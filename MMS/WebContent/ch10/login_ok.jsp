<%@ page contentType="text/html;charset=euc-kr" 
         import="java.sql.*,oracle.dbpool.*"
         errorPage="error.jsp" %>

<HTML>
   <HEAD>
      <TITLE> 로그인 확인  </TITLE>
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
			<h3>로그인 성공</h3>
			<img src="img/love.gif"><p>
			<%= uid %> 님이 로그인 하셨습니다.<p>
<%
		} else {
 %>
			<h3>로그인 실패</h3>
			<img src="img/warning.gif"><p>
			비밀 번호를 다시 확인해 주세요...<p>
<%       
		}          
	} else {
%>
		<h3>로그인 실패</h3>
		<img src="img/warning.gif"><p>
		아이디를 다시 확인해 주세요...<p>
<%	}
	rs.close();
	pstmt.close();
	pool.freeConnection("ora8", con);
%>
</BODY>
</HTML>