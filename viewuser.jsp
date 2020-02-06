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
<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12"></div>
</div>
          
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

 
    <%@page import="java.sql.*" %>
        <%@page import="java.util.*" %>
        <%@page import="java.lang.Math" %>
        
        
           <%
              try{
                  
                  Class.forName("com.mysql.jdbc.Driver");
                   Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/bloodbank", "root", "");
                   PreparedStatement ps=c.prepareStatement("select * from users");
                   ResultSet rs=ps.executeQuery();
                   %>
                       <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 col-lg-offset-3 col-md-offset-3 col-sm-offset-3">
                       <table width="100%" class="table table-bordered table-hover" id="dataTables">
                                <thead>
                                    <tr>
                                        <th>User Name</th>
                                        <th>Edit</th>
                                        <th>Delete</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    
                                    <tr class="odd">
                                        <%
                                        while(rs.next())
                                        {
                                        %>
                                        <tr>
                                        <td><% out.println(rs.getString("username")); %></td>
                                        <td><a href="edit.jsp?username=<% out.println(rs.getString("username")); %>">edit</a></td>
                                        <td><a href="delete.jsp?username=<% out.println(rs.getString("username")); %>">delete</a></td>
                                        </tr>
                                        <%
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
                   </body>
</html>
