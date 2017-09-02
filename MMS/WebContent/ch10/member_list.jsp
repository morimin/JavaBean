<%@ page contentType="text/html;charset=euc-kr" 
         import="java.sql.*, java.util.*, oracle.dbpool.*" %>

<% request.setCharacterEncoding("euc-kr"); %>

<%
	// ������ ���̵�� ��й�ȣ�� �˻�.
	if (!("admin".equals(session.getAttribute("aid")))) {
%>    
		<jsp:forward page="admin_login.jsp" /> <%  }
		if (!("1234".equals(session.getAttribute("apwd")))) {
%>		
			<jsp:forward page="admin_login.jsp" />  <%  } 

	DBConnectionManager pool = DBConnectionManager.getInstance();
	Connection con = pool.getConnection("ora8");
	Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);

	// ������ �׺���̼� ���� ����
	int PAGE_SIZE = 5;		// ���������� ������ �Խù��� ��
	int GROUP_SIZE = 2;		// �׷��� ũ��
	String reqPage;			// ��û ������ : linkPage ����
	int curPage;			// ���� ������
	int totalCount;			// ��ü �Խù��� ����
	int pageCount;			// ��ü �������� ��

	reqPage = request.getParameter("page");
	if(reqPage == null) {
		curPage = 1;
	} else
		curPage = Integer.parseInt(reqPage);
	
	// ��ȸ���� ���
	String sql= "select count(*) from member";
	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
	totalCount = rs.getInt(1);
    rs.close();
%>

<HTML>
   <HEAD>
       <TITLE> ȸ����� ����Ʈ </TITLE>
  		<link href="m3.css" type=text/css rel=stylesheet>
   </HEAD>

<BODY bgcolor="#ccffff">
	<center><br>
	<table cellpadding=3 cellspacing=0 border=1 width=450>       
		<tr bgcolor=#7aaad5 height=30>
			<td width=250 align=center bgcolor="#0000ff"><font color="#ffffff" size=3><b>ȸ �� �� ��</b></font></td>
			<td width=100  bgcolor="#ccffff">��ȸ�� : <%=  totalCount %>��</td>
		</tr>
	</table>
	<table cellpadding=3 cellspacing=0 border=1 width=450> 
		<tr bgcolor=#ffff33  align=center>
			<td width="30">����</td>
			<td width="60">���̵�</td>
			<td width="50">�̸�</td>
			<td width="70" >��ȭ��ȣ</td>
			<td width="60">email�ּ�</td>
			<td width="60">�湮Ƚ��</td>
		</tr>
<%
	try{
		// ȸ�� ���� �˻��� ���� select ��
		sql = "SELECT m_uid, m_name,m_phone,m_email,m_visit FROM  member ";
		rs = stmt.executeQuery(sql);

		int i=totalCount+1;
		// ��û �������� ���� Ŀ���� �ش� �����ͷ� �̵�
		if(curPage > 1){
			rs.absolute((curPage-1)*PAGE_SIZE);
			i = i - ((curPage-1)*PAGE_SIZE);  // ���� �������� ��ȣ ���
		}
		
		int j = 1;            // ���� �������� ����
		// ���� �������� �ش��ϴ� ȸ���� ���.
		while (rs.next() && (j <= PAGE_SIZE)) {
			i--;
%>
		<tr bgcolor="#ffffff">
			<td align=center><%= i %></td>
			<td><%= rs.getString("m_uid") %></td>
			<td><%= rs.getString("m_name") %></td>
			<td><%= rs.getString("m_phone") %></td>
			<td><%= rs.getString("m_email") %></td>
			<td align=center><%= rs.getString("m_visit") %></td>
		</tr>
<%
		j++;
	}
	rs.close();
	stmt.close();
	pool.freeConnection("ora8", con);
	} catch(Exception e) {
	    System.out.println(e);
	   }
%>
   </table><br>

<%
	// ��ü ���������� ���
	pageCount = (int)Math.ceil(totalCount / (PAGE_SIZE+0.0));
	// ����׷� ����
	int curGroup = (curPage-1) / GROUP_SIZE;
	int linkPage = curGroup * GROUP_SIZE;
	// �����׷��� �ִ� ���
	if(curGroup > 0) {
		out.println("<a href=member_list.jsp?page="+linkPage+"><<����</a>");
	}
	linkPage++;           // ��ũ����
	int loopCount = GROUP_SIZE;
	// �׷������ ������ ��ũ
	while((loopCount > 0) && (linkPage <= pageCount)) {
		out.println("[<a href=member_list.jsp?page="+linkPage+">"+linkPage+"</a>]&nbsp;");
		linkPage++;
		loopCount--;
	}
	// �����׷��� �ִ� ���
	if(linkPage <= pageCount) {
		out.println("<a href=member_list.jsp?page="+linkPage+">���� >></a>");
	}
%>
   </center>
</BODY>
</HTML>