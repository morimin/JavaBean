<%@ page contentType="text/html;charset=euc-kr" %>

<HTML>
	<HEAD>
		<TITLE> ������ �α��� </TITLE>
		<link href="m3.css" type=text/css rel=stylesheet>
	</HEAD>

<body bgcolor="#ccffff">
	<center><br><br>

	<form name=fname method=post action="admin_check.jsp">
	<table width="350" border="1" cellspacing="0" cellpadding="0">
		<tr>
			<td bgcolor="#00ff00" height="28" align="center"><font size=3>�� �� �� �� �� ��</font></td>
		</tr>
		<tr bgcolor="#ffffff"> 
			<td align=center bgcolor="#eff4f8" height="120"> 
				<table width="230" border="1" cellspacing="0" cellpadding="1">
					<tr> 
						<td width=80 align=center>�� �� ��</td>
							<td><input type=text name="aid" size=15 style="width:150"></td>
					</tr>
					<tr> 
						<td align=center>��й�ȣ</td>
						<td><input type=password name="apwd" size=15 style="width:150"></td>
					</tr>
					<tr height=35 valign=middle>
						<td colspan=2 align=center>
							<input type="submit" value="�α���">
							<input type="reset" value="�� ��"></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr> 
			<td bgcolor="#ffffff" align=center height="80" valign=middle> 
				<p> ������ ���̵�(ID)�� �н����带 �Է��ϼ���!!!.</p>
			</td>
		</tr>
	</table></center>
</BODY>
</HTML>
