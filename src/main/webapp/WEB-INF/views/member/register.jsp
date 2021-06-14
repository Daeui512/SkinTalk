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
        
        
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        
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
        
  <div class="container">
    <br>
    <p class="text-center">
      SkinTalk
    </p>
    <hr>
    
    <div >
      <article class="card-body mx-auto" style="max-width: 400px;">
        <h4 class="card-title mt-3 text-center">회원가입 페이지</h4>
        <form name="register" action="register" method="post">
        
          <!-- 아이디 -->
          <div class="form-group input-group">
            <div class="input-group-prepend">
              <span class="input-group-text"> <i class="fa fa-user"></i>
              </span>
            </div>
            <input class="form-control" type="text" id="userId" name="userId" placeholder="아이디 입력">
          </div>
            <span id="userid_duplicate_output"></span>
            
          <!-- 비밀번호 -->
          <div class="form-group input-group">
            <div class="input-group-prepend">
              <span class="input-group-text"> <i class="fa fa-lock"></i>
              </span>
            </div>
            <input class="form-control" type="password" id="password" name="password" placeholder="비밀번호 입력">
          </div>
            <span id="password_accurate_output" style="color:green; display:none"><p>사용 가능한 비밀번호 입니다.</p></span>
            <span id="password_inaccurate_output" style="color:red; display:none"><p>4~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.</p></span>
          
          <!-- 비밀번호확인 -->
          <div class="form-group input-group">
            <div class="input-group-prepend">
              <span class="input-group-text"> <i class="fa fa-lock"></i>
              </span>
            </div>
            <input class="form-control" type="password" id="passwordCheck" name="passwordCheck" placeholder="비밀번호 확인">
          </div>
            <span id="password_check_accurate_output" style="color:green; display:none"><p>비밀번호가 일치합니다.</p></span>
            <span id="password_check_inaccurate_output" style="color:red; display:none"><p>비밀번호가 일치하지 않습니다.</p></span>
            <span id="password_check_fail_output" style="color:red; display:none"><p>8~16자 영문 대 소문자, 숫자, 특수문자를 사용하여 비밀번호를 작성하세요.</p></span>
        
          <!-- 이름 -->
          <div class="form-group input-group">
            <div class="input-group-prepend">
              <span class="input-group-text"> <i class="fa fa-user"></i>
              </span>
            </div>
            <input class="form-control" type="text" id="userName" name="userName" placeholder="이름 입력">
          </div>
            <span id="username_inaccurate_output" style="color:red; display:none"><p>한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)</p></span>
            <span id="username_non_output" style="color:red; display:none"><p>필수 정보입니다.</p></span>
          
          <!-- 닉네임 -->
          <div class="form-group input-group">
            <div class="input-group-prepend">
              <span class="input-group-text"> <i class="fa fa-user"></i>
              </span>
            </div>
            <input class="form-control" type="text" id="nickName" name="nickName" placeholder="닉네임 입력">
          </div>
            <span id="nickname_duplicate_output"></span>
          
          <!-- 성별 -->
          <div class="form-group input-group">
            <div class="input-group-prepend">
              <span class="input-group-text"> <i class="fa fa-user"></i>
              </span>
            </div>
            <select class="form-control" id="gender" name="gender">
              <option selected>성별을 선택하세요</option>
              <option value="남">남</option>
              <option value="여">여</option>
            </select> 
          </div>
          
          <!-- 나이 -->
          <div class="form-group input-group">
            <div class="input-group-prepend">
              <span class="input-group-text"> <i class="fa fa-user"></i>
              </span>
            </div>
            <input class="form-control" type="number" id="age" name="age" placeholder="나이 입력">
          </div>
            <span id="age_non_output" style="color:red; display:none"><p>필수 정보입니다.</p></span>
          
          <!-- 피부타입 -->
          <div class="form-group input-group">
            <div class="input-group-prepend">
              <span class="input-group-text"> <i class="fa fa-user"></i>
              </span>
            </div>
            <select class="form-control" id="skinType" name="skinType">
              <option selected>피부타입을 선택하세요</option>
              <option value="지성">지성</option>
              <option value="중성">중성</option>
              <option value="건성">건성</option>
              <option value="복합성">복합성</option>
            </select>
          </div>
          
          <!-- 피부문제 -->
          <div class="form-group input-group">
            <div class="input-group-prepend">
              <span class="input-group-text"> <i class="fa fa-user"></i>
              </span>
            </div>
              <input type="checkbox" id="skinTrouble1" name="skinTrouble" value="해당없음" checked> 해당없음
                <input type="checkbox" id="skinTrouble2" name="skinTrouble" value="아토피" > 아토피
                  <input type="checkbox" id="skinTrouble3" name="skinTrouble" value="여드름" > 여드름
                  <input type="checkbox" id="skinTrouble4" name="skinTrouble" value="민감성" > 민감성
          </div>
          
          <!-- 이메일 -->
          <div class="form-group input-group">
            <div class="input-group-prepend">
              <span class="input-group-text"> <i class="fa fa-envelope"></i>
              </span>
            </div>
            <input class="form-control" type="email" id="email" name="email" placeholder="이메일 입력">
          </div>
            <span id="email_duplicate_output"></span>
          
          <!-- 전화번호 -->
          <div class="form-group input-group">
            <div class="input-group-prepend">
              <span class="input-group-text"> <i class="fa fa-phone"></i>
              </span>
            </div>
            <input class="form-control" type="text" id="phone" name="phone" placeholder="번호 입력">
          </div>
            <span id="phone_duplicate_output"></span>
          
          <!-- 주소 -->
          <div class="form-group input-group">
            <div class="input-group-prepend">
              <span class="input-group-text"> <i class="fa fa-address"></i>
              </span>
            </div>
            <input class="form-control" type="text" id="address" name="address" placeholder="주소 입력">
          </div>
          <span id="address_non_output" style="color:red; display:none"><p>필수 정보입니다.</p></span>
          
          
          <!-- 회원가입 -->
          <div class="form-group">
            <input class="btn btn-primary btn-block" id="btnSubmit"type="button" value="회원가입">
          </div>
          
          <!-- form-group// -->
          <p class="text-center">
            Have an account? <a href="./login">Log In</a>
          </p>
          
        </form>
      </article>
    </div>
    <!-- card.// -->

  </div>
  <!--container end.//-->

  <script type="text/javascript">
      $(document).ready(()=>{
        var userIdFlag = false;
        var passwordFlag = false;
        var passwordCheckFlag = false;
        var userNameFlag = false;
        var nickNameFlag = false;
        var genderFlag = false;
        var ageFlag = false;
        var skinTypeFlag = false;
        var skinTroubleFlag = false;
        var emailFlag = false;
        var phoneFlag = false;
        var addressFlag = false;
      
        // #아이디 중복확인
        $('#userId').blur(()=>{
          var userId = $('#userId').val();
          console.log(userId);
          $.ajax({
      	    type : 'post',
			url : '../checks/userid_check',
			data : JSON.stringify({
				'userId' : userId
			}),
			headers : {
				'Content-Type' : 'application/json',
				'X-HTTP-Method-Override' : 'POST'
			},
            success : (result,status)=>{
              var isUserId = /^[a-z0-9][a-z0-9]{3,19}$/;
              var list = '';
              console.log('중복확인 : ' + result);
              
              if (userId == "") { // 아이디를 입력하지 않은 경우
                list += '<p style="color:red">필수 정보입니다.</p>';
                $('#userid_duplicate_output').html(list);
                userIdFlag = false;
                console.log('userIdFlag : ' + userIdFlag);
                return false;
              } 
              
              if (!isUserId.test(userId)) { // 잘못된 아이디를 입력한 경우
                list += '<p style="color:red">4~20자의 영문 소문자, 숫자만 사용 가능합니다.</p>'
                $('#userid_duplicate_output').html(list);
              userIdFlag = false;
              console.log('userIdFlag : ' + userIdFlag);
                return false;
              }
              
              if (result == '1') { // 중복된 아이디를 입력한 경우
                  list += '<p style="color:red">' + userId + '는 중복된 아이디 입니다.</p>';
              $('#userid_duplicate_output').html(list);
              userIdFlag = false;
              console.log('userIdFlag : ' + userIdFlag);
              return false;
            } 
              
              if (isUserId.test(userId) && result == '0'){ // 정상적인 아이디를 입력한 경우
              list += '<p style="color:green">' + userId + '는 사용할 수 있는 아이디 입니다.</p>';
              $('#userid_duplicate_output').html(list);
              userIdFlag = true;
              console.log('userIdFlag : ' + userIdFlag);
              return false;
            }
              
            console.log('userIdFlag : ' + userIdFlag);
            }// end of success
          }); // end of ajax;
        }); // end of userId.blur
        
        // #닉네임 중복확인
        $('#nickName').blur(()=>{
          var nickName = $('#nickName').val();
          
          $.ajax({
            type : 'post',
            url : '../checks/nickname_check',
            data : JSON.stringify({
              'nickName' : nickName
            }),
            headers : {
				'Content-Type' : 'application/json',
				'X-HTTP-Method-Override' : 'POST'
			},
            success : (result,status)=>{
              var isNonNickName = /[^가-힣a-zA-Z0-9]/gi;
              var list = '';
              console.log('닉네임 중복확인 : ' + result);
              
              if (nickName == "") { // 닉네임을 입력하지 않은 경우
                list += '<p style="color:red">필수 정보입니다.</p>';
                $('#nickname_duplicate_output').html(list);
              nickNameFlag = false;
              console.log('nickNameFlag : ' + nickNameFlag);
                return false;
              } 
              
              if (isNonNickName.test(nickName)) { // 잘못된 닉네임을 입력할 경우
                list += '<p style="color:red">한글, 숫자, 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)</p>'
                $('#nickname_duplicate_output').html(list);
                nickNameFlag = false;
              console.log('nickNameFlag : ' + nickNameFlag);
                return false;
              }
              
              if (result == '1') { // 중복된 닉네임을 입력할 경우
                  list += '<p style="color:red">' + nickName + '는 중복된 닉네임 입니다.</p>';
              $('#nickname_duplicate_output').html(list);
              nickNameFlag = false;
              console.log('nickNameFlag : ' + nickNameFlag);
              return false;
            } 
              
              if (!isNonNickName.test(nickName) && result == '0'){ // 정상적인 닉네임을 입력할 경우
              list += '<p style="color:green">멋진 닉네임이네요!</p>';
              $('#nickname_duplicate_output').html(list);
              nickNameFlag = true;
              console.log('nickNameFlag : ' + nickNameFlag);
              return false;
            }
              
            }// end of success
          }); // end of ajax;
        }); // end of userId.blur
        
        // #이메일 중복확인 Ajax
      $('#email').blur(()=>{
            var email = $('#email').val();
            $.ajax({
            	type : 'post',
				url : "../checks/email_check",
				data : JSON.stringify({
					'email' : email
				}),
				headers : {
					'Content-Type' : 'application/json',
					'X-HTTP-Method-Override' : 'POST'
				},
              success : function(result) {
                var isEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
                var list = "";
                
                if (email == "") { // 이메일을 입력하지 않을 경우
                    list += '<p style="color:red">필수 정보입니다.</p>';
                    $('#email_duplicate_output').html(list);
                    emailFlag = false;
                    console.log('emailFlag : ' + emailFlag);
                    return false;
                  } 
                
                if (!isEmail.test(email)) { // 잘못된 이메일을 입력할 경우
                    list += '<p style="color:red">정확한 정보를 입력하세요.</p>'
                    $('#email_duplicate_output').html(list);
                    emailFlag = false;
                    console.log('emailFlag : ' + emailFlag);
                    return false;
                  }
                
                if (result == '1') { // 중복된 이메일을 입력할 경우
                  list += '<p style="color:red">' + email + '는 중복된 이메일 입니다.</p>';
                  $('#email_duplicate_output').html(list);
                  emailFlag = false;
                  console.log('emailFlag : ' + emailFlag);
                  return false;
                } 
                
                if (isEmail.test(email) && result == '0') { // 정상적인 이메일을 입력할 경우
                  list += '<p style="color:green">'
                      + email
                      + '는 사용 가능한 이메일 입니다.</p>';
                  $('#email_duplicate_output').html(list);
                  emailFlag = true;
                    console.log('emailFlag : ' + emailFlag);
                  return false;
                }
                
              } // end of success
            }) // end #email Ajax()
          }) // end #email.blur()
      // #핸드폰 중복확인 Ajax
      $('#phone').blur(()=>{
            var phone = $('#phone').val();
            $.ajax({
            	type : 'post',
				url : "../checks/phone_check",
				data : JSON.stringify({
					'phone' : phone
				}),
				headers : {
					'Content-Type' : 'application/json',
					'X-HTTP-Method-Override' : 'POST'
				},
              success : function(result) {
                var isPhone = /^\d{3}\d{3,4}\d{4}$/;
                var list = "";
                
                if (phone == "") { // 전화번호를 입력하지 않는 경우
                    list += '<p style="color:red">필수 정보입니다.</p>';
                    $('#phone_duplicate_output').html(list);
                    phoneFlag = false;
                    console.log('phoneFlag : ' + phoneFlag);
                    return false;
                  } 
                
                if (!isPhone.test(phone)) { // 잘못된 전화번호를 입력할 경우
                    list += '<p style="color:red">정확한 정보를 입력하세요.</p>'
                    $('#phone_duplicate_output').html(list);
                    phoneFlag = false;
                    console.log('phoneFlag : ' + phoneFlag);
                    return false;
                  }
                
                if (result == '1') { // 중복된 전화번호를 입력할 경우
                  list += '<p style="color:red">'
                      + phone
                      + '는 중복된 전화번호 입니다.</p>';
                  $('#phone_duplicate_output').html(list);
                  phoneFlag = false;
                    console.log('phoneFlag : ' + phoneFlag);
                  return false;
                } 
                
                if (isPhone.test(phone) && result == '0') { // 정상적인 전화번호를 입력할 경우
                  list += '<p style="color:green">'
                      + phone
                      + '는 사용 가능한 전화번호 입니다.</p>';
                  $('#phone_duplicate_output').html(list);
                  phoneFlag = true;
                    console.log('phoneFlag : ' + phoneFlag);
                  return false;
                }
                
              } // end of success
            }); // end #phone Ajax()
          }); // end #phone.blur()
          
          // 비밀번호 Flag
          $('#password').blur(function(){
            var password = $('#password').val();
            var isPassword = /^[A-Za-z0-9`\-=\\\[\];',\./~!@#\$%\^&\*\(\)_\+|\{\}:"<>\?]{4,16}$/;
              if (!isPassword.test(password)) {
                $('#password_accurate_output').hide();
                $('#password_inaccurate_output').show();
                passwordCheckFlag = false;
                console.log('passwordCheckFlag : ' + passwordCheckFlag);
              } else {
                $('#password_inaccurate_output').hide(); 
                $('#password_accurate_output').show(); 
                passwordCheckFlag = true;
                console.log('passwordCheckFlag : ' + passwordCheckFlag)
              }
          
          });
        
          // 비밀번호확인 Flag
          $('#passwordCheck').blur(function(){
            var password = $('#password').val();
            var passwordCheck = $(this).val();
            console.log('password : ' + password + ', passwordCheck : ' + passwordCheck);
            
            if (passwordCheckFlag == false) {
              console.log('passwordCheckFlag : ' + passwordCheckFlag);
                  $('#password_check_accurate_output').hide();
                  $('#password_check_inaccurate_output').hide();
                  $('#password_check_fail_output').show();
                  passwordFlag = false;
            } else {
              console.log('passwordCheckFlag : ' + passwordCheckFlag);
              
              if (password == passwordCheck) {
                  console.log('passwordCheckFlag : ' + passwordCheckFlag);
                  $('#password_check_inaccurate_output').hide();
                  $('#password_check_fail_output').hide();
                  $('#password_check_accurate_output').show();
                  passwordFlag = true;
                } else if (password != passwordCheck){
                  $('#password_check_accurate_output').hide();
                  $('#password_check_fail_output').hide();
                  $('#password_check_inaccurate_output').show();
                  passwordFlag = false;
              }
            }
              console.log('passwordFlag : ' + passwordFlag);
          });
          
          // 이름 Flag
          $('#userName').blur(function(){
            var isNonUserName = /[^가-힣a-zA-Z0-9]/gi;
            var userName = $(this).val();
            console.log('userName : ' + userName);
            
            if (userName == "") {
              $('#username_inaccurate_output').hide();
              $('#username_non_output').show();
              userNameFlag = false;
            } else if (userName != "" && isNonUserName.test(userName)) {
              $('#username_non_output').hide();
              $('#username_inaccurate_output').show();
              userNameFlag = false;
            } else {
              $('#username_non_output').hide();
              $('#username_inaccurate_output').hide();
              userNameFlag = true;
            }
            console.log('userNameFlag : ' + userNameFlag);
          }); // end of userName.blur
          
          // 성별 Flag
          $('#gender').blur(function() {
            var gender = $(this).val();
            console.log('gender : ' + gender);
              
            if (gender == '남' || gender == '여') {
              genderFlag = true;
            } else {
              genderFlag = false;
            }
              console.log('genderFlag : ' + genderFlag);
          }); // end of gender.blur
          
          // 나이 Flag
          $('#age').blur(function() {
            var age = $(this).val();
            console.log('age : ' + age);
            var isNonAge = /[^0-9]/gi;
            
            if(age == "") {
              $('#age_non_output').show();
              ageFlag = false;
            } else if (age != "" && isNonAge.test(age)) {
              $('#age_non_output').hide();
              console.log('isNonAge.test(age) : ' + isNonAge.test(age));
              ageFlag = false;
            } else {
              $('#age_non_output').hide();
              ageFlag = true;
            }
            console.log('ageFlag : ' + ageFlag);
          }); // end of age.blur
          
          // 피부타입 Flag
          $('#skinType').blur(function() {
            var skinType = $(this).val();
            console.log('skinType : ' + skinType);
            
            if(skinType == "지성" || skinType == "중성" || skinType == "건성" || skinType == "복합성") {
              skinTypeFlag = true;
            } else {
              skinTypeFlag = false;
            }
            console.log('skinTypeFlag : ' + skinTypeFlag);
          }); // end of skinType.blur
          $('#skinTrouble1').click(function() {
            
            if ($("#skinTrouble2").prop("checked")
            || $("#skinTrouble3").prop("checked")
            || $("#skinTrouble4").prop("checked")) {
              $('#skinTrouble2').prop("checked", false)
              $('#skinTrouble3').prop("checked", false)
              $('#skinTrouble4').prop("checked", false)
            
              console.log('해당없음 체크여부 : ' + $("#skinTrouble1").is(":checked"));
            } 
              
            }); // end of skinTrouble1.click
          
          $('#skinTrouble2').click(function() {
            
            if ($("#skinTrouble1").prop("checked")) {
              $('#skinTrouble1').prop("checked", false)
            
              console.log('해당없음 체크여부 : ' + $("#skinTrouble1").is(":checked"));
            } 
            
          }); // end of skinTrouble2.click
          
          $('#skinTrouble3').click(function() {
            
            if ($("#skinTrouble1").prop("checked")) {
              $('#skinTrouble1').prop("checked", false)
            
              console.log('해당없음 체크여부 : ' + $("#skinTrouble1").is(":checked"));
            } 
            
          }); // end of skinTrouble3.click
          
          $('#skinTrouble4').click(function() {
            
            if ($("#skinTrouble1").prop("checked")) {
              $('#skinTrouble1').prop("checked", false)
            
              console.log('해당없음 체크여부 : ' + $("#skinTrouble1").is(":checked"));
            } 
            
          }); // end of skinTrouble4.click
          
          // 피부고민 Flag
          $('input[name="skinTrouble"]').click(function() {
            var checkBoxLength = $("input:checkbox[name=skinTrouble]:checked").length;
            console.log('length : ' + checkBoxLength);
            
            if(checkBoxLength == 0) {
              skinTroubleFlag = false;
            } else {
              skinTroubleFlag = true;
            }
            
            console.log('skinTroubleFlag : ' + skinTroubleFlag);
          }); // end of skinTrouble.blur
          
          // 주소 Flag
          $('#address').blur(function() {
            var address = $(this).val();
            console.log('address : ' + address);
            
            if(address == "") {
              $('#address_non_output').show();
              addressFlag = false;
            } else {
              $('#address_non_output').hide();
              addressFlag = true;
            }
            console.log('addressFlag : ' + addressFlag);
          }); // end of address.blur
          
          // 회원가입 클릭
          $("#btnSubmit").click(function(){
            if(userIdFlag == false
            || passwordFlag == false
            || userNameFlag == false
            || nickNameFlag == false
            || genderFlag == false
            || ageFlag == false
            || skinTypeFlag == false
            || skinTroubleFlag == false
            || emailFlag == false
            || phoneFlag == false
            || addressFlag == false){
              console.log('userIdFlag : ' + userIdFlag + ', passwordFlag : ' + passwordFlag +
                    ', userNameFlag : ' + userNameFlag + ', nickNameFlag : ' + nickNameFlag +
                    ', genderFlag : ' + genderFlag + ', ageFlag : ' + ageFlag + 
                    ', skinTypeFlag : ' + skinTypeFlag + ', skinTroubleFlag : ' + skinTroubleFlag +
                    ', emailFlag : ' + emailFlag + ', phoneFlag : ' + phoneFlag + ', addressFlag : ' + addressFlag);
                alert("회원정보를 정확히 입력해주세요.")
                return false;
              } else {
                document.register.submit();
              }
          }); // end btnSubmit
      }); //end of document
    
    </script>
    
</body>
</html>