<%-- 
    Document   : login
    Created on : Aug 12, 2017, 4:51:50 PM
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
        <%@page import="java.util.*" %>
      
        
        <%
         
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        out.println(username);
        if(username.equals("admin") && password.equals("admin")){
            session.setAttribute("name",username); 
            response.sendRedirect("admin.jsp");

        }
        else
        {
        try{
                   Class.forName("com.mysql.jdbc.Driver");
                   Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/bloodbank", "root", "");
                   PreparedStatement ps=c.prepareStatement("select * from users where username=? and password=?");
                   ps.setString(1,username);
                   ps.setString(2,password);
                   ResultSet rs=ps.executeQuery();
                   if(rs.next()){
                       session.setAttribute("name",username);
                       response.sendRedirect("home.jsp"); 
                   }
                   else{
                       %>
                        <script>
                            alert('incorrect username or password');
                        </script>
                       <%
                        response.sendRedirect("login.html");
                        }

        }
        catch(Exception e)
              {
                out.println(e);
}         }

        %>
    </body>
</html>
