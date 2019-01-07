<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/config.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>7-2</title>
</head>
<body>
	<h3>2.인클루드 액션태그</h3>
	
	<jsp:include page="./inc/head.jsp" />
	<section>
		<h1>메인 컨텐츠 영역입니다.</h1>
	</section>
	<jsp:include page="./inc/footer.jsp" />
</body>
</html>