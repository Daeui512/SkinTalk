<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
<script type="text/javascript" src="../resources/script/jquery.cookie.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

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
  width: 200px;
  
}
</style>

<title>SkinTalk ????????????</title>
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
                      <li class="nav-item"><a class="nav-link" href="../member/login">?????????</a></li>
                    </c:if>
                    <c:if test="${not empty sessionScope.userId }">
                      <li class="nav-item"><a class="nav-link" href="../member/member-detail">???????????????</a></li>
                      <li class="nav-item"><a class="nav-link" href="../member/logout">????????????</a></li>
                    </c:if>
                    <li class="nav-item"><a class="nav-link" href="../cart/cartList">????????????</a></li>
                    <li class="nav-item"><a class="nav-link" href="../board/list">????????????</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <input type="hidden" id="cartLength" value= "${fn:length(cartList)}" />
    <input type="hidden" class="cart_counts" value="${cartCount }"/>
    <input type="hidden" id="sumMoney" value="${sumMoney }">
    <h2 style="text-align: center; padding-top: 16px">????????????</h2>
      <c:choose>
        <c:when test="${cartCount == 0}">
          <div class="container">
            <table class="table table-dark table-striped" border="1" width="100%">
              <tr>
                <th>?????????</th>
                <th>??????</th>
                <th>??????</th>
                <th>??????</th>
                <th>&nbsp;</th>
              </tr>
              <tr align="center" class="cart_item">
                <td>??????????????? ???????????????. ????????? ???????????????.</td>
              </tr>
            </table>
          </div>
        </c:when>

      <c:otherwise>
        <div class="container">
          <table class="table table-dark table-striped" border="1" width="100%">
            <tr>
              <th>?????????</th>
              <th>??????</th>
              <th>??????</th>
              <th>??????</th>
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
              <td colspan="5" align="right">???????????? ?????? ?????? : <fmt:formatNumber value="${sumMoney}" pattern="#,###,###" /></td>
            </tr>
                 
          </table>
          </div>
      </c:otherwise>
    </c:choose>
    
    <div style="text-align: center">
      <button type="button" id="btnDeleteAll" class="form-control btn btn-primary">???????????? ?????????</button>
      <a href="../main/product"><button type="button" id="btnList" class="form-control btn btn-primary">????????????</button></a>
      
      <c:if test="${not empty sessionScope.userId }">
      <button onclick="requestPay()" class="form-control btn btn-primary">??????</button>    
      </c:if>
      <c:if test="${empty sessionScope.userId }">
      <button onclick="requestNonMemberPay()" class="form-control btn btn-primary">???????????????</button>    
      </c:if>
    </div>
  
  <script type="text/javascript">
  $(document).ready(()=>{
    $('.cart_item').on('click', '.amount_valuable .btnIncrease', function(){
      console.log(this);
      var amount = $(this).prevAll('#cart_amount').val();
      var cartNo = $(this).prevAll('#cart_cartNo').val();
      var cart_this = this;
      $.ajax({
          url : '../carts/cartUpdateIncrease',
          type : 'PUT',
          data : JSON.stringify({
            'amount' : amount,
            'cartNo' : cartNo
          }),
          headers : {
              'Content-Type' : 'application/json',
              'X-HTTP-Method-Override' : 'PUT'
          },
          success : function(result){
  			console.log(result);
  			if(result > 0){
  				$(cart_this).prevAll('#amount').val(result+'');
  				alert('???????????? ????????? ?????? ???????????????.');
  				location.reload();
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
          url : '../carts/cartUpdateDecrease',
          type : 'PUT',
          data : JSON.stringify({
            'amount' : amount,
            'cartNo' : cartNo
          }),
          headers : {
              'Content-Type' : 'application/json',
              'X-HTTP-Method-Override' : 'PUT'
          },
          success : function(result){
  			console.log(result);
  			if(result > 0){
  				$(cart_this).nextAll('#amount').val(result + '');
  				alert('???????????? ????????? ?????? ???????????????.');
  				location.reload();
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
    		url : '../carts/cartUpdate',
    		type : 'PUT',
    		data : JSON.stringify({
    			'cartNo' : cartNo,
    			'amount' : amount
    		}),
    		headers : {
                'Content-Type' : 'application/json',
                'X-HTTP-Method-Override' : 'PUT'
             },
    		success : function(result){
    			console.log(result);
    			if(result > 0){
      				$(cart_this).val(result+'');
      				alert('???????????? ????????? ?????? ???????????????.');
      				location.reload();
    			}
    		}// end of success
    	});// end of ajax
    });// end of #amount.blur
    
    $('.cart_item').on('click', '.delete_btn #btnDelete', function(){
      var cartNo = $(this).prevAll('#cart_cartNo').val();
      $.ajax({
        url : '../carts/cartDeleteOne',
        type : 'DELETE',
        data : JSON.stringify({
          'cartNo' : cartNo
        }),
        headers : {
            'Content-Type' : 'application/json',
            'X-HTTP-Method-Override' : 'DELETE'
         },
        success : function(result){
          if(result == 'success'){
            alert('????????? ?????????????????????.');
            location.reload();
          }
        }// end of success
      })//end of ajax
    });//end of onclick
    
    $('#btnDeleteAll').click(()=>{
      var userId = $('#cart_userId').val();
      console.log(userId);
      $.ajax({
        url : '../carts/cartDeleteAll',
        type : 'DELETE',
        data : JSON.stringify({
          'userId' : userId
        }),
        headers : {
            'Content-Type' : 'application/json',
            'X-HTTP-Method-Override' : 'DELETE'
        },
        success : function(result){
          if(result == 'success'){
            alert('??????????????? ???????????????.');
            location.reload();
          }
        }// end of success
      });// end of ajax
    });// end of click()
  });// end of document()
  
  
  function getToday(){
      var date = new Date();
      var year = date.getFullYear();
      var month = ("0" + (1 + date.getMonth())).slice(-2);
      var day = ("0" + date.getDate()).slice(-2);

      return year + month + day;
  }
  
  // IMP.request_pay(param, callback) ??????
  function requestPay(){
	 var userId = '${userId}';
	 var sumMoney = $('#sumMoney').val();
	 var email = '${vo.email}';
	 var phone = '${vo.phone}';
	 merchant_uid = getToday() + '_' + new Date().getTime();
	 var cartLength = $('#cartLength').val();		  
	 console.log(userId);
	 console.log(sumMoney);
	 console.log(email);
	 console.log(phone);
	 
	  IMP.request_pay({
	        pg : 'html5_inicis', // ?????????
	        pay_method : 'card', // ????????????
	        merchant_uid : getToday() + '_' + new Date().getTime(), //????????????
	        name : '?????????: skintalk ????????????' ,
	        amount : sumMoney, //??????
	        buyer_email : '${vo.email}' ,
	        buyer_name : '${vo.userName}',
	        buyer_tel : '${vo.phone}',
	     }, function(rsp) {
	        if ( rsp.success ) {
	        	for(var i = 0; i < cartLength; i++){
	        	    (function(i) {
	        	    	var productNo = $('#cart_productNo'+i).val();
	        	    	var productName = $('#productName'+i).val();
	        	    	var amount = $('#amount'+i).val();
	        	    	var price = $('#price'+i).val();
	        	           $.ajax({
	        	               type: "post",
	        	               url: "../payment/result/"+i+ "/" +  cartLength, // ?????????????????? ??????
	        	               headers: { "Content-Type": "application/json","X-HTTP-Method-Override" : "POST"},
	        	               data: JSON.stringify({
	        	                  'paymentNo' : merchant_uid, //???????????????//
	        	                  'userId' : userId,//
	        	                  'productNo' : productNo,
	        	                  'price' : price,//
	        	                  'productName' : productName,
	        	                  'amount' : amount,
	        	                  'email' : email,//
	        	                  'phone' : phone,
	        	               }),
	        	               async: false,
	        	               success : function (result, status){
	        	                  console.log(result +','+ status);
	        	               }//end success
	        	            }); // end ajax
	        	    })(i);//end function(i)
	        	}//end for
    	            var msg = '????????? ?????????????????????.\n';
    	            msg += '${vo.userName}??? ?????? ???????????? ?????????\n';
    	            msg += '??????ID : ' + rsp.imp_uid;
    	            msg += '\n?????? ??????ID : ' + rsp.merchant_uid;
    	            msg += '\n?????? ?????? : ' + rsp.paid_amount;
    	            msg += '?????????';
    	            alert(msg);
	        		location.href='../member/inquiry'; 
    	            
    	            
    	            ///////////////////////////  ???????????? ??????   /////////////////////////////////
	        
	        
	        
	        } else {
	           var msg = '????????? ?????? ???????????????.';
	           msg += '???????????? : ' + rsp.error_msg;
	           msg += ' ${vo.userName}???';
	           alert(msg);
	        }
	     });//end function(rsp)
  }//end requestPay
  
    function requestNonMemberPay(){
 		 var userId = '${nonMemberUserId}';
		 console.log(userId);
	 
		 $.ajax({
         type : 'post',
         url : '../payment/nonMember/' + userId,
         headers : {
            'Content-Type' : 'application/json',
            'X-HTTP-Method-Override' : 'POST'
         }, 
         data : JSON.stringify({
            'userId' : userId
         }),
         success : function (result, status) {
        	 if(result == 1){
       		 var sumMoney = $('#sumMoney').val();
       		 var email = '${nonmembervo.email}';
       		 var phone = '${nonmembervo.phone}';
       		 merchant_uid = getToday() + '_' + new Date().getTime();
       		 var cartLength = $('#cartLength').val();		  
     			
     		 IMP.request_pay({
     		        pg : 'html5_inicis', // ?????????
     		        pay_method : 'card', // ????????????
     		        merchant_uid : getToday() + '_' + new Date().getTime(), //????????????
     		        name : '??????????????????: skintalk ????????????' ,
     		        amount : sumMoney, //??????
     		        buyer_email : '${nonmembervo.email}' ,
     		        buyer_name : '?????????',
     		        buyer_tel : '${nonmembervo.phone}',
     		     }, function(rsp) {
     		        if ( rsp.success ) {
     		        	for(var i = 0; i < cartLength; i++){
     		        	    (function(i) {
     		        	    	var productNo = $('#cart_productNo'+i).val();
     		        	    	var productName = $('#productName'+i).val();
     		        	    	var amount = $('#amount'+i).val();
     		        	    	var price = $('#price'+i).val();
     		        	    	console.log(productNo);
     		        	    	console.log(productName);
     		        	    	console.log(amount);
     		        	           $.ajax({
     		        	               type: "post",
     		        	               url: "../payment/result/"+i+"/"+cartLength, // ?????????????????? ??????
     		        	               headers: { "Content-Type": "application/json","X-HTTP-Method-Override" : "POST"},
     		        	               data: JSON.stringify({
     		        	                  'paymentNo' : merchant_uid, //???????????????//
     		        	                  'userId' : userId,//
     		        	                  'productNo' : productNo,
     		        	                  'price' : price,//
     		        	                  'productName' : productName,
     		        	                  'amount' : amount,
     		        	                  'email' : email,//
     		        	                  'phone' : phone,
     		        	               }),
     		        	               async: false,
     		        	               success : function (result, status){
     		        	                  console.log(result +','+ status);
     		        	               }//end success
     		        	            }); // end ajax
     		        	    })(i);//end function(i)
     		        	}//end for
         		            var msg = '????????? ?????????????????????.\n';
         		            msg += '???????????? ?????? ???????????? ?????????\n';
         		            msg += '??????ID : ' + rsp.imp_uid;
         		            msg += '\n?????? ??????ID : ' + rsp.merchant_uid;
         		            msg += '\n?????? ?????? : ' + rsp.paid_amount;
         		            msg += ' ????????????';
         		            alert(msg);
         		          
         		            //////////////////  ??????????????? ????????????   /////////////////// 
     		       
     		        } else {
						alert('????????? ?????? ???????????????.');
     		        }
     		     });//end function(rsp)
        	  }else{
        		  var count = $('.cart_counts').val();
        		  console.log(count);
        		  if(count == 0){
        			  alert('??????????????? ???????????????.');
        			  location.href="../main/index";
        		  } else {
        		  	  alert('????????? ????????? ?????? ????????????');
	        		  location.href="../member/nonmember-payment";
        		  }
        	  }
          }//end success
       }); // end ajax()
       }//end requestNonMemberPay
  
  </script>
 
</body>
</html>
