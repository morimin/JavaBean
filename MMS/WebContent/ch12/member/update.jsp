<%@ page contentType="text/html;charset=euc-kr" 
            import="java.sql.*,java.util.*,oracle.dbpool.*"
            errorPage="error.jsp" %>
<% request.setCharacterEncoding("euc-kr"); %>

<% 
	DBConnectionManager pool = DBConnectionManager.getInstance();
	Connection con = pool.getConnection("ora8");

	try {
		String mem_uid=request.getParameter("uid");
		String mem_pwd=request.getParameter("pwd");
		String mem_email=request.getParameter("email");
		String mem_addr=request.getParameter("addr");
		String mem_zip =request.getParameter("zip");
		String mem_phone=request.getParameter("tel");
		String mem_job = request.getParameter("job");

        String sql = "update member set mem_pwd=?,";
		sql = sql + "mem_email=?,mem_job=?,mem_phone=?,";
		sql = sql + "mem_zip=?,mem_address=? ";
		sql = sql + " where mem_uid ='"+mem_uid+"'";

		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, mem_pwd);
		pstmt.setString(2, mem_email);
		pstmt.setString(3, mem_job);
		pstmt.setString(4, mem_phone);
        pstmt.setString(5, mem_zip);
		pstmt.setString(6, mem_addr);
		
		pstmt.executeUpdate();
		pstmt.close();
        pool.freeConnection("ora8", con);
%>
        <script language=javascript>
                alert("회원정보를 수정했습니다.");
                document.location.href='../main/index.jsp';
        </script>
<%     
	} catch (Exception e) {
		out.println(e);
		pool.freeConnection("ora8", con); 
	}
%>