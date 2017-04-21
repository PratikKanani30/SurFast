
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
             %>
             
             <%
                 Object id1=request.getParameter("DayID1");
           Object title1=request.getParameter("Title1");
           Object celebration1=request.getParameter("Celebration1");
           Object image1=request.getParameter("Image1");
           Object country=request.getParameter("Country");
           
             if(id1!=null)
           {
              st=con.createStatement();
              int b=st.executeUpdate("insert into usersimage(Day_ID,Title,Celebration_Type,Country,Image) values("+id1+",'"+title1+"','"+celebration1+"','"+country+"','"+image1+"')"); 
           }
                 %>
    </body>
</html>
