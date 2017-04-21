

<%@page contentType="text/html" pageEncoding="UTF-8" session="true" import="java.util.*, java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Images</title>
    </head>
    <body>
 <jsp:include page="dayHeader.jsp"></jsp:include>
        <%!
            Connection con;
            Statement st,st1,st2,st3;
            ResultSet rs,rs1,rs2,rs3;
        %>

        <%
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/surfast", "root", "");
            st = con.createStatement();
            rs = st.executeQuery("select distinct Title from usersimage order by Day_ID");
        %>

        <div>
            <form>
                <table border="1">
                    <tr>
                        <th>Title</th>
                        <th>Country</th>
                    </tr>

                    <%
                        while (rs.next()) 
                        {
                            String title = rs.getString(1);
                                       
                    %>
                    
                    <tr>                   
                        <td><a href="?title=<%=title%>"><%=title%></a></td>     
                        <td>
                            <select  name="country" id="country">   
                                <%
                                    st1 = con.createStatement();
                                    rs1 = st1.executeQuery("SELECT Country FROM usersimage WHERE Title like '"+title+"'");
                                    while (rs1.next()) 
                                    {
                                        String country=rs1.getString(1)+"";
                                        out.print("<option value=" + country + ">" + country + "</option>");
                                    }
                                %>
                            </select>
                        </td>
                        
                        <%
                                       Object gettitle=request.getParameter("title");
                                       Object getcountry=request.getParameter("country");
                   
                                       if(gettitle!=null)
                                         {
                                            st3=con.createStatement();
                                            rs3=st3.executeQuery("select * from usersimage where Title='"+title+"'");
                                        while(rs3.next())
                                           {
                                             String img=rs3.getString(4);
                        %>
                              
                        <td>
                               <img src="userImages/<%=img%>" width="150px" height="150px"/>
                               <input type="submit" value="Submit">

                        </td>
                        
                        
                   <%
                                           }
                                         }
                       }   
                   %>
                    </tr>
                   
                </table>
            </form>
                   <jsp:include page="footer.jsp"></jsp:include>
        </div>
                    
    </body>
</html>


