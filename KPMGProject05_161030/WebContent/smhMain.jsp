<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "kr.or.asterisk.homep.SmhItems" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");			
	String CMDS = request.getParameter("CMDS");
	String CMD = request.getParameter("CMD");
	
	// Session 기능 : id, name, level 정보가 있어야함.
	// - sessID, sessName, sessLevel 로 사용할것임
 		if (session.getAttribute("sessLevel")==null)
	{
		session.setAttribute("sessLevel","0");
	}
%> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Asterisk Blog</title>
<link rel = "shortcut icon" href="/upload/favicon.ico" type="image/x-icon">
<link rel = "stylesheet" href="css/style.css">
</head>
<body>	

	
	
	
	<div id="smhContainer">
		<div id="smhHeader">
			<img src="/upload/Orion01.png"> 
			<!-- <a href="smhMain.jsp" align="center"> 홈 </a> -->		
		</div>
		<div id="smhContents">
			<div id="smhMenuList">
				<div id="smhGreeting">
					<a href="smhMain.jsp?CMDS=smhCover.jsp">Asterisk 블로그 입니다.</a><br>
				</div>		
				
				<hr>
				
				<div id="smhManList">							
					<c:if test="${sessionScope.sessID ne null }">
						<b>${sessionScope.sessName }</b> <input type="button" value="Exit" onClick="location.href='smhMain.jsp?CMDS=smhLogOut.jsp' " > <br>
						<c:if test="${sessionScope.sessLevel ge 9 }"> <!-- 개발자가 10이라고 하는 경우가 종종 있다. -->
						<br>
						<a href="smhMain.jsp?CMDS=manSMH.jsp">게시판 관리</a>
						</c:if>
					</c:if>
				<c:if test="${sessionScope.sessID eq null }">
					<a href = 'smhMain.jsp?CMDS=smhPrintLogIn.jsp'> LogIn </a> <br>
				</c:if>
				</div>
				
				<hr>
				
				<div id="smhCateg">	
				Categories<br>
					<jsp:include page="smhMenu.jsp" />
				</div>
				<hr>
														
					
				<!-- bid를 이용해서 게시판들을 구별하겠다. -->
				<!-- 
				<a href="smhMain.jsp?CMDS=smhMakeList?bid=1" >공지사항 </a><br>
				; servlet 이므로.java를 안써줘도 된다.
				<a href="smhMain.jsp?CMDS=smhMakeList?bid=2" >자유게시판 </a><br>
				<a href="smhMain.jsp?CMDS=smhMakeList?bid=3" >QnA 게시판 </a><br><br> 
				-->				
				<div id="smhBanner" align="center">
					<a href="index.jsp"><img src="/upload/KPMGACI02.png"></a><br>
					<a href="https://www.instagram.com/crevasse.s/"><img src="/upload/insta02.png"></a><br>
					<a href="http://blog.naver.com/pandekten5"><img src="/upload/blog02.png"></a><br>
				</div>
			</div>	
			<div id=smhDisplay>
				<jsp:include page="${param.CMDS}" /> 
			</div>
			</div>
			<div id="footer">
				◎ pandekten5@naver.com / COPYRIGHT ⓒ 2016. SMin. ALL RIGHTS RESERVED.
			</div>			
	</div>
	

</body>
</html>











