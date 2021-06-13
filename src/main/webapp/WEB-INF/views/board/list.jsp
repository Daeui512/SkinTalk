<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>


<style>
body {
    margin-top: 2%
}
#accordion .panel-title a {
    background: #ffb900 none repeat scroll 0 0;
    border: 1px solid transparent;
    border-radius: 30px;
    color: #fff;
    display: block;
    font-size: 12px;
    font-weight: 600;
    padding: 12px 20px 12px 50px;
    position: relative;
    transition: all 0.3s ease 0s;
}

</style>
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

<title>FAQ 고객센터</title>
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
        
        <!-- 자주묻는질문 -->
         <body>
        <div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="section-title text-center wow zoomIn">
						<h1>자주하는 질문</h1>
						<span></span>
						<p>자주하는 질문을 통하여 빠르게 도움을 받아보세요</p>
					</div>
				</div>
			</div>
			<div class="row">				
				<div class="col-md-12">
					<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
						<div class="panel panel-default">
							<div class="panel-heading" role="tab" id="headingOne">
								<h4 class="panel-title">
									<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
										Q. 아이디와 비밀번호(Password)를 변경할 수 있나요?
									</a>
								</h4>
							</div>
							<div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
								<div class="panel-body">
									<p> ID 변경을 위해서는 탈퇴 후 재가입을 하셔야 합니다. <br> 회원탈퇴 시에는 보유하고 있는 마일리지 적립금는 자동으로 소멸되며, 주문한 내역이 자동 삭제되어 구입한 제품의 정보 확인, A/S등 모든 처리가 불가하게 됩니다.<br>
										비밀번호 변경은 [마이페이지 → 개인정보수정]에서 새로운 비밀번호를 입력하여 변경하실 수 있습니다. <br> 확인이 어려운 경우 고객센터(1600-0000)로 연락주세요. </p>
								</div>
							</div>
						</div>
						<div class="panel panel-default">
							<div class="panel-heading" role="tab" id="headingTwo">
								<h4 class="panel-title">
									<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
										Q. 배송비 기준이 어떻게 되나요?
									</a>
								</h4>
							</div>
							<div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
								<div class="panel-body">
									<p> 기본 배송비는 2,500원이며, 3만원 이상 구매 시 무료 배송입니다. </p>
								</div>
							</div>
						</div>
						<div class="panel panel-default">
							<div class="panel-heading" role="tab" id="headingThree">
								<h4 class="panel-title">
									<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
										Q. 주문 후 다른 결제방법으로 변경이 가능한가요? 
									</a>
								</h4>
							</div>
							<div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
								<div class="panel-body">
									<p> 불가능합니다. <br> 고객센터를 통한 결제가 불가하므로 기존 주문 취소 후 다시 주문하셔야 합니다. </p>
								</div>
							</div>
						</div>
						<div class="panel panel-default">
							<div class="panel-heading" role="tab" id="headingFour">
								<h4 class="panel-title">
									<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
										Q.상품 배송기간은 얼마나 걸리나요? 
									</a>
								</h4>
							</div>
							<div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour">
								<div class="panel-body">
									<p> 상품은 주문하신 날로부터 2~5일 이내(영업일 기준)에 받으실 수 있습니다.<br>
									다만, 공휴일, 연휴, 명절의 경우 택배사 사정으로 배송이 지연될 수 있으니 참고해주시기 바랍니다.<br>
									<br>
									배송기일내에 상품을 받지 못하신 경우는 고객센터(1600-0000)로 연락주시면 처리 도움드리겠습니다. </p>
								</div>
							</div>
						</div>
						<div class="panel panel-default">
							<div class="panel-heading" role="tab" id="headingFive">
								<h4 class="panel-title">
									<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
										Q.파손된 상품을 받았습니다 어떻게 해야하나요? 
									</a>
								</h4>
							</div>
							<div id="collapseFive" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFive">
								<div class="panel-body">
									<p>파손의 경우 포장 또는 운송도중 발생이 대부분이며, 고객센터(1666-2096)에 전화 주시거나 1:1 게시판에 문의해주시면 빠른 처리 도와드리도록 하겠습니다. </p>
								</div>
							</div>
						</div>
					</div>
				</div><!--- END COL -->		
			</div><!--- END ROW -->			
		</div>
    </body>
        
        
        <!-- ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ -->
        <div class="container">
	<div class="row">
        <div class="col-md-3">
            <form action="#" method="get">
                <div class="input-group">
                    <!-- USE TWITTER TYPEAHEAD JSON WITH API TO SEARCH -->
                    <input class="form-control" id="system-search" name="q" placeholder="Search for" required>
                    <span class="input-group-btn">
                        <button type="submit" class="btn btn-default"><i class="glyphicon glyphicon-search"></i></button>
                    </span>
                    <a href="#menu" id="toggle"><span></span></a>
                </div>
            </form>
        </div>
        
		<div class="col-md-9">
    	 <table class="table table-list-search">
                    <thead>
                        <tr>
                            <th>NO</th>
                            <th>TITLE</th>
                            <th>USER</th>
                            <th>DATE</th>
                        </tr>
                    </thead>
                    <tbody>
      <c:forEach var="vo" items="${list }">
        <tr>
          <td>${vo.boardNo }</td>
          <td><a href="detail?boardNo=${vo.boardNo}&page=${pageMaker.criteria.page }">${vo.boardTitle }</a></td>
          <td>${vo.userId }</td>
          <fmt:formatDate value="${vo.boardCdate }" pattern="yy년mm월dd일 HH시mm분"
            var ="boardCdate"/>
          <td>${boardCdate }</td>
        </tr>
      </c:forEach>
                </table>   
		</div>
	</div>
</div>
            <a href="register"><input type="button" value="글쓰기"></a>
       
                      <div class="panel-footer">
                  <div class="col col-xs-8">
                    <ul class="pagination hidden-xs pull-right">
                      <c:if test="${pageMaker.hasPrev }">
                            <li><a href="list?page=${pageMaker.startPageNo - 1 }">«</a></li>
                            </c:if>
  					 <c:forEach begin="${pageMaker.startPageNo }"
    				  end="${pageMaker.endPageNo }" var="num">
     				 <li><a href="list?page=${num }">${num }</a></li>
    				</c:forEach>
    				 <c:if test="${pageMaker.hasNext }">
     				 <li><a href="list?page=${pageMaker.endPageNo + 1 }">»</a></li>
   					 </c:if>
                    </ul>


 
  <!-- BoardController -> registerPOST() 에서 보낸 데이터 저장 -->  
  <input id="insertAlert" type="hidden" value="${insert_result }">

  <script type="text/javascript">
  	$(document).ready(function(){
  		confirmInsertResult(); // 호출
  		function confirmInsertResult(){
  			var result = $('#insertAlert').val();
  			if(result=='success'){
  				alert('글 등록 완료');
  			}else if(result=='fail'){
  				alert('등록 실패 다시한번 실행해주세요');
  			}
  		}
  	}); // end document
  </script>
</body>
</html>