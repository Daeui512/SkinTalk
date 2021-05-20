<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>회원 정보 수정</title>
</head>
<body>
	<form action="update" method="post">
		<!-- 아이디 -->
		<div>
		아이디<br>
			<p>
			<input type="text" name="userId" value="${vo.userId}" readonly>
			</p>
		</div>
		<!-- 비밀번호 -->
		<div>
		비밀번호<br>
			<p>
			<input type="password" name="password" placeholder="비밀번호" value="${vo.password}">
			</p>
		</div>
		<!-- 이름 -->
		이름<br>
		<div>
			<p>
			<input type="text" name="userName" placeholder="이름" value="${vo.userName}">
			</p>
		</div>
		<!-- 닉네임 -->
		닉네임<br>
		<div>
			<p>
			<input type="text" name="nickName" placeholder="닉네임" value="${vo.nickName}">
			</p>
		</div>
		<!-- 성별 -->
		성별<br>
		<div>
			<p>
			<input type="radio" name="gender" value="남" required="required" checked>남
			<input type="radio" name="gender" value="여" required="required">여
			</p>
		</div>
		<!-- 나이 -->
		나이<br>
		<div>
			<p>
			<input type="text" name="age" placeholder="나이" value="${vo.age}">
			</p>
		</div>
		<!-- 피부 타입 -->
		피부타입<br>
		<div>
			<p>
			<input type="radio" name="skinType" value="지성" checked>지성
			<input type="radio" name="skinType" value="중성">중성
			<input type="radio" name="skinType" value="건성">건성
			<input type="radio" name="skinType" value="복합성">복합성
			</p>
		</div>
		<!-- 피부 고민 -->
		피부고민<br>
		<div>
			<p>
			<input type="checkbox" name="skinTrouble" value="해당없음" checked>해당없음
			<input type="checkbox" name="skinTrouble" value="아토피">아토피
			<input type="checkbox" name="skinTrouble" value="여드름">여드름
			<input type="checkbox" name="skinTrouble" value="민감성">민감성
			</p>
		</div>
		<!-- 이메일 -->
		이메일<br>
		<div>
			<p>
			<input type="mail" name="email" placeholder="이메일" value="${vo.email}">
			</p>
		</div>
		<!-- 핸드폰 번호 -->
		핸드폰번호<br>
		<div>
			<p>
			<input type="text" name="phone" placeholder="핸드폰번호" value="${vo.phone}">
			</p>
		</div>
		<!-- 주소 -->
		주소<br>
		<div>
			<p>
			<input type="text" name="address" placeholder="주소" value="${vo.address}">
			</p>
		</div>
		
		<div>
			<input type="submit" value="등록">
		</div>
	</form>
	
</body>
</html>












