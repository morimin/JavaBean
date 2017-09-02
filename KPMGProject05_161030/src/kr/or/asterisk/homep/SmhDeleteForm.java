package kr.or.asterisk.homep;

import java.io.IOException;
import java.sql.Connection;
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
 * Servlet implementation class SmhDeleteForm
 */
@WebServlet("/smhDeleteForm")
public class SmhDeleteForm extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html; charset=utf-8");		
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		
		String bid = request.getParameter("bid");
		String idx = request.getParameter("idx");
		// idx 값을 찾아서 가져옴
		
		
		if (idx == null)  // 만약 idx가 없으면 
		{
			request.setAttribute("dbResult", "FAIL");
			request.setAttribute("dbResultMsg", "처리를 위한 필수정보가 없습니다.");
			request.setAttribute("nextURL", "smhMain.jsp?CMDS=home.jsp");
			
			RequestDispatcher rd = request.getRequestDispatcher("smhMain.jsp?CMDS=smhResult.jsp");
			rd.forward(request, response);		
		}// if
			
		
		/* DB접속 */
		//
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;		

		try{
			Context initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource)envContext.lookup("jdbc/kpmgsmdb_pool");
			// ; Context 내부를 읽어오면서 rapadb1_pool 을 찾아서 가져온다.
			
			
			/* get connection */
			//
			conn = ds.getConnection();
			
			String sqld = String.format("delete from smh where bid='%s' and idx = '%s'", bid, idx);			
			pstmt = conn.prepareStatement(sqld);
			System.out.println("[DEBUG] sqld = " + sqld);			
			int affectedCount = pstmt.executeUpdate();  // 영향을 받을 갯수
			
			/*
			int numInt = Integer.parseInt(idx);
			//String sqlq = String.format("alter table smh auto_increment='%d'",numInt);
			String sqlq = "alter table smh auto_increment="+numInt;
			pstmt = conn.prepareStatement(sqlq);			
			pstmt.executeUpdate();
			System.out.println("[DEBUG] sqlq = " + sqlq);
			*/
			// bbsResult.jsp 에서 결과를 알고 싶다.			
			if ( affectedCount == 1 )
			{  // 1보다 작으면 error
				//request.setAttribute("dbResult", "FAIL");
				request.setAttribute("nextURL", "smhMain.jsp?CMDS=smhMakeList?bid="+bid);
				request.setAttribute("dbResultMsg", "데이터 삭제 성공.!!");
			}else
			{  // 그렇지 않으면 성공
				//request.setAttribute("dbResult", "SUCCESS");
				request.setAttribute("nextURL", "smhMain.jsp?CMDS=smhMakeList?bid="+bid);
				request.setAttribute("dbResultMsg", "데이터 삭제 실패");
			}
							
			/* resource release into connection pool */
			//
			//if ( rs != null)
			//rs.close(); 									
			pstmt.close();
			conn.close();
			
		}catch(Exception e){
			System.out.print("ERROR : " + e.getMessage() + "<br>");  
			// ; syso 이므로 콘솔에 출력
			
		}
		
		// if 문을 포워드 할것임
		RequestDispatcher rd = request.getRequestDispatcher("smhMain.jsp?CMDS=smhResult.jsp");
		rd.forward(request, response);			
	
	}// doGet Method	
	

	/* 한글깨짐을 유니코드로 바꿔주는 메소드 */
	public String toUnicode(String str)
	{		if( str == null ) return null;
		
		try {
			byte[] b = str.getBytes("ISO-8859-1");
			return new String(b);
		} catch (Exception e) {
			return null;
		}		
	}// Unicode Method
	
	
	
}//Main Class
