package com.kpmg.reports;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 * Servlet implementation class MakeList
 */
@WebServlet("/confirmReports")
public class ConfirmReports extends HttpServlet {
	
 protected void doGet(HttpServletRequest request, HttpServletResponse response)
   throws ServletException, IOException {

  response.setContentType("text/html; charset=utf-8");
  response.setCharacterEncoding("utf-8");
  request.setCharacterEncoding("utf-8");

  ReportsList list = new ReportsList();

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
   
   String sql = String.format("select * from reports where search_date = '%s' and disting='국내기사' order by idx desc", toDay);
   // ; upperIdx 가 %d 자리로 들어감.   
   
   
   System.out.println("[DEBUG CFR]curdate="+sql);
   pstmt = conn.prepareStatement(sql);   
   rs = pstmt.executeQuery();   
   
   while(rs.next()) // 값을 채워주는 역할
   {
    list.setIdx(rs.getInt("idx"));
    // ; idx 값을 가져와서 add 한 것을 셋 한다.
    list.setYmd(rs.getDate("ymd"));
    list.setSd(rs.getDate("search_date"));
    list.setSort(rs.getString("sort"));
    list.setTimes(rs.getString("times"));
    list.setTitle(rs.getString("title"));
    list.setUrl(rs.getString("url"));    

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
    
 
  request.setAttribute("ReportsLIST", list);
  
    
  RequestDispatcher rd = request.getRequestDispatcher("main.jsp?CMD=confirmReports.jsp");
  //RequestDispatcher rd = request.getRequestDispatcher("reportsList.jsp");
  // ; 새창에서 시작
  rd.forward(request, response);

 }// doGet Method



}// Main Servlet
