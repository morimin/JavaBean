<%@ page contentType="text/html;charset=euc-kr"
        import="java.sql.*"  %>
<%
   String url="jdbc:oracle:thin:@220.67.2.2:1521:ora8";
   String sql = "create table member ( ";
     sql = sql + "m_uid			varchar2(10)	PRIMARY KEY, ";
     sql = sql + "m_pwd		varchar2(10)	NOT NULL, ";
     sql = sql + "m_name		varchar2(10)	NOT NULL, ";
     sql = sql + "m_ssn			varchar2(14)	NOT NULL, ";
     sql = sql + "m_emai		varchar2(30)	NULL, ";
     sql = sql + "m_phone		varchar2(12)	NULL, ";
     sql = sql + "m_job			varchar2(20)	default '0', ";
     sql = sql + "m_regdate	date             default sysdate, ";
     sql = sql + "m_visit		NUMBER(5)	NULL, ";
     sql = sql + "m_lastvisit	date				NULL, ";
     sql = sql + "m_zip			varchar2(7)	NULL, ";
     sql = sql + "m_address	varchar2(60)	NULL ) ";

   Class.forName("oracle.jdbc.driver.OracleDriver");
   Connection con = DriverManager.getConnection(url,"stud145","pass145");
   Statement Stmt = con.createStatement();
   Stmt.executeUpdate(sql);

   Stmt.close();
   con.close();
   	out.println("회원관리(member) 테이블이 생성되었습니다.");
%>
