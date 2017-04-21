<%-- 
    Document   : next1
    Created on : Dec 29, 2014, 5:14:19 PM
    Author     : PRATIK KANANI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%!
             Connection con;
             Statement st;
             Statement st1;
       %>
       
       <%
           Object id=request.getParameter("DayID");
           Object title=request.getParameter("Title");
           Object country=request.getParameter("Country");
           Object image=request.getParameter("Image");
           
           Object id1=request.getParameter("DayID1");
           Object title1=request.getParameter("Title1");
           Object image1=request.getParameter("Image1");
           
           
           
           if(id!=null)
           {
              Class.forName("com.mysql.jdbc.Driver");
	      con=DriverManager.getConnection("jdbc:mysql://localhost/surfast","root","");
              st=con.createStatement();
              int a=st.executeUpdate("insert into usersimage(Day_ID,Title,Country,Image) values("+id+",'"+title+"','"+country+"','"+image+"')"); 
           }
           
           if(id1!=null)
           {
              st1=con.createStatement();
              int b=st1.executeUpdate("insert into usersimage(Day_ID,Title,Country,Image) values("+id1+",'"+title1+"','"+country+"','"+image1+"')");        
           }
       %>
    </body>
</html>
