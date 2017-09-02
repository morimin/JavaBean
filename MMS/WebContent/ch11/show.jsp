<%@ page contentType="text/html;charset=euc-kr" 
		 import="java.sql.*,oracle.dbpool.*"  %>

<%!
	String b_name ,b_email,b_title,b_content,b_date,b_ip,mailto;
	int b_id , b_hit , ref=0 ;
 %>
<%
	String bid=request.getParameter("b_id"); 
	String sql="select b_id, b_name, b_email, b_title, b_content, to_char(b_date,'yy-mm-dd'),b_hit, b_ip, ref, step, level, pwd  from re_board where b_id="+bid; 

try {
	DBConnectionManager pool = DBConnectionManager.getInstance();
	Connection con = pool.getConnection("ora8");
	Statement stmt = con.createStatement();
	stmt.executeUpdate("update re_board set b_hit=b_hit+1 where b_id="+bid+""); 
	ResultSet rs = stmt.executeQuery(sql);  
	if(rs.next()) {   
		b_id=rs.getInt(1);
		b_name=rs.getString(2);
		b_email=rs.getString(3);
		b_title=rs.getString(4);
		b_content=rs.getString(5);
		b_date=rs.getString(6);
		b_hit=rs.getInt(7)+1;
		b_ip=rs.getString(8);
		ref = rs.getInt(9);  // 글 그룹
		if(!b_email.equals("")) {
			mailto="(<font size=2><a href=mailto:"+b_email+">"+b_email+"</a></font>)";
		} else {
			mailto="";
		}
	}
	rs.close(); 
	stmt.close();
 	pool.freeConnection("ora8", con); 
	}  catch (Exception e) {
		out.println(e);
}
%>	    

<HTML>
	<HEAD>
		<TITLE>게시물 읽기</TITLE>
			<link href="../ch10/m3.css" type=text/css rel=stylesheet>
	</HEAD>

<BODY topmargin=0 leftmargin=0 bgcolor=white>
	<center><br><br>
	<table border=1 width=500 height=30>
		<tr>
			<td align=center bgcolor=0063ce><font size=3 color=#ffffff><b>[게시물] 읽 기</b></td>
		</tr>
	</table>
	<table width="500"  border=1>
		<tr>
			<td width=100 height=25 align=center bgcolor="#7eaee9">등록자</td>
			<td width=180>&nbsp;<%=b_name%></td>
			<td width=100 height=25 align=center bgcolor="#7eaee9">작성일</td>
			<td width=120>&nbsp;<%=b_date%></td>
		</tr>	
		<tr>
			<td width=100 height=25 align=center bgcolor="#7eaee9">E-Mail 주소</td>
			<td colspan=3>&nbsp;<a href="mailto:<%= b_email %>"><%= b_email %></a></td>
		</tr>	
		<tr>
			<td height=25 align=center bgcolor="#7eaee9">제 목</td>
			<td colspan=3>&nbsp;<%= b_title %></td>
		</tr>	
		<tr>
			<td align=center bgcolor="#7eaee9">내 용</td>
			<td colspan=3>
			<table>
				<tr>
					<textarea cols=53 rows=10 name="content"><%= b_content %></textarea>
				</tr>
			</table>
			</td>
		</tr>

		<tr>
			<td colspan=4 align=right height=30 >
				<a href="reply_form.jsp?b_id=<%= b_id %>"><img src="img/b_re.gif" border=0></a>
				<a href="update_form.jsp?b_id=<%= b_id %>"><img src="img/b_modify.gif" border=0></a>
				<a href="delete_form.jsp?b_id=<%= b_id %>"><img src="img/b_delete.gif" border=0></a>
				<a href="javascript:history.go(-1)"><img src="img/b_list.gif" border=0></a>
			</td>
		</tr>
	</table></center>
</BODY>
</HTML>
