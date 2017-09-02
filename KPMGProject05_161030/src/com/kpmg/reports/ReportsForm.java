package com.kpmg.reports;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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
 * Servlet implementation class ReportsForm
 */
@WebServlet("/reportsForm")
public class ReportsForm extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html; charset=utf-8");
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
			 

		String[] ord = request.getParameterValues("ord");
		/*String[] ymd = request.getParameterValues("ymd");
		String[] search_date = request.getParameterValues("search_date");
		String[] sort = request.getParameterValues("sort");
		String[] times = request.getParameterValues("times");
		String[] title = request.getParameterValues("title");
		String[] url = request.getParameterValues("url");*/		
	    String disting = request.getParameter("disting");
	    System.out.println("[RF disting]"+disting);
		
		
				

		
		try {		
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			
			Context initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource) envContext.lookup("jdbc/kpmgsmdb_pool");

			conn = ds.getConnection();			
			System.out.println("Connection OK");			

			//String preSql = "SET SQL_SAFE_UPDATES =0";			
			//pstmt = conn.prepareStatement(preSql);
			//pstmt.executeQuery();
			//System.out.println("[DEBUG presql]"+preSql);
			
			/* reportsform DB 매번 초기화 */
			String sqld = "delete from reportsform where ordform > 0";			
			pstmt = conn.prepareStatement(sqld);			
			pstmt.executeUpdate();
			System.out.println("[DEBUG sqld]"+sqld);
			
			/*
			String sqla = "alter table reportsform auto_increment=1";
			pstmt = conn.prepareStatement(sqla);
			pstmt.executeUpdate();
			System.out.println("[DEBUG sqla]"+sqla);
			*/

		   /* 날짜('1989-05-29')형식 가져오기 */
		   String toDay = "select curdate() as todate";
		   pstmt = conn.prepareStatement(toDay);
		   rs = pstmt.executeQuery();
		   
		   while(rs.next())
		   {
			   toDay = rs.getString("todate");
		   }
			
			String sql = String.format("select * from reports where search_date = '%s' and disting='%s' order by idx desc ", toDay, disting);
			System.out.println("[RF DEBUG sql]" + sql);
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
						
			
			/* 나머지값들 리스트형태로 디비에서 직접 가져오기 */
			List<String> ymdform = new ArrayList<String>();
			List<String> sdform = new ArrayList<String>();
			List<String> sortform = new ArrayList<String>();	
			List<String> timesform = new ArrayList<String>();			
			List<String> titleform = new ArrayList<String>();			
			List<String> urlform = new ArrayList<String>();
						

			while(rs.next()) // 값을 채워주는 역할
			{
				ymdform.add(rs.getString("ymd"));
				sdform.add(rs.getString("search_date"));
				sortform.add(rs.getString("sort"));
				timesform.add(rs.getString("times"));				
				titleform.add(rs.getString("title"));
				urlform.add(rs.getString("url"));				
				
			} // while
			
			for( int i = 0 ; i < ord.length; i++)
			{		
				try{
								
					String sqli = String.format("insert into reportsform (ordform, ymdform, sdform, sortform, timesform, titleform, urlform ) values('%s','%s','%s','%s','%s','%s','%s')", Integer.parseInt(ord[i]), ymdform.get(i).toString(), sdform.get(i).toString(), sortform.get(i).toString(), timesform.get(i).toString(), titleform.get(i).toString(), urlform.get(i).toString());				
					pstmt = conn.prepareStatement(sqli);	
					System.out.println("[DEBUG sqli]"+sqli);
					
					//request.setAttribute("ordform",ord);
				}catch(Exception e){
					request.setAttribute("dbResultMsg" , "데이터정렬실패");
					request.setAttribute("nextURL", "main.jsp?CMD=confirmReports");					
				}
				
				int affectedCount = pstmt.executeUpdate();
				
				if (affectedCount >= 1) {
					request.setAttribute("dbResultMsg" , "결과창으로 이동합니다.");
					request.setAttribute("nextURL", "main.jsp?CMD=reportsForm.jsp");										
				} 
				
			}//for		
			
			rs.close();
			pstmt.close();
			conn.close();
									
		} catch (Exception e) {
			System.out.println("ERROR :" + e.getMessage());
			request.setAttribute("dbResultMsg" , "데이터정렬실패");
			request.setAttribute("nextURL", "main.jsp?CMD=confirmReports");
		}		
			
		
		
		RequestDispatcher rd = request.getRequestDispatcher("main.jsp?CMD=YesOrNo.jsp");
		rd.forward(request, response);
		
		
	
		
	}// doPost
	

}// Main Class


