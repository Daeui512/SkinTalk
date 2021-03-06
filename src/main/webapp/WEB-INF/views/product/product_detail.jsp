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
        <!-- Page Content-->
        <section class="py-5">
            <div class="container">
                <!-- Page Heading/Breadcrumbs-->
                <h1 class="mt-4 mb-3">
                    ????????????
                    <small>
                        by
                        <a href="../main/index">SkinTalk</a>
                    </small>
                    
                </h1>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="../main/index">Home</a></li>
                    <li class="breadcrumb-item active">product</li>
                    
                </ol>
                <div class="row">
                    <!-- Post Content Column-->
                    <div class="col-lg-8">
                        <!-- Preview Image-->
                        <img class="img-fluid rounded" src="${vo.imgSource }" alt="..." width="900px" height="200px"/>
                        <hr />
                        <!-- Post Content-->
                        <p class="lead"></p>
                        <blockquote class="blockquote">
                            <p>????????? : ${vo.productName }</p>
                            <p>?????? : ${vo.price }???</p>
                            <p>?????? : ${vo.point }</p>
                            ?????? : <span class="grade_output"></span>
                            <small >????????? : ${vo.viewCount }</small>
                            
                            <div id="like">
                              <input type="hidden" id="productNo" value="${vo.productNo }">
                              <input type="hidden" id="userId" value="${sessionScope.userId }">
                              <button type="button" id="like_button" style="border: hidden; background-color: #ffffff"><img id="imgsrc" src="../resources/img/h2.png" width="20"/></button>
                            </div>
                            
                              <input type="hidden" id="review_grade" value="${vo.grade }">
                            <footer class="blockquote-footer">
                                <cite title="Source Title">${vo.productName }</cite>
                            </footer>
                        </blockquote>
                        <hr />
                         <!-- ???????????? ?????? -->
                        <form name="form2" action="../cart/insert" method="post">
                            <input type="hidden" name="productNo" value="${vo.productNo }">
                                <select name="amount">
                                    <c:forEach begin="1" end="10" var="i">
                                        <option value="${i}">${i}</option>
                                    </c:forEach>
                                </select>&nbsp;??? 
                                <input type="submit" value="??????????????? ??????">
                        </form>
                        <!-- Comments Form -->
                        <div class="card my-4">
                            <h5 class="card-header">?????? ??????</h5>
                            <div class="card-body">
									<div class="form-group">
                                    	<input type="hidden" id="reviewPno" value="${vo.productNo }">
                                    	<c:if test="${empty sessionScope.userId }">
                                    		<textarea class="form-control" rows="3" readonly>* ????????? ???????????? ????????? ??????????????????.</textarea>
                                    	</c:if>
                                    	<c:if test="${not empty sessionScope.userId }">
                                    		<div>
                                              <input type="text" id="review_nickName" value="${mVo.nickName }" readonly style="border: white;">
                                            </div>
											?????? <input type="radio" name="reviewGrade" id="reviewGrade5" value="5" checked="checked"> 5
      										<input type="radio" name="reviewGrade" id="reviewGrade4" value="4" > 4
											<input type="radio" name="reviewGrade" id="reviewGrade3" value="3" > 3
											<input type="radio" name="reviewGrade" id="reviewGrade2" value="2" > 2
											<input type="radio" name="reviewGrade" id="reviewGrade1" value="1" > 1
                                    		<textarea id="reviewContent" class="form-control" rows="3" placeholder="?????? ????????? ???????????????."></textarea>
                                            <input type="hidden" id="reviewNickName" value="${mVo.nickName }">
                                    		<input type="hidden" id="reviewAge" value="${mVo.age }">
                                    		<input type="hidden" id="reviewGender" value="${mVo.gender }">
                                    		<input type="hidden" id="reviewSkinType" value="${mVo.skinType }">
                                    	</c:if>
                                    </div>
                                    	<c:if test="${not empty sessionScope.userId }">
                                   			<button id="btn_add" class="btn btn-primary" type="button">??????</button>
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
                        <div class="card mb-4" style="size: 289.984*800.000">
                            <h5 class="card-header">Categories</h5>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <ul class="list-unstyled mb-0">
                                            <li><a href="../main/product?type=1">????????????</a></li>
                                            <li><a href="../main/product?type=2">????????????</a></li>
                                        </ul>
                                    </div>
                                    <div class="col-lg-6">
                                        <ul class="list-unstyled mb-0">
                                            <li><a href="../main/product?type=3">????????????</a></li>
                                            <li><a href="../main/rank">??????</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
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
  		var reviewPno = $('#reviewPno').val();  // ?????? ?????? ???
  		getAllReviews();
  		
  		var reviewGrade = $('#review_grade').val();
        $('.grade_output').html('<p>' + reviewGrade + '</p>');
        console.log('gradeoutput : ' + reviewGrade);

  		// ????????? ?????? ??????
          $('#btn_add').click(function(){
             var reviewContent = $('#reviewContent').val();
             var reviewNickName = $('#reviewNickName').val();
             var reviewGrade = $('[name="reviewGrade"]:checked').val();
             var reviewAge = $('#reviewAge').val();
             var reviewGender = $('#reviewGender').val();
             var reviewSkinType = $('#reviewSkinType').val();
             var obj = {
                   'reviewPno' : reviewPno,
                   'reviewContent' : reviewContent,
                   'reviewNickName' : reviewNickName,
                   'reviewGrade' : reviewGrade,
                   'reviewAge' : reviewAge,
                   'reviewGender' : reviewGender,
                   'reviewSkinType' : reviewSkinType
             };
             var JSONObj = JSON.stringify(obj);
             
             // $.ajax??? ??????
             $.ajax({
                type : 'post',
                url : '../reviews',
                headers : {
                   'Content-Type' : 'application/json',
                   'X-HTTP-Method-Override' : 'POST'
                },
                data : JSONObj,
                success : function(result, status){
                	console.log(result + ' , ' + status);
                	if(result >= 0) {
                        $('#reviewContent').val('');
                        $('#reviewGrade').val('');
                        var productGrade = result.toFixed(1);
                        console.log('productGrade : ' + productGrade);
                        $('.grade_output').html('<p>' + productGrade + '</p>');
                        alert('????????? ?????? ??????');
                        getAllReviews();
                     }
                } //end success
             }); // end ajax()
          }); // end btn_add.click()
          
       	// ?????????????????? ????????? ?????? ????????????
          function getAllReviews(){
             var url =  '../reviews/all/' + reviewPno;
             $.getJSON(
                    url,
                    function(jsonData){
                      
                    var reviewNickName = $('#review_nickName').val();
                    var list = ''; // JSON ???????????? ????????? ??????
                    $(jsonData).each(function(){
                        // this : ??????????????? ??? ???????????? ????????? ??????
                        var reviewCdate = new Date(this.reviewCdate);
                  	    
                    	var disabled = 'disabled';
					    var readonly = 'readonly';
				    	var disable = 'disabled';
				    	
					    if (reviewNickName == this.reviewNickName) {
				  			disabled = '';
				  			readonly = '';
					  	}
					    
					    if(reviewNickName != null){
					    	disable = '';
					    }
					    
							
                        list += '<div class="review_item' + this.reviewNo + '">'
                             + '<pre>'
                             + '<input type="hidden" id="reviewNo" value="' + this.reviewNo + '" />'
                             + '<input type="hidden" id="reviewNickName" value="' + this.reviewNickName + '" />'
                             + '<input type="hidden" id="reviewGrade" value="' + this.reviewGrade + '" />'
                             + '<input type="hidden" id="reviewAge" value="' + this.reviewAge + '" />'
                             + '<input type="hidden" id="reviewGender" value="' + this.reviewGender + '" />'
                             + '<input type="hidden" id="reviewSkinType" value="' + this.reviewSkinType + '" />'
				       + '<img class="d-flex mr-3 rounded-circle" src="https://via.placeholder.com/50x50" alt="..." />'
				       + '<h5 class="mt-0">?????????: '+ this.reviewNickName + '&nbsp;&nbsp;' + '??????: ' + this.reviewGrade + '&nbsp;&nbsp;' + '??????: ' + this.reviewAge + '&nbsp;&nbsp;' + '??????: ' + this.reviewGender + '&nbsp;&nbsp;' + '????????????: ' + this.reviewSkinType  +'</h5>'
		      		   + '<input type="text" id="reviewSingleContent' + this.reviewNo + '" value="' + this.reviewContent + '" '+ readonly +' style="border:hidden;"/>'
                             + '&nbsp;&nbsp;'
                             + reviewCdate
                             + '&nbsp;&nbsp;'
                             + '<button class="btn_update" type="button" ' + disabled + '>??????</button>'
                             + '<button class="btn_delete" type="button" ' + disabled + '>??????</button>'
                             + '<button class="reply_insert" type="button" ' + disable + '>??????</button>'
                             + '<div class="reply_answer"></div>'
                             + '<div class="reply_read"></div>'
                             + "</pre>"
                             + "</div>";
                             
                       var destination = '../rreviews/all/' + this.reviewNo;
                       
					 $.getJSON(
							 destination,
							 function(jsonData){
								 
								 var arr = '<br>';
								 $(jsonData).each(function(){
									 var rReviewCdate = new Date(this.rReviewCdate);
									 var userId = $('#userId').val();
									 
									 if (userId == this.userId) {
										  	disabled = '';
										  	readonly = '';
			  							  }
									 
									 arr += '<pre>'
									 	 + '<input type="hidden" id="rReviewNo" value="' + this.rReviewNo + '">'
									 	 + '<input type="text" id="rUserId" value="' + this.userId + '" readonly style="border:hidden;"/>'
									 	 + '<input type="text" id="rReviewContent" value="' + this.rReviewContent + '" ' + readonly + ' style="border:hidden;"/>'
                                         + '&nbsp;&nbsp;'
                                         + rReviewCdate
                                         + '&nbsp;&nbsp;'
                                         + '<button class="btn_review_update" type="button"' + disabled + '>??????</button>'
                                         + '<button class="btn_review_delete" type="button"' + disabled + '>??????</button>'
                                         + "</pre>";
								 $('#reviews > div.review_item' + this.rReviewRno + ' > pre > div.reply_read').html(arr);
								 })// end of each;
							 }// end of callback
							 )// end of getJSON
							 
                       }); // end each()
                       $('#reviews').html(list);
                       
                    } // end callback()
                ); // end getJSON()
          } //end getAllReviews()
          
       	// ?????? ????????? ???????????? ????????? ????????? ??????
  		$('#reviews').on('click', 'div[class^=review_item] .btn_update', function() {
  			
  			// ????????? ????????? reviewNo, reviewSingleContent, reviewContent ?????? ??????
  			var reviewNo = $(this).prevAll('#reviewNo').val();
  	        var reviewSingleContent = $('#reviewSingleContent' + reviewNo).val(); // ????????? ??????
            var reviewNickName = $('#reviewNickName').val(); // ????????? ?????????

              // ajax ??????
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
  				success : function(result,status) {
  					console.log(result + ' , ' + status);
  					if (result == 'success') {
  						alert('????????? ?????? ??????');
  						getAllReviews();
  					}
  				} // end callback()
  			}); // end ajax()
  		}); // end btn_update()
  		
  		// ?????? ????????? ???????????? ????????? ????????? ??????
  		$('#reviews').on('click', 'div[class^=review_item] .btn_delete', function(){
  			// ????????? ????????? reviewNo
  			var reviewNo = $(this).prevAll('#reviewNo').val();
  			// ajax ??????
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
  				success : function(result, status) {
  					console.log(result + ' , ' + status);
  					if (result >= 0) {
						var productGrade = result.toFixed(1);
// 						if (${rVo.reviewPno == null}) {
// 							productGrade = 0.0;
// 						}
                        console.log('productGrade : ' + productGrade);
                        $('.grade_output').html('<p>' + productGrade + '</p>');
						
                        alert('????????? ?????? ??????');
						getAllReviews();
  					}
  				} // end of callback()
  			}); // end of ajax()
  		}); // end btn_delete()
  		
  		var rReviewRno;
  		
  		$('#reviews').on('click', 'div[class^=review_item] .reply_insert', function(){
  			rReviewRno = $(this).prevAll('#reviewNo').val();
		var userId = $('#userId').val();
  			list = '';
  			list += '<br><textarea id="rReviewContent" class="form-control" rows="3" placeholder="?????? ??????."></textarea><br><button id="rReview_btn" class="btn btn-primary" type="button">??????</button>'
  				 + '<input type="hidden" id="rReviewUserId" value="' + userId + '">';

  			$(this).nextAll('.reply_answer').html(list).toggle();
  		});// end of reviews.onclick ????????? textarea ??????
  		
  		$('#reviews').on('click', 'div[class^=review_item] .reply_answer #rReview_btn', function(){
  			var rReviewContent = $(this).prevAll('#rReviewContent').val();
  			var userId = $(this).nextAll('#rReviewUserId').val();
  			console.log(rReviewRno + ',' + rReviewContent + ',' + userId);
  			$.ajax({
  				type : 'POST',
  				url : '../rreviews',
  				headers : {
  					'Content-Type' : 'application/json',
  					'X-HTTP-Method-Override' : 'POST'
  				},
  				data : JSON.stringify({
  					'userId' : userId, 
  					'rReviewRno' : rReviewRno,
  					'rReviewContent' : rReviewContent
  				}),
  				success : function(result, status){
  					console.log(result + ',' + status)
  					alert("????????? ?????? ??????");
  					$(this).prevAll('#rReviewContent').html('');
  					getAllReviews();
  				}
  			});// end of ajax
		});// end of ?????? ??????
		
		$('#reviews').on('click', 'div[class^=review_item] .reply_read .btn_review_update', function(){
			var rReviewNo = $(this).prevAll('#rReviewNo').val();
			var rReviewContent = $(this).prevAll('#rReviewContent').val();
			var userId= $('#userId').val();
			
			$.ajax({
				type : 'PUT',
				url : '../rreviews/' + rReviewNo,
				headers :{
					'Content-Type' : 'application/json',
  					'X-HTTP-Method-Override' : 'PUT'
				},
				data : JSON.stringify({
					'rReviewNo' : rReviewNo,
					'rReviewContent' : rReviewContent,
					'userId' : userId
				}),
				success : function(result, status){
					alert("????????? ?????? ??????");
					getAllReviews();
				}
				
			});// end of ajax
		})// end of update;
		
		$('#reviews').on('click', 'div[class^=review_item] .reply_read .btn_review_delete', function(){
			var rReviewNo = $(this).prevAll('#rReviewNo').val();
			$.ajax({
				type : 'DELETE',
				url : '../rreviews/' + rReviewNo,
				headers :{
					'Content-Type' : 'application/json',
  					'X-HTTP-Method-Override' : 'DELETE'
				},
				data : JSON.stringify({
					'rReviewNo' : rReviewNo
				}),
				success : function(result, status){
					console.log(result + ',' + status);
					alert("????????? ?????? ??????")
					getAllReviews();
				}
				
			});// end of ajax
		})// end of delete;
  	}); // end of document
  </script>
        
  <script type="text/javascript">
    // ?????????
  $(document).ready(function(){
           
      var userId = $("#userId").val();
      var productNo = $('#productNo').val();
      
      var like_obj = {
          'productNo' : productNo,
          'userId' : userId
      };
      
      var JSON_like = JSON.stringify(like_obj);
      
      $("body").on("click", "#like_button", function(event){
          $.ajax({
             type : 'POST',
             url : '../like/insert',
             headers : {
                'Content-Type' : 'application/json',
                'X-HTTP-Method-Override' : 'POST'
             },
             data : JSON_like,
             success : function (result, status) {
                   if (result == 1) {
                    $("#imgsrc").attr("src", "../resources/img/h1.png");
                   } else {
                    $("#imgsrc").attr("src", "../resources/img/h2.png");
                   }
             } // end success()
    		});// end ajax
     	}); // end body.click()
     	
     		 $.ajax({
                 type : 'POST',
                 url : '../like/select',
                 headers : {
                    'Content-Type' : 'application/json',
                    'X-HTTP-Method-Override' : 'POST'
                 },
                 data : JSON_like,
                 success : function (count, status) {
                       if (count == 1) {
                        $("#imgsrc").attr("src", "../resources/img/h1.png");
                       } else {
                        $("#imgsrc").attr("src", "../resources/img/h2.png");
                       }
                 } // end success()
        		});// end ajax
     	
     	
     	
     	
     	
  }); //end document
  
  
  </script>
        
</body>
</html>
