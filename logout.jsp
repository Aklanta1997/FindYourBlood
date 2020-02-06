<%-- 
    Document   : logout
    Created on : Aug 12, 2017, 5:39:12 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% session.invalidate(); 
           response.sendRedirect("index.html");
        %>
        
    </body>
</html>
