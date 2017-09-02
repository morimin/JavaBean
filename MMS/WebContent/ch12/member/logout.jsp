<%
     // 세션을 끊는다.
     session.invalidate();
	 // 활성 사용자 한명 줄이기..
    if( application.getAttribute("admincount") != null){
	Integer rm1 = (Integer)application.getAttribute("admincount");
	int s = rm1.intValue(); 
	Integer rm2 = new Integer(--s);
    application.setAttribute("admincount",rm2);
	}				
%>
<script language="javascript">
    location.href="../main/index.jsp";
</script>