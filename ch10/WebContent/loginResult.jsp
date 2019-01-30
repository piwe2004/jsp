<%@ page import="sub1.User" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginResult</title>
</head>
<body>
	<h3>로그인결과</h3>
	<%
		request.setCharacterEncoding("UTF-8");
		String result = request.getParameter("result");
		
		if( result.equals("success")){
			User user = (User)session.getAttribute("user");
	%>
	<p><%=user.getName() %>님 반갑습니다.</p>
	<a href="./logout.jsp">로그아웃하기</a>
	<%
		}else{
	%>
	<p>
	해당하는 회원이 없습니다.<br/>
	다시 확인하시기 바랍니다<br/>
	<a href="./login.jsp">다시로그인하기</a>
	</p>
	<%
		}
	%>

</body>
</html>