<%@ page contentType="text/html;charset=euc-kr" 
		 import="java.sql.*,oracle.dbpool.*" %>

<%
	int b_id=Integer.parseInt(request.getParameter("b_id"));
	String pwd = "";

	DBConnectionManager pool = DBConnectionManager.getInstance();
	Connection con = pool.getConnection("shop");
try {
	Statement stmt= con.createStatement();
	ResultSet rs=stmt.executeQuery("select pwd from re_board where b_id="+b_id);
	if(rs.next()) {
		pwd=rs.getString(1);
	}
	if (pwd.equals(request.getParameter("pwd"))){ 
		stmt.executeUpdate("delete from re_board where b_id="+b_id);
%>
		<script language=javascript>
			document.location.href='board_list.jsp';
		</script>
<%
	} else {
%>
		<script language=javascript>
			alert("���� ������ �� �����ϴ�.");
			history.back();
		</script>
<%
	}
	rs.close();
	stmt.close(); 
} catch (Exception e) {
	out.println(e);
}  finally {
	pool.freeConnection("shop", con); 
	}
%>