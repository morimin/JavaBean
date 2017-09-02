<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.kpmg.reports.ReportsItems" %>
<%@ page import = "com.kpmg.reports.ReportsList" %>
<%@ page errorPage="errorpage.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="date" value="<%= new Date() %>" />
<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
		
	String sub = request.getParameter("sub");
	if (sub==null) sub ="1";
	request.setAttribute("sub", sub);
	
%>    
    
<!DOCTYPE html>
<html>
<head>
<title>reportsList.jsp</title>
<link rel="stylesheet" href="css/style.css">
<script language='javascript'>
 function submitfunc(index){
    if(index==1){
      document.CRform.action='main.jsp?CMD=searchReports';      
    }else if( index ==2){          
    	document.CRform.action='main.jsp?CMD=reportsForm';
    }
    document.CRform.submit();
 }
</script>
</head>
<body>

<br><br>

 <div id=reportslist>
 <form name="CRform" method=post> 
 <table border=0 align="center">
 <tr> 
 	<td> 	
 		<select name="disting"> 			
	 		<c:if test="${sub eq 1 }">
 				<option selected="selected">국내기사</option>
 				<option >해외기사</option>
 			</c:if>			
 			<c:if test="${sub eq 2 }">
 				<option >국내기사</option>
 				<option selected="selected">해외기사</option>
 			</c:if> 			 		
 		</select> 		
 		<input type="button" value="조회" onClick="submitfunc(1)"> 	
 	</td>  	 
 	<td colspan="5" align="right"><input type = "button" value="정렬하기" onClick="submitfunc(2)"></td> 
 </tr>
  <tr>  
   <td class=reportsOrderHead>정렬순서</td>   
   <td class=reportsYmdHead>날짜</td>
   <td class=reportsSdHead >검색일</td>
   <td class=reportsSortHead>구분</td>
   <td class=reportsTimesHead>언론사</td>
   <td class=reportsTitleHead>제목</td>   
  </tr>
  
   <c:forEach var="cnt" begin="0" end="${ReportsLIST.listSize -1}">
   <tr>
    <td class=reportsOrder><input type="text" name="ord"></td>    
    <td class=reportsYmd>${ReportsLIST.ymd[cnt] }</td>
    <td class=reportsSd>${ReportsLIST.search_date[cnt] }</td>
    <td class=reportsSort>${ReportsLIST.sort[cnt] }</td>
    <td class=reportsTimes>${ReportsLIST.times[cnt] }</td>
    <td class=reportsTitle>${ReportsLIST.title[cnt] }</td>           
   </tr>   
  </c:forEach> 

 </table>
</form> 
 <br><br><br>
 

 
 </div>

 
</body>
</html>
















