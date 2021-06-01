<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>SkinTalk</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../resources/design/styles.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>SkinTalk 장바구니</title>
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
                    <c:if test="${not empty sessionScope.userId }">
                    <li class="nav-item"><a class="nav-link" href="../member/member-detail">마이페이지</a></li>
                    </c:if>
                    <!-- 비회원용 장바구니로 이동 -->
                    <c:if test="${empty sessionScope.userId }">
                      <li class="nav-item"><a class="nav-link" href="nonMemberCartList">장바구니</a></li> 
                    </c:if>
                    <!-- 회원용 장바구니로 이동 -->
                    <c:if test="${not empty sessionScope.userId }">
                      <li class="nav-item"><a class="nav-link" href="cartList">장바구니</a></li>
                    </c:if>
                    
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

  
    <h2>장바구니</h2>
    <!-- 로그인해서 세션이 존재할 때 실행되는 코드 -->
       <c:choose>
      <c:when test="${cartCount == 0}">
          장바구니가 비었습니다.
      </c:when>

      <c:otherwise>
        <form action="../cart/cartList" method="post">
          <table border="1" width="100%">
            <tr>
              <th>상품명</th>
              <th>단가</th>
              <th>수량</th>
              <th>금액</th>
              <th>&nbsp;</th>
            </tr>
            <c:forEach var="cartList" items="${cartList }">
              <tr align="center" class="cart_item">
                <td>
                  ${cartList.productName}
                </td>
  
                <td>
                    <fmt:formatNumber value="${cartList.price}" pattern="#,###,###" />
                </td>
  
                <td class="amount_valuable">
                    <input type="hidden" id="cart_userId" value="${cartList.userId }">
                    <input type="hidden" id="cart_amount" value="${cartList.amount }">
                    <input type="hidden" id="cart_cartNo" value="${cartList.cartNo }">
                    <c:choose>
                      <c:when test="${cartList.amount <= 1}">
                        <button type="button" class="btnDecrease" disabled="disabled">-</button>
                      </c:when>
                      <c:otherwise>
                        <button type="button" class="btnDecrease">-</button>
                      </c:otherwise>
                    </c:choose>
                    <input type="text" id="amount" class="amount" name="amount" style="width: 30px; text-align: right" value="${cartList.amount }">
                    <button type="button" class="btnIncrease">+</button>
                </td>
                
                <td>
                    <fmt:formatNumber value="${cartList.money}" pattern="#,###,###" />
                </td>
                
                <td class="delete_btn">
                  <input type="hidden" id="cart_cartNo" value="${cartList.cartNo }">
                  <button type="button" id="btnDelete">x</button>
                </td>
              </tr>
            </c:forEach>
            <tr>
              <td colspan="5" align="right">장바구니 금액 합계 : <fmt:formatNumber value="${sumMoney}" pattern="#,###,###" /><br>
                배송료 : <input type="text" style="border: none;" ><br> 
                총합계 : <fmt:formatNumber value="" pattern="#,###,###" />
              </td>
            </tr>
                 
          </table>
          <input type="submit" value="결제하기">
        </form>
      </c:otherwise>
    </c:choose>
    
    <button type="button" id="btnDeleteAll">장바구니 비우기</button><br>
    <a href="../main/product"><button type="button" id="btnList">상품목록</button></a>
  
  <script type="text/javascript">
  $(document).ready(()=>{
    $('.cart_item').on('click', '.amount_valuable .btnIncrease', function(){
      console.log(this);
      var amount = $(this).prevAll('#cart_amount').val();
      var cartNo = $(this).prevAll('#cart_cartNo').val();
      var cart_this = this;
      $.ajax({
          url : '../cart/cartUpdateIncrease',
          type : 'GET',
          data : {
            'amount' : amount,
            'cartNo' : cartNo
          },
          success : function(result){
  			console.log(result);
  			if(result > 0){
  				$(cart_this).prevAll('#amount').val(result+'');
  				alert('장바구니 수량이 변경 되었습니다.');
  			}
  		}// end of success
        });// end of ajax
    });// end of btnIncrease
    
    $('.cart_item').on('click', '.amount_valuable .btnDecrease', function(){
      console.log(this);
      var amount = $(this).prevAll('#cart_amount').val();
      var cartNo = $(this).prevAll('#cart_cartNo').val();
      var cart_this = this;
      $.ajax({
          url : '../cart/cartUpdateDecrease',
          type : 'GET',
          data : {
            'amount' : amount,
            'cartNo' : cartNo
          },
          success : function(result){
  			console.log(result);
  			if(result > 0){
  				$(cart_this).nextAll('#amount').val(result + '');
  				alert('장바구니 수량이 변경 되었습니다.');
  			}
  		}// end of success
        });// end of ajax
    });// end of btnDecrease

    $('.cart_item').on('blur', '#amount', function(){
    	console.log(this);
    	var cartNo = $(this).prevAll('#cart_cartNo').val();
    	var amount = $(this).val();
    	var cart_this = this;
    	$.ajax({
    		url : '../cart/cartUpdate',
    		type : 'POST',
    		data : {
    			'cartNo' : cartNo,
    			'amount' : amount
    		},
    		success : function(result){
    			console.log(result);
    			if(result > 0){
      				alert('장바구니 수량이 변경 되었습니다.');
      				$(cart_this).val(result+'');
    			}
    		}// end of success
    	});// end of ajax
    });// end of #amount.blur
    
    $('.cart_item').on('click', '.delete_btn #btnDelete', function(){
      var cartNo = $(this).prevAll('#cart_cartNo').val();
      $.ajax({
        url : '../cart/cartDeleteOne',
        type : 'GET',
        data : {
          'cartNo' : cartNo
        },
        success : function(result){
          if(result == 'success'){
            alert('상품이 삭제되었습니다.');
            location.reload();
          }
        }// end of success
      })//end of ajax
    });//end of onclick
    
    $('#btnDeleteAll').click(()=>{
      var userId = $('#cart_userId').val();
      console.log(userId);
      $.ajax({
        url : '../cart/cartDeleteAll',
        type : 'GET',
        data : {
          'userId' : userId
        },
        success : function(result){
          if(result == 'success'){
            alert('장바구니가 비었습니다.');
            location.reload();
          }
        }// end of success
      });// end of ajax
    });// end of click()
  });// end of document()
  </script>
 
</body>
</html>
