<%@ page contentType="text/html;charset=EUC_KR"  %>

<%
     if( session.getAttribute("pid") == null) {
%>
    <script language="Javascript">
	   alert("로그인을 하세요")
	   location.href="../member/login.jsp";
    </script>
<%
	} else {
%>

<html>
<head>
  <title>컴퓨터전문쇼핑몰</title>
	<LINK href="../common/u3.css" type=text/css rel=STYLESHEET>
	<SCRIPT language=JavaScript src="../common/u3.js"></script>
</head>

<BODY leftmargin='0' topmargin='0' marginwidth='0' marginheight='0'>
    <jsp:include page="../common/basic_screen.jsp" flush="true"/>
<!-- 회원 탈퇴 -->
		<jsp:include page="delete.jsp" flush="true"/>
<!-- 회원 탈퇴 끝 -->
	<jsp:include page="../common/basic_copyright.jsp" flush="true"/>
</body>
</html>
<% } %>