<%@ page import="java.sql.*,oracle.dbpool.*" errorPage="/error.jsp" contentType="text/html; charset=EUC_KR" %>
<%-- @ include file="/fresh.jsp" --%>

<%
   if( session.getAttribute("pid") == null)  {
	response.sendRedirect("../main/index.jsp");
   } else {

   DBConnectionManager connMgr=null;

   Connection conn=null;
   Statement stmt=null;
   Statement stmt1=null; 
   ResultSet rs=null;
   ResultSet rs1=null;

try {

connMgr=DBConnectionManager.getInstance();
conn=connMgr.getConnection("ora8");

int checknum=0;

String p_id =(String)session.getAttribute("pid");
		
		for(int checknumm=0; checknum<19;checknum++){
			if(Integer.parseInt(request.getParameter("1"))!=checknum){
			}
		}

		String name,company_id,expression,photo,category;

		String sql3="select count(id) from basket";
		String sql1="select id,name,price,company_id,expression,photo,category from product where id in (select distinct(product_id) from basket)";

		int id,price,qty;
		int number=1;

		stmt=conn.createStatement();
		stmt1=conn.createStatement();

//-- resultset3
	    //rs3=stmt.executeQuery(sql3);
		rs=stmt.executeQuery(sql3);
		int count=777;

		if(rs.next())  {
			count=rs.getInt(1);
			if(count==0) {
				count=count+1;
			} else {
				rs.close();	
				count=count+1;    
				}
		}  else  {
			count=7777;   
		}
		//String sql2= "insert into basket(id,product_id,user_id,qty,buydate,temp1,temp2 ) values(" + count + "," + pc_calnum + ",'"+p_id+"',1,sysdate,'GG','Y')";
		rs=stmt.executeQuery(sql1);
		//stmt2.executeUpdate(sql2);

		while(rs.next()) {
			id=rs.getInt(1);
			name=rs.getString(2);
			price=rs.getInt(3);
			company_id=rs.getString(4);
			expression=rs.getString(5);
			photo=rs.getString(6);
			category=rs.getString(7);
		}
	//rs2.close();
	rs.close();

	} catch (Exception e) {
		System.out.println(e);
	} finally{
	if (stmt != null) stmt.close();
	//if (stmt2 != null) stmt2.close();
	if (conn != null) {
		connMgr.freeConnection("ora8", conn);
		}
	}
%>

<!-- ============================= -->
	<script language="javascript">
		location.href="basket_view.jsp";
	</script>
<%
}
%>