
<%@page import="java.io.File"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.net.URL"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%
               String paths="somepath/hotel1.txt"; 


                File fileObject = new File(paths);

                char data[] = new char[(int) fileObject.length()];
                FileReader filereader = new FileReader(paths);

                int charsread = filereader.read(data);
                out.println(new String(data, 0 , charsread));

                filereader.close();
            %>
    </body>
</html>
