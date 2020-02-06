<%-- 
    Document   : updateprofile
    Created on : Aug 15, 2017, 12:08:59 PM
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
        <%@page import="java.sql.*" %>
        <%
            String name=(String)session.getAttribute("name");  
              try{
                   Class.forName("com.mysql.jdbc.Driver");
                   Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/bloodbank", "root", "");
                   PreparedStatement ps=c.prepareStatement("update users set password=?,email=?,name=?,contact=?,blood_group=? where username=?");
                   ps.setString(6,name);
                   ps.setString(1, request.getParameter("password"));
                    ps.setString(3, request.getParameter("name"));
                   ps.setString(2, request.getParameter("email"));
                   ps.setString(4, request.getParameter("contact"));
                   ps.setString(5, request.getParameter("blood_group"));
                   
                   if(x>0)
                   {
                       response.sendRedirect("home.jsp");
                    %>
                       
                    <%
                   }
                  
                   else{
                    %>
                
                   <%
                       response.sendRedirect("signup.html");
                   }
		}
              catch(Exception e)
              {
                out.println(e);
              }
        
                 %>
    </body>
</html>
