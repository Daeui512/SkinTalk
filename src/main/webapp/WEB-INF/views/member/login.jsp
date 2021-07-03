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
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
.btn-primary{
  background-color: #343A40;
  border-color: #ffffff;
}
</style>
<title>SkinTalk 로그인</title>
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
                    <li class="nav-item"><a class="nav-link" href="../cart/cartList">장바구니</a></li>
                    <li class="nav-item"><a class="nav-link" href="../board/list">고객센터</a></li>
                </ul>
            </div>
        </div>
    </nav>
    
    
      <div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2" style="position: absolute; left: 50%; transform: translateX(-50%); padding-top: 115px">
        <div class="panel panel-success">
          <div class="panel-heading">
            <div class="panel-title">환영합니다!</div>
          </div>
          <div class="panel-body">
            <form id="../member/login-form" action = "login" method = "post">
              <div style="padding-bottom: 20px">
                <input type="text" class="form-control" name="userId" placeholder="Username" autofocus required>
              </div>
              <div style="padding-bottom: 20px">
                <input type="password" class="form-control" name="password" placeholder="Password" required>
              </div>
		    <!-- 로그인 실패시 -->
		    <c:if test="${param.loginFail == 'loginFail' }">
		      <p style="color:red">아이디 비밀번호가 일치하지 않습니다</p>
		    </c:if>
              <div style="padding-bottom: 20px">
                <button type="submit" class="form-control btn btn-primary">로그인</button>
              </div>
            </form>
           <div style="padding-bottom: 20px">
             <a href="register">
              <button type="button" class="form-control btn btn-primary">회원가입</button>
             </a>
           </div>
           <div style="padding-bottom: 20px">
            <a href="find_id_form"><button type="button" id="findIdBtn" class="form-control btn btn-primary">아이디찾기</button></a>
           </div>
           <div style="padding-bottom: 20px">
            <a href="find_password_form"><button type="button" id="findPasswordBtn" class="form-control btn btn-primary">비밀번호찾기</button></a>
           </div>
          </div>
        </div>
      </div>

  
    <!-- MemberController -> registerPost() 에서 보낸 데이터 저장 -->
    <input id=registerAlert type="hidden" value="${register_result }">  
    <script type="text/javascript">
		$(document).ready(function() {
			// 회원가입시 alert 띄우기
			confirmRegisterResult(); // confirmRegisterResult()호출
			function confirmRegisterResult() {
				var result = $('#registerAlert').val();
				if (result == 'success') { // success 받아올 시 alert
					alert('회원가입이 되었습니다.');
				} else if (result == 'fail') { // fail 받아올 시 alert
					alert('회원가입 실패하였습니다.');
				}
			} // end of confirmRegisterResult()
		}); // end of document
  	</script>
  
</body>
</html>