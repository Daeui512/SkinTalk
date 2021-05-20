<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Page header-->
        <header>
            <div class="carousel slide" id="carouselExampleIndicators" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li class="active" data-target="#carouselExampleIndicators" data-slide-to="0"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img class="d-block w-100" src="https://via.placeholder.com/1900x600" alt="..." />
                        <div class="carousel-caption d-none d-md-block">
                            <h3>First Slide</h3>
                            <p>This is a description for the first slide.</p>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="https://via.placeholder.com/1900x600" alt="..." />
                        <div class="carousel-caption d-none d-md-block">
                            <h3>Second Slide</h3>
                            <p>This is a description for the second slide.</p>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="https://via.placeholder.com/1900x600" alt="..." />
                        <div class="carousel-caption d-none d-md-block">
                            <h3>Third Slide</h3>
                            <p>This is a description for the third slide.</p>
                        </div>
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
        </header>
        <!-- Page Content-->
        <section class="py-5">
            <div class="container">
                <h1 class="mb-4">카테고리</h1>
                <!-- Marketing Icons Section-->
                <div class="row">
                    <div class="col-lg-4 mb-4 mb-lg-0">
                        <div class="card h-100">
                            <h4 class="card-header">스킨케어</h4>
                            <div class="card-body"><p class="card-text">스킨케어 카테고리</p></div>
                            <div class="card-footer"><a class="btn btn-primary" href="product">더 보기</a></div>
                        </div>
                    </div>
                    <div class="col-lg-4 mb-4 mb-lg-0">
                        <div class="card h-100">
                            <h4 class="card-header">메이크업</h4>
                            <div class="card-body"><p class="card-text">메이크업 카테고리</p></div>
                            <div class="card-footer"><a class="btn btn-primary" href="#!">더 보기</a></div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="card h-100">
                            <h4 class="card-header">바디케어</h4>
                            <div class="card-body"><p class="card-text">바디케어 카테고리</p></div>
                            <div class="card-footer"><a class="btn btn-primary" href="#!">더 보기</a></div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <hr class="my-0" />
        
        <!-- Product Recommand Section-->
        <section class="py-5 bg-light">
            <div class="container">
                <h2 class="mb-4">상품추천정보</h2>
                <div class="row">
                
                    <c:forEach var="productList" items="${productList }" end="5">
                        <div class="col-lg-4 col-sm-6 mb-4">
                            <div class="card h-100">
                                <a href="#!"><img class="card-img-top" src="https://via.placeholder.com/700x400" alt="..." /></a>
                                <div class="card-body">
                                    <h4 class="card-title"><a href="../product/product_detail?productNo=${productList.productNo }">${productList.productName }</a></h4>
                                    <p class="card-text">${productList.point }</p>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </section>
        
        <hr class="my-0" />
       
        <!-- Call to Action-->
        <aside class="py-5 bg-light">
            <div class="container">
                <div class="row">
                    <div class="col-md-8"><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestias, expedita, saepe, vero rerum deleniti beatae veniam harum neque nemo praesentium cum alias asperiores commodi.</p></div>
                    <div class="col-md-4"><a class="btn btn-lg btn-secondary btn-block" href="#!">Call to Action</a></div>
                </div>
            </div>
        </aside>
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Skintalk 2021</p></div>
        </footer>
        
        <script type="text/javascript">
        $(document).ready(()=>{
        	$('.form-control').keyup(()=>{
        		var keyword = $('.form-control').val();
        		$.ajax({
        			type : 'get',
        			url : '../main/search-autocomplete',
        			data : {
        				'keyword' : keyword
        			},
        			success : (result)=>{
//         				list = '<div class="atcmp_container"><ul class="keyword_list">';

//         				for (var i = 0; i < result.length; i++) {
//         					list += '<li class="item">'
//         						+ '<a href="#" class="kwd">'
//         						+ '<span>' + result[i] + '</span></a></li></ul></div>';
// 						}
//         				$('.search_output').html(list);
						list_1 ='';
						list_1 += '<div class="collapse navbar-collapse" id="navbarResponsive">'
				            + '<ul class="navbar-nav ml-auto">'
		                    + '<div class="dropdown-menu dropdown-menu-right show" aria-labelledby="navbarDropdownPortfolio" >';
	                    for (var i = 0; i < result.length; i++) {
		                     list_1 += '<a class="dropdown-item" href="portfolio-1-col.html">' + result[i] + '</a>';
						}
		                list_1 += '</div>'
	                		+ '</li>'
		            		+ '</ul>'
		        			+ '</div>';
		        		$('.search_output').html(list_1);
        			}// end of success
        		});// end of ajax
        	});// end of search(form-cotrol.keyup)
        });// end of document.ready
        
        </script>
        
        
    </body>
</html>
