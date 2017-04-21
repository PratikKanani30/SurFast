
<%@page contentType="text/html"  session="true" pageEncoding="UTF-8" import="java.util.*, java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Day Celebration</title>
        
        <script>
             function go()
            {
                var req;
                if(window.XMLHttpRequest)
                    req=new XMLHttpRequest();
                else
                 req=new ActiveXObject("Microsft.XMLHTTP");

                var fn=photo.value;
                 var nm=fn;
                 var n=fn.indexOf('fakepath');
                if(n>0)
                nm=fn.substr(n+9,fn.length-n-8);
            //alert(nm);
                req.open("post", "next1.jsp?DayID="+document.getElementById('dayid').value+"&Title="+document.getElementById('daytitle').value+"&Country="+document.getElementById('country1').value+"&Image="+document.getElementById('photo').value, false);
                req.send(null);
                
                
           // fl.value=photo.value;
            //frm1.submit();
            frm2.submit();
            }
            
             function goo()
            {
                var req;
                if(window.XMLHttpRequest)
                    req=new XMLHttpRequest();
                else
                 req=new ActiveXObject("Microsft.XMLHTTP");

                var fn=photo1.value;
                 var nm=fn;
                 var n=fn.indexOf('fakepath');
                if(n>0)
                nm=fn.substr(n+9,fn.length-n-8);
            //alert(nm);
                req.open("post", "next1.jsp?DayID1="+document.getElementById('dayid1').value+"&Title1="+document.getElementById('daytitle1').value+"&Image1="+document.getElementById('photo1').value, false);
                req.send(null);
                
                
           // fl.value=photo.value;
            //frm1.submit();
            frm3.submit();
            }
        </script>
    </head>
    <body>
 
        <%
        Object nm=session.getAttribute("users");
        %>
        welcome  <%=nm%><br>
        <a href="logout.jsp">Log out</a><br>
        
        
        <%!
            Connection con;
            Statement st;
            ResultSet rs;
            Statement st1;
            ResultSet rs1;
        %>
        
        <%
            Class.forName("com.mysql.jdbc.Driver");
	    con=DriverManager.getConnection("jdbc:mysql://localhost/surfast","root","");
	    st=con.createStatement();
            rs=st.executeQuery("select Day_ID,Title,Celebration_Type from daycelebration");
            
             out.println("<div class='userDay' style='float:left;'>");
             out.println("<table border='1'>");
             out.println("<tr>");
             out.println("<th style='display: none;'>");
             out.println("ID");
             out.println("</th>");
             out.println("<th>");
             out.println("Title");
             out.println("</th>");
             out.println("<th>");
             out.println("Celebration Type");
             out.println("</th>");
             out.println("</tr>");
            while(rs.next())
            {
                int id=rs.getInt(1);
                String title=rs.getString(2);
                String celebrationtype=rs.getString(3);          
        %>
                    <tr> 
                        <td style='display: none;'><%=id%></td>
                        <td><a href="?day_id=<%=id%>+&title_name=<%=title%>+&celebration_type=<%=celebrationtype%>"><%=title%></a></td>
                        <td><%=celebrationtype%></td>                     
                    </tr>
   
       <% 
            }          
            out.println("</table>");
            out.println("</div");

       %>
       
       <div class="display" style="float: left;">
           <%
            Object getid=request.getParameter("day_id");
            String gettitle=request.getParameter("title_name");
            String getcelebration=request.getParameter("celebration_type");

            if(gettitle!=null)
            {
           %>           
           <h2><p>Upload Image for <%=gettitle%></p></h2>
           <%
           
              // st1=con.createStatement();      
               if(getcelebration.equals("National"))
               {
           %>
           <div>
           <form>
               <table>
                   <tr>
                       <td style="display: none;">ID:</td>
                       <td style="display: none;"><input type="text" id="dayid" name="dayid" value="<%=getid%>"></td>
                   </tr>
                   <tr>
                       <td>Title:</td>
                       <td><input type="text" id="daytitle" name="daytitle" value="<%=gettitle%>" readonly></td>
                   </tr>
               
                   <tr>
                       <td>Country:</td>
                       <td><select name="country1" id="country1">
                               <option>India</option>
                               <option>USA </option>
                               <option>UK</option>
                               <option>China</option>
                               <option>Pakistan</option>
                               <option>Bangladesh</option>
                               <option>Japan</option>
                           </select>
                       </td>
                   </tr>
               </table>
           </form>
           <form enctype="multipart/form-data" method="post" id="frm2" action="uploadImage.jsp" target="_blank">                          
                      <tr>
                          <td>Image:</td>
                      </tr>
                      <tr>
                          <td><input type="file" name="photo" id="photo"></td>
                      </tr>
                  </form>
            <input type="button" value="submit" onclick="go()"/>
               
           </form>
           </div>   
                 
                 
          <%
               }
               
               else
               {
          %>
                 <div>
           <form>
               <table>
                   <tr>
                       <td style="display: none;">ID:</td>
                       <td style="display: none;"><input type="text" id="dayid1" name="dayid1" value="<%=getid%>"></td>
                   </tr>
                   <tr>
                       <td>Title:</td>
                       <td><input type="text" id="daytitle1" name="daytitle1" value="<%=gettitle%>" readonly></td>
                   </tr>
                 
               </table>
           </form>
                   
           <form enctype="multipart/form-data" method="post" id="frm3" action="uploadImage.jsp" target="_blank">                          
                      <tr>
                          <td>Image:</td>
                      </tr>
                      <tr>
                          <td><input type="file" name="photo" id="photo1"></td>
                      </tr>
                  </form>
            <input type="button" value="submit" onclick="goo()"/>
               
           </form>
                 </div>       
                   
         <%
               }
            }
         %>
       
    </body>
</html>
