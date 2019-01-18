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
	 
	 Connection conn = DBconfig.getConnection();
	 PreparedStatement psmt = conn.prepareStatement(SQL.SELECT_LIST);
	 
	 ResultSet rs = psmt.executeQuery();
	 
	 ArrayList<BoardVO> list = new ArrayList<>();
	 
	 while(rs.next()){
		 BoardVO bs = new BoardVO();

		 bs.setSeq(rs.getInt(1));
		 bs.setParent(rs.getInt(2));
		 bs.setComment(rs.getInt(3));
		 bs.setCate(rs.getString(4));
		 bs.setTitle(rs.getString(5));
		 bs.setContent(rs.getString(6));
		 bs.setFile(rs.getInt(7));
		 bs.setHit(rs.getInt(8));
		 bs.setUid(rs.getString(9));
		 bs.setRegip(rs.getString(10));
		 bs.setRdate(rs.getString(11));
		 bs.setNick(rs.getString(12));

		 list.add(bs);
	 }
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
						<td><%=bs.getSeq() %></td>
						<td><a href="./view.jsp?seq=<%=bs.getSeq() %>"><%=bs.getTitle() %></a><%= "&nbsp[" + bs.getComment() + "]" %></td>
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
				<a href="#" class="prev">이전</a>
				<a href="#" class="num">1</a>
				<a href="#" class="next">다음</a>
				</span>
			</nav>
			<a href="./write.jsp" class="btnWrite">글쓰기</a>
		</div>
	</body>

</html>










