<%-- 
    Document   : SignUp
    Created on : Aug 9, 2017, 1:15:09 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <%@page import="java.sql.*" %>
        <%
              try{
                   Class.forName("com.mysql.jdbc.Driver");
                   Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/bloodbank", "root", "");
                   PreparedStatement ps=c.prepareStatement("insert into users values(?,?,?,?,?,?,?,?)");
                   ps.setString(1, request.getParameter("username"));
                   ps.setString(2, request.getParameter("password"));
                    ps.setString(3, request.getParameter("name"));
                   ps.setString(4, request.getParameter("email"));
                   ps.setString(5, request.getParameter("contact"));
                   ps.setString(6, request.getParameter("blood_group"));
                   ps.setString(7, request.getParameter("lat"));
                   ps.setString(8, request.getParameter("lng"));
                   int x=ps.executeUpdate();
                   if(x>0)
                   {
                       response.sendRedirect("home.jsp");
                    %>
                       <script>
                       alert("Thank you ! Now you are Registerd yourself as one of our Doner");
                       </script>
                    <%
                   }
                  
                   else{
                    %>
                   <script>
                       alert("oops something went wrong !!! please try again");
                   </script>
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
