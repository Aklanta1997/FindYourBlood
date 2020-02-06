<%-- 
    Document   : adduser
    Created on : Aug 15, 2017, 12:45:47 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Signup</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <script src="js/jquery-3.2.1.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  
  <style>
.MyDrop{
height:48px;
border-radius:4px;
}
body{
background-image: url("images/blooood.jpeg"); 
background-size:100% 190%;
background-repeat: no-repeat;
font-family:cursive;
color: red;
}
#map_canvas{
width:100%;height:100%;
}
</style>
</head>
<body onload="locate()">
<nav class="navbar navbar-inverse navbar-fixed-top" style="background-color:#8B0000;font-size:20px;font-family:cursive;height:100px;">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="index.html" style="margin-top:25px;font-size:20px;font-family:cursive;">Logo</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li><a href="index.html" style="margin-top:25px;"><span class="glyphicon glyphicon-home"></span> Home</a></li>
       
        <li><a href="aboutUs.html" style="margin-top:25px;"><span class="glyphicon glyphicon-info-sign"></span> Aboutus</a></li>
        <li><a href="contactUs.html" style="margin-top:25px;"><span class="glyphicon glyphicon-earphone"></span> Contactus</a></li>
        <li><a href="login.html" style="margin-top:25px;"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="signup.html" style="margin-top:25px;"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      </ul>
    </div>
  </div>
</nav>
<div class="container-fluid" style="margin-top:100px;">
<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12"></div>
<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">


                    <div class="row" style="margin-top:110px;">
                        <div class="form-group">
                          <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="margin-top:10px;">
                              <form action="SignUp.jsp" method="POST">
                                  <div class="form-group">
                                  <label for="username">UserName:</label>
                                  <input type="text" class="form-control" name="username">
                                  </div>
                                  <div class="form-group">
                                  <label for="password">Password:</label>
                                  <input type="password" class="form-control" name="password">
                                  </div><div class="form-group">
                                  <label for="name">FullName:</label>
                                  <input type="text" class="form-control" name="name">
                                  </div>
                                  <div class="form-group">
                                  <label for="email">Email:</label>
                                  <input type="email" class="form-control" name="email">
                                  </div><div class="form-group">
                                  <label for="contact">Contact:</label>
                                  <input type="text" class="form-control" name="contact">
                                  </div>
                                  <div class="form-group">
                                  <label for="blood_group">Blood Group</label>
                                  <select name="blood_group" class="col-lg-12 col-md-12 col-sm-12 col-xs-12 MyDrop">
                                 <option>select blood group</option>
                                  <option value="O+">O+</option>
                                   <option value="O-">O-</option>
                                    <option value="A+">A+</option>
                                   <option value="A-">A-</option>
                                    <option value="B+">B+</option>
                                   <option value="B-">B-</option>
                                    <option value="AB+">AB+</option>
                                   <option value="AB-">AB-</option>	   
                                </select>
                                  </div>
                                  <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#MyModal">NEXT</button>
                          </div>
                        </div>
                    </div> 

					
</div>
<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12"></div>
</div>
<div id="MyModal" class="modal fade" role="dialog">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            Let's Get Started..
            <button type="button" class="close" data-dismiss="modal">&times;</button>
          </div>
          <div class="modal-body text-center">
           	<div id="map_canvas"></div>
           	<input type="hidden" name="lat" id="lat">
           	<input type="hidden" name="lng" id="lng">
          </div>
          <div class="modal-footer">
            <button type="submit" class="btn btn-success">save</button>
          </div>
        </div>
      </div>
    </div>
            </form>
		
		<script src="js/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
	</body>
	<script>
    var im = url('img/redmarker');
    function locate(){
        navigator.geolocation.getCurrentPosition(initialize,fail);
    }

    function initialize(position) {
    	var lat=position.coords.latitude;
    	var lng=position.coords.longitude;
    	document.getElementById('lat').value = lat;
    	document.getElementById('lng').value = lng;

        var myLatLng = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
        var mapOptions = {
          zoom: 15,
          center: myLatLng,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        }
        var map = new google.maps.Map(document.getElementById('map_canvas'),
                                      mapOptions);
        var userMarker = new google.maps.Marker({
            position: myLatLng,
            map: map,
            draggable: true,
            icon: im
        });
        google.maps.event.addListener(userMarker, 'click', function (event) {
                                 document.getElementById("lat").value = this.getPosition().lat();
                                 document.getElementById("lng").value = this.getPosition().lng();
                                 });
        google.maps.event.addListener(userMarker, 'dragend', function (event) {
    							document.getElementById("lat").value = this.getPosition().lat();
    							document.getElementById("lng").value = this.getPosition().lng();
								});
      }
     
    
     function fail(){
         alert('navigator.geolocation failed, may not be supported');
     }
    </script>
	  <script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDNwzBjiI_fDBGT1O4OJQNhB4Yq5aqZ5FQ &callback=initMap">
    </script>
</html>
