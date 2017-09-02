<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import ="com.kpmg.reports.*" %>
<%@ page import="java.util.*" %>    
<c:set var="date" value="<%= new Date() %>" />
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="javax.naming.Context" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.sql.DataSource" %>


<% 
 request.setCharacterEncoding("utf-8");
 response.setCharacterEncoding("utf-8");  
 
 ReportsList totalList = new ReportsList();
 ReportsList distingDList = new ReportsList();
 ReportsList distingAList = new ReportsList();
 
 Connection conn = null;
 PreparedStatement pstmt = null;
 ResultSet rs = null;

 try {
  Context initContext = new InitialContext();
  Context envContext = (Context) initContext.lookup("java:/comp/env");
  DataSource ds = (DataSource) envContext.lookup("jdbc/kpmgsmdb_pool");
  // ; Context 내부를 읽어오면서 rapadb1_pool 을 찾아서 가져온다.

  /* get connection */
  //
  conn = ds.getConnection();
  
  String toDay = "select curdate() as todate";
  pstmt = conn.prepareStatement(toDay);
  rs = pstmt.executeQuery();
  
  while(rs.next())
  {
	   toDay = rs.getString("todate");
  }
  
  String sql = String.format("select * from reports where search_date = '%s' order by idx desc", toDay);
  // ; upperIdx 가 %d 자리로 들어감.  
  pstmt = conn.prepareStatement(sql);
  rs = pstmt.executeQuery();   

  while(rs.next()) // 값을 채워주는 역할
  {
	  totalList.setIdx(rs.getInt("idx"));
   // ; idx 값을 가져와서 add 한 것을 셋 한다.
   totalList.setYmd(rs.getDate("ymd"));
   totalList.setSd(rs.getDate("search_date"));
   totalList.setSort(rs.getString("sort"));
   totalList.setTimes(rs.getString("times"));
   totalList.setTitle(rs.getString("title"));
   totalList.setUrl(rs.getString("url"));    

  } // while
  
  String sqldd = String.format("select * from reports where search_date = '%s' and disting = '국내기사' order by idx desc", toDay);
  pstmt = conn.prepareStatement(sqldd);
  rs = pstmt.executeQuery();
  
  while(rs.next()) // 값을 채워주는 역할
  {
	distingDList.setIdx(rs.getInt("idx"));
   // ; idx 값을 가져와서 add 한 것을 셋 한다.
   distingDList.setYmd(rs.getDate("ymd"));
   distingDList.setSd(rs.getDate("search_date"));
   distingDList.setSort(rs.getString("sort"));
   distingDList.setTimes(rs.getString("times"));
   distingDList.setTitle(rs.getString("title"));
   distingDList.setUrl(rs.getString("url"));    

  } // while
	  
  String sqlda = String.format("select * from reports where search_date = '%s' and disting = '해외기사' order by idx desc", toDay);
  pstmt = conn.prepareStatement(sqlda);
  rs = pstmt.executeQuery();
  
  while(rs.next()) // 값을 채워주는 역할
  {
   distingAList.setIdx(rs.getInt("idx"));
   // ; idx 값을 가져와서 add 한 것을 셋 한다.
   distingAList.setYmd(rs.getDate("ymd"));
   distingAList.setSd(rs.getDate("search_date"));
   distingAList.setSort(rs.getString("sort"));
   distingAList.setTimes(rs.getString("times"));
   distingAList.setTitle(rs.getString("title"));
   distingAList.setUrl(rs.getString("url"));    

  } // while
  
  
  
  /* resource release into connection pool */
  //
  rs.close();
  pstmt.close();
  conn.close();

 } catch (Exception e) {
  System.out.print("ERROR : " + e.getMessage() + "<br>");
  // ; syso 이므로 콘솔에 출력

 }
   

 request.setAttribute("totalReportsLIST", totalList);
 request.setAttribute("distingDReportsLIST", distingDList);
 request.setAttribute("distingAReportsLIST", distingAList);
 
%> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KPMG ACI 기사수합 페이지</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body> 

	<br><br>



<div id="cover" >

<h2><fmt:formatDate value="${date }" type="both" pattern="yyyy-MM-dd"/></h2> <br><br><br>
	
금일 전체 기사개수 : ${totalReportsLIST.listSize} 건<br><br><br>
	
국내기사 : ${distingDReportsLIST.listSize } 건 <br><br>     

해외기사: ${distingAReportsLIST.listSize } 건         
	
</div>

<div id="plott">
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Daily News', '# per Day'],
          ['국내기사',     ${distingDReportsLIST.listSize }],          
          ['해외기사',  ${distingAReportsLIST.listSize }]          
        ]);
        var options = {
          title: 'ACI Daily Newsletter Chart'
        };
        var chart = new google.visualization.PieChart(document.getElementById('piechart'));
        chart.draw(data, options);
      }      
    </script>    
    <div id="piechart" style="width: 600px; height: 600px;" align="right"></div>    
</div>
</body>
</html>