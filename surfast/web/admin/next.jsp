<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>

<body>
 
        <%!
             Connection con;
             Statement st;
             Statement st1;
             Statement st2;
             Statement st3;
             Statement st4;
             ResultSet rs;
        %>
        
        <%
            Object radio1=request.getParameter("r1");
            Object radio2=request.getParameter("r2");
            Object title=request.getParameter("title");
            if(title!=null)
            {
             
              Object description=request.getParameter("description");
              Object celeType=request.getParameter("celebrationType");
              Object cType=request.getParameter("ctype");            
              
              Object image=request.getParameter("image");
              Object enable=request.getParameter("enable");
              
              Object country=request.getParameter("country");
              Object day=request.getParameter("day");
              Object week=request.getParameter("week");
              Object month=request.getParameter("month");
              
              Object date=request.getParameter("date");           
              Object month1=request.getParameter("month1");
              Object country1=request.getParameter("country1");
              
 
              Class.forName("com.mysql.jdbc.Driver");
	      con=DriverManager.getConnection("jdbc:mysql://localhost/surfast","root","");
              st=con.createStatement();
             int a=st.executeUpdate("insert into daycelebration(Title,Description,Celebration_Type,C_Type) values('"+title+"','"+description+"','"+celeType+"','"+cType+"')");
              
              st1=con.createStatement();
              rs=st1.executeQuery("select Day_ID from daycelebration");
              rs.last();
              int dayID=rs.getInt(1);

              st2=con.createStatement();
              int b=st2.executeUpdate("insert into dayimage(Day_ID,Image,Enable) values("+dayID+",'"+image+"',"+enable+")");
        %>
               
        <script lang="javascript">
               
                   if(radio1.checked===true) 
                   {
        </script>
        
        <%                           
                  st3=con.createStatement();
                  int c=st3.executeUpdate("insert into daywise(Day_ID,Country,Day,Week,Month) values("+dayID+",'"+country+"',"+day+","+week+","+month+")");
        %>
                  
       <script lang="javascript">        
             }         
            else
             {
       </script>
        
        <%
                  st4=con.createStatement();
                  int d=st4.executeUpdate("insert into datewise(Day_ID,Date,Month,Country) values("+dayID+","+date+","+month1+",'"+country1+"')");
         %>
         
        <script lang="javascript">        
             } 
        </script>
         
         
        <%
            }  
        %>
</body>
</html>