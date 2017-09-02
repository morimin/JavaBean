<%
	if( session.getAttribute("aid") == null) {
%>
		<script language="Javascript">
		location.href="admin_login.jsp";
		</script>
<%
	} else {
		// °ü¸®ÀÚ session Á¦°Å.
		String alogin = session.getAttribute("aid").toString();
		session.invalidate();
		out.println("<h4> 로그아웃 했습니다.</h4>");
	}
%>
