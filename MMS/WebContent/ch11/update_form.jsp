<%@ page  import="java.sql.*,oracle.dbpool.*" contentType="text/html;charset=euc-kr" %>

<%!
	String b_name ,b_email,b_title,b_content,b_date,b_ip,mailto;
	int b_id, b_hit, ref=0;
%>
<%
	String bid=request.getParameter("b_id"); 
	String sql="select b_id, b_name, b_email, b_title, b_content, to_char(b_date,'yy-mm-dd'),b_hit, b_ip, ref, step, level, pwd  from re_board where b_id= "+bid; 

try {
	DBConnectionManager pool = DBConnectionManager.getInstance();
	Connection con = pool.getConnection("ora8");
	Statement stmt = con.createStatement();
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
		ref = rs.getInt(9);
		if(!b_email.equals("")) {
			mailto="(<font size=2><a href=mailto:"+b_email+">"+b_email+"</a></font>)";
		} else {
			mailto="";
		}
	}
	rs.close(); 
	stmt.close();
	pool.freeConnection("ora8", con); 
	} catch (Exception e) {
		out.println(e);
	}
%>

<HTML>
	<HEAD><TITLE>게시물수정폼</TITLE>
 		<link href="../ch11/m3.css" type=text/css rel=stylesheet>
<script>
	function  go_update(){
		document.update_form.submit();
	}
</script>
</head>

<BODY  topmargin=0 leftmargin=0 bgcolor=white>
	<center><br><br>
	<table border=1 width=500 height=30>
		<tr>
			<td align=center bgcolor=0063ce><font size=3 color=#ffffff><b>[게시물] 수 정</b></td>
		</tr>
	</table>
	<table width=500 border=1 cellspacing=0 cellpadding=0>
	<form method="post" name="update_form" action="update.jsp">
		<tr>
			<td width=100 align=center bgcolor=#7eaee9>등록자</td>
			<td width=180>&nbsp;<input type="text" size=20 name="name" value="<%= b_name %>"></td>
			<td width=100 align=center bgcolor=#7eaee9>등록일</td>
			<td width=120>&nbsp;<%= b_date %></td>
		</tr>
		<tr>
			<td align=center bgcolor=#7eaee9>E-Mail 주소</td>
			<td colspan=3>&nbsp;<input type="text" size=30 name="email" value="<%=b_email%>"></td>
		</tr>
		<tr>
			<td align=center bgcolor=#7eaee9>비밀번호</td>
			<td colspan=3>&nbsp;<input type="password" size=15 name="pwd" ></td>
		</tr>
		<tr>
			<td align=center bgcolor=#7eaee9>제 목</td>
			<td colspan=3>&nbsp;<input type="text" size=40 name="title" value="<%= b_title %>"></td>
		</tr>	
		<tr>
			<td align=center bgcolor=#7eaee9>내 용</td>
			<td colspan=3>
			<table>
				<tr>
					<td><textarea cols=53 rows=10 name="content"><%= b_content %></textarea></td>
				</tr>
			</table>
			</td>
		</tr>

		<tr>
			<td colspan=4 align=right height=30>
				<a href="javascript:go_update()"><img src="img/b_edit.gif" border=0></a>
				<a href="javascript:history.go(-1)"><img src="img/b_cancel.gif" border=0></a>
			</td>
		</tr>
			<input type="hidden" name="b_id" value="<%= b_id %>">
	</form>
	</table></center>
</BODY>
</HTML>