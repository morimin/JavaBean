<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.kpmg.reports.ReportsItems" %>
<%@ page import = "com.kpmg.reports.ReportsList" %>
<%@ page import = "com.kpmg.reports.ArrangeReports" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="date" value="<%= new Date() %>" />
<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
%>    
    
<!DOCTYPE html>
<html>
<head>

<title>arrangedReports.jsp</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>


<div id=reportslist>
	<table>
		<tr>
		   <td class=reportsOrderHead>번호</td>
		   <td class=reportsYmdHead>날짜</td>
		   <td class=reportsSdHead>검색일</td>
		   <td class=reportsSortHead>구분</td>
		   <td class=reportsTimesHead>언론사</td>
		   <td class=reportsTitleHead>제목</td>
		   <td class=reportsUrlHead>URL</td>
		 </tr>
		  
		 <c:forEach var="cnt" begin="0" end="${ArrangedLIST.listSize -1}">
		 <tr>
		    <td class=reportsOrder> ${ArrangedLIST.idx[cnt] }</td>
		    <td class=reportsYmd>${ArrangedLIST.ymd[cnt] }</td>
		    <td class=reportsSd>${ArrangedLIST.search_date[cnt] }</td>
		    <td class=reportsSort>${ArrangedLIST.sort[cnt] }</td>
		    <td class=reportsTimes>${ArrangedLIST.times[cnt] }</td>
		    <td class=reportsTitle>${ArrangedLIST.title[cnt] }</td>
		    <td class=reportsUrl>${ArrangedLIST.url[cnt] }</td>	           
	   	</tr>
	    </c:forEach>
	    
	</table>
</div>


</body>
</html>