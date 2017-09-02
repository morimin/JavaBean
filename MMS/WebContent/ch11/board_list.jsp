<%@ page contentType="text/html;charset=euc-kr" 
		 import="java.sql.*,oracle.dbpool.*" %>

<%!   
	// ������ �׺���̼� ����
	int pageNUM=1;			// ������ ��ȣ
	int pagecount=1;		// ������ ���� ���� ����
	int pagesize = 10;		// ���������� 10�� ��¹�
	int absolutepage=1;		// ���� ��ġ ������ ��ȣ
	int dbcount=0 ;			// DB �ȿ� �� ���� ���� ����

	String  b_name, b_email, b_title, b_content, b_date, mailto;
	int  b_id =0 , b_hit = 0, level=0, color=1 ;
%>

<HTML>
	<HEAD><TITLE>�Խ��Ǹ��</TITLE>
  		<link href="../ch10/m3.css" type=text/css rel=stylesheet>
	</HEAD>

<BODY topmargin=0 leftmargin=0 bgcolor=white>
	<center><br><br>
	<form name=board_lst method=post>
	<table border=1 width=500 height=28>
		<tr>
			<td align=center bgcolor=0063ce><font size=3 color=#ffffff><b>[����] �� �� ��</b></td>
		</tr>
	</table>
	<table width=500 border="1">
		<tr bgcolor=#7eaee9 height=25>
			<th width=40   align=center>��ȣ</th>
			<th width=230 align=center>�� ��</th>
			<th width=80   align=center>�۾���</th>
			<th width=80   align=center>�ۼ���</th>
			<th width=60   align=center>��ȸ��</th>
		</tr>
<%
	try {
		DBConnectionManager pool = DBConnectionManager.getInstance();
		Connection con = pool.getConnection("ora8");
 
		// ��ü �Խù� �� �˻�
		Statement stmt = con.createStatement();  
		ResultSet pageset = stmt.executeQuery("select count(b_id) from re_board ");

		if( pageset.next()){
			dbcount = pageset.getInt(1);
			pageset.close();
		}

		// �� �������� ���
		if(dbcount%pagesize == 0)   
			pagecount = dbcount/(pagesize);
		else
			pagecount = dbcount/(pagesize)+1;
		// ��û������ �� ���
		if(request.getParameter("pageNUM") != null) {
			pageNUM=Integer.parseInt(request.getParameter("pageNUM"));
			absolutepage=(pageNUM-1)*pagesize+1;
		}

		String sql = "select b_id, b_name, b_email, b_title,";
		sql = sql + " to_char(b_date,'yy-mm-dd'), b_hit, ref "; 
		sql = sql + " from re_board order by ref desc, anslevel ";
		sql = sql.toUpperCase().trim();
		ResultSet rs = stmt.executeQuery(sql);

		for(int k=1; k<absolutepage; k++) rs.next();
			int k=1;
			while(rs.next() && k<=pagesize){ 
				b_id=rs.getInt(1);			// �۹�ȣ
				b_name=rs.getString(2);		// �۾���
				b_email=rs.getString(3);	// �ۼ��� ����
				b_title=rs.getString(4);	// ������
				b_date=rs.getString(5);		// �ۼ���¥
				b_hit=rs.getInt(6);			// ��ȸ��
				if(b_email.equals("")) {
					mailto=b_name; 
				} else {
					mailto="<a href=mailto:"+b_email+">"+b_name+"</a>";
				}
%>
		<tr bgcolor='#dddddd' onMouseOver=this.style.backgroundColor='#fff8de' onMouseOut=this.style.backgroundColor='#dddddd'>
			<td width=40 align=center><%= b_id %></td>
			<td width=230 align="left"><a href='show.jsp?b_id=<%= b_id %>'><%= b_title %></a></td>
			<td width=80 align=center><%= mailto %></td>
			<td width=80 align=center><%= b_date %></td>
			<td width=60 align=center><%= b_hit %></td>
		</tr>
<%
		k++;
	} 
	rs.close();
	stmt.close(); 
	con.close(); 
	pool.freeConnection("ora8",con);
} catch (Exception e) {
	out.println(e);
}
%>
	</table>
	<table width=500  border=1 cellpadding=0 cellspacing=0>
		<tr bgcolor=ffffff>
			<td width=360  align=center valign=middle height=30>
<% 
			// ������ ������
			int limit = 3;   // ������ ����Ʈ ���� ����
			// ���� ������ ���ϱ�
			int temp =(pageNUM-1) % limit ;
			int startPage = pageNUM - temp;
			// [����] ��ũ �߰�
			if ((startPage-limit)>0){ %>
				<a href='board_list.jsp?pageNUM=<%= startPage-1 %>'>[����] </a>
<%			}
			// ������ ��ȣ ����
			for(int i=startPage ; i<(startPage+limit);i++){
				if( i == pageNUM){
%>
					&nbsp;<%= i %>&nbsp;
<%
				} else { 
%>
					<a href='board_list.jsp?pageNUM=<%= i %>'><%= i %><a>
<%
				}
				if(i >= pagecount) break;
			}
			// [����] ��ũ �߰�
			if ((startPage+limit)<=pagecount){ 
%>
				<a href='board_list.jsp?pageNUM=<%= startPage+limit %>'>[����] </a>
<%  } %>
			</td>
			<td width=150 height=30 valign=middle align=right>
				<a href="write_form.jsp"><img src="img/b_write.gif" border=0 align=absmiddle></a>
				<a href="board_list.jsp"><img src="img/b_list.gif" border=0 align=absmiddle></a>
			</td>
		</tr>
	</table>
	</form></center>
</body>
</html>