

<%@page contentType="text/html" session="true" pageEncoding="UTF-8" import="java.util.*, java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Login</title>
        <link href="style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
        <div class="adminLogin">
        <fieldset class="field">
           <!--<legend>Login to Day Celebration</legend>-->
        
           <form method="post" class="adminTable">
            <table>
                <tr>
                    <td>User Name:</td>
                    <td><input type="text" name="username"></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td> <input type="password" name="password"></td>
                <tr>
                <tr>
                    <td  colspan="2" align="center"><input type="submit" value="Log in"></td>
                </tr>
            </table>
        </form>
        </fieldset>
        </div>
        
        
        
        
        <%!
        
        Connection con;
        Statement st;
        ResultSet rs;
        
        %>
        
        <%
           Object o1=request.getParameter("username");
           if(o1!=null)
           {
                Object o2=request.getParameter("password");
	        Class.forName("com.mysql.jdbc.Driver");
	        con=DriverManager.getConnection("jdbc:mysql://localhost/surfast","root","");
	        st=con.createStatement();
                rs=st.executeQuery("select * from admin where username='"+o1+"' and password='"+o2+"'");
 
                if(rs.next())
                {   
                    String a=rs.getString(1);
                    session.setAttribute("users",01);
                    response.sendRedirect("index.jsp");
                }
                
                else
                {
                    out.println("Login Failed...Try again.");
                }
                
            }
	
	%>
           
           
        <jsp:include page="footer.jsp"></jsp:include>
                
         
            
      
    </body>
</html>
