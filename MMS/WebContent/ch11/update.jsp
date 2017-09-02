<%@ page contentType="text/html;charset=euc-kr" import="java.sql.*,oracle.dbpool.*" %>

<% request.setCharacterEncoding("euc-kr"); %>

<%
		String b_id = request.getParameter("b_id");
		String b_name=request.getParameter("name");
		String pwd = request.getParameter("pwd");
		String b_email = request.getParameter("email");
		String b_title = request.getParameter("title");
		String b_content = request.getParameter("content");
		String ip = request.getRemoteAddr(); 

	try {
		DBConnectionManager pool = DBConnectionManager.getInstance();
		Connection con = pool.getConnection("ora8");
 		Statement stmt= con.createStatement();
		ResultSet rs = stmt.executeQuery("select pwd from re_board where b_id="+b_id); 
		if(rs.next()){
			if(pwd.equals(rs.getString("pwd"))) { 
				String  sql = "update re_board set b_name='"+b_name ;
				sql = sql + "' ,b_email='"+b_email +"' , b_title='"+b_title;
				sql = sql + "' ,b_content='"+b_content+"' where b_id="+b_id;
				stmt.executeUpdate(sql);
			} else { 
%>
				<script language=javascript>
					alert("글을 수정할 수 없습니다.");
					history.back();
				</script>
<%
		}
	}
	rs.close();
	stmt.close(); 
	pool.freeConnection("ora8", con); 
%>
	<script language=javascript>
		location.href="board_list.jsp";
	</script>
<%
	} catch (Exception e) {
		out.println(e);
	} 
%>
