<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "kr.or.asterisk.homep.SmhItems" %>
<%@ page import = "kr.or.asterisk.homep.SmhList" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% 
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");	
%> 

 	<c:if test="${nextURL eq null }"> <!-- nextURL 없으면 원래대로  -->
 		<script>
 		alert("${dbResultMsg }"); // 팝업창으로 dbResultMsg 를 띄우고
 		location.href='smhMain.jsp?CMDS=smhMakeList';  // 팝업창을 닫으면 bbslist로 이동
 	</script>
 	</c:if>
 	<c:if test="${nextURL ne null }"> <!-- nextURL 있으면 nextURL 로 이동 -->
 		<script>
 		alert("${dbResultMsg }"); // 팝업창으로 dbResultMsg 를 띄우고
 		location.href='${nextURL} ';  // 팝업창을 닫으면 nextURL로 이동
 	</script>
 	</c:if>
 	
 




