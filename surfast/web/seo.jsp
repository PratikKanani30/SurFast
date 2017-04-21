
<%@page import="java.io.*"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.net.*"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SEO Tool</title>
        <script src="js/surfast.js" type="text/javascript"></script>
        <script language="javascript">
            function validate()
            {
                var file = document.getElementById('file');
                var fileName = file.value;
                var ext = fileName.substring(fileName.lastIndexOf('.') + 1);
                if (ext === "html" || ext === "htm" || ext === "php" || ext === "jsp" || ext === "asp" || ext === "aspx")
                {
                    return true;
                }
                else
                {
                    alert("Oopps.....Invalid file type");
                    return false;
                }
            }
        </script>
    </head>
    <body>
        <form enctype="multipart/form-data" method="post" onsubmit="validate()">
            <table>
                <tr>
                    <td> Enter file: </td>
                    <td> <input type="file" name="file" id="file"/> </td>
                </tr>
                <tr>
                    <td> <input type="submit" name="submit" value="Submit"/> </td>                      
                </tr>
            </table>  
        </form> 
        <%
           //String file= "C:\\Google Drive\\Project\\Code\\admin-side-11-Feb\\addDay.jsp\\";
              StringBuffer ins = request.getRequestURL();
                out.println(ins);
                out.println("<br/>");
                
                URL obj=new URL("http://localhost:8080/surfast/web/index.jsp");
                InputStream is=obj.openStream();
				int a,i=0,i1=0;
				String s="";
				
				while((a=is.read())!=-1)
				{
					s=s+(char)a;				
				} 
                                
                                StringBuffer buf = new StringBuffer(s);
					while(true)
					{
						int meta=buf.indexOf("<meta",i1);
		
						if(meta==-1) 
						{ 
			  				break;      
						}
						int start=meta+6;
						int end=buf.indexOf("/>",start);
						buf=buf.replace(start,end,"");
						i1=end+1;
                                                out.println(s.substring(start,end));
                                                
					}
						
					s=buf.toString();
                                        
        %>

    </body>
</html>
