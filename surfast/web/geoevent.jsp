
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script> 
<script type="text/javascript"> 
     var geocoder;

    if (navigator.geolocation) 
    {
        navigator.geolocation.getCurrentPosition(successFunction, errorFunction);
    } 
    //Get the latitude and the longitude;
        function successFunction(position) 
        {
            var lat = position.coords.latitude;
            var lng = position.coords.longitude;
            codeLatLng(lat, lng)
        }

        function errorFunction()
        {
            alert("Geocoder failed");
        }

        function initialize() 
        {
            geocoder = new google.maps.Geocoder();

        }

        function codeLatLng(lat, lng) 
        {
            var latlng = new google.maps.LatLng(lat, lng);
            geocoder.geocode({'latLng': latlng}, function(results, status) 
            {
                if (status == google.maps.GeocoderStatus.OK) 
                {
                    //console.log(results)
                    if (results[1]) 
                    {
                         //formatted address
                        // alert(results[0].formatted_address);
                        var a=results[0].formatted_address.split(",");
                        var ct=a[0].substr(0);
                        alert(ct);
                        window.location.href='show_event.jsp?location='+ct;
                    }
     
        } 
	  else
          {
                alert("Geocoder failed due to: " + status);
          }
    });
  }
</script> 
    </head>
    <body onload="initialize()">
        
    </body>
</html>
