<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "com.kpmg.reports.SearchReports" %>
<%@ page import="java.util.*" %>    
<c:set var="date" value="<%= new Date() %>" />
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<% 
 request.setCharacterEncoding("utf-8");
 response.setCharacterEncoding("utf-8");  
 
 String disting = request.getParameter("disting");
 request.setAttribute("disting", disting);
 
%> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KPMG ACI임시 페이지입니다.</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body> 
<br>

<h1>ACI Daily Newsletter</h1><br><br>


<fmt:formatDate value="${date }" type="both" pattern="yyyy-MM-dd"/><br><br><br><br>


 <sql:query var = "rs" dataSource="jdbc/kpmgsmdb_pool">
  select distinct ordform, titleform, urlform from reportsform where sdform = '<fmt:formatDate value="${date }" type="both" pattern="yyyy-MM-dd"/>' order by ordform asc
 </sql:query>

 <br>
 <div id=reportsform>
 
 <table>
	 <tr>
		 <td class=finalOrdHead>No.</td>
		 <td class=finalTitleHead>기사제목</td>
	 </tr>


 <c:forEach var="row" items="${rs.rows }">

	 <tr>
		 <td class= finalOrd>${row.ordform }</td>
		 <td class= finalTitle><a href ="${row.urlform }">${row.titleform }</a></td>
	 </tr>
	 </c:forEach>
 </table> <br><br><br>
 
 
 
 
</div>
  

</body>
</html>