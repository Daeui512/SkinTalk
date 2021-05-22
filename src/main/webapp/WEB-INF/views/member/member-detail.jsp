<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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

<title>마이페이지</title>
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
	<h2>회원 가입 정보</h2>
	<p>아이디 : ${vo.userId}</p>
	<p>이름 : ${vo.userName}</p>
	<p>닉네임 : ${vo.nickName}</p>
	<p>성별 : ${vo.gender}</p>
	<p>나이 : ${vo.age}</p>
	<p>피부타입 : ${vo.skinType}</p>
	<p>피부고민 : ${vo.skinTrouble}</p>
	<p>이메일 : ${vo.email}</p>
	<p>핸드폰번호 : ${vo.phone}</p>
	<p>주소 : ${vo.address}</p>
</div>
<div>
	<a href="../main/index"><input type="button" value="메인페이지"></a>
	<a href="../member/update"><input type="button" value="정보 수정"></a>
	<a href="../member/delete"><input type="button" value="회원 탈퇴"></a>
</div>	

	<!-- MemberController -> updatePost() 에서 보낸 데이터 저장 -->
	<input id=updateAlert type="hidden" value="${update_result }">
	
	<script type="text/javascript">
		$(document).ready(function(){
			confirmUpdateResult(); // confirmUpdateResult()호출
			function confirmUpdateResult() {
				var result = $('#updateAlert').val();
				if (result == 'success') { // success 받아올 시 alert
					alert('정보가 수정되었습니다.');
				} else if(result == 'fail') { // fail 받아올 시 alert
					alert('정보 수정 실패하였습니다.');
				}
			} // end of confirmupdateResult()
		});
	</script>
</body>
</html>