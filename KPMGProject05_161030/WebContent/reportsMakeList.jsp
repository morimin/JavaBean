<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.kpmg.reports.ReportsItems" %>
<%@ page import = "com.kpmg.reports.ReportsList" %>
<%@ page import = "com.kpmg.reports.ReportsMakeList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- <c:set var="date" value="<%= new Date() %>" /> --%>
<%@ page errorPage="errorpage.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");	
%>    
    
<!DOCTYPE html>
<html>
<head>

<title>reportsMakeList.jsp</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>


 <div id=reportslist>
 <form > 
  <table align="center" style="table-layout:fixed">
  <tr>   
   <td class=reportsOrderHead >번호</td>
   <td class=reportsDistingHead >유형</td>
   <td class=reportsYmdHead >날짜</td>
   <td class=reportsSdHead >검색일</td>
   <td class=reportsSortHead >구분</td>
   <td class=reportsTimesHead >언론사</td>
   <td class=reportsTitleHead >제목</td>
   <td class=reportsUrlHead >URL</td>
  </tr>
  
   <c:forEach var="cnt" begin="0" end="${ReportsLIST.listSize -1}">
   <tr>
    <td class=reportsOrder style="word-break:break-all;"> ${ReportsLIST.idx[cnt] }</td>
    <td class=reportsDisting style="word-break:break-all;"> ${ReportsLIST.disting[cnt] }</td>
    <td class=reportsYmd style="word-break:break-all;">${ReportsLIST.ymd[cnt] }</td>
    <td class=reportsSd style="word-break:break-all;">${ReportsLIST.search_date[cnt] }</td>
    <td class=reportsSort style="word-break:break-all;">${ReportsLIST.sort[cnt] }</td>
    <td class=reportsTimes style="word-break:break-all;">${ReportsLIST.times[cnt] }</td>
    <td class=reportsTitle style="word-break:break-all;">${ReportsLIST.title[cnt] }</td>
    <td class=reportsUrl style="word-break:break-all;">${ReportsLIST.url[cnt] }</td>           
   </tr>   
  </c:forEach> 

 </table>
 </form>
 
 
 
 </div>

 
</body>
</html>