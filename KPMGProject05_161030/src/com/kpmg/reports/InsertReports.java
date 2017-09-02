package com.kpmg.reports;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

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
 * Servlet implementation class InsertReports
 */
@WebServlet("/insertReports")
public class InsertReports extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html; charset=utf-8");
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		
		String disting = request.getParameter("disting");		
		String ymd = request.getParameter("ymd");
		String search_date = request.getParameter("search_date");
		
		String sort = request.getParameter("sort");
		sort = sort.replace(" ", "");
		
		String times = request.getParameter("times");
		times = times.replace(" ", "");
		
		String title = request.getParameter("title");
		title = title.replace("'", "\"");
		
		String url = request.getParameter("url");
		url = url.replace(" ", "");

		Connection conn = null;
		PreparedStatement pstmt = null;
		

		

		try {

			Context initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource) envContext.lookup("jdbc/kpmgsmdb_pool");
			
			conn = ds.getConnection();			
			System.out.println("Connection OK");
		
			String sql = String.format("insert into reports (disting, ymd, search_date, sort, times, title, url) values('%s','%s','%s','%s','%s','%s','%s')", disting, ymd, search_date, sort, times, title, url);			
			System.out.println("[DEBUG sql]" + sql);
	
			pstmt = conn.prepareStatement(sql);			
			
			int affectedCount = pstmt.executeUpdate();
			
			if (affectedCount >= 1)	{
				
				request.setAttribute("nextURL" , "main.jsp?CMD=insertReports.jsp");
			}
		
			pstmt.close();
			conn.close();

			
			
			}catch(Exception e){
				
				request.setAttribute("dbResultMsg" , "데이터등록실패");				
				request.setAttribute("nextURL" , "main.jsp?CMD=insertReports.jsp");				
			}
						
					

		RequestDispatcher rd = request.getRequestDispatcher("main.jsp?CMD=YesOrNo.jsp");
		rd.forward(request, response);

	}// doPost Method

}// Main Servlet
