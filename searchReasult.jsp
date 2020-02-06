<%-- 
    Document   : searchReasult
    Created on : Aug 9, 2017, 2:15:15 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
  <head>
  <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>
    <link href="css/bootstrap.min.css" rel="stylesheet">
  
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
}
#map_canvas{
width:100%;height:100%;
}
th{
    color: white;
}
td{
    color: red;
}
table{
    background-color: black;
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
        <li><a href="logout.jsp" style="margin-top:25px;"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="profile.jsp" style="margin-top:25px;"><span class="glyphicon glyphicon-user"></span> MY Profile</a></li>
      </ul>
    </div>
  </div>
</nav>
            <div class="container-fluid" style="margin-top:100px;">
<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12"></div>
<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">


                    <div class="row" style="margin-top:250px;">
                        <div class="form-group">
                          <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="margin-top:10px;">
                              <form action="searchReasult.jsp" method="POST">
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
                                  <button type="submit">Search</button> 
                                  <input type="text" id="location" disabled>
                                     <button type="submit" class="text-center btn btn-danger" data-toggle="modal" data-target="#MyModal">NEXT</button>
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
    <%@page import="java.sql.*" %>
        <%@page import="java.util.*" %>
        <%@page import="java.lang.Math" %>
        
        
           <%
            Double lat1   = Double.valueOf(request.getParameter("lat"));
                  Double lon1 = Double.valueOf(request.getParameter("lng"));
            session.setAttribute("latitude",lat1);
            session.setAttribute("langitude",lon1);
              try{
                  
                  System.out.println(lat1);
                  Class.forName("com.mysql.jdbc.Driver");
                   Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/bloodbank", "root", "");
                   System.out.println("connectio");
                   PreparedStatement ps=c.prepareStatement("select * from users where blood_group=?");
                   System.out.println("sql");
                   ps.setString(1,request.getParameter("blood_group"));
                   System.out.println("executequery");
                   ResultSet rs=ps.executeQuery();
                   %>
                       <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 col-lg-offset-3 col-md-offset-3 col-sm-offset-3">
                       <table width="100%" class="table table-bordered table-hover" id="dataTables">
                                <thead>
                                    <tr>
                                        <th>Name</th>
                                        <th>Email</th>
                                        <th>Contact</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    
                                    <tr class="odd">
                                        <%
                                        while(rs.next())
                                        {
                                            System.out.println("while loop");
                                            final int R = 6371; // Radius of the earth
                                            double lat2=rs.getDouble("lat");
                                            double lon2=rs.getDouble("lng");
                                            double latDistance = Math.toRadians(lat2 - (double)session.getAttribute("latitude"));
                                            double lonDistance = Math.toRadians(lon2 - (double)session.getAttribute("langitude"));
                                            double a = Math.sin(latDistance / 2) * Math.sin(latDistance / 2)
                                            + Math.cos(Math.toRadians(lat1)) * Math.cos(Math.toRadians(lat2))
                                            * Math.sin(lonDistance / 2) * Math.sin(lonDistance / 2);
                                            double c1 = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
                                            double distance = R * c1 * 1000; // convert to meters
                                            if(distance<=15000){
                                                System.out.println("if statement executed");
                                        %>
                                        <tr>
                                        <td><% out.println(rs.getString("name")); %></td>
                                        <td><% out.println(rs.getString("email")); %></td>
                                        <td><% out.println(rs.getString("contact")); %></td>
                                        </tr>
                                        <%
                                                            }
                                            }
                                        %>
                                    </tr>
                                    
                  
                                </tbody>
                            </table>
                        </div>
                       </div>
                                    <%
              }
              catch(Exception e)
              {
                out.println(e);
              }
        
                 %>
</html>
