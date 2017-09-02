package com.kpmg.reports;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
 * Servlet implementation class ArrangeReports
 */
@WebServlet("/arrangeReports")
public class ArrangeReports extends HttpServlet {


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html; charset=utf-8");
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		
		String search = request.getParameter("search");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ReportsList list = new ReportsList();
		
		System.out.println("[DEBUG]");

		
		try {
			
			Context initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource) envContext.lookup("jdbc/kpmgsmdb_pool");

			conn = ds.getConnection();			
			System.out.println("Connection OK");
			
			try{
				String sql = String.format("select * from reports where search_date ='%s' order by idx asc", search);
				System.out.println("[DEBUG sql ]" + sql);
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();	
				System.out.println("[DEBUG rs]"+rs);
			}catch(Exception e)
			{
				request.setAttribute("dbResultMsg" , "데이터검색실패");				
				request.setAttribute("nextURL" , "main.jsp?CMD=reportsMakeList");
				System.out.println("ERROR :"+ e.getMessage() );
			}
				
			if(rs.next())
			{
				list.setIdx(rs.getInt("idx"));				
				list.setYmd(rs.getDate("ymd"));
				list.setSd(rs.getDate("search_date"));
				list.setSort(rs.getString("sort"));
				list.setTimes(rs.getString("times"));
				list.setTitle(rs.getString("title"));
				list.setUrl(rs.getString("url"));
				
								
				request.setAttribute("nextURL" , "main.jsp?CMD=arrangedReports.jsp");
				
			}else{
				request.setAttribute("dbResultMsg" , "데이터검색실패");				
				request.setAttribute("nextURL" , "main.jsp?CMD=reportsMakeList");
				System.out.println("ERROR :" );
			}
			
			System.out.println("[DEBUD while]");
			
			rs.close();
			pstmt.close();			
			conn.close();			
			
		} catch (Exception e) {
			System.out.println("ERROR :" + e.getMessage() );
		}
		
		request.setAttribute("ArrangedLIST", list);
		System.out.println("[DEBUG + list]"+list);
		
		
		RequestDispatcher rd = request.getRequestDispatcher("main.jsp?CMD=arrangedReports.jsp");
		rd.forward(request, response);
		
		
	}// doPost

}// Main Class
