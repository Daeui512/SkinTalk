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
        <title>SkinTalk</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="../resources/design/styles.css" rel="stylesheet" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>아이디 찾기</title>
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

	<div>
		<h3>아이디 찾기 검색결과</h3>
	</div>
	<div>
		<h5>
			아이디 : ${userId}
		</h5>
		<p>
			<button type="button" id="loginBtn">로그인으로</button>
			<button type="button" onclick="history.go(-1)">아이디찾기</button>
		</p>
	</div>

	<!-- MemberController -> updatePost() 에서 보낸 데이터 저장 -->
	<input id=findUserIdAlert type="hidden" value="${findUserId_result }">

	<script type="text/javascript">
		$(document).ready(function(){
			confirmFindUserIdResult(); // confirmFindeUserIdResult() 호출 
			function confirmFindUserIdResult() {
				var result = $('#findUserIdAlert').val();
				if (result == 'fail') { // MemberController에서 받아온 findUserId_result 값이 fail
					alert('해당하는 아이디정보가 없습니다.')
					history.go(-1)
				} else if(result == 'success') { // MemberController에서 받아온 findUserId_result 값이 success
					$("#loginBtn").click(function(){ // #loginBtn버튼 클릭시
						location.href='../member/login'
					}); // end of #loginBtn
				}
			} // end of confirmFindUserIdResult()
			
		}); // end of document
	</script>
</body>
</html>