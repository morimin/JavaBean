<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.kpmg.reports.ReportsItems" %>
<%@ page import = "com.kpmg.reports.ReportsList" %>
<%@ page import = "com.kpmg.reports.ReportsMakeList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page errorPage="errorpage.jsp" %> 
<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
	//String DID = request.getParameter("DID");
%>    
    
<!DOCTYPE html>
<html>
<head>

<title>reportsDelete.jsp</title>
<link rel="stylesheet" href="css/style.css">
<script language='javascript'>
 function submitfunc(){
	 
	var dLck = document.dList.dkey.value;
	var pattern = /[0-9]{4}-[0-9]{2}-[0-9]{2}/; 
  
    if(pattern.test(rLck)){    	
    	return;            
    }else{
    	alert("숫자형식('529')으로 입력해주세요.");
    	document.rList.key.focus();
    	return;            
    }

 }
</script>
</head>
<body>


 <div id=reportslist>
 
 <form name="dList" method=post onSubmit="submitfunc()" action="main.jsp?CMD=reportsDelete" > 
 <h4>※. 주의사항.!!</h4>
 넘버링 문제로 인해 특정번호 이후 전체삭제 됨을 주의해주시기 바랍니다.<br><br>
 ex)<br>
 삭제하실 번호를 입력하면 그 번호 이후의 데이터가 전부 삭제됩니다.<br><br>
 eg) 1~100 번의 데이터가 존재.<br>
 50번 데이터 삭제 => 50~100번째 데이터 전체삭제<br><br>
 <hr>
 <table align="center" style="table-layout:fixed">
 
	 <tr>
	 	<td colspan="8" align="center">	 	
	 	삭제할번호 : 
	 	<input type="text" name="dkey" style="width:150px; height:30px; " placeholder="index값을 입력하세요."> <input type = "submit" style="width:150px; height:35px;" value="삭 제">
	 	</td>
 	 </tr>
</table>
 </form>
 <br>
 
 <div>
 	<jsp:include page="reportsMakeList.jsp" />
 </div>
 
</body>
</html>