<%@ page contentType="text/html;charset=euc-kr"  
		 import="java.sql.*,oracle.dbpool.*,java.util.*" %>

<% request.setCharacterEncoding("euc-kr"); %>

<%
	int b_id=0;
	int ref=0;
	int step=0;
	int level=0;

	String b_name = request.getParameter("name");
	String pwd = request.getParameter("pwd");
	String b_email = request.getParameter("email");
	String b_title = request.getParameter("title");
	String b_content = request.getParameter("body");
	String ip = request.getRemoteAddr(); 
	String sql = "select max(b_id) from re_board";

try {
	DBConnectionManager pool = DBConnectionManager.getInstance();
	Connection con = pool.getConnection("ora8");
	Statement stmt=con.createStatement();
	ResultSet rs=stmt.executeQuery(sql);  
	if(rs.next()) {
		b_id=rs.getInt(1) + 1; 
		rs.close();
	} else {
		b_id=1;   
	}
 
	ref=Integer.parseInt(request.getParameter("ref"));
	step=Integer.parseInt(request.getParameter("step"));
	level=Integer.parseInt(request.getParameter("level"));
	step=step+1;
	level=level+1;
	String str="update re_board set anslevel = anslevel+1 where ref = "+ref+" and anslevel >= "+ level;
	stmt.executeUpdate(str);
	stmt.close();

	sql = "insert into re_board values(?,?,?,?,?,?,sysdate,?,?,?,?,?)";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setInt(1,b_id);
	pstmt.setString(2,b_name);
	pstmt.setString(3,pwd);
	pstmt.setString(4,b_email);
	pstmt.setString(5,b_title);
	pstmt.setString(6,b_content);
	pstmt.setInt(7,0);
	pstmt.setString(8, ip);
	pstmt.setInt(9,ref);
	pstmt.setInt(10,step);
	pstmt.setInt(11,level);

	pstmt.executeUpdate();
	pstmt.close();
	pool.freeConnection("ora8", con);
%>
	<script language=javascript>
		location.href ="board_list.jsp"; 
	</script>
<%
	} catch (Exception e) {
		out.println(e);
	}
%>
