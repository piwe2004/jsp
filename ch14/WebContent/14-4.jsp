<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	response.setCharacterEncoding("utf-8");
	
	String seq = request.getParameter("seq");

	final String HOST = "jdbc:mysql://192.168.0.156:3306/kmg";
	final String USER = "kmg";
	final String PASS = "1234";
	
	Connection conn  = null;
	Statement stmt = null;
	
	

	try{
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(HOST,USER,PASS);
		stmt = conn.createStatement();
		
		String sql = "DELETE FROM `USER`  WHERE seq="+seq;
		stmt.executeUpdate(sql);
		
	} catch(Exception e){
		e.printStackTrace();
	}finally{
		conn.close();
		stmt.close();
	}
	
	response.sendRedirect("./14-3.jsp");

%>