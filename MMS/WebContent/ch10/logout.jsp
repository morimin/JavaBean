<%@ page contentType="text/html;charset=euc-kr" %>

<%
	if( session.getAttribute("uid") == null) {
%>
		<script language="Javascript">
		location.href="login.jsp";
		</script>
<%
	} else {
		//  ����� ���� ����
		String uid = session.getAttribute("uid").toString();
		session.invalidate();
		out.println("<h3>�α׾ƿ�</h3>");
		out.println(uid+" ���� �α׾ƿ� �Ǿ����ϴ�.");
	}
%>
