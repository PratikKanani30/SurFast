

<%@page contentType="text/html" session="true" pageEncoding="UTF-8" import="java.util.*, java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="style.css" rel="stylesheet" type="text/css"/>
        <title>Day Celebration</title>
        
        <script lang="javaScript">   
            function loadDay()
            {
                
                var d1=document.getElementById('dayDiv');
                d1.style.display='inline';
   
                var d2=document.getElementById('dateDiv');
                d2.style.display='none';
            }

             function unloadDay()
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
                req.open("GET", "next.jsp?radio1="+document.getElementById('r1').value+"radio2="+document.getElementById('r2').value+"&title="+document.getElementById('title').value+"&description="+document.getElementById('description').value+"&celebrationType="+document.getElementById('celebration_type').value+"&ctype="+document.getElementById('cType').value+"&enable="+document.getElementById('enable').value+"&country="+document.getElementById('country').value+"&day="+document.getElementById('dayD').value+"&week="+document.getElementById('week1').value+"&month="+document.getElementById('month2').value+"&date="+document.getElementById('date1').value+"&month1="+document.getElementById('month1').value+"&country1="+document.getElementById('country1').value+"&image="+document.getElementById('photo').value, false);
                req.send(null);
                
                
           // fl.value=photo.value;
            //frm1.submit();
            frm2.submit();
            }
        </script>
        
    </head>
    <body>
        <jsp:include page="dayHeader.jsp"></jsp:include>
        
        <div>
            <fieldset><legend><h4>Add Day Celebration</h4></legend>
                <form method="get">
                    <table align="center"> 
                    <tr>
                        <td> <input type="radio" id="r1" name="dc" value="daywise" onclick="loadDay()" checked/>Daywise</td>
                    </tr>
                    
                  
                    <tr>
                        <td><input type="radio" id="r2" name="dc" value="datewise" onclick="unloadDay()"/>Datewise</td>
                    </tr>
                 
                
                    <tr>
                        <td>Title:</td>
                        <td><input type="text" id="title" name="title" placeholder="Enter Title" ></td>  
                    </tr>
                    
                    <tr>
                        <td>Description:</td>
                        <td><input type="text" id="description" name="description" placeholder="Enter Description"></td>
                    </tr>
                    
                    <tr>
                        <td>Celebration_Type:</td>
                        <td> <select id="celebration_type" name="celebration_type">
                                <option>Daywise</option>
                                <option>Datewise</option>
                            </select>  
                        </td>
                    </tr>
                    
                    <tr>
                        <td>C_Type:</td>
                        <td> <select id="cType" name="cType">
                                 <option>National</option>
                                 <option>International/Global</option>
                            </select>    
                        </td>              
                    </tr>
                    
                    <tr>
                        <td>Enable:</td>
                        <td> <input type="radio" id="enable" name="enable" value="1" checked="checked"/>Yes </td>
                        <td> <input type="radio" id="enable" name="enable" value="0"/>No </td>  
                    </tr>
                 </table>
                         
                <div id="dayDiv">
                    <table  align="center">
                    <tr>
                        <td>Country:</td>
                        <td><input type="text" id="country" name="country" placeholder="Enter Country" /></td>
                    </tr>
                    
                    <tr>
                        <td>Day:</td>
                        <td><input type="date" id="dayD" name="dayD" onblur="checkDate('dayD','reqDayD')"></td>
                        <span id="reqDayD" style="display:none;color:red;">*Day should be between 1 to 31</span>   
                    </tr>
                    
                    <tr>
                        <td>Week:</td>
                        <td> <select name="week1" id="week1">
                                   <option>1</option>
                                   <option>2</option>
                                   <option>3</option>
                                   <option>4</option>
                            </select>
                        </td>
                    </tr>
                    
                    <tr>
                        <td>Month:</td>
                        <td><input type="month" id="month2" name="month2" onblur="checkMonth('month2','reqMonth2')">
                            <span id="reqMonth2" style="display:none;color:red;">*Month should be between 1 to 12</span>
                        </td>
                    </tr>
                        </table>
                    </div>
                    
                    <div id="dateDiv" hidden="true">
                        <table align="center">
                    <tr>
                        <td>Date:</td>
                        <td><input type="date" id="date1" name="date1" onblur="checkDate('date1','reqDate1')">
                            <span id="reqDate1" style="display:none;color:red;">*Date should be between 1 to 31</span>

                        </td>  
                    </tr>
                    
                    <tr>
                        <td>Month:</td>
                        <td><input type="month" id="month1" name="month1" onblur="checkMonth('month1','reqMonth1')">
                            <span id="reqMonth1" style="display:none;color:red;">*Month should be between 1 to 12</span>
                        </td>
                    </tr>
                    
                    <tr>
                        <td>Country:</td>
                        <td><input type="text" id="country1" name="country1"></td>
                    </tr>
                </table>
            </div>                    
            </form>  
                
                <form enctype="multipart/form-data" method="post" id="frm2" action="upload.jsp" target="_blank">                          
                      <tr>
                          <td>Image</td>
                      </tr>
                      <tr>
                          <td><input type="file" name="photo" id="photo"></td>
                      </tr>
                  </form>
            <input type="button" value="submit" onclick="go()"/>
        </div>
            </fieldset>
            
             
        
        <div style="margin-bottom: 173px;">
            <a href="editDay.jsp"><button align="center">Click here to see Day Celebration</button></a><br><br>
            <a href="usersImage.jsp"><button>Click here to see client uploaded Images</button></a>
        </div>
       
        
        <%
                 if(request.getParameter("file")!=null)
            { 
        %>
                 <img src="images/<%=request.getParameter("file")%>" />
        <%
             }
        %>
        
   <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>