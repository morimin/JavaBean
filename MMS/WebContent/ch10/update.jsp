 <%@ page contentType="text/html;charset=euc-kr" 
            import="java.sql.*,oracle.dbpool.*"
            errorPage="error.jsp" %>
<% request.setCharacterEncoding("euc-kr"); %>

 <%
	String m_uid=request.getParameter("uid");
	String m_pwd=request.getParameter("pwd");
	String m_email=request.getParameter("email");
	String m_phone=request.getParameter("tel");
	
	String sql = "update member set m_pwd=?,  m_phone=?, m_email=? ";
			 sql = sql + " where m_uid ='"+m_uid+"'";
	DBConnectionManager pool = DBConnectionManager.getInstance();
	Connection con = pool.getConnection("ora8");
	PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, m_pwd);
		pstmt.setString(2, m_phone);
		pstmt.setString(3, m_email);
%>

<HTML>
   <HEAD>
      <TITLE> ȸ������ ���� </TITLE>
  		<link href="m3.css" type=text/css rel=stylesheet>
   </HEAD>

<BODY bgcolor="#ffffff">
<%
	try {
		pstmt.executeUpdate();
		pstmt.close();
		pool.freeConnection("ora8", con);
%> 
		<h3>ȸ������ ����</h3>
		<%= m_uid %> ���� ȸ�� ������ �����Ǿ����ϴ�.<p>
<%
	} catch (Exception e) {
%>
		<h3>ȸ������ ���� ����</h3>
		<%= m_uid %> ���� ȸ�������� �������� ���߽��ϴ�.<p>
<% } %>
</BODY>
</HTML>