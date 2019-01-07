<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>2. JAVA 반복문</h3>
	
	<h4>for</h4>
	<%
		int sum=0;
		for(int k=0; k<=10; k++){
			sum += k;
		}
	%>
	<i>1에서 10까지의 합 : <%=sum %></i>
	<h4>구구단표</h4>
	<table border="1">
		<%
			/* for(int dan = 2; dan<10; dan++){
				out.println("<tr><td>" + dan + "단</td></tr>");
				out.println("<tr>");
				for(int num = 1; num<10; num++){
					out.println("<td>" + dan + "x" + num + "=" + dan*num + "</td>");
				}
			} */
			for(int a=1; a<=9; a++){
		%>
		<tr>
			<% for(int b=2; b<=9; b++){ %>
			<td><%= b %> x <%=a %> = <%= b*a %></td>
			<%} %>
		</tr>
		<%} %>
	</table>
	
</body>
</html>