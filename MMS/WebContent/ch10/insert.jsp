<%@ page contentType="text/html;charset=euc-kr" 
         import="java.sql.*,oracle.dbpool.*"
         errorPage="error.jsp" %>
<% request.setCharacterEncoding("euc-kr"); %>

<HTML>
   <HEAD>
      <TITLE> 회원 가입 처리 </TITLE>
  		<link href="m3.css" type=text/css rel=stylesheet>
   </HEAD>

<BODY>
<%
	String m_uid=request.getParameter("uid");
	String m_pwd=request.getParameter("pwd");
	String m_name=request.getParameter("name");
	String m_email=request.getParameter("email");
	String m_ssn = request.getParameter("ssn1")+"-"+request.getParameter("ssn2");
	String m_phone=request.getParameter("tel1")+"-"+request.getParameter("tel2")+"-"+request.getParameter("tel3");

	String sql1 = "select m_uid from member where m_uid='"+m_uid+"'";
	String sql2 = "insert into member values (?,?,?,?,?,?,sysdate,?,sysdate)";
try {
	DBConnectionManager pool = DBConnectionManager.getInstance();
	Connection con = pool.getConnection("ora8");
	Statement stmt = con.createStatement();
	ResultSet rs=stmt.executeQuery(sql1);

	if(rs.next()) {
		rs.close();
%>
		<script language=javascript>
		alert("중복되는 아이디가 존재합니다.");
		history.back();
		</script>
<%
	} else {
		PreparedStatement pstmt = con.prepareStatement(sql2);
		pstmt.setString(1, m_uid);
		pstmt.setString(2, m_pwd);
		pstmt.setString(3, m_name);
		pstmt.setString(4, m_ssn);
		pstmt.setString(5, m_email);
		pstmt.setString(6, m_phone);
		pstmt.setInt(7, 0);
		pstmt.executeUpdate();

		session.setAttribute("uid", m_uid);
		rs.close();
		pstmt.close();
		pool.freeConnection("ora8", con);
%>
		<h3>회원가입 성공</h3>
		<img src="img/cong.gif"><p>
		<%= m_name %> 님의 
		가입을 축하합니다!!!<p>
<%
	}
	} catch (SQLException e) {
%>
		<h3>회원가입 실패</h3>
		<img src="img/warning.gif"><p>
		<%= m_name %> 님의 회원가입은 실패했습니다..<p>
		다시 한번 시도해 보시기 바랍니다.
<% } %>
</BODY>
</HTML>