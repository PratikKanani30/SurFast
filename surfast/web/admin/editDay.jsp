

<%@page contentType="text/html" session="true" pageEncoding="UTF-8" import="java.util.*, java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
        <link href="style.css" rel="stylesheet" type="text/css"/>

        <title>JSP Page</title>
        
         <script lang="javaScript">   
            function loadDay()
            {
                
                var d1=document.getElementById('dayDiv');
                d1.style.display='inline';
               
                var d2=document.getElementById('dateDiv');
                d2.style.display='none';
            }

             function loadDate()
            {
                var d1=document.getElementById('dayDiv');
                d1.style.display='none';
                
                var d2=document.getElementById('dateDiv');
                d2.style.display='inline';
            }
                     
             function checkDate(a,b)
            {
                var n=document.getElementById(a);
                var req=document.getElementById(b);
                
                if(n.value<=0 || n.value>31)
                {
                    req.style.display="inline";
                }
                else
                {
                    req.style.display="none";
                    
                }
            }
            
            function checkMonth(a,b)
            {
                var n=document.getElementById(a);
                var req=document.getElementById(b);
                
                if(n.value<=0 || n.value>12)
                {
                    req.style.display="inline";
                }
                else
                {
                    req.style.display="none";
                    
                }
                
            }
        </script>        
    </head>
    <body>
         <jsp:include page="dayHeader.jsp"></jsp:include>
        
        <%!
             Connection con;
             Statement st;
             ResultSet rs;
             Statement st1;
             ResultSet rs1;
             Statement st2;
             Statement st3;
        %>
        
        <fieldset><legend><h4>Edit type</h4></legend>
                <form>
                    <table> 
                    <tr>
                        <td> <input type="radio" id="r1" name="dc" value="daywise" onclick="loadDay()" checked/>Daywise</td>
                    </tr>

                    <tr>
                        <td><input type="radio" id="r2" name="dc" value="datewise" onclick="loadDate()"/>Datewise</td>
                    </tr>
                    </table>
                </form>
        </fieldset>
        
        <%
             Class.forName("com.mysql.jdbc.Driver");
	     con=DriverManager.getConnection("jdbc:mysql://localhost/surfast","root","");
             Object r=request.getParameter("dc");
        %>
        
        <script lang="javascript">

               var r=document.getElementById('r1');            
               if(r.checked===true)
               {                   
        </script>

        
        <%
             
               st=con.createStatement();
               rs=st.executeQuery("select * from daywise");
               while(rs.next())
              {  
                int DayID1=rs.getInt(1);
                String country1=rs.getString(2);
                int day1=rs.getInt(3);
                int week1=rs.getInt(4);
                int month1=rs.getInt(5);
        
                 if(request.getParameter("edit_id")!=null)
                {
                  int id=Integer.parseInt(request.getParameter("edit_id"));
                  if(id==DayID1)
                 {

        %>
     
         <div id='dayDivision' class="dayDivision">
            <fieldset><legend><h4>Day ID: <%=DayID1%></h4></legend>
                <form>
                <table align="center">
                    <tr>
                        <td>Day_ID:</td>
                        <td><input type="text" id="txtid" name="txtid" value="<%=DayID1%>" readonly/></td>
                    </tr>
                    
                    <tr>
                        <td>Country:</td>
                        <td><input type="text" name="txtcountry" value="<%=country1%>"/></td>
                        
                    </tr>
                    
                    <tr>
                        <td>Day:</td>
                        <td><input type="text" id="txtday" name="txtday" value="<%=day1%>" onblur="checkDate('txtday','reqday')"/>
                             <span id="reqday" style="display:none;color:red;">*Day should be between 1 to 31</span>
                        </td>
                    </tr>
                    
                    <tr>
                        <td>Week:</td>
                        <td><input type="text" name="txtweek" value="<%=week1%>"/></td>
                    </tr>
                    
                    <tr>
                        <td>Month:</td>
                        <td><input type="text" id="txtmonth" name="txtmonth" value="<%=month1%>" onblur="checkMonth('txtmonth','reqmonth')">
                            <span id="reqmonth" style="display:none;color:red;">*Month should be between 1 to 12</span>
                        </td>
                    </tr>
                    
                    <tr>
                        <td colspan="2" align="center"><button>Save</button></td>
                    </tr>
                </table>
            </fieldset>
            </form>
         </div>
            
            <%
               
                }
                  
                  else
                  {
            %>                    
            <div id='dayDiv' class="dayDiv">
            <fieldset><legend><h4>Day ID: <%=DayID1%></h4></legend>
                <table align="center">
                    <tr>
                        <td>Day_ID:</td>
                        <td><%=DayID1%> </td>
                    </tr>
                    
                    <tr>
                        <td>Country:</td>
                        <td><%=country1%></td>
                        
                    </tr>
                    
                    <tr>
                        <td>Day:</td>
                        <td><%=day1%></td>
                    </tr>
                    
                    <tr>
                        <td>Week:</td>
                        <td><%=week1%></td>
                    </tr>
                    
                    <tr>
                        <td>Month:</td>
                        <td><%=month1%></td>
                    </tr>
                    
                    <tr>
                        <td colspan="2" align="center">
                            <a href="?edit_id=<%=DayID1%>"><button>Edit</button></a>
                        </td>
                    </tr>
                    
                    <tr>
                        <td colspan="2" align="center">
                            <a href="?delete_id=<%=DayID1%>"><button>Delete</button></a>
                        </td>
                    </tr>
                </table>
           
            </fieldset>
        </div>
           <%
                  }
            }
              
                
                else
                {
           %>                    
           <div id='dayDiv' class="dayDiv">
            <fieldset><legend><h4>Day ID: <%=DayID1%></h4></legend>
                <table align="center">
                    <tr>
                        <td>Day_ID:</td>
                        <td><%=DayID1%> </td>
                    </tr>
                    
                    <tr>
                        <td>Country:</td>
                        <td><%=country1%></td>
                        
                    </tr>
                    
                    <tr>
                        <td>Day:</td>
                        <td><%=day1%></td>
                    </tr>
                    
                    <tr>
                        <td>Week:</td>
                        <td><%=week1%></td>
                    </tr>
                    
                    <tr>
                        <td>Month:</td>
                        <td><%=month1%></td>
                    </tr>
                    
                    <tr>
                        <td colspan="2" align="center">
                            <a href="?edit_id=<%=DayID1%>"><button>Edit</button></a>
                        </td>
                    </tr>
                    
                    <tr>
                        <td colspan="2" align="center">
                            <a href="?delete_id=<%=DayID1%>"><button>Delete</button></a>
                        </td>
                    </tr>
                </table>         
            </fieldset>
        </div>
           <%
                } 
                
             }
          %>

   
       <script lang="javaScript">
              }
              else
                {
                    
        </script>
            
        
        <%
               st1=con.createStatement();
               rs1=st1.executeQuery("select * from datewise");
               while(rs1.next())
              {  
                int DayID2=rs1.getInt(1);
                int date2=rs1.getInt(2);
                int month2=rs1.getInt(3);
                String country2=rs1.getString(4);
      
        %>
        
        <div id='dateDiv' class="dateDiv" hidden="true">
            <fieldset><legend><h4>Day ID: <%=DayID2%></h4></legend>
                <table>
                    <tr>
                        <td>ssssDay_ID:</td>
                        <td><%=DayID2%></td>
                    </tr>
                    
                    <tr>
                        <td>Date:</td>
                        <td><%=date2%></td>
                    </tr>
                    
                     <tr>
                        <td>Month:</td>
                        <td><%=month2%></td>
                    </tr>
                    
                    <tr>
                        <td>Country:</td>
                        <td><%=country2%></td>
                    </tr>
                    
                    <tr>
                        <td colspan="2" align="center">
                            <a href="edit.jsp"><button>Edit</button></a>
                        </td>
                    </tr>
                    
                    <tr>
                        <td colspan="2" align="center">
                            <a href="delete.jsp"><button>Delete</button></a>
                        </td>
                    </tr>
                </table>
            </fieldset>
        </div>        
        
        <%
              }     
        %>
        
        
        <script lang="javascript">
            }
        }
        </script>
        
              <jsp:include page="footer.jsp"></jsp:include>

        <%
              Object txtid=request.getParameter("txtid");
              
              if(txtid!=null)
              {
              Object id=request.getParameter("DayID1");
              Object txtcountry=request.getParameter("txtcountry");
              Object txtday=request.getParameter("txtday");
              Object txtweek=request.getParameter("txtweek");
              Object txtmonth=request.getParameter("txtmonth");
              
              st2=con.createStatement();
              int a=st2.executeUpdate("update daywise set Day_ID="+txtid+", Country='"+txtcountry+"', Day="+txtday+", Week="+txtweek+", Month="+txtmonth+" where Day_ID="+txtid);
        %>
        
        <script lang="javaScript">
        window.location="editDay.jsp";
        </script>
        <%
              }
            
              
              Object dID=request.getParameter("delete_id");
              if(dID!=null)
              {
              st3=con.createStatement();
              int a=st3.executeUpdate("delete from daywise where Day_ID="+dID);
        %>
        
        <script lang="javaScript">
         window.location="editDay.jsp";
        </script>
        
       <%
              }        
        %>
 
      
    </body>
</html>