<%@ page contentType="text/html;charset=euc-kr" 
         import="java.sql.*,oracle.dbpool.*"
         errorPage="error.jsp" %>
<%
	if( session.getAttribute("uid") == null) {
%>
		<script language="Javascript">
		location.href="login.jsp";
		</script>
<%
	} else {
%>

<HTML>
	<HEAD>
		<TITLE> 회원정보 삭제 </TITLE>
			<link href="m3.css" type=text/css rel=stylesheet>
	</HEAD>

<BODY>
<% 
	String  uid = session.getAttribute("uid").toString();
	String sql = "delete from member where m_uid = ?" ;
	try {
		DBConnectionManager pool = DBConnectionManager.getInstance();
		Connection con = pool.getConnection("ora8");
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1,uid);
		pstmt.executeUpdate();
		pstmt.close();
		pool.freeConnection("ora8", con);
%>  
		<h3>회원 탈퇴 성공</h3>
		<img src="img/delete.gif"><p>
		<%= uid %> 님은 회원에서 탈퇴 되었습니다.<p>
<%
		session.invalidate();
	}  catch (Exception e) {
%>
		<h3>회원 탈퇴 실패</h3>
		<img src="img/warning.gif"><p>
		<%= uid %> 님은 아직 회원에서 탈퇴되지 않았습니다.<p>
<% } 
} %>
</BODY>
</HTML>
   