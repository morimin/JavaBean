<%@ page contentType="text/html;charset=euc-kr" 
            import="java.sql.*,oracle.dbpool.*" 
            errorPage="error.jsp" %>

<% 
	DBConnectionManager pool = DBConnectionManager.getInstance();
	Connection con = pool.getConnection("ora8");

	String  uid = session.getAttribute("pid").toString();

	String sql = "delete from member ";
		 sql = sql + "where mem_uid = ?" ;
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1,uid);

	pstmt.executeUpdate();
	session.invalidate();
	pstmt.close();
	pool.freeConnection("ora8", con); 
%>
	<script language=javascript>
		alert("ȸ�������� �����Ͽ����ϴ�.");
		document.location.href='../main/index.jsp';
	</script>
 