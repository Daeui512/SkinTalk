<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
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
/*   text-align: center;  */
  padding-top: 10px;
}
</style>

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
<div class="container">
    <br>
    <p class="text-center">
      SkinTalk
    </p>
    <hr>
    
    <div >
      <article class="card-body mx-auto" style="max-width: 400px;">
        <h4 class="card-title mt-3 text-center">회원가입 정보</h4>
          <!-- 아이디 -->
          <div class="form-group input-group">
            <div class="input-group-prepend">
              <span class="input-group-text" style="width:100px;"> <i class="fa fa-user"></i>
              아이디
              </span>
			<h5>${vo.userId}</h5>
            </div>
          </div>
            
          <!-- 이름 -->
          <div class="form-group input-group">
            <div class="input-group-prepend">
              <span class="input-group-text" style="width:100px;"> <i class="fa fa-user"></i>
              이름
              </span>
            <h5>${vo.userName}</h5>
            </div>
          </div>
          
          <!-- 닉네임 -->
          <div class="form-group input-group">
            <div class="input-group-prepend">
              <span class="input-group-text" style="width:100px;"> <i class="fa fa-user"></i>
              닉네임
              </span>
            </div>
            <h5>${vo.nickName}</h5>
          </div>
          
          <!-- 성별 -->
          <div class="form-group input-group">
            <div class="input-group-prepend">
              <span class="input-group-text" style="width:100px;"> <i class="fa fa-user"></i>
              성별
              </span>
            <h5>${vo.gender}</h5>
            </div>
          </div>
          
          <!-- 나이 -->
          <div class="form-group input-group">
            <div class="input-group-prepend">
              <span class="input-group-text" style="width:100px;"> <i class="fa fa-user"></i>
              나이
              </span>
            <h5>${vo.age}</h5>
            </div>
          </div>
          
          <!-- 피부타입 -->
          <div class="form-group input-group">
            <div class="input-group-prepend">
              <span class="input-group-text" style="width:100px;"> <i class="fa fa-user"></i>
              피부타입
              </span>
            <h5>${vo.skinType}</h5>
            </div>
          </div>
          
          <!-- 피부문제 -->
          <div class="form-group input-group">
            <div class="input-group-prepend">
              <span class="input-group-text" style="width:100px;"> <i class="fa fa-user"></i>
              피부문제
              </span>
              <h5>${vo.skinTrouble}</h5>
            </div>
          </div>
          
          <!-- 이메일 -->
          <div class="form-group input-group">
            <div class="input-group-prepend">
              <span class="input-group-text" style="width:100px;"> <i class="fa fa-envelope"></i>
              이메일
              </span>
			<h5>${vo.email}</h5>
            </div>
          </div>
          
          <!-- 전화번호 -->
          <div class="form-group input-group">
            <div class="input-group-prepend">
              <span class="input-group-text" style="width:100px;"> <i class="fa fa-phone"></i>
              전화번호
              </span>
            <h5>${vo.phone}</h5>
            </div>
          </div>
          
          <!-- 주소 -->
          <div class="form-group input-group">
            <div class="input-group-prepend">
              <span class="input-group-text" style="width:100px;"> <i class="fa fa-address"></i>
              주소
              </span>
            <h5>${vo.address}</h5>
            </div>
          </div>
          
           
           <div style="padding-bottom: 20px">
            <a href="../member/update"><input type="button" value="정보 수정" class="form-control btn btn-primary"></a>
           </div>
           
           <div style="padding-bottom: 20px">
            <button id="btn_delete" class="form-control btn btn-primary">회원 탈퇴</button></a>
           </div>

           <div style="padding-bottom: 20px">
            <a href="../member/inquiry"><input type="button" value="결제정보 확인" class="form-control btn btn-primary"></a>
           </div>
          
          
          </div>
          <!-- form-group// -->
          <p class="text-center">
            Have an account? <a href="./login">Log In</a>
          </p>
          
        
      </article>
      
    </div>
    
    <!-- card.// -->

  </div>
  <!--container end.//-->

  <!-- MemberController -> updatePost() 에서 보낸 데이터 저장 -->
  <input id=updateAlert type="hidden" value="${update_result }">
  
  <h3 align="center">좋아요</h3><hr>
  <div class="row" style="padding-left : 400px; padding-right : 400px">
        
    <c:forEach var="productList" items="${list }" >
    
    <div class="col-lg-4 col-md-6 mb-4" style="padding-bottom: 5px ; padding-left : 20px; padding-right : 20px;">
      <div class="card h-100">
        <a href="../product/product_detail?productNo=${productList.productNo }"><img class="card-img-top" src="${productList.imgSource }" width="700px" height="200px"></a>
        <div class="card-body">
          <h4 class="card-title">
            <a href="../product/product_detail?productNo=${productList.productNo }">${productList.productName }</a>
          </h4>
          <h5>
            <fmt:formatNumber value="${productList.price}" pattern="#,###,###원" />
          </h5>
            <p><img id="imgsrc" src="../resources/img/h1.png" width="20"/> ${productList.good}</p>
          <p class="card-text">${productList.point }</p>
        </div>
      </div>
    </div>
    
    </c:forEach>
  </div>
  
  
  
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
      
      $('#btn_delete').click(function(){
        var deleteMsg = confirm("회원탈퇴를 하시겠습니까?");
        if (deleteMsg == true) {
          location.replace("/skintalk/member/delete");
        }
      }); // end of btn_delete
    });
  </script>
</body>
</html>
