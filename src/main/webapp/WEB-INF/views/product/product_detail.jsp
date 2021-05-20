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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
        <!-- Page Content-->
        <section class="py-5">
            <div class="container">
                <!-- Page Heading/Breadcrumbs-->
                <h1 class="mt-4 mb-3">
                    상품정보
                    <small>
                        by
                        <a href="../main/index">SkinTalk</a>
                    </small>
                </h1>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="../main/index">Home</a></li>
                    <li class="breadcrumb-item active">Blog Home 2</li>
                </ol>
                <div class="row">
                    <!-- Post Content Column-->
                    <div class="col-lg-8">
                        <!-- Preview Image-->
                        <img class="img-fluid rounded" src="https://via.placeholder.com/900x300" alt="..." />
                        <hr />
                        <!-- Post Content-->
                        <p class="lead"></p>
                        <blockquote class="blockquote">
                            <p>상품명 : ${vo.productName }</p>
                            <p>가격 : ${vo.price }원</p>
                            <p>효과 : ${vo.point }</p>
                            평점 : <span class="grade_output"></span>
                              <input type="hidden" id="review_grade" value="${vo.grade }">
                            <footer class="blockquote-footer">
                                <cite title="Source Title">${vo.productName }</cite>
                            </footer>
                        </blockquote>
                        <hr />
                         <!-- 장바구니 담기 -->
                        <form name="form2" action="../cart/insert" method="post">
                            <input type="hidden" name="productNo" value="${vo.productNo }">
                                <select name="amount">
                                    <c:forEach begin="1" end="10" var="i">
                                        <option value="${i}">${i}</option>
                                    </c:forEach>
                                </select>&nbsp;개 
                                <input type="submit" value="장바구니에 담기">
                        </form>
                        <!-- Comments Form -->
                        <div class="card my-4">
                            <h5 class="card-header">상품 후기</h5>
                            <div class="card-body">
									<div class="form-group">
                                    	<input type="hidden" id="reviewPno" value="${vo.productNo }">
                                    	<c:if test="${empty sessionScope.userId }">
                                    		<textarea class="form-control" rows="3" readonly>* 댓글은 로그인이 필요한 서비스입니다.</textarea>
                                    	</c:if>
                                    	<c:if test="${not empty sessionScope.userId }">
                                    		<div>
                                              <input type="text" id="review_nickName" value="${mVo.nickName }">
                                            </div>
											평점 <input type="radio" name="reviewGrade" id="reviewGrade5" value="5" checked="checked"> 5
      										<input type="radio" name="reviewGrade" id="reviewGrade4" value="4" > 4
											<input type="radio" name="reviewGrade" id="reviewGrade3" value="3" > 3
											<input type="radio" name="reviewGrade" id="reviewGrade2" value="2" > 2
											<input type="radio" name="reviewGrade" id="reviewGrade1" value="1" > 1
                                    		<textarea id="reviewContent" class="form-control" rows="3" placeholder="상품 후기를 남겨주세요."></textarea>
                                            <input type="hidden" id="reviewNickName" value="${mVo.nickName }">
                                    		<input type="hidden" id="reviewAge" value="${mVo.age }">
                                    		<input type="hidden" id="reviewGender" value="${mVo.gender }">
                                    		<input type="hidden" id="reviewSkinType" value="${mVo.skinType }">
                                    	</c:if>
                                    </div>
                                    	<c:if test="${not empty sessionScope.userId }">
                                   			<button id="btn_add" class="btn btn-primary" type="button">작성</button>
                                		</c:if>
                            </div>
                        </div>
                        <!-- Single Comment-->
                        <div class="media mb-4">
