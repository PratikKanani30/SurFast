

<%@page contentType="text/html" pageEncoding="UTF-8" session="true" import="java.util.*, java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <title>Login</title>
    </head>
    <body style="background: url(images/default.jpg);width:100%;">
       <div class="adminLogin"> 
                   <fieldset class="field">

           <form method="post" class="adminTable">
            <table>
                <tr>
                    <td>User Name:</td>
                    <td><input type="text" name="uname" placeholder="Enter your email" required></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td> <input type="password" name="password" placeholder="Enter your password" required></td>
                </tr>
                <tr>
                    <td  colspan="2" align="center"><input type="submit" value="Login"></td>
                </tr>
                <tr>
                    <td>Not Registered?</td>
                </tr>
                <tr>
                    <td><a href="userRegistration.jsp">Click here to get registered...</a></td>
                </tr>
            </table>
           </form>
                   </fieldset>
      </div>
        <section>
            <nav style="margin-top: 300px;" class="navbar navbar-default menu"  id="menu" role="navigation">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#example-navbar-collapse">
         <span class="sr-only">Toggle navigation</span>
         <span class="icon-bar"></span>
         <span class="icon-bar"></span>
         <span class="icon-bar"></span>
      </button>
        <a class="navbar-brand" href="index.jsp">SurFast</a>
    </div>
   <div class="collapse navbar-collapse pull-right" id="example-navbar-collapse">
     
   </div>
   </nav>
   </section>
        
        <%!
            Connection con;
            Statement st;  
            ResultSet rs;
        %>
        
        <%
            Object uname=request.getParameter("uname");
            if(uname!=null)
            {
                Object password=request.getParameter("password");
                Class.forName("com.mysql.jdbc.Driver");
	        con=DriverManager.getConnection("jdbc:mysql://localhost/surfast","root","");
	        st=con.createStatement();
                rs=st.executeQuery("select * from users where email='"+uname+"' and password='"+password+"'");
 
                if(rs.next())
                {   
                    String a=rs.getString(1);
                    session.setAttribute("users",uname);
                    response.sendRedirect("displayDayCelebration.jsp");
                }
                
                else
                {
                    out.println("Login Failed...Try again.");
                }
                
            }
            
          
        %>
        
                
    </body>
</html>
