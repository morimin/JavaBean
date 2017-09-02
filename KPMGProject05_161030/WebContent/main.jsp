<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
	String CMD = request.getParameter("CMD");
	
	if(session.getAttribute("sessLevel")==null){
		session.setAttribute("sessLevel", "0");
	}
%>    
    




<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KPMG ACI 기사수합 페이지입니다.</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>

<c:if test="${sessionScope.sessLevel lt 3}">
	<script>
		alert('로그인해주시기 바랍니다.');
		location.href='printLogIn.jsp';
	</script>
</c:if>

<br><br>

<div id="container">	
		<a href ="main.jsp?CMD=LogOut.jsp" align="left">로그아웃</a><br>	
	<div id="header" align="center">
		<a href="main.jsp?CMD=insertReports.jsp"><h1>삼정KPMG ACI 기사수합 페이지</h1></a> <br><br><br>
		
		<table border="0">
		<tr>
		<c:if test="${sessionScope.sessLevel ge 3}">
			<td class ="insertMain"><a href="main.jsp?CMD=insertReports.jsp">DB입력하기</a></td>
			<td class = "listMain"><a href="main.jsp?CMD=reportsMakeList">전체DB보기</a></td>
			<td class = "arrangeMain"><a href="main.jsp?CMD=confirmReports">DB정렬하기</a></td>
			<td class = "confirmMain"><a href="main.jsp?CMD=reportsForm.jsp">금일DB기사확인</a></td>
			<td class = "nothingMain"></td>
			<td class = "deleteMain"><a href="main.jsp?CMD=reportsDelete">DB삭제하기</a></td>
		</c:if>
		</tr>
		</table><br>
		<hr>			
	</div>
	
	<div id="contents">
		<jsp:include page="${param.CMD }" />
	</div>	
		
	<!-- <div id="footer">
	
	  Copyright ⓒ 2016. SMin. All rights reserved.
	</div> -->
</div>





</body>
</html>




