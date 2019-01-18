<%@page import="kr.co.board1.vo.MemberVO"%>
<%@page import="kr.co.board1.config.SQL"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.board1.config.DBconfig"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

	response.setCharacterEncoding("UTF-8");
	MemberVO member = (MemberVO)session.getAttribute("member");
	
	String title = request.getParameter("subject");
	String content = request.getParameter("content");
	String uid = member.getUid();
	String regip = request.getRemoteAddr();
	
	Connection conn = DBconfig.getConnection();
	
	PreparedStatement psmt = conn.prepareStatement(SQL.INSERT_BOARD);
	psmt.setString(1, title);
	psmt.setString(2, content);
	psmt.setString(3, uid);
	psmt.setString(4, regip);
	
	psmt.executeUpdate();
	
	psmt.close();
	conn.close();
	
	response.sendRedirect("../list.jsp");
	//1단계
	//2단계
	//3단계
	//4단계
	//5단계
	//6단계
%>