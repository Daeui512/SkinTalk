<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>글 작성 페이지</title>
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
                        <li class="nav-item"><a class="nav-link" href="../member/member-detail">마이페이지</a></li>
                        <li class="nav-item"><a class="nav-link" href="../cart/cartList">장바구니</a></li>
                        <li class="nav-item"><a class="nav-link" href="../board/list">고객센터</a></li>
                        <c:if test="${empty sessionScope.userId }">
                          <li class="nav-item"><a class="nav-link" href="../member/login">로그인</a></li>
                        </c:if>
                        <c:if test="${not empty sessionScope.userId }">
                          <li class="nav-item"><a class="nav-link" href="../member/logout">로그아웃</a></li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </nav>
  <h2>글 작성 페이지</h2>
  <form action="register" method="post">
    <div>
      <p>제목 :
        <input type="text" name="boardTitle" placeholder="제목" required="required">
      </p>
    </div>
    
    <div>
      <p>작성자 :
        <input type="text" name="userId" placeholder="작성자" required="required">
      </p>
    </div>
    
    <div>
      <textarea rows="20" cols="120" name="board_content" placeholder="내용 입력" 
      required="required"></textarea>
    </div>
    <div>
      <input type="submit" value="등록"> 
    </div>
  </form>
</body>
</html>