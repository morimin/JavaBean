<%@ page contentType="text/html;charset=euc-kr" %>

<HTML>
	<HEAD>
		<TITLE> 회원관리 메뉴화면 </TITLE>
		<link href="m3.css" type=text/css rel=stylesheet>
	</HEAD>

<BODY>
	<table width=100 border=1 cellspacing=1 cellpadding=0>
	<tr bgcolor="#cccccc"  align="center">
		<td valign="center"><font size=3><b>회 원 관 리</b></font></td>
	</tr>
	<tr>
		<td class="left">
		<table width=100 cellspacing=0 cellpadding=0 border="1">
			<tr bgcolor="#0000cc">
				<td align=left><font color=#ffffff><b>회원 메뉴</b></td>
			</tr>
			<tr>
				<td align=right><a href="login.jsp" target=right>로그인</a></td>
			</tr>
			<tr>
				<td align=right><a href="insert_form.jsp"  target=right>회원가입<a></td>
			</tr>
			<tr>
				<td align=right><a href="update_form.jsp"  target=right>회원정보수정</a></td>
			</tr>
			<tr>
				<td align=right><a href="delete.jsp"  target=right>회원탈퇴</a></td>
			</tr>
			<tr>
				<td align=right><a href="logout.jsp"  target=right>로그아웃</a></td>
			</tr>
		</table>

		<table width=100 cellspacing=0 cellpadding=0 border="1">
			<tr bgcolor="#0000cc">
				<td align=left><font color=#ffffff><b>관리자 메뉴</b></td>
			</tr>
			<tr>
				<td align=right><a href="admin_login.jsp"  target=right>로그인</a></td>
			</tr>
			<tr>
				<td align=right><a href="member_list.jsp"  target=right>회원명부 출력</a></td>
			</tr>
			<tr>
				<td align=right><a href="admin_logout.jsp"  target=right>로그아웃</a></td>
			</tr>
		</table>
		</td>
	</tr>
	</table>
</BODY>
</HTML>