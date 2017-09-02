<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "kr.or.asterisk.homep.SmhItems" %>
<%@ page import = "kr.or.asterisk.homep.SmhList" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% 
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");	
%> 

 	<form name=loginForm method=post action="smhLogIn">
 	<!-- ; login 을 servlet 으로 처리해줄것임 -->
 	<table border=1>
 		<tr>
 			<td colspan = 2 > 로그인	</td>
 		</tr>
 		<tr>
 			<td> 아이디 </td>
 			<td> <input type=text name=id></td>
 		</tr>
 		<tr>
 			<td> 비번 </td>
 			<td> <input type=password name=pass></td>
 		</tr>
 		<tr> 			
 			<td colspan =2 > <input type=submit value='로그인'></td>
 		</tr>
 	</table>
 	
 	</form>
 	






