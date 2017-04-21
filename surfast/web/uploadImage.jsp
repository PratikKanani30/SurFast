<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>

<body>
<%@ page import="java.io.*"%>
<%!
String fn;
%>
<%
      String saveFile = "";
      String contentType = request.getContentType();
      if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) 
	  
	  
	  {
            DataInputStream in = new DataInputStream(request.getInputStream());
			
            int formDataLength = request.getContentLength();
			
			
            byte dataBytes[] = new byte[formDataLength];
			
			
            int byteRead = 0;
			
            int totalBytesRead = 0;
			
            while (totalBytesRead < formDataLength) {
				
                  byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
                  totalBytesRead += byteRead;
            }
			
			
/*String sb=new String(dataBytes);
out.print(sb);*/

            String file = new String(dataBytes);
			out.print(file);
            saveFile = file.substring(file.indexOf("filename=\"") + 10);


            saveFile = saveFile.substring(0, saveFile.indexOf("\n"));

            saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1, saveFile.indexOf("\""));
            int lastIndex = contentType.lastIndexOf("=");

            String boundary = contentType.substring(lastIndex + 1, contentType.length());

out.print("<br><br>"+boundary);

            int pos;

           pos = file.indexOf("filename=\"");
           pos = file.indexOf("\n", pos) + 1;
            pos = file.indexOf("\n", pos) + 1;
            pos = file.indexOf("\n", pos) + 1;



          int boundaryLocation = file.indexOf(boundary, pos) - 4;
            int startPos = ((file.substring(0, pos)).getBytes()).length;
            int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;


            //saveFile = "\\upload\\" + saveFile;
 fn=saveFile;
 saveFile = "C:\\xampp\\apache-tomcat-8.0.15\\webapps\\surfast\\web\\admin\\userImages\\" + saveFile;


            File ff = new File(saveFile);
            FileOutputStream fileOut = new FileOutputStream(ff);
            fileOut.write(dataBytes, startPos, (endPos - startPos));
            fileOut.flush();
            fileOut.close();
      }
       try
      {
     // if(session.getAttribute("url")!=null)
     //String path=session.getAttribute(url).toString();
  //   response.sendRedirect(session.getAttribute("url").toString());
      }
      catch(Exception e)
      {
          
      }
%>

<jsp:forward page="displayDayCelebration.jsp"></jsp:forward>

</body>
</html>