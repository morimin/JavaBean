<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.kpmg.reports.ReportsItems" %>
<%@ page import = "com.kpmg.reports.ReportsList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="date" value="<%= new Date() %>" />
<%@ page errorPage="errorpage.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");	
%>    
    
<!DOCTYPE html>
<html>
<head>

<title>reportsList.jsp</title>
<link rel="stylesheet" href="css/style.css">
<script language='javascript'>
 function submitfunc(){
	 
	var rLck = document.rList.key.value;
	var pattern = /[0-9]{4}-[0-9]{2}-[0-9]{2}/; 
  
    if(pattern.test(rLck)){    	
    	return;            
    }else{
    	alert("날짜형식('1989-05-29')으로 입력해주세요.");
    	document.rList.key.focus();
    	return;            
    }
 }
</script>
</head>
<body>


 <div id=reportslist>
 
 <form name="rList" method=post onSubmit="submitfunc()" action="main.jsp?CMD=reportsMakeList" > 
 <table align="center" style="table-layout:fixed">
 
	 <tr>
	 	<td colspan="8" align="right">	 	
	 		<select name = "opt" style="width:80px; height:21.5px;">					
					<option value="1"> 국내기사 </option>
					<option value="2"> 해외기사 </option>
					<option value="3" selected> 검색일 </option>						
			</select>
	 	
	 	<input type="text" name="key" style="width:230px;" placeholder="검색일('1989-05-29')을 입력하세요."> <input type = "submit" value="찾기"  ></td>
 	 </tr>
 	 </table>
 </form><br>
<div>
	<jsp:include page="reportsMakeList.jsp" />
</div>

 
 
 </div>

 
</body>
</html>