<%@page import="java.sql.Statement"%>
<%@page import="kr.co.board1.service.BoardService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.board1.vo.BoardVO"%>
<%@page import="kr.co.board1.config.SQL"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.board1.config.DBconfig"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.board1.vo.MemberVO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	MemberVO member = (MemberVO)session.getAttribute("member");

	 if(member == null){
		pageContext.forward("./login.jsp");
	} 

	 request.setCharacterEncoding("UTF-8");
	 String pg = request.getParameter("pg");
	 
	BoardService service = BoardService.getInstance();
	
	int limit = service.getLimitStart(pg);

	//페이지 번호계산
		int total = service.getTotal();
		int pageEnd = service.getPageEnd(total);
	
	// 글카운터 번호
	int count = service.getPageCountStart(total, limit);
	
	// 페이지그룹 계산
	int[] groupStartEnd = service.getPageGroupStartEnd(pg, pageEnd);
	
	ArrayList<BoardVO> list = service.list(limit);
	
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<title>글목록</title> 
		<link rel="stylesheet" href="./css/style.css" />
		<script></script>
	</head>
	<body>
		<div id="board">
			<h3>글목록</h3>
			<!-- 리스트 -->
			<div class="list">
				<p class="logout"><%= member.getNick() %>님! 반갑습니다. <a href="./proc/logout.jsp">[로그아웃]</a><p>
				<table>
					<tr>
						<td>번호</td>
						<td>제목</td>
						<td>글쓴이</td>
						<td>날짜</td>
						<td>조회</td>
					</tr>
				<%
					for(BoardVO bs : list){
				%>
					<tr>
						<td><%= count-- %></td>
						<td><a href="./view.jsp?seq=<%=bs.getSeq() %>"><%=bs.getTitle() %></a><%= "&nbsp[" + bs.getComment() + "]" %>
							<% if(bs.getFile() == 1){ %>
							<img src="./img/file_ico.jpg">
							<%} %>
						</td>
						<td><%=bs.getNick() %></td>
						<td><%=bs.getRdate().substring(2,10) %></td>
						<td><%=bs.getHit() %></td>
					</tr>
					<%} %>
				</table>
			</div>
			<!-- 페이징 -->
			<nav class="paging">
				<span> 
				<%if (groupStartEnd[0] > 1){ %>
				<a href="./list.jsp?pg=<%= groupStartEnd[0]-1 %>" class="prev">이전</a>
				<%} %>
				
				<%for(int current=groupStartEnd[0]; current <= groupStartEnd[1]; current++){ %>
				<a href="./list.jsp?pg=<%= current %>" class="num"><%= current %></a>
				<%} %>
				
				<%if(groupStartEnd[1] < pageEnd){ %>
				<a href="./list.jsp?pg=<%= groupStartEnd[1]+1 %>" class="next">다음</a>
				<%} %>
				</span>
			</nav>
			<a href="./write.jsp" class="btnWrite">글쓰기</a>
		</div>
	</body>

</html>










