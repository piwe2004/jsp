<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/config.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>7-3</title>
</head>
<body>
	<h3>3. forward 액션태그</h3>
	<%
		// pageContext.forward("./inc/head.jsp" /);
	%>
	
	<jsp:forward page="./7-1.jsp"></jsp:forward>
</body>
</html>