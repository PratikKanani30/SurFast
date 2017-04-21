

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
<link href="css/font-awesome.css" rel="stylesheet" type="text/css"/>
<script src="js/surfast.js" type="text/javascript"> </script>
<script src="js/bootstrap.js" type="text/javascript"> </script>
<script src="js/bootstrap.min.js" type="text/javascript"> </script>
<script src="js/jquery.min.js" type="text/javascript"> </script>
        <title>Weather Forecasting</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
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
            codeLatLng(lat, lng);
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
                         alert(results[0].formatted_address);
                        var a=results[0].formatted_address.split(",");
                      //var ct=a[2].substr(1);
                        //alert(ct);
                        var appurl = "http://www.weatherfor.us/load.php?location="+a;
                        document.getElementById("abc").src = appurl;
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
        <div class="container-fluid">
    <section id="home">
        <iframe id="abc" src="" 
            scrolling="no" frameborder="0" 
            allowtransparency="true" style="background: transparent;margin-left: 20%; margin-top: 12%;   width: 1000px; height: 600px; overflow: scroll;"></iframe>      
    </section>
        </div>
        
    </body>
</html>
