<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
        <script src="../resources/script/jquery.cookie.js"></script>
<title>회원가입</title>
</head>
<body>
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="../main/index">SkinTalk</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <!-- Search-->
                
                <form action="../main/product" method="get">
                  <div class="card-body">
                      <div class="input-group">
                          <input name="keyword" class="form-control" type="text" placeholder="Search" autocomplete="off"/>
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

    <h1>회원 가입 페이지</h1>
    <form action="register" method="post">
      <p>아이디</p>    
      <input type="text" id="userId" name="userId" placeholder="아이디 입력">
      <div id="userid_duplicate_output"></div>
      <p>패스워드</p>
      <input type="password" name="password" placeholder="비밀번호 입력">
      <p>이름</p>
      <input type="text" name="userName" placeholder="이름 입력">
      <p>닉네임</p>
      <input type="text" name="nickName" placeholder="닉네임 입력">
      <p>성별</p>
      <input type="radio" name="gender" value="남" checked> 남자
      <input type="radio" name="gender" value="여" > 여자
      <p>나이</p>
      <input type="number" name="age" placeholder="나이 입력">
      <p>피부타입</p>
      <input type="radio" name="skinType" value="지성" checked> 지성
      <input type="radio" name="skinType" value="중성" > 중성
      <input type="radio" name="skinType" value="건성" > 건성
      <input type="radio" name="skinType" value="복합성" > 복합성
      <p>피부문제</p>
      <input type="checkbox" name="skinTrouble" value="해당없음" checked> 해당없음
      <input type="checkbox" name="skinTrouble" value="아토피" > 아토피
      <input type="checkbox" name="skinTrouble" value="여드름" > 여드름
      <input type="checkbox" name="skinTrouble" value="민감성" > 민감성
      <p>이메일</p>
      <input type="email" id="email" name="email" placeholder="이메일 입력">
      <div id="email_duplicate_output"></div>
      <p>핸드폰</p>
      <input type="text" id="phone" name="phone" placeholder="번호 입력">
      <div id="phone_duplicate_output"></div>
      <p>주소</p>
      <input type="text" name="address" placeholder="주소 입력">
      <br>
    <input type="submit" value="회원가입">
    <a href="../main/index"><input type="button" value="메인페이지"></a>
    </form>
    
    <script type="text/javascript">
    	$(document).ready(()=>{
    		$('#userId').blur(()=>{
    			var userId = $('#userId').val();
    			console.log(userId);
    			
    			$.ajax({
    				type : 'get',
    				url : '../checks/userid_check',
    				data : JSON.stringify({
    					'userId' : userId
    				}),
    				headers : {
    					'Content-Type' : 'application/json',
    					'X-HTTP-Method-Override' : 'GET'
    				},
    				success : (result)=>{
    					var list = '';
    					console.log(result);
    					if (result == '1') {
        					list += '<p style="color:red">' + userId + '는 중복된 아이디 입니다.</p>';
							$('#userid_duplicate_output').html(list);
						} else if (result == '0'){
							list += '<p style="color:green">' + userId + '는 사용할 수 있는 아이디 입니다.</p>';
							$('#userid_duplicate_output').html(list);
						}
    				}// end of success
    			});// end of ajax;
    		}); // end of userId.blur
    		
    		// #이메일 중복확인 Ajax
			$('#email').blur(()=>{
						var email = $('#email').val();

						$.ajax({
							type : 'get',
							url : "../checks/email_check",
							data : JSON.stringify({
								'email' : email
							}),
							headers : {
	        					'Content-Type' : 'application/json',
	        					'X-HTTP-Method-Override' : 'GET'
	        				},
							success : function(result) {
								var list = "";
								if (result == '1') {
									list += '<p style="color:red">' + email + '는 중복된 이메일 입니다.</p>';
									$('#email_duplicate_output').html(list);
								} else if (result == '0') {
									list += '<p style="color:green">'
											+ email
											+ '는 사용 가능한 이메일 입니다.</p>';
									$('#email_duplicate_output').html(list);
								}
							}
						}) // end #email Ajax()
					}) // end #email.blur()

			// #핸드폰 중복확인 Ajax
			$('#phone').blur(()=>{
						var phone = $('#phone').val();

						$.ajax({
							type : 'get',
							url : "../checks/phone_check",
							data : JSON.stringify({
								'phone' : phone
							}),
							headers : {
	        					'Content-Type' : 'application/json',
	        					'X-HTTP-Method-Override' : 'GET'
	        				},
							success : function(result) {
								var list = "";
								if (result == '1') {
									list += '<p style="color:red">'
											+ phone
											+ '는 중복된 전화번호 입니다.</p>';
									$('#phone_duplicate_output').html(list);
								} else if (result == '0') {
									list += '<p style="color:green">'
											+ phone
											+ '는 사용 가능한 전화번호 입니다.</p>';
									$('#phone_duplicate_output').html(list);
								}
							}
						}) // end #email Ajax()
					}) // end #email.blur()
    		
    	}); //end of document
    
    </script>
    
</body>
</html>