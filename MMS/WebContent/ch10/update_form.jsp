<%@ page contentType="text/html;charset=euc-kr" 
            import="java.sql.*,oracle.dbpool.*"
            errorPage="error.jsp" %>
   
<%
	if( session.getAttribute("uid") == null) {
%>
		<script language="Javascript">
		location.href="login.jsp";
		</script>
<%
	} else {

		String m_uid = session.getAttribute("uid").toString();
		String m_name, m_ssn, m_pwd, m_phone, m_email;
		String sql = "select m_name,m_ssn,m_pwd,m_phone,m_email from member where m_uid='"+ m_uid +"'";

try {
	DBConnectionManager pool = DBConnectionManager.getInstance();
	Connection con = pool.getConnection("ora8");
	Statement stmt=con.createStatement();
	ResultSet rs=stmt.executeQuery(sql);
	if(rs.next()) {
		m_name=rs.getString(1);
		m_ssn = rs.getString(2);
		m_pwd = rs.getString(3);
		m_phone = rs.getString(4);
		m_email = rs.getString(5);
%>

<HTML>
	<HEAD>
		<TITLE>ȸ����������ȭ��</TITLE>
  		<link href="m3.css" type=text/css rel=stylesheet>

	<script language="JavaScript">
		function checkInput() {
			if(document.mform.pwd.value == "") {
				alert("��й�ȣ�� �Է��ϼ���");
			return;
			}
			document.mform.submit();
		}   
	</script>
		</HEAD>

<BODY bgcolor="#e0eee0">
<center><br><br>
<form name=mform method=post action="update.jsp" >
	<table cellpadding=3 cellspacing=0 border=1 width=550>
		<tr bgcolor=#7aaad5 height=30>
			<td align=center bgcolor="#0000FF" colspan=2><font color="#ffffff"><b>ȸ������ ����&nbsp;</b></font></td>
		</tr>
		<tr>
			<td bgcolor=#eff4f8>&nbsp;ȸ�� ����</td>
			<td>
				<input type=text name="name" size=20 readonly value="<%= m_name %>"></td>
		</tr>
		<tr>
			<td bgcolor="#eff4f8">&nbsp;�ֹε�Ϲ�ȣ</td>
			<td>
				<input type=text name=ssn size=13 value="<%= m_ssn %>" readonly></td>
		</tr>
		<tr>
			<td bgcolor="#eff4f8">&nbsp;ȸ�� id</td>
			<td>
			<%= m_uid %>
			<input type=hidden name=uid size=12 value="<%= m_uid %>" readonly style="width:120"></td>
		</tr>
		<tr>
			<td bgcolor="#eff4f8">&nbsp;��й�ȣ<font color=red>&nbsp;*</font></td>
			<td>
				<input type=password name=pwd size=8 maxlength=15 style="width:80" value="<%= m_pwd %>"></td>
		</tr>
		<tr>
			<td bgcolor="#eff4f8">&nbsp;��й�ȣȮ��<font color=red>&nbsp;*</font></td>
			<td><input type=password name=repwd size=8 maxlength=12 value="<%= m_pwd %>" style="width:80">&nbsp;��й�ȣ�� �ѹ� �� �Է��� �ּ���. </td>
		</tr>
		<tr>
			<td bgcolor="#eff4f8">&nbsp;��ȭ��ȣ<font color=red>&nbsp;*</font></td>
			<td>
				<input type=text name=tel size=12 maxlength=12 value="<%= m_phone %>"></td>
		</tr>
		<tr>
			<td bgcolor="#eff4f8">&nbsp;e-mail<font color=red>&nbsp;*</font></td>
			<td>
				<input type=text name=email size=30 maxlength=30 value="<%= m_email %>"></td>
		</tr>
		<tr bgcolor=#ffffff>
			<td colspan=4>&nbsp;<font color=red>*</font> ǥ�ø� ������ �� �ֽ��ϴ�&nbsp;&nbsp;
				<input type="button" name="modify" value="�� ��" OnClick="checkInput()"></td>
		</tr>
	</table> 
 </form>
<%	 
	} 
	stmt.close();
	rs.close();
	pool.freeConnection("ora8", con);
	} catch (Exception e)	{}
	}
%>	
</BODY>
</HTML>   