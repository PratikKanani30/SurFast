
<%@page contentType="text/html" import="java.sql.*" language="java" session="true" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Side of Event</title>
        <script language="javascript">

        function check(e,r)
        {
            var n=document.getElementById(e);
            var req=document.getElementById(r);
	
            if(n.value=='')
            {
               	req.style.display='inline';
            }
            else
            {
                req.style.display='none';	
            }
        }

        </script>
    </head>
    <body>
        
        <%!
	Connection con;
	Statement stmt;
	ResultSet rs;
        %>
        <%
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost/surfast","root","");
            stmt=con.createStatement();
            Object evtnm=request.getParameter("eventname");
	if(evtnm!=null)
	{
		Object city=request.getParameter("city");
		Object fdate=request.getParameter("fromdate");
		Object tdate=request.getParameter("todate");
		Object org=request.getParameter("org");
                Object venue=request.getParameter("venue");
                Object desc1=request.getParameter("desc1");
		Object st=request.getParameter("st");
                Object et=request.getParameter("et");
                
               /* todate
                String dt=tdate.toString();
                String tm=st.toString();
               String cdt=dt+" "+tm;
               fromdate
               String dt2=fdate.toString();
               String tm2=et.toString();
               String cdt2=dt2+" "+tm2;*/
              
                int c= stmt.executeUpdate("insert into eventdetail (Description,Organizer,TimeStampTo,TimeStampFrom,Venue,Title,City_ID) values('"+desc1+"','"+org+"','"+tdate+"','"+fdate+"','"+venue+"','"+evtnm+"',"+request.getParameter("city")+")");
                
                if(c!=0)
		{
			out.print("successfully Added");
                        out.print("</br>");                       
                        out.print("<a href='display_event.jsp'>Display Added Event</a>");
                        out.print("</br>");
                        out.print("<a href='admin_event.jsp'>Again Insert Event</a>");
		}
                else
		{
			out.print("unsuccessfully Added");					
                }          
               
        }
        else
        {   
            
          %>
        
        
            <fieldset>
                <legend>Admin Side of Event</legend>
                <form> 
            <table align="center">
                           
                <tr>
                    <td>Event Name:</td>
                    <td><input type="text" name="eventname" id="eventname" required="required" onBlur="check('eventname','req1')"/></td>
                    <td style="display:none;color:#F00;" id="req1">*Required</td>
                </tr>
                
                <tr>
                    <td>Event City:</td>                
                    <td>                       
                        
                        <select  name="city" id="city">   
                            <%
                                rs=stmt.executeQuery("select * from city");
                            while(rs.next())
                            { 
                                 String nm=rs.getString(4); 
                                 int City_ID=rs.getInt(1);%>
                                 <option value="<%=City_ID%>"><%=nm%></option> 
                            <%
                                } 
                            %>                           
                        </select>
                    
                        </td>
                </tr>
                
                <tr>
                    <td>To Date:</td>
                    <td><input type="datetime-local" name="todate" id="todate" required="required" onBlur="check('todate','req2')"/></td>
                    <td style="display:none;color:#F00;" id="req2">*Required</td>
                </tr>
                
                <tr>
                    <td>From Date:</td>
                    <td><input type="datetime-local" name="fromdate" id="fromdate" required="required" onBlur="check('fromdate','req3')"/></td>
                    <td style="display:none;color:#F00;" id="req3">*Required</td>
                </tr>
                <!-- <tr>
                    <td>
                        Starting Time:
                    </td>
                    <td><input type="time" name="st" id="st" required="required" onBlur="check('st','req4')"/></td>
                    <td style="display:none;color:#F00;" id="req4">*Required</td>
                </tr>
                <tr>
                    <td>
                        Ending Time:
                    </td>
                    <td><input type="time" name="et" id="et" required="required" onBlur="check('et','req5')"/></td>
                    <td style="display:none;color:#F00;" id="req5">*Required</td>
                </tr>
                -->
                <tr>
                    <td>Organizer:</td>
                    <td><input type="text" name="org" id="org" required="required" onBlur="check('org','req6')"/></td>
                    <td style="display:none;color:#F00;" id="req6">*Required</td>
                </tr>
                
                <tr>
                    <td>Venue:</td>
                    <td><input type="text" name="venue" id="venue" required="required" onBlur="check('venue','req7')"/></td>
                    <td style="display:none;color:#F00;" id="req7">*Required</td>
                </tr>
                
                <tr>
                    <td>Description:</td>
                    <td><input type="text" name="desc1" id="desc1" required="required" onBlur="check('desc1','req8')"/></td>
                    <td style="display:none;color:#F00;" id="req8">*Required</td>
                </tr>
                
                <tr>    
                    <td></td>
                    <td><input type="submit" value="Insert Event" required="required"/></td>
                </tr>
                <tr>
                        <td>
                                 <a href='display_event.jsp'>Display Previous Event</a> 
                        </td>
                    </tr>  
                 </table>
                </form>
           
            </fieldset>
                <% 
                    }
                %>
                <table align="center">
                      
                </table>
                
    </body>
</html>
