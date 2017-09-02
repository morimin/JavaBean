<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>       
<%@ page import="java.util.*" %>   
<%@ page import="java.sql.*" %> 

<%@ page import="org.apache.commons.dbcp2.*" %>
<%@ page import="org.apache.commons.pool2.*" %>
<%@ page import="org.apache.commons.pool2.impl.*" %>   

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
 request.setCharacterEncoding("utf-8");
 response.setCharacterEncoding("utf-8");  
%> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>E05connectionPool.jsp</title>


</head>
<body> 

<%
 final String POOL_NAME = "/kpmgsmdb_pool";  //rapadb1 에 접속하는 pool 로 이름 선언
 try{
  ConnectionFactory connectionFactory = new DriverManagerConnectionFactory (
    "jdbc:mysql://localhost:3306/vavojasic?characterEncoding=utf8",
    "vavojasic", "aksnfkfk5" );
  
  PoolableConnectionFactory poolableConnectionFactory = new PoolableConnectionFactory(connectionFactory, null);
  
  GenericObjectPoolConfig objectPoolConfig = new GenericObjectPoolConfig();
  
  objectPoolConfig.setTimeBetweenEvictionRunsMillis(1000 * 60L * 5L);
  objectPoolConfig.setTestWhileIdle(true);
  objectPoolConfig.setMinIdle(4);
  objectPoolConfig.setMaxTotal(50);
  
  GenericObjectPool<PoolableConnection> objectPool = new GenericObjectPool<PoolableConnection>(poolableConnectionFactory, objectPoolConfig);
  
  PoolingDriver poolingDriver = new PoolingDriver();
  poolingDriver.registerPool(POOL_NAME, objectPool);
  
  out.print("OKAY");
  
 }catch(Exception e){  
  
 }
 

%>
 
</body>
</html>