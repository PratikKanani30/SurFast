
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div>
            <sql:setDataSource driver="com.mysql.jdbc.Driver" user="root" url="jdbc:mysql://localhost/surfast" password="" var="statment"/>
            <sql:query dataSource="${statment}" var="rs" sql="select * from city where Name='${param.location}'"/>
                <c:forEach items="${rs.rows}" var="r">
                    <c:set var="id" value="${r.City_ID}" scope="page"/>            
                </c:forEach>
          
            <c:if test="${id!=0}">
                <sql:setDataSource driver="com.mysql.jdbc.Driver" user="root" url="jdbc:mysql://localhost/surfast" password="" var="ds"/>
                <sql:query dataSource="${ds}" var="x">
                    select count(*) mn from eventdetail where City_ID=${id}
                </sql:query>
                
                <c:forEach items="${x.rows}" var="t">
                   
                    <c:set var="kk" value="${t.mn}"/>
                   
                </c:forEach>
                
            </c:if>
                    
                    
           <c:set var="page" value="${kk/5.0}" scope="page"/>
           
           <fmt:formatNumber var="no_page" value="${page+(1-page%1)%1}" type="number" pattern="#"></fmt:formatNumber>
             
        <c:set var="start" value="${0}"/>
                <c:set var="end" value="${5}"/>
                <c:if test="${not empty param.page}">

                    <c:set var="start" value="${(param.page-1)*5}"/>
                      <c:set var="end" value="${param.page*5}"/>
                </c:if> 
                                       
                           
        <sql:query dataSource="${statment}" var="r" sql="select e1.Title,e1.Venue,e1.TimeStampFrom,e1.TimeStampTo,e1.Organizer,e1.Description,c1.Name,e1.City_ID,c1.City_ID,e1.Event_ID FROM eventdetail as e1,city as c1 WHERE c1.City_ID=e1.City_ID and c1.Name='${param.location}' limit ${start},5"/>
        
        
                    

             <c:forEach var="row" items="${r.rows}">
                <fieldset style="width:20%; float: left; padding-left: 1%; padding-right:1%;">  
                    <legend>${'Event ID : '}${row.Event_ID}</legend>
                    <table>
                        <tr>
                            <td>${'Title:'}</td>
                            <td>${row.Title}</td>
                        </tr>
                        <tr>
                            <td>${'City:'}</td>
                            <td>${row.Name}</td>
                        </tr>
                        <tr>
                            <td>${'Description:'}</td>
                            <td>${row.Description}</td>
                        </tr>
                        <tr>
                             <td>${'Organizer:'}</td>
                            <td>${row.Organizer}</td>
                        </tr>
                        <tr>
                            <td>${'TimeStampTo:'}</td>
                            <td>  <c:set value="${row.TimeStampTo}" var="dateString" />
            <fmt:parseDate value="${dateString}" var="dateObject" pattern="yyyy-MM-dd HH:mm:ss" />
             <fmt:formatDate value="${dateObject}" pattern="dd'th' MMMM yyyy 'at' HH:mm" /></td>
                        </tr>
                        <tr>
                            <td>${'TimeStampFrom:'}</td>
                            <td>  <c:set value="${row.TimeStampFrom}" var="dateString" />
            <fmt:parseDate value="${dateString}" var="dateObject" pattern="yyyy-MM-dd HH:mm:ss" />
             <fmt:formatDate value="${dateObject}" pattern="dd'th' MMMM yyyy 'at' HH:mm" /></td>
                        </tr>
                    </table> 
                </fieldset>
             </c:forEach> 
                       
        <br/><br/><table style="margin-top:30%;"><tr><td>
                                 <c:forEach var="i" begin="1" end="${no_page}" step="1">
                                     <a href="show_event.jsp?page=${i}"><c:out value="${i}"/></a>
                                 </c:forEach></td></tr>
        </table> 
                  
        </div>
    </body>
</html>
