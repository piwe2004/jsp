<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>5-2</title>
</head>
<body>
	<h3>1.내장객체 범위</h3>
	<%
	/* Object pName = pageContext.getAttribute("name"); */
	Object pName = pageContext.getAttribute("name");
	Object rName = request.getAttribute("name");
	Object sName = session.getAttribute("name");
	String aName = application.getAttribute("name").toString();
	
	/* String str = (String)pName; */
	/* String strName = pName.toString(); */
	%>
	
	<h4>내장객체 값 셋팅완료!!!</h4>
	<p>pageContext 값 : <%=pName %></p>
	<p>request 값 : <%=rName %></p>
	<p>session 값 : <%=sName %></p>
	<p>application 값 : <%=aName %></p>
	<a href="./5-1.jsp">내장객체 셋팅값 확인하기</a>
</body>
</html>