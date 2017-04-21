


<%@page import="org.apache.catalina.connector.Request"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>  
    <metequiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form method="post" hidden="true">
        <input type="text"  name="txtnm" placeholder="Enter your searchword"/>
        <input type="submit"  name="submit" value="search"/>
        <input type="hidden" name="page" value="1"/>
        </form>
    
       <%!
        Connection con;
        Statement srch,srch1,srch2;
        ResultSet rsrch,rsrch1,rsrch2,rsrch3;
         int csrch=0;
        
    %>
    
    <%
         Object n=request.getParameter("txtnm");
       if(n!=null)
       {
        try
        {
              
        Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost/surfast","root","");
        srch=con.createStatement();
        srch1=con.createStatement();
        srch2=con.createStatement();
        int pg1;
         Object p=request.getParameter("page");
            if(p==null)
            {
                pg1=1;
            }
            else
            {
            pg1=Integer.parseInt(p+"");
            }
           
           int l=pg1*10;
    
       String sql="select sid from keyword where keyword like'%"+request.getParameter("txtnm")+"%' limit "+(l-10+1)+",10";
      //out.print(sql);
       rsrch1=srch1.executeQuery(sql);
      
       int count=0;
       while(rsrch1.next())
       { count++;
           if(rsrch1!=null)
           {
           int s=rsrch1.getInt(1);
           String sql1="select sid,url,description,title from site_reference where sid='"+s+"'";
           rsrch2=srch2.executeQuery(sql1);
        
           while(rsrch2.next())
           {
              String u=rsrch2.getString("url");
              String desc=rsrch2.getString("description");
              String ttl= rsrch2.getString("title");
              int id=rsrch2.getInt(1);
            %> 
            <div>
            <%
              out.println(id);
              out.println("<a href="+u+">"+ttl+"</a><br>");
              out.println(desc);
            %>
            </div>
            <%
           }
           }
           
          
       }
        String sql1="select count(*) from keyword where keyword like'%"+request.getParameter("txtnm")+"%'";
        rsrch3=srch1.executeQuery(sql1);
        rsrch3.next();
        csrch=rsrch3.getInt(1);
        
       float pg2=csrch/10.0f;
     
      
       for(int j=1;j<=(pg2+(1-(pg2%1))%1);j++)
       {
           out.println("<a href=index.jsp?txtnm="+request.getParameter("txtnm")+"&page="+j+">"+j+"</a>");
           out.println("\t");
       }
       
      if(count==0)
           {
               out.println("No results found");
           }
        }  
       catch(Exception e)
       {
               out.print(e);
       }
       }
       
    %>
    </body>
</html>
