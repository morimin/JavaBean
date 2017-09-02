<%@ page contentType="text/html;charset=euc-kr" import="java.sql.*,oracle.dbpool.*" %>

<%
	String  b_name=null, b_email=null, b_title=null, b_content=null;
	int      ref = 0, step=0, level=0;
	String b_id=request.getParameter("b_id");
	String sql="select b_name,b_email,b_title,b_content, ";
	sql = sql+" ref, step, anslevel from re_board where b_id="+b_id;

	DBConnectionManager pool = DBConnectionManager.getInstance();
	Connection con = pool.getConnection("ora8");
	Statement stmt= con.createStatement();
	ResultSet rs=stmt.executeQuery(sql);
	if(rs.next()) {
		b_name=rs.getString(1);
		b_email=rs.getString(2);
		b_title=rs.getString(3);
		b_content=rs.getString(4);
		ref = rs.getInt(5);
		step = rs.getInt(6);
		level = rs.getInt(7);
	}   
	rs.close();
	stmt.close();
	pool.freeConnection("ora8", con);
%>

<HTML>
	<HEAD><TITLE>답변입력화면</TITLE>
 		<link href="../ch10/m3.css" type=text/css rel=stylesheet>

<script>
function go_reply() {
	var form = document.reply_form;
	
	if(!form.title.value){
		alert("제목을 입력하세요.");
		form.title.focus();
		return ;
	}
	if(!form.pwd.value){
		alert("암호를 입력하세요");
		form.pwd.focus();
		return ;
	}
	if(!form.name.value){
		alert("이름을 입력하세요");
		form.name.focus();
		return ;
	}
	if(!form.body.value){
		alert("내용을 입력하세요.");
		form.body.focus();
		return;
	}
	form.submit();
}
</script>
</head>

<body  topmargin=0 leftmargin=0 bgcolor=white>
	<center><br><br>
	<table border=1 width=500 height=30>
		<tr>
			<td align=center bgcolor=0063ce><font size=3 color=#FFFFFF><b>[게시물] 답 변</b></td>
		</tr>
	</table>

	<table width="500" border="1" cellspacing="0" cellpadding="0">
	<form method="post" name="reply_form" action="reply.jsp">
		<input type="hidden" name="b_id" value="<%= b_id %>">
		<input type="hidden" name="ref" value="<%= ref %>">
		<input type="hidden" name="step" value="<%= step %>">
		<input type="hidden" name="level" value="<%= level %>">
		<tr>
			<td width=100 align=center bgcolor="#7eaee9">등록자</td>
			<td width=180>&nbsp;<input type="text" name="name" size=20 ></td>
			<td width=100 align=center bgcolor="#7eaee9">비밀번호</td>
			<td width=120>&nbsp;<input type="password" name="pwd" size=15 value="" ></td>
		</tr>	
		<tr>
			<td align=center bgcolor="#7eaee9">E-Mai 주소</td>
			<td colspan=3>&nbsp;<input type="text" size=30 name="email" value=""></td>
		</tr>	
		<tr>
			<td align=center bgcolor="#7eaee9">제 목</td>
			<td colspan=3>&nbsp;<input type="text" size=40 name="title" value="<%="[답변] "+b_title%>"></td>
		</tr>	
		<tr>
			<td align=center bgcolor="#7eaee9">내 용</td>
			<td colspan=3>
			<table>
				<tr>
					<td><textarea cols=53 rows=10 name="body"><%=b_content%></textarea></td>
				</tr>
			</table>
			</td>
		</tr>
		<tr>
			<td colspan=4 align=right height=30>
				<a href="javascript:go_reply()"><img src="img/b_reply.gif" border=0></a>
				<a href="javascript:history.go(-1)"><img src="img/b_cancel.gif" border=0></a>
			</td>
		</tr>
	</form>
	</table></center>
</BODY>
</HTML>