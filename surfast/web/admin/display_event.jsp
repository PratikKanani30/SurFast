

<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date,java.text.SimpleDateFormat,java.text.ParseException"%>
<%@page contentType="text/html" import="java.sql.*" language="java" session="true" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
	Statement stmt,st;
	ResultSet rs,rs1;
        %>
        <%
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost/surfast","root","");
            stmt=con.createStatement();
            st=con.createStatement();
            rs=stmt.executeQuery("select distinct e1.Title,e1.Venue,e1.TimeStampFrom,e1.TimeStampTo,e1.Organizer,e1.Description,c1.Name,e1.City_ID,c1.City_ID,e1.Event_ID FROM eventdetail as e1,city as c1 WHERE c1.City_ID=e1.City_ID");
            
            while(rs.next())
            { 
                String des=rs.getString(6);
                String nm=rs.getString(1);
		String org=rs.getString(5);
		String ven=rs.getString(2);
                String city=rs.getString(7);
                String tdate=rs.getString(4);
                String fdate=rs.getString(3);
		int id=rs.getInt(10);
                
                if(request.getParameter("Event_ID")!=null)
                {
                  int eid=Integer.parseInt(request.getParameter("Event_ID"));
                  if(eid==id)
                 {

        %>
        
        <fieldset style="width:10%; float: left; padding-left: 1%; padding-right:1%;">
            <legend><h4>Event ID: <%=id%></h4></legend>
                <form>
                <table align="center">
                    
                    <tr>
                        <td>Event_ID:</td>
                        <td><input type="text" id="txtid" name="txtid" value="<%=id%>" readonly/></td>
                    </tr>
                    <tr>
                        <td>Event Name:</td>
                        <td><input type="text" id="txtnm" name="txtnm" value="<%=nm%>" required="required" onBlur="check('txtnm','req1')"/></td>
                        <td style="display:none;color:#F00;" id="req1">*Required</td>
                    </tr>
                    <tr>
                        <td> Event City:</td>
                        <td> 
                        <select  name="city" id="city">   
                            <%
                                rs1=st.executeQuery("select * from city");
                           while(rs1.next())
                            { 
                                 String nm1=rs1.getString(4); 
                                 int City_ID=rs1.getInt(1);
                            %>
                                 <option value="<%=City_ID%>"><%=nm1%></option> 
                            <%
                                } 
                            %> 
                         </select>
                        </td>
                    </tr>
                    <tr>
                        <td>To Date:</td>
                        <td><input type="datetime-local" id="txtto" name="txtto" required="required"  value="<%=tdate%>" onBlur="check('txtto','req2')"/></td>
                        <td style="display:none;color:#F00;" id="req2">*Required</td>
                    </tr>
                    <tr>
                        <td>From Date:</td>
                        <td><input type="datetime-local" id="txtfrom" name="txtfrom" required="required" value="<%=fdate%>" onBlur="check('txtfrom','req3')"/></td>
                        <td style="display:none;color:#F00;" id="req3">*Required</td>
                    </tr>
                    <tr>
                        <td>Event Venue:</td>
                        <td><input type="text" id="txtven" name="txtven" value="<%=ven%>" required="required" onBlur="check('txtven','req7')"/></td>
                        <td style="display:none;color:#F00;" id="req7">*Required</td>
                    </tr>
                    <tr>
                        <td>Organizer:</td>
                        <td><input type="text" id="txtorg" name="txtorg" value="<%=org%>" required="required" onBlur="check('txtorg','req8')"/></td>
                        <td style="display:none;color:#F00;" id="req8">*Required</td>
                    </tr>
                    <tr>
                        <td>Description:</td>
                        <td><input type="text" id="txtdesc" name="txtdesc" value="<%=des%>" required="required" onBlur="check('txtdesc','req6')"/></td>
                        <td style="display:none;color:#F00;" id="req6">*Required</td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center"><button>Edit Done</button></td>
                    </tr>
                </table>
                </form>
        </fieldset>
        <%
                 }
                   else
                  {
            %>  
        <fieldset style="width:15%; float: left; padding-left: 1%; padding-right:1%;">
                <legend>Event Detail: <%=id%></legend>
         <form>
            <table>
              
                <tr>
                    <td>
                        Event Name:
                    </td>
                    <td><%=nm%></td>
                </tr>
                
                <tr>
                    <td>
                        Event City:
                    </td>
                    <td><%=city%></td>
                </tr>
                
                <tr>
                    <td>
                        To Date:
                    </td>
                    <td>
                        
                       <%
                         SimpleDateFormat sf=new SimpleDateFormat("dd'th' MMMM yyyy 'at' HH:mm");
                         String lDate=sf.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(tdate));
                         out.println(lDate);
                       %>
                    </td>
                </tr>
                <tr>
                    <td>
                        From Date:
                    </td>
                    <td>
                        <%  
                           SimpleDateFormat sf1=new SimpleDateFormat("dd'th' MMMM yyyy 'at' HH:mm");
                           String lDate1=sf1.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(fdate));
                           out.println(lDate1);
                        %>
                    </td>
                    
                </tr>
                <tr>
                    <td>
                        Event Venue:
                    </td>
                    <td><%=ven%></td>
                </tr>
                <tr>
                    <td>
                        Organizer:
                    </td>
                    <td><%=org%></td>
                </tr>
                <tr>
                    <td>
                        Description:
                    </td>
                    <td><%=des%></td>
                </tr>
                <tr>
                    <td><a href="?Event_ID=<%=id%>">Edit</a></td>
                    <td><a href="?delete_id=<%=id%>">Delete</a></td>
                </tr>
            </table> 
                </form>
           
        </fieldset> 
                <%
                  }
            }
                else
                {
             %>     <fieldset style="width:15%; float: left; padding-left: 1%; padding-right:1%;">
                <legend>Event Detail: <%=id%></legend>
        <form>
            <table>
               
                <tr>
                    <td>
                        Event Name:
                    </td>
                    <td><%=nm%></td>
                </tr>
                
                <tr>
                    <td>
                        Event City:
                    </td>
                    <td><%=city%>    </td>
                </tr>
                
                <tr>
                    <td>
                        To Date:
                    </td>
                    <td>
                        
                       <%
                         SimpleDateFormat sf=new SimpleDateFormat("dd'th' MMMM yyyy 'at' HH:mm");
                         String lDate=sf.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(tdate));
                         out.println(lDate);
                       %>
                    </td>
                </tr>
                <tr>
                    <td>
                        From Date:
                    </td>
                    <td>
                        <%  
                           SimpleDateFormat sf1=new SimpleDateFormat("dd'th' MMMM yyyy 'at' HH:mm");
                           String lDate1=sf1.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(fdate));
                           out.println(lDate1);
                        %>
                    </td>
                    
                </tr>
                <tr>
                    <td>
                        Event Venue:
                    </td>
                    <td><%=ven%></td>
                </tr>
                <tr>
                    <td>
                        Organizer:
                    </td>
                    <td><%=org%></td>
                </tr>
                <tr>
                    <td>
                        Description:
                    </td>
                    <td><%=des%></td>
                </tr>
                <tr>
                    <td><a href="?Event_ID=<%=id%>">Edit</a></td>
                    <td><a href="?delete_id=<%=id%>">Delete</a></td>
                </tr>
                  </table>
                </form>
          
        </fieldset>    
                    
         <%
                } 
                
             }
          %>     
             <%
              Object txtid=request.getParameter("txtid");
              
              if(txtid!=null)
              {
              Object id=request.getParameter("id");
              Object txtcity=request.getParameter("txtcity");
              Object txtnm=request.getParameter("txtnm");
              Object txtto=request.getParameter("txtto");
              Object txtfrom=request.getParameter("txtfrom");
              Object txtven=request.getParameter("txtven");
              Object txtorg=request.getParameter("txtorg");
              Object txtdesc=request.getParameter("txtdesc");
              Object city=request.getParameter("city");
                    stmt=con.createStatement();
                    int a=stmt.executeUpdate("update eventdetail set Title='"+txtnm+"',City_ID="+city+", Description='"+txtdesc+"', Organizer='"+txtorg+"', TimeStampTo='"+txtto+"', TimeStampFrom='"+txtfrom+"',Venue='"+txtven+"' where Event_ID="+txtid);
            
              %>
              
              
              <script lang="javascrip">
                  window.location="display_event.jsp";
              </script>
             <%
              }
              Object id=request.getParameter("delete_id");
              if(id!=null)
              {
                    stmt=con.createStatement();
                    int a=stmt.executeUpdate("delete from eventdetail where Event_ID="+id);
              
              %>  
              <script lang="javascrip">
                  window.location="display_event.jsp";
              </script>
            
              <%
              }
              %>
             
    </body>
</html>
