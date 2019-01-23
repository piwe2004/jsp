<%@page import="kr.co.board1.service.BoardService"%>
<%@page import="kr.co.board1.config.SQL"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.board1.config.DBconfig"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
/* request.setCharacterEncoding("UTF-8");

String seq = request.getParameter("seq");

Connection conn = DBconfig.getConnection();

PreparedStatement psmt = conn.prepareStatement(SQL.DELETE_COMMENT);

psmt.setString(1, seq);

psmt.executeUpdate();

psmt.close();
conn.close();

response.sendRedirect("../list.jsp"); */

BoardService service = BoardService.getInstance();
String parent = service.delete(request);

//리다이렉트
response.sendRedirect("../view.jsp?seq="+parent);


%>