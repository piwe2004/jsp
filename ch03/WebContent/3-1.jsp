<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>3-1</title>
</head>
<body>
	<h3>1.request 내장객체</h3>
	<form action="./3-2.jsp" method="post">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="uid"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pass"></td>
			</tr>
			<tr>
				<td colspan="2" align="right"><input type="submit" value="로그인"></td>
			</tr>
		</table>
	</form>
	<form action="./3-3.jsp" method="get">
		<table border="1">
			<tr>
				<td>이름</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<input type="radio" name="gender" value="남">남
					<input type="radio" name="gender" value="여">여
				</td>
			</tr>
			<tr>
				<td>취미</td>
				<td>
					<input type="checkbox" name="hobby" value="등산">등산
					<input type="checkbox" name="hobby" value="여행">여행
					<input type="checkbox" name="hobby" value="독서">독서
					<input type="checkbox" name="hobby" value="컴퓨터">컴퓨터
					<input type="checkbox" name="hobby" value="게임">게임
				</td>
			</tr>
			<tr>
				<td>지역</td>
				<td>
					<select name="addr">
						<option>서울</option>
						<option>부산</option>
						<option>광주</option>
						<option>대구</option>
						<option>대전</option>
					</select>
				</td>
			</tr>
			<tr><td colspan="2" align="right"><input type="submit" value="회원정보 전송"></td></tr>
		</table>
	</form>
</body>
</html>