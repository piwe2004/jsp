<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>9-1</title>
</head>
<body>
	<h3>2.쿠키값 확인</h3>
	<%
		Cookie[] cookies = request.getCookies();
	
		for(Cookie cookie : cookies) {
			String name = cookie.getName();
			String value = cookie.getValue();
			
			out.println("<h4>쿠키명: " + name + "<br>쿠키값 : " + value  + "</h4>");
		}
		
		
		
	%>
	<h4>쿠키 생성에서 클라이언트로 전송완료</h4>
</body>
</html>