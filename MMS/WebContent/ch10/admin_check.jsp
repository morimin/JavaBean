<%
	// ������ ���̵�� ��й�ȣ�� �˻�.
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

	// �����ڿ� ���� ���� ����
	session.setAttribute("aid","admin");
	session.setAttribute("apwd","1234");
	out.println("�����ڷ� �α��� �ϼ̽��ϴ�.<br>ȸ�� ��θ� ����� �� �ֽ��ϴ�.");
%>
