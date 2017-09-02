<%@ page contentType="text/html;charset=euc-kr" 
         import="java.sql.*,oracle.dbpool.*"
         errorPage="error.jsp" %>

<HTML>
   <HEAD>
      <TITLE> �α��� Ȯ��  </TITLE>
  		<link href="m3.css" type=text/css rel=stylesheet>
   </HEAD>

<BODY>
<%
	String uid = request.getParameter("uid");
	String pwd = request.getParameter("pwd");
	String sql = "select m_uid, m_pwd from member where m_uid = ? ";
	String sql1 = "update member set  m_visit=m_visit+1 where m_uid = ? ";

	DBConnectionManager pool = DBConnectionManager.getInstance();
	Connection con = pool.getConnection("ora8");
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, uid);
	ResultSet rs = pstmt.executeQuery();
    
	if( rs.next() ) {
		if (pwd.trim().equals(rs.getString("m_pwd").trim())) {
			session.setAttribute("uid", uid);
			PreparedStatement pstmt1 = con.prepareStatement(sql1);
			pstmt1.setString(1, uid);
			pstmt1.executeQuery();
			pstmt1.close();
 %>
			<h3>�α��� ����</h3>
			<img src="img/love.gif"><p>
			<%= uid %> ���� �α��� �ϼ̽��ϴ�.<p>
<%
		} else {
 %>
			<h3>�α��� ����</h3>
			<img src="img/warning.gif"><p>
			��� ��ȣ�� �ٽ� Ȯ���� �ּ���...<p>
<%       
		}          
	} else {
%>
		<h3>�α��� ����</h3>
		<img src="img/warning.gif"><p>
		���̵� �ٽ� Ȯ���� �ּ���...<p>
<%	}
	rs.close();
	pstmt.close();
	pool.freeConnection("ora8", con);
%>
</BODY>
</HTML>