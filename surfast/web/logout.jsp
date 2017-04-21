<%-- 
    Document   : logout
    Created on : Dec 28, 2014, 11:16:42 AM
    Author     : PRATIK KANANI
--%>

<%@page contentType="text/html" session="true" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        request.getSession().setAttribute("name", null); 

 response.sendRedirect("login.jsp");
 %>
    </body>
</html>
