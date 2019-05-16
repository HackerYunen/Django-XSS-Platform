if(document.getElementById('xss_audio') == null ) {
	var a = document.createElement('audio');
	a.src = "<+|music_url|+>"
	a.autoplay=true;
	a.id='xss_audio';
	a.style.display='none';
	document.body.appendChild(a);
}