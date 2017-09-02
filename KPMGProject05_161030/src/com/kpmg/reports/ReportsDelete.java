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
@WebServlet("/reportsDelete")
public class ReportsDelete extends HttpServlet {	
	String dkey;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html; charset=utf-8");		
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		
		
		dkey = request.getParameter("dkey"); 
		
		doGet(request, response);
				
	}//doPost

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html; charset=utf-8");
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");		

		String strUpperIdx = request.getParameter("LAST_IDX"); // 최고 큰 idx 값 찾아오기
		
		
		int upperIdx;

		if (strUpperIdx == null)	upperIdx = Integer.MAX_VALUE; // 2**32
		else	upperIdx = Integer.parseInt(strUpperIdx);
		// ; idx 값을 주는 것이 아니라 처음에 리스트를 볼때 리스트 전체를 보려고 함.

		ReportsList list;

		list = readDB(upperIdx); // 가장큰 수부터 가져와서 readDB에 넣는다.		
		dkey=null;

		request.setAttribute("ReportsLIST", list);
		
		RequestDispatcher rd = request.getRequestDispatcher("main.jsp?CMD=reportsDelete.jsp");
		//RequestDispatcher rd = request.getRequestDispatcher("reportsList.jsp");
		// ; 새창에서 시작
		rd.forward(request, response);

	}// doGet Method

	private ReportsList readDB(int upperIdx) // 큰 수에서 10자리를 채우기 위함 for making
												// List.
	{

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
			String sql = String.format("select * from reports where idx < '%d' order by idx desc", upperIdx);
			// ; upperIdx 가 %d 자리로 들어감.			
			//String sqld =null;
			//String sqla=null;

			

			
			
			if( dkey != null)
			{
				//sql = String.format("delete from reports where idx >= '%s' ", dkey);
				sql = "delete from reports where idx >= "+dkey+" ";
			
				System.out.println("[DEBUG RD] sqld :" + sql);
				pstmt = conn.prepareStatement(sql);
				pstmt.executeUpdate();
				
				//sql = String.format("alter table reports auto_increment= '%s' ", dkey);
				sql = "alter table reports auto_increment= "+dkey+" ";
				System.out.println("[DEBUG RD] sqld :" + sql);
				pstmt = conn.prepareStatement(sql);
				pstmt.executeUpdate();
				
			}else 
			{
				sql = String.format("select * from reports where idx < '%d' order by idx desc", upperIdx);
			}
			
			/*
			System.out.println("[DEBUG RD] sqla :" + sql);
			pstmt = conn.prepareStatement(sql);
			pstmt.executeQuery();

*/			sql = String.format("select * from reports where idx < '%d' order by idx desc", upperIdx);
			System.out.println("[DEBUG RD1] sql :" + sql);
			pstmt = conn.prepareStatement(sql);			
			rs = pstmt.executeQuery();
													
			
			while( rs.next() )  // 값을 채워주는 역할
			{			
				list.setDisting( rs.getString("disting"));															
				list.setIdx(rs.getInt("idx"));
				// ; idx 값을 가져와서 add 한 것을 셋 한다.
				list.setSd(rs.getDate("search_date"));
				list.setYmd(rs.getDate("ymd"));				
				list.setSort(rs.getString("sort"));
				list.setTimes(rs.getString("times"));
				list.setTitle(rs.getString("title"));
				list.setUrl(rs.getString("url"));				
			}// while
									
			/* resource release into connection pool */
			//
			rs.close();
			pstmt.close();
			conn.close();

		} catch (Exception e) {
		    
			System.out.print("ERROR : " + e.getMessage() + "<br>");
			// ; syso 이므로 콘솔에 출력

		}

		return list;

	}// readDB(int upperIdx) Method
	
	
	
	

}// Main Servlet



