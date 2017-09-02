<%
	// 관리자 아이디와 비밀번호를 검사.
	if (!("admin".equals(request.getParameter("aid").trim()))) {
%>
		<jsp:forward page="admin_login.jsp" />
<%
	}
	if (!("1234".equals(request.getParameter("apwd").trim())) ) {
%>
		<jsp:forward page="admin_login.jsp" />
<%
	}

	// 관리자에 대한 세션 지정
	session.setAttribute("aid","admin");
	session.setAttribute("apwd","1234");
	out.println("관리자로 로그인 하셨습니다.<br>회원 명부를 출력할 수 있습니다.");
%>
