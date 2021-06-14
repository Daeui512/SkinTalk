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
h5 {
  width:255px;
  height:38px;
  border: none; 
  padding:3px 2px 0 30px;
/*   float:left; */
/*   text-align: center;  */
  padding-top: 10px; 
}
</style>
        
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
  
  
  <div class="container">
    <br>
    <p class="text-center">
      SkinTalk
    </p>
    <hr>
    
    <div>
      <article class="card-body mx-auto" style="max-width: 400px;">
        <h4 class="card-title mt-3 text-center">아이디찾기 결과</h4>
          <!-- 아이디 -->
          <div class="form-group input-group">
            <div class="input-group-prepend">
              <span class="input-group-text" style="width:100px;"> <i class="fa fa-user"></i>
              아이디
              </span>
			<h5>${userId}</h5>
            </div>
          </div>
          
          <div style="padding-bottom: 20px">
            <a href="../member/login"><input type="button" value="로그인으로" class="form-control btn btn-primary"></a>
            <a href="../member/find_id_form"><input type="button" value="아이디찾기" class="form-control btn btn-primary"></a>
           </div>
          
      </article>
    </div>
  </div>
    

  
  

  
</body>
</html>