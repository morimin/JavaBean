package com.kpmg.reports;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ReportsItems {

	private int idx;
	private Date ymd;
	private Date search_date;
	private String sort;
	private String times;
	private String title;
	private String url;
	
	private int ord;
	
	public int getOrd(){
		return ord;
	} 
	public void setOrd(int ord)
	{
		this.ord = ord;
	}
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public Date getYmd() {
		return ymd;
	}
	public void setYmd(Date ymd) {
		this.ymd = ymd;
	}
	public Date getSearch_date() {
		return search_date;
	}
	public void setSearch_date(Date search_date) {
		this.search_date = search_date;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public String getTimes() {
		return times;
	}
	public void setTimes(String times) {
		this.times = times;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
	
	public void readDB()  // idx 값을 입력해주면 DB에서 쿼리되도록 설정
	 {  
	  
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
	   String sql = String.format("select * from reports where idx = '%d'", this.idx); 
	   // ; idx 가 키 값이므로 while 문 대신 if 문 사용
	   pstmt = conn.prepareStatement(sql);
	   
	   rs = pstmt.executeQuery();
	   
	   
	   if( rs.next() )  // 값을 채워주는 역할
	   {
	    this.title = rs.getString("title");	    
	    this.ymd  = rs.getDate("ymd");
	    this.search_date = rs.getDate("search_date");
	    this.sort =rs.getString("sort");
	    this.times = rs.getString("times");
	    this.title = rs.getString("title");
	    this.url = rs.getString("url");
	    
	   }// while -> If


	    
	   /* resource release into connection pool */
	   //
	   rs.close();
	   pstmt.close();
	   conn.close();
	   
	  }catch(Exception e){
	   System.out.print("ERROR : " + e.getMessage() + "<br>");  
	   // ; syso 이므로 콘솔에 출력
	  }
	  
	 }// readDB Method
	 
	 /* 한글깨짐을 유니코드로 바꿔주는 메소드 */
	/* public String toUnicode(String str)
	 {
	  if( str == null ) return null;
	  
	  try {
	   byte[] b = str.getBytes("ISO-8859-1");
	   return new String(b);
	  } catch (Exception e) {
	   return null;
	  }
	  
	 }// Unicode Method
	  */
	 
	
	
	
}// ReportsItems Class
