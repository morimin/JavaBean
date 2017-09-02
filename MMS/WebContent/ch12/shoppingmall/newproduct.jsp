<%@ page  contentType="text/html;charset=euc-kr" import="java.sql.*,oracle.dbpool.*" %> 
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>



<HTML>
	<HEAD>
		<TITLE>��ǻ���������θ�</TITLE>
		<script language=JavaScript src="../common/u3.js"></script>
		<link href="../common/u3.css" type=text/css rel=stylesheet>
  		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  		<link rel="stylesheet" href="/resources/demos/style.css">
  		<style>
  		label {
    		display: inline-block;
    		width: 5em;
  		}
  		</style>
  		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  		<script>
  		$( function() {
    		$( document ).tooltip({
      			track: true
    		});
  		} );
  </script>
	</HEAD>

<BODY leftmargin='0' topmargin='0' marginwidth='0' marginheight='0'>
    <jsp:include page="../common/basic_screen.jsp" flush="true"/>
	
<!--  �Ż�ǰ ȭ��    -->
	<center><br>
	<table border=1 width=500 height=30>
		<tr>
			<td align=center bgcolor=0063ce><font size=2 color=white><b>�� �� ǰ</b></td>
		</tr>
	</table><br>
	<table width="500" border=0 cellpadding=1 cellspacing=1>
<%
	try {
		String name,company_id,expression,photo;
		int id,price;
		DBConnectionManager pool = DBConnectionManager.getInstance();
		Connection con = pool.getConnection("ora8");

		Statement stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery("select id,name,price,company_id,expression,photo from product order by cdate desc, id desc");
		
		int flag=0;
        int stop = 1;		
		while(rs.next())  {
			id=rs.getInt(1);
			name=rs.getString(2);
			price=rs.getInt(3);
			company_id=rs.getString(4);
			expression=rs.getString(5);
			photo=rs.getString(6);
		if(flag==0){
%>
		<tr>
			<td>
				<!-- ========= ���� ���̺� ========== -->
				<table width="250" border=1 cellpadding=1 cellspacing=2 align=center bordercolor=#990000>
				<tr>
					<td colspan=2 align="center"><a href="../product/product.jsp?i=<%= id%>">
					<img src="../product/image/<%=photo%>" width=100 height=100 border=0></a></td>
				</tr>
				<tr>
					<td width=60 align=right bgcolor=#7eaee9>��ǰ��</td>
					<td bgcolor=cde6ff>&nbsp;&nbsp;<%=name%></td>
				</tr>
				<tr>
					<td width=60 align=right bgcolor=#7eaee9>����</td>
					<td bgcolor=cde6ff>&nbsp;&nbsp;[<fmt:formatNumber value="<%=price%>" pattern="\#,###.##"/>��]</td>
				</tr>
				<tr>
					<td width=60 align=right bgcolor=#7eaee9>����ȸ��</td>
					<td bgcolor=cde6ff>&nbsp;&nbsp;<%=company_id%></td>
				</tr>
				<tr>
					<td width=60 align=right><font  color=blue>��ǰ����</font></td>
					<c:set var="expression" value ="<%=expression%>" />
					<td>
					<p>&nbsp;<a href="../product/product.jsp?i=<%= id%>" title="<%=expression%>">				    
					 <c:choose>
           				<c:when test="${fn:length(expression) > 14}">
            				<c:out value="${fn:substring(expression,0,12)}"/>...
           				</c:when>
           				<c:otherwise>
            				<c:out value="${expression}"/>
           				</c:otherwise> 
          			</c:choose>
          			</a></p>
          			</td>
				</tr>
				</table>
			    <!-- �� -->
<%      
		flag=1;            

		} else {
%>
		</td>
		<td>
			<!-- ������  ���̺� -->
			<table width="250" border=1 cellpadding=1 cellspacing=2 align=center bordercolor=#990000>
			<tr>
				<td colspan=2 align="center"><a href="../product/product.jsp?i=<%= id%>">
				<img src="../product/image/<%=photo%>" width=100 height=100 border=0></a></td>
			</tr>
			<tr>
				<td width=60 align=right bgcolor=#7eaee9>��ǰ��</td>
				<td bgcolor=cde6ff>&nbsp;&nbsp;<%=name%></td>
			</tr>
			<tr>
				<td width=60 align=right bgcolor=#7eaee9>����</td>
				<td bgcolor=cde6ff>&nbsp;&nbsp;[<fmt:formatNumber value="<%=price%>" pattern="\#,###.##"/>��]</td>
			</tr>
			<tr>
				<td width=60 align=right bgcolor=#7eaee9>����ȸ��</td>
				<td bgcolor=cde6ff>&nbsp;&nbsp;<%=company_id%></td>
			</tr>
			<tr>
				<td width=60 align=right><font color=blue>��ǰ����</td>
				<c:set var="expression" value ="<%=expression%>" />
				<td>
				<p>&nbsp;<a href="../product/product.jsp?i=<%= id%>" title="<%=expression%>">
					<c:choose>
           				<c:when test="${fn:length(expression) > 14}">
            				<c:out value="${fn:substring(expression,0,12)}"/>...
           				</c:when>
           				<c:otherwise>
            				<c:out value="${expression}"/>
           				</c:otherwise> 
          			</c:choose>
          		 </div>
          		 </td>
			</tr>
			</table>
			<!--�� -->	
		</td>
	</tr>
<%
	flag=0;

     stop = stop + 1;
	 if( stop > 2) break;
	} //while
	} //try
        rs.close(); 
        stmt.close();
	 pool.freeConnection("ora8", con);
} catch (Exception e) {
	out.println(e);
}
%>
	</table>
	</center>  

<!--  ȭ�� ��   -->
	<jsp:include page="../common/basic_copyright.jsp" flush="true"/>
</BODY>
</HTML>