<!--                             <img class="d-flex mr-3 rounded-circle" src="https://via.placeholder.com/50x50" alt="..." /> -->
                            <div id="reviews" class="media-body">
                            </div>
                        </div>
                    </div> <!-- end of .col-lg-8 -->
                    <!-- Sidebar Widgets Column-->
                    <div class="col-md-4">
                        
                        <!-- Categories Widget-->
                        <div class="card mb-4">
                            <h5 class="card-header">Categories</h5>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <ul class="list-unstyled mb-0">
                                            <li><a href="#!">Web Design</a></li>
                                            <li><a href="#!">HTML</a></li>
                                            <li><a href="#!">Freebies</a></li>
                                        </ul>
                                    </div>
                                    <div class="col-lg-6">
                                        <ul class="list-unstyled mb-0">
                                            <li><a href="#!">JavaScript</a></li>
                                            <li><a href="#!">CSS</a></li>
                                            <li><a href="#!">Tutorials</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Side Widget-->
                        <div class="card">
                            <h5 class="card-header">Side Widget</h5>
                            <div class="card-body">You can put anything you want inside of these side widgets. They are easy to use, and feature the new Bootstrap 4 card containers!</div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; SkinTalk 2021</p></div>
        </footer>
        
        <script type="text/javascript">
        	$(document).ready(function(){
        		var reviewPno = $('#reviewPno').val();  // 상품 번호 값
        		getAllReviews();
        		
                // 상품평 입력 기능
                $('#btn_add').click(function(){
                   var reviewContent = $('#reviewContent').val(); // 상품평 내용
                   var reviewNickName = $('#reviewNickName').val(); // 사용자 아이디
                   var reviewGrade = $('[name="reviewGrade"]:checked').val(); // 평점
                   var reviewAge = $('#reviewAge').val(); // 사용자 나이
                   var reviewGender = $('#reviewGender').val(); // 사용자 성별
                   var reviewSkinType = $('#reviewSkinType').val(); // 사용자 성별
                   console.log('reviewGrade : ' + reviewGrade);
                   var obj = {
                         'reviewPno' : reviewPno,
                         'reviewContent' : reviewContent,
                         'reviewNickName' : reviewNickName,
                         'reviewGrade' : reviewGrade,
                         'reviewAge' : reviewAge,
                         'reviewGender' : reviewGender,
                         'reviewSkinType' : reviewSkinType
                   };
                   console.log(obj);
                   var JSONObj = JSON.stringify(obj);
                   console.log('JSONObj : ' + JSONObj)
                   
                   // $.ajax로 송신
                   $.ajax({
                      type : 'post',
                      url : '../reviews',
                      headers : {
                         'Content-Type' : 'application/json',
                         'X-HTTP-Method-Override' : 'POST'
                      },
                      data : JSONObj,
                      success : function(result, status){
                         console.log('result : ' + result);
                         console.log('status : ' + status);
                         if(result == 1) {
                            alert('상품평 입력 성공');
                            getAllReviews();
                            $('#reviewContent').val('');
                            $('#reviewNickName').val('');
                            $('#reviewGrade').val('');
                            $('#reviewAge').val('');
                            $('#reviewGender').val('');
                            $('#reviewSkinType').val('');
                         }
                      } //end success
                   }); // end ajax()
                }); // end btn_add.click()
                
             	// 상품페이지의 상품평 전체 가져오기
                function getAllReviews(){
                   var url =  '../reviews/all/' + reviewPno;
                   $.getJSON(
                         url,
                         function(jsonData){
                            console.log(jsonData);
                            
                            var reviewNickName = $('#review_nickName').val();
                            var list = ''; // JSON 데이터를 표현할 변수
							console.log(reviewNickName);
                            $(jsonData).each(function(){
                                // this : 컬렉션에서 각 데이터를 꺼내서 저장
                                    console.log(this);
                                    var reviewCdate = new Date(this.reviewCdate);
                                    
                                    var disabled = 'disabled';
        							var readonly = 'readonly';
        								console.log('reviewNickName' + reviewNickName);
        								console.log('this.reviewNickName' + this.reviewNickName);
        								
        								if (reviewNickName == this.reviewNickName) {
											disabled = '';
											readonly = '';
										}
        							
                                        list += '<div class="review_item">'
                                          + '<pre>'
                                          + '<input type="hidden" id="reviewNo" value="' + this.reviewNo + '" />'
                                          + '<input type="hidden" id="reviewNickName" value="' + this.reviewNickName + '" />'
                                          + '<input type="hidden" id="reviewGrade" value="' + this.reviewGrade + '" />'
                                          + '<input type="hidden" id="reviewAge" value="' + this.reviewAge + '" />'
                                          + '<input type="hidden" id="reviewGender" value="' + this.reviewGender + '" />'
                                          + '<input type="hidden" id="reviewSkinType" value="' + this.reviewSkinType + '" />'
										  + '<img class="d-flex mr-3 rounded-circle" src="https://via.placeholder.com/50x50" alt="..." />'
										  + '<h5 class="mt-0">닉네임: '+ this.reviewNickName + '&nbsp;&nbsp;' + '평점: ' + this.reviewGrade + '&nbsp;&nbsp;' + '나이: ' + this.reviewAge + '&nbsp;&nbsp;' + '성별: ' + this.reviewGender + '&nbsp;&nbsp;' + '피부타입: ' + this.reviewSkinType  +'</h5>'
										  + '<input type="text" id="reviewSingleContent' + this.reviewNo + '" value="' + this.reviewContent + '" '+ readonly +'/>'
                                          + '&nbsp;&nbsp;'
                                          + reviewCdate
                                          + '&nbsp;&nbsp;'
                                          + '<button class="btn_update" type="button" '+ disabled +'>수정</button>'
                                          + '<button class="btn_delete" type="button" '+ disabled +'>삭제</button>'
                                          + "</pre>"
                                          + "</div>";
                            }); // end each()
                            $('#reviews').html(list);
                            var reviewGrade = $('#review_grade').val();
                            $('.grade_output').html('<p>' + reviewGrade + '</p>');
                         } // end callback()
                         ); // end getJSON()
                } //end getAllReviews()
                
             // 수정 버튼을 클릭하면 선택된 상품평 수정
        		$('#reviews').on('click', '.review_item .btn_update', function() {
        			console.log(this);
        			
        			// 선택된 상품평 reviewNo, reviewSingleContent, reviewContent 값을 저장
        			var reviewNo = $(this).prevAll('#reviewNo').val();
        	        var reviewSingleContent = $('#reviewSingleContent' + reviewNo).val(); // 상품평 내용
                    var reviewNickName = $('#reviewNickName').val(); // 사용자 아이디
        			console.log("선택된 상품평 번호 : " + reviewNo + ", 상품평 내용 : " + reviewSingleContent
        					+ ", 사용자 닉네임 : " + reviewNickName);
        			
        			// ajax 요청
        			$.ajax({
        				type : 'put',
        				url : '../reviews/' + reviewNo,
        				headers : {
        					'Content-Type' : 'application/json',
        					'X-HTTP-Method-Override' : 'PUT'
        				},
        				data : JSON.stringify({
                            'reviewPno' : reviewPno,
                            'reviewContent' : reviewSingleContent,
                            'reviewNickName' : reviewNickName,
        				}),
        				success : function(result) {
        					if (result == 'success') {
        						alert('상품평 수정 성공');
        						getAllReviews();
        					}
        				} // end callback()
        			}); // end ajax()
        		}); // end btn_update()
        		
        		// 삭제 버튼을 클릭하면 선택된 상품평 삭제
        		$('#reviews').on('click', '.review_item .btn_delete',
        				function(){
        			console.log(this);
        			
        			// 선택된 상품평 reviewNo
        			var reviewNo = $(this).prevAll('#reviewNo').val();
        			console.log("선택된 상품평 번호 : " + reviewNo);
        			
        			// ajax 요청
        			$.ajax({
        				type : 'delete',
        				url : '../reviews/' + reviewNo,
        				headers : {
        					'Content-Type' : 'application/json',
        					'X-HTTP-Method-Override' : 'DELETE'
        				},
        				data : JSON.stringify({
        					'reviewPno' : reviewPno
        				}),
        				success : function(result) {
        					if (result == 'success') {
        						alert('상품평 삭제 성공');
        						getAllReviews();
        					}
        				} // end of callback()
        			}); // end of ajax()
        		}); // end btn_delete()
                
        	}); // end of document
        </script>
        
    </body>
</html>
