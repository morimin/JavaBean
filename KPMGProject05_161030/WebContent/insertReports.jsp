<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="date" value="<%= new Date() %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertReport.jsp</title>
<link rel="stylesheet" href="css/style.css">
<script language='javascript'>
 function submitfunc(){
	 
	var ymdck = document.inserts.ymd.value; 
	var sdck = document.inserts.search_date.value;
	var sortck = document.inserts.sort.value;
	var timesck = document.inserts.times.value;
	var titleck = document.inserts.title.value;
	var urlck = document.inserts.url.value;	 
 
	var pattern = /[0-9]{4}-[0-9]{2}-[0-9]{2}/; 
	
    if(ymdck==""||ymdck==null){
    	alert("날짜를 입력해주세요.");
    	document.inserts.ymd.focus();
    	return;            
    }
    if(pattern.test(ymdck)){return;}
    else{
    	alert("날짜형식을 확인해주세요.");
    	document.inserts.ymd.focus();
    	return;
    }
    if(sdck==""||sdck==null){
    	alert("검색일을 입력해주세요.");
    	document.inserts.search_date.focus();
    	return;            
    }
    if(pattern.test(sdck)){return;}
    else{
    	alert("검색일형식을 확인해주세요.");
    	document.inserts.search_date.focus();
    	return;
    }
    if(sortck==""||sortck==null){
    	alert("구분을 입력해주세요.");
    	document.inserts.sort.focus();
    	return;            
    }
    if(timesck==""||timesck==null){
    	alert("언론사를 입력해주세요.");
    	document.inserts.times.focus();
    	return;            
    }
    if(titleck==""||titleck==null){
    	alert("제목을 입력해주세요.");
    	document.inserts.title.focus();
    	return;            
    }
    if(urlck==""||urlck==null){
    	alert("URL를 입력해주세요.");
    	document.inserts.url.focus();
    	return;            
    }       
    
 }
</script>
</head>
<body>



<table align="center">
	<tr>
		<td><h1> 정보 입력 </h1></td>
	</tr>
 
</table><br><br>
<form name=inserts method=post onSubmit="submitfunc()" action="main.jsp?CMD=insertReports" >
	<table align="center">
		<tr align="center">
			<td>종류</td>
			<td>날짜</td>
			<td>검색일</td>
			<td>구분</td>
			<td>언론사</td>
			<td>제목</td>
			<td>URL</td>
		</tr>
		<tr>
			<td>
				<select name = "disting" style="width:130px; height:28.5px;">					
					<option > 국내기사 </option>
					<option > 해외기사 </option>					
				</select>
			</td>
			<td><input type=text name="ymd" style="width:150px; height:22px; text-align:center;" placeholder="1989-05-29"> </td>
			<td><input type=text name="search_date" style="width:130px; height:22px; text-align:center;" value="<fmt:formatDate value="${date }" pattern="yyyy-MM-dd" />"> </td>
			<td><input type=text name="sort" style="width:150px; height:22px; text-align:center;"> </td>
			<td><input type=text name="times" style="width:150px; height:22px; text-align:center;"> </td>
			<td><input type=text name="title" style="width:200px; height:22px;"> </td>
			<td><input type=text name="url" style="width:230px; height:22px;" placeholder="http:// 를 꼭 넣어주세요."> </td>		
		</tr>
		<tr>
			<td colspan = "7" align="right"><input type="submit" value="등록하기"></td>
		</tr>	
	</table>
</form>

<br><br><br>
</body>
</html>

















