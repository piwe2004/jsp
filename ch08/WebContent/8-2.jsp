<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>8-2</title>
</head>
<body>
	<h3>2. 전송 파마미터 출력</h3>
		<%-- 자바빈을 이용한 파라미터 수신 --%>
		<%
		/* 	String name = request.getParameter("name");
			String gender = request.getParameter("gender");
			String[] hobbies = request.getParameterValues("hobby");
			String addr = request.getParameter("addr"); */
		%>
		
		<%-- useBean태그를 이용한 파라미터 수신 --%>
		<jsp:useBean id="user" class="sub1.User">
			<jsp:setProperty name="user" property="name" />
			<jsp:setProperty name="user" property="gender" />
			<jsp:setProperty name="user" property="hobby" />
			<jsp:setProperty name="user" property="addr" />
		</jsp:useBean>
	<p>
		<%-- 이름 : <%=name %><br/>
		성별 : <%=gender %><br/>
		취미 : <%
			if(hobbies != null){
				for(String hobby : hobbies){
					out.print("hobby" + ",");
				}
			} else{
				out.print("null");
			}
		%><br/>
		지역 : <%=addr %><br/>  --%>
		
		이름 : <jsp:getProperty name="user" property="name" /><br/>
		이름 : <jsp:getProperty name="user" property="gender" /><br/>
		이름 : <jsp:getProperty name="user" property="hobby" /><br/>
		이름 : <jsp:getProperty name="user" property="addr" /><br/>
	</p>
</body>
</html>