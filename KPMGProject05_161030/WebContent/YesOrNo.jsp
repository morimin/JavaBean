<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@ page import = "com.kpmg.reports.InsertReports" %>  --%>
<!-- ; 이것 있으면 화면도 이렇게 바뀌었다가 alert창 닫히면 다시 바뀌게됨. -->
<% 
 request.setCharacterEncoding("utf-8");
 response.setCharacterEncoding("utf-8"); 
%> 

<c:if test="${dbResultMsg eq null}" >
   <script>   
   location.href='${nextURL} ';  // 팝업창을 닫으면 nextURL로 이동
  </script>
</c:if>
<c:if test="${dbResultMsg ne null}" >
   <script>
   alert("${dbResultMsg }"); // 팝업창으로 dbResultMsg 를 띄우고
   location.href='${nextURL} ';  // 팝업창을 닫으면 nextURL로 이동
  </script>
</c:if>
  
  
 