<%@ page contentType="text/html;charset=euc-kr" %>

<HTML>
   <HEAD>
      <TITLE> �α�����</TITLE>
  		<link href="m3.css" type=text/css rel=stylesheet>

<script language="JavaScript">
	function checkInput() {
		if(document.fname.uid.value == "") {
			alert("ID�� �Է��ϼ���");
			return;
		}
		if(document.fname.pwd.value == "") {
			alert("��й�ȣ�� �Է��ϼ���");
			return;
		} 
		document.fname.submit();
	}
</script>
</HEAD>

<BODY bgcolor="#bfefff">
	<center><br><br>
	<form name=fname method=post action="login_ok.jsp">
	<table width="350" border="1" cellspacing="0" cellpadding="0">
	<tr>
		<td bgcolor="#0000ff" height="28" align="center"><font size=3 color="#ffffff"><font >ȸ �� �� �� ��</font></td>
	</tr>
	<tr bgcolor="#ffffff"> 
		<td align=center bgcolor="#eff4f8" height="120"> 
			<table width="220" border="1" cellspacing="0" cellpadding="1">
				<tr> 
					<td width="80" align=center>�� �� ��</td>
					<td><input type=text name="uid" size=15 style="width:150"></td>
				</tr>
				<tr> 
					<td align=center>��й�ȣ</td>
					<td><input type=password name="pwd" size=15 style="width:150"></td>
				</tr>
				<tr height=35 valign=middle>
           			<td colspan=2 align=center>
						<input type="button" value="�α���" OnClick="checkInput()">
						<input type="reset" value="�� ��"></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr> 
		<td bgcolor="#ffffff" align=center height="110"> 
			<p>���̵�(ID)�� �н����带 �Է��ϼ���!!!.<br><br>
���̵� ������ ���� <a href="insert_form.jsp">ȸ������</a>�� �Ͻñ� �ٶ��ϴ�.<br></p>
		</td>
	</tr>
	</table>
</form></center>
</BODY>
</HTML>
