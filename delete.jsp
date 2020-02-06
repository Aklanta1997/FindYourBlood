<%-- 
    Document   : profile
    Created on : Aug 15, 2017, 11:33:28 AM
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

                                  
                                      <%@page import="java.sql.*" %>
                                        <%@page import="java.util.*" %>
        <%
        String name=request.getParameter("username");  
        	  
              try{
                   Class.forName("com.mysql.jdbc.Driver");
                   Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/bloodbank", "root", "");
                   PreparedStatement ps=c.prepareStatement("delete from users where username=?");
                   ps.setString(1,name);
                   ps.executeUpdate();
                   response.sendRedirect("viewuser.jsp");
				   
              }
              catch(Exception e)
              {
                out.println(e);
              }
    %>
                
	</body>
	
</html>
