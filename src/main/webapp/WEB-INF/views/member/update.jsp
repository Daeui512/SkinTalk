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

<style type="text/css">
.btn-primary{
  background-color: #343A40;
  border-color: #ffffff;
}

</style>
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







  <div class="container">
    <br>
    <p class="text-center">
      SkinTalk
    </p>
    <hr>
    
    <div >
      <article class="card-body mx-auto" style="max-width: 400px;">
        <h4 class="card-title mt-3 text-center">회원정보 수정</h4>
        <form action="update" method="post">
        
          <!-- 아이디 -->
          <div class="form-group input-group">
            <div class="input-group-prepend">
              <span class="input-group-text"> <i class="fa fa-user"></i>
              </span>
            </div>
            <input class="form-control" type="text" name="userId" value="${vo.userId}" readonly>
          </div>
            
          <!-- 비밀번호 -->
          <div class="form-group input-group">
            <div class="input-group-prepend">
              <span class="input-group-text"> <i class="fa fa-lock"></i>
              </span>
            </div>
            <input class="form-control" type="password" name="password" placeholder="비밀번호" value="${vo.password}">
          </div>
        
          <!-- 이름 -->
          <div class="form-group input-group">
            <div class="input-group-prepend">
              <span class="input-group-text"> <i class="fa fa-user"></i>
              </span>
            </div>
            <input class="form-control" type="text" name="userName" value="${vo.userName}" readonly>
          </div>
          
          <!-- 닉네임 -->
          <div class="form-group input-group">
            <div class="input-group-prepend">
              <span class="input-group-text"> <i class="fa fa-user"></i>
              </span>
            </div>
            <input class="form-control" type="text" name="nickName" placeholder="닉네임" value="${vo.nickName}">
          </div>
          
          <!-- 성별 -->
          <div class="form-group input-group">
            <div class="input-group-prepend">
              <span class="input-group-text"> <i class="fa fa-user"></i>
              </span>
            </div>
            <input class="form-control" type="text" name="gender" value="${vo.gender}" readonly>
          </div>
          
          <!-- 나이 -->
          <div class="form-group input-group">
            <div class="input-group-prepend">
              <span class="input-group-text"> <i class="fa fa-user"></i>
              </span>
            </div>
            <input class="form-control" type="text" name="age" placeholder="나이" value="${vo.age}" readonly>
          </div>
          
          <!-- 피부타입 -->
          <div class="form-group input-group">
            <div class="input-group-prepend">
              <span class="input-group-text"> <i class="fa fa-user"></i>
              </span>
            </div>
            <select class="form-control" id="skinType" name="skinType">
              <option selected>피부타입을 선택하세요</option>
              <option value="지성">지성</option>
              <option value="중성">중성</option>
              <option value="건성">건성</option>
              <option value="복합성">복합성</option>
            </select>
          </div>
          
          <!-- 피부문제 -->
          <div class="form-group input-group">
            <div class="input-group-prepend">
              <span class="input-group-text"> <i class="fa fa-user"></i>
              </span>
            </div>
              <input type="checkbox" id="skinTrouble1" name="skinTrouble" value="해당없음" checked> 해당없음
                <input type="checkbox" id="skinTrouble2" name="skinTrouble" value="아토피" > 아토피
                  <input type="checkbox" id="skinTrouble3" name="skinTrouble" value="여드름" > 여드름
                  <input type="checkbox" id="skinTrouble4" name="skinTrouble" value="민감성" > 민감성
          </div>
          
          <!-- 이메일 -->
          <div class="form-group input-group">
            <div class="input-group-prepend">
              <span class="input-group-text"> <i class="fa fa-envelope"></i>
              </span>
            </div>
            <input class="form-control" type="email" name="email" placeholder="이메일" value="${vo.email}">
          </div>
          
          <!-- 전화번호 -->
          <div class="form-group input-group">
            <div class="input-group-prepend">
              <span class="input-group-text"> <i class="fa fa-phone"></i>
              </span>
            </div>
			<input class="form-control" type="text" name="phone" placeholder="핸드폰번호" value="${vo.phone}">
          </div>
          
          <!-- 주소 -->
          <div class="form-group input-group">
            <div class="input-group-prepend">
              <span class="input-group-text"> <i class="fa fa-address"></i>
              </span>
            </div>
			<input class="form-control" type="text" name="address" placeholder="주소" value="${vo.address}">
          </div>
          
          <!-- 등록 -->
		  <div class="form-group">
            <input class="btn btn-primary btn-block" type="submit" value="등록">
          </div>
          
          
          
          
        </form>
      </article>
    </div>
    <!-- card.// -->

  </div>
  <!--container end.//-->
  
<script type="text/javascript">
		
</script> 

	
</body>

</html>












