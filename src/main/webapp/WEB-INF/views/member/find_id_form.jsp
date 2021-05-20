<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
</head>
<body>
	<form action="find_id" method="post">
		<div>
			<h3>아이디 찾기</h3>
		</div>
		<div>
			<p>
				<label>이메일</label>
				<input type="text" id="email" name="email" placeholder="이메일" required>
			</p>
			
			<p>
				<label>전화번호</label>
				<input type="text" id="phone" name="phone" placeholder="전화번호" required>
			</p>
			
			<p>
				<button type="submit">아이디찾기</button>
				<button type="button" onclick="history.go(-1);">로그인으로</button>
			</p>
		</div>
	</form>
</body>
</html>