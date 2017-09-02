<%@ page contentType="text/html;charset=euc-kr" %>

<%
	if( session.getAttribute("uid") == null) {
%>
		<script language="Javascript">
		location.href="login.jsp";
		</script>
<%
	} else {
		//  저장된 세션 삭제
		String uid = session.getAttribute("uid").toString();
		session.invalidate();
		out.println("<h3>로그아웃</h3>");
		out.println(uid+" 님은 로그아웃 되었습니다.");
	}
%>
