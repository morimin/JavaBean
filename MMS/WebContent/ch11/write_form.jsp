<%@ page contentType="text/html;charset=euc-kr" %>

<HTML>
	<HEAD>
		<TITLE>�����Խ���-�ۿø���</TITLE>
			<link href="../ch10/m3.css" type=text/css rel=stylesheet>
<script>
function writeCheck() {
	if(!document.bbs_form.b_name.value){
		alert("�̸��� �Է��ϼ���");
		document.bbs_form.b_name.focus();
		return ;
	}
	if(!document.bbs_form.pwd.value){
		alert("��й�ȣ�� �Է��ϼ���.");
		document.bbs_form.pwd.focus();
		return ;
	}
	if(!document.bbs_form.b_email.value){
		alert("E-Maill�� �Է��ϼ���.");
		document.bbs_form.b_email.focus();
		return ;
	}
	if(!document.bbs_form.b_title.value){
		alert("������ �Է��ϼ���.");
		document.bbs_form.b_title.focus();
		return ;
	}
	if(!document.bbs_form.b_content.value){
		alert("������ �Է��ϼ���.");
		document.bbs_form.b_content.focus();
		return;
	}
	document.bbs_form.submit();
}
</script>
</head>

<body topmargin=0 leftmargin=0 bgcolor=white>
	<center><br><br>
	<form name=bbs_form method=post action="write.jsp">
	<table border=1 width=500 height=30>
		<tr>
			<td align=center bgcolor=0063ce><font size=3 color=#ffffff><b>[�Խù�] �� ��</b></td>
		</tr>
	</table>
	<table width=500 border=1>
		<tr>
			<td width=100 align=center bgcolor="#7eaee9">�� �� ��</td>
			<td width=180>&nbsp;<input type="text" name="b_name" size=20 maxlength=20></td>
			<td width=100 align=center bgcolor="#7eaee9">��й�ȣ</td>
			<td width=120>&nbsp;<input type="password" name="pwd" size=10 maxlength=15></td>
		</tr>	
		<tr>
			<td  align=center bgcolor="#7eaee9">E-Mail �ּ�</td>
			<td  colspan=3>&nbsp;<input type="text" name="b_email" size=30 maxlength=30></td>
		</tr>	
		<tr>
			<td align=center bgcolor="#7eaee9">��   ��</td>
			<td colspan=3>&nbsp;<input type="text" name="b_title" size=40 maxlength=40></td>
		</tr>	
			<td align=center bgcolor="#7eaee9">��  ��</td>
			<td  colspan=3>
	<table>
		<tr>
			<td><textarea cols=53 rows=10 name="b_content"></textarea></td>
		</tr>
	</table>
		<tr>
			<td colspan=4 align=right height=25>
				<a href="javascript:writeCheck()"><img src="img/b_save.gif" border=0></a>
				<a href="javascript:history.go(-1)"><img src="img/b_cancel.gif" border=0></a>
			</td>
		</TR>
	</table>
	</form>
</BODY>
</HTML>
