<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<!-- Bootstrap core JS-->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="../resources/script/scripts.js"></script>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../resources/design/styles.css" rel="stylesheet" />
<meta charset="UTF-8">
<title>회원 정보 수정</title>
</head>
<body>
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="../main/index">SkinTalk</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <!-- Search-->
                <div class="card-body">
                    <div class="input-group">
                        <input class="form-control" type="text" placeholder="Search" />
                        <span class="inpug-group-append"><button class="btn btn-secondary" type="button">Go!</button></span>
                    </div>
                </div>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                       <c:if test="${empty sessionScope.userId }">
                          <li class="nav-item"><a class="nav-link" href="../member/login">로그인</a></li>
                        </c:if>
                        <c:if test="${not empty sessionScope.userId }">
                          <li class="nav-item"><a class="nav-link" href="../member/member-detail">마이페이지</a></li>
                          <li class="nav-item"><a class="nav-link" href="../member/logout">로그아웃</a></li>
                        </c:if>
                        <li class="nav-item"><a class="nav-link" href="../cart/cartList">장바구니</a></li>
                        <li class="nav-item"><a class="nav-link" href="../board/list">고객센터</a></li>
                    </ul>
                </div>
            </div>
        </nav>

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












