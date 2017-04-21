
<%@page contentType="text/html" session="true" pageEncoding="UTF-8" import="java.util.*, java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Registration</title>
    </head>
    <body>
        <div class="userRegistration">
        <fieldset>
           <legend>Fill Up to get Registered</legend>
        
           <form method="post">
            <table>
                <tr>
                    <td>First Name:</td>
                    <td><input type="text" name="fname" required></td>
                </tr>
                <tr>
                    <td>Middle Name:</td>
                    <td><input type="text" name="mname" required></td>
                </tr>
                <tr>
                    <td>Last Name:</td>
                    <td><input type="text" name="lname" required></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td> <input type="password" name="password" required></td>
                <tr>
             
                <tr>
                    <td>Email:</td>
                    <td><input type="email" name="email" required></td>
                </tr>
                <tr>
                    <td>City:</td>
                    <td><input type="text" name="city1" required></td>
                </tr>
                <tr>
                    <td>State:</td>
                    <td><input type="text" name="state1" required></td>
                </tr>
                <tr>
                    <td>County:</td>
                    <td><input type="text" name="county1" required></td>
                </tr>
                <tr>
                    <td  colspan="2" align="center"><input type="submit" value="Register"></td>
                </tr>
            </table>
        </form>
        </fieldset>
        </div>
        
        <%!
            Connection con;
            Statement st;       
        %>
        
        <%
            Object fname=request.getParameter("fname");
            
            if(fname!=null)
            {
            Object mname=request.getParameter("mname");
            Object lname=request.getParameter("lname");
            Object password=request.getParameter("password");
            Object email=request.getParameter("email");
            Object city1=request.getParameter("city1");
            Object state1=request.getParameter("state1");
            Object country1=request.getParameter("country1");
            
           Class.forName("com.mysql.jdbc.Driver");
	   con=DriverManager.getConnection("jdbc:mysql://localhost/surfast","root","");
	   st=con.createStatement();
           int a=st.executeUpdate("insert into users(firstname,middlename,lastname,password,email,city,state,country) values('"+fname+"','"+mname+"','"+lname+"','"+password+"','"+email+"','"+city1+"','"+state1+"','"+country1+"')");
           
           if(a!=0)
           {
               out.println("Successfully Registered");
               out.println("<br/>");
               out.println("<a href='login.jsp'>Login</a>");
           }
           
           else
           {
               out.println("registration Failed");
               out.println("<br/>");
               out.println("<a href='userRegistration.jsp'>Register Again</a>");

           }
          }
            
        %>
    </body>
</html>
