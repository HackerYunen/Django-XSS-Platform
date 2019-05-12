(function($) {
  'use strict';
  $(function() {
    var body = $('body');
    var contentWrapper = $('.content-wrapper');
    var scroller = $('.container-scroller');
    var footer = $('.footer');
    var sidebar = $('.sidebar');

    //Ajax获取explain
	$('#selectPayload').change(function () {
        var payload_name = $(this).val();
		if(payload_name !=='diy' && payload_name!=='0'){
			$('#diypayload').remove();
			if(payload_name === '基础Payload'){
				$('#keep').append('<div class="form-check form-check-danger" id="keep1"><label class="form-check-label"><input type="checkbox" class="form-check-input" id="keep_alive">保持Cookie活性<i class="input-helper"></i></label></div>');
			}else{
				$('#keep1').remove();
			}
			$.ajax({
				type: "POST",
				url: "/user/ajax_payload_explain/",
				data: {payload_name},
				success: function(msg){
					$('#explain').html(msg);
				}
			});
		}else{
			$('#keep1').remove();
			if(payload_name!=='0'){
				$('#explain').html('自定义Payload：<br>参数：id(项目id，payload中使用<--id-->代替)、value(将作为信封内容存入数据库)<br>接受请求方式：GET和POST');
				$('#diy').append('<div id="diypayload" class="form-group"><label for="exampleSelectGender">Payload:</label><textarea class="form-control" rows="4" id="payload_value"></textarea></div>');
			}else{
				$('#diypayload').remove();
			}
		}
	});
	
    //弹出changepass窗口
    $('a[name="Userinfo"]').click(function () {
		$("body").append("<div id='mask'></div>");
        $("#mask").addClass("mask").fadeIn("slow");
        $("#Userinfo").fadeIn("slow");
	});
    
    //Changepass事件
    $('button[name="changepass"]').click(function () {
        var newpass = $('#changepass').val();
        var pass_copy = $('#passcopy').val();
        var oldpass = $('#oldpass').val();
        $("#Userinfo").fadeOut("fast");
        if (newpass === pass_copy && newpass !== '' && oldpass !== '') {
            $.ajax({
                type: "POST",
                url: "/user/changepass/",
                data: {newpass,oldpass},
                success: function(msg){
                    if (msg !== 'True'){
                        $("#Failchange").fadeIn("slow");
                    }else{
                        $(location).prop('href', '/user/login');
                    }
                }
            });
        }else{
            $("#Failchange").fadeIn("slow");
        }
    });
    
    $('button[name="closechange"]').click(function () {
        $("#Userinfo").fadeOut("fast");
		$("#mask").css({ display: 'none' });
    });


	$("button[name='addbutton']").click(function(){
		var name = $('#name').val();
		var describe = $('#describe').val();
		var payload = $('#selectPayload').val();
		var send_email=$('#send_email').is(':checked');
		if(payload==='diy'){
			var diy_payload = $('#payload_value').val();
			var send_data = {name,describe,payload,send_email,diy_payload};
		}else{
			var send_data = {name,describe,payload,send_email};
		}
		if(payload==='基础Payload'){
			var send_email=$('#keep_alive').is(':checked');
			send_data["send_email"] = send_email;
		}
		$.ajax({
			type: "POST",
			url: "/user/ajax_add_project/",
			data: send_data,
			success: function(msg){
				if(msg==='True'){
					$(location).prop('href', '/user/project');
				}else{
					alert(msg);
				}
			}
		});
		
	});
	
	//弹出信封内容
	$("button[name='letterid']").on('click', function () {
		$("#value").empty();
		var letterid=$(this).val();
	　　$.ajax({
			type: "POST", 
	　　　　url : "/user/ajax_letter_value/",
			data: {letterid},
	　　	success : function(msg){
				$("#value").val(msg);
				$("body").append("<div id='mask'></div>");
				$("#mask").addClass("mask").fadeIn("slow");
				$("#Letterinfo").fadeIn("slow");
	　　	}});
	});
    
	//关闭按钮
	$(".close_btn").hover(function () { $(this).css({ color: 'black' }) }, function () { $(this).css({ color: '#999' }) }).on('click', function () {
		$("#Letterinfo").fadeOut("fast");
        $("#Failchange").fadeOut("fast");
		$("#mask").css({ display: 'none' });
	});
	
	//删除信封
	$("button[name='delletter']").click(function(){
		var letterid=$(this).val();
	　　$.ajax({
			type: "POST", 
	　　　　url : "/user/ajax_del_letter/",
			data: {letterid},
	　　	success : function(msg){
				if(msg==='True'){
					window.location.reload();
				}
	　　	}});
	});
	
	//删除项目
	$("button[name='delproject']").click(function(){
		console.log('aaaa');
		var projectid=$(this).val();
	　　$.ajax({
			type: "POST", 
	　　　　url : "/user/ajax_del_project/",
			data: {projectid},
	　　	success : function(msg){
				if(msg==='True'){
					window.location.reload();
				}
	　　	}});
	});


    //Add active class to nav-link based on url dynamically
    //Active class can be hard coded directly in html file also as required
    var current = location.pathname.split("/").slice(-1)[0].replace(/^\/|\/$/g, '');
    $('.nav li a', sidebar).each(function() {
      var $this = $(this);
      if (current === "") {
        //for root url
        if ($this.attr('href').indexOf("index.html") !== -1) {
          $(this).parents('.nav-item').last().addClass('active');
          if ($(this).parents('.sub-menu').length) {
            $(this).closest('.collapse').addClass('show');
            $(this).addClass('active');
          }
        }
      } else {
        //for other url
        if ($this.attr('href').indexOf(current) !== -1) {
          $(this).parents('.nav-item').last().addClass('active');
          if ($(this).parents('.sub-menu').length) {
            $(this).closest('.collapse').addClass('show');
            $(this).addClass('active');
          }
        }
      }
    })

    //Close other submenu in sidebar on opening any

    sidebar.on('show.bs.collapse', '.collapse', function() {
      sidebar.find('.collapse.show').collapse('hide');
    });


    //Change sidebar and content-wrapper height
    applyStyles();

    function applyStyles() {
      //Applying perfect scrollbar
      if (!body.hasClass("rtl")) {
        if ($('.tab-content .tab-pane.scroll-wrapper').length) {
          const settingsPanelScroll = new PerfectScrollbar('.settings-panel .tab-content .tab-pane.scroll-wrapper');
        }
        if ($('.chats').length) {
          const chatsScroll = new PerfectScrollbar('.chats');
        }
      }
    }

    //checkbox and radios
    $(".form-check label,.form-radio label").append('<i class="input-helper"></i>');

    //fullscreen
    $("#fullscreen-button").on("click", function toggleFullScreen() {
      if ((document.fullScreenElement !== undefined && document.fullScreenElement === null) || (document.msFullscreenElement !== undefined && document.msFullscreenElement === null) || (document.mozFullScreen !== undefined && !document.mozFullScreen) || (document.webkitIsFullScreen !== undefined && !document.webkitIsFullScreen)) {
        if (document.documentElement.requestFullScreen) {
          document.documentElement.requestFullScreen();
        } else if (document.documentElement.mozRequestFullScreen) {
          document.documentElement.mozRequestFullScreen();
        } else if (document.documentElement.webkitRequestFullScreen) {
          document.documentElement.webkitRequestFullScreen(Element.ALLOW_KEYBOARD_INPUT);
        } else if (document.documentElement.msRequestFullscreen) {
          document.documentElement.msRequestFullscreen();
        }
      } else {
        if (document.cancelFullScreen) {
          document.cancelFullScreen();
        } else if (document.mozCancelFullScreen) {
          document.mozCancelFullScreen();
        } else if (document.webkitCancelFullScreen) {
          document.webkitCancelFullScreen();
        } else if (document.msExitFullscreen) {
          document.msExitFullscreen();
        }
      }
    })
  });
})(jQuery);