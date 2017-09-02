<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
 request.setCharacterEncoding("utf-8");
 response.setCharacterEncoding("utf-8"); 
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KPMG ACI임시 로그인</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body> 

<div id="printlogin">

<img SRC="https://assets.kpmg.com/content/dam/kpmg/images/platform/KPMG.png" ><br><br>


  <form name=loginForm method=post action="logIn">
  <!-- ; login 을 servlet 으로 처리해줄것임 -->
  <table border=1>   
   <tr>
    <td> 아이디 </td>
    <td> <input type=text name=id></td>
   </tr>
   <tr>
    <td> 비밀번호 </td>
    <td> <input type=password name=pass > </td>
   </tr>
   <tr align="center">    
    <td colspan =2 width=match> <input type=submit value='로그인'></td>
   </tr>
  </table> <br><br>
  
  ※. 로고 이미지는 삼정KPMG홈페이지를 따릅니다.
  
  </form>
  
</div>
  
  </body>
</html>