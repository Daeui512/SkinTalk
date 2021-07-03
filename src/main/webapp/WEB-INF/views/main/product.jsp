<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

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
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="../resources/script/jquery.cookie.js"></script>
        
</head>

<body>

  <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="index">SkinTalk</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <!-- Search-->
                
                <form action="../main/product" method="get">
                  <div class="card-body">
                      <div class="input-group">
                          <input name="keyword" class="form-control" type="text" placeholder="Search" />
                          <span class="inpug-group-append"><button class="btn btn-secondary" type="submit">Go!</button></span>
                          <span class="search_output"></span>
                      </div>
                  </div>
                  
                </form>
                
                
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
                        <li class="nav-item"><a class="nav-link" href="../main/rank">랭킹</a></li>
                    </ul>
                </div>
            </div>
        </nav>

  <!-- Page Content -->
  <div class="container">
    <div class="row">
      <div class="col-lg-3">
        <h1 class="my-4">SkinTalk</h1>
        <div class="list-group">
          <a href="product?type=1" class="list-group-item">스킨케어</a>
          <a href="product?type=2" class="list-group-item">메이크업</a>
          <a href="product?type=3" class="list-group-item">바디케어</a>
          <a href="../main/rank?page=1" class="list-group-item">랭킹</a>
        </div>
      </div>
      <!-- /.col-lg-3 -->
      <div class="col-lg-9">
        <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
          <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
          </ol>
          <div class="carousel-inner" role="listbox">
            <div class="carousel-item active">
              <img class="d-block img-fluid" src="https://blog.kakaocdn.net/dn/caDM2D/btqHTZMeRfR/8tUOKUiXyGoe7BLfImHTR1/img.png" alt="First slide" style="width : 900px; height : 350px;">
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="https://joahye.com/wp-content/uploads/2020/11/Thermus-01-2000x952-min-1024x487.jpg" alt="Second slide" style="width : 900px; height : 350px;">
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="https://i.pinimg.com/originals/25/e3/b6/25e3b6b929a0b18e02860f05b18e59d0.jpg" alt="Third slide" style="width : 900px; height : 350px;">
            </div>
          </div>
          <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div>

        <div class="row">
        
          <c:forEach var="productList" items="${productList }" >
          
          <div class="col-lg-4 col-md-6 mb-4">
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
              <div class="card-footer">
                <c:if test="${productList.grade eq 0 }">
              	상품평없음
              </c:if>
              <c:if test="${0 lt productList.grade and productList.grade lt 1}">
                <small class="text-muted">
                &#9734; &#9734; &#9734; &#9734; &#9734;
                </small>
              </c:if>
              <c:if test="${1 le productList.grade and productList.grade lt 2}">
                <small class="text-muted">
                &#9733; &#9734; &#9734; &#9734; &#9734;
                </small>
              </c:if>
              <c:if test="${2 le productList.grade and productList.grade lt 3}">
                <small class="text-muted">
                &#9733; &#9733; &#9734; &#9734; &#9734;
                </small>
              </c:if>
              <c:if test="${3 le productList.grade and productList.grade lt 4}">
                <small class="text-muted">
                &#9733; &#9733; &#9733; &#9734; &#9734;
                </small>
              </c:if>
              <c:if test="${4 le productList.grade and productList.grade lt 5}">
                <small class="text-muted">
                &#9733; &#9733; &#9733; &#9733; &#9734;
                </small>
              </c:if>
              <c:if test="${productList.grade eq 5}">
                <small class="text-muted">
                &#9733; &#9733; &#9733; &#9733; &#9733;
                </small>
              </c:if>
              </div>
            </div>
          </div>
          
          </c:forEach>
        </div>
        <!-- /.row -->

      </div>
      <!-- /.col-lg-9 -->

    </div>
    <!-- /.row -->
  <!-- Pagination-->
  <ul class="pagination justify-content-center">
  
      <c:if test="${pageMaker.hasPrev }">
        <li class="page-item">
            <c:if test="${not empty keyword }">
              <a class="page-link" href="product?page=${pageMaker.startPageNo - 1 }&keyword=${keyword }" aria-label="Previous">
                  <span aria-hidden="true">«</span>
                  <span class="sr-only">Previous</span>
              </a>
            </c:if>
            <c:if test="${empty keyword }">
              <a class="page-link" href="product?page=${pageMaker.startPageNo - 1 }&type=${param.type}" aria-label="Previous">
                  <span aria-hidden="true">«</span>
                  <span class="sr-only">Previous</span>
              </a>
            </c:if>
        </li>
      </c:if>
      
      <c:if test="${not empty param.keyword }">
        <c:forEach begin="${pageMaker.startPageNo }" end="${pageMaker.endPageNo }" var="num">
          <li class="page-item"><a class="page-link" href="product?page=${num }&keyword=${param.keyword }">${num }</a></li>
        </c:forEach>
      </c:if>
      <c:if test="${empty param.keyword }">
        <c:forEach begin="${pageMaker.startPageNo }" end="${pageMaker.endPageNo }" var="num">
          <li class="page-item"><a class="page-link" href="product?page=${num }&type=${param.type}">${num }</a></li>
        </c:forEach>
      </c:if>
      
      <c:if test="${pageMaker.hasNext }">
        <li class="page-item">
            <c:if test="${not empty keyword }">
              <a class="page-link" href="product?page=${pageMaker.endPageNo + 1 }&keyword=${keyword }" aria-label="Next">
                  <span aria-hidden="true">»</span>
                  <span class="sr-only">Next</span>
              </a>
            </c:if>
            
            <c:if test="${empty keyword }">
              <a class="page-link" href="product?page=${pageMaker.endPageNo + 1 }&type=${param.type}" aria-label="Previous">
                  <span aria-hidden="true">»</span>
                  <span class="sr-only">Previous</span>
              </a>
            </c:if>
        </li>
      </c:if>
      
  </ul>
  </div>
  <!-- /.container -->
  

  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Your Website 2019</p>
    </div>
    <!-- /.container -->
  </footer>
  
</body>
</html>