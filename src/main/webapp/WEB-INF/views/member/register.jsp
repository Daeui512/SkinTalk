<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>회원가입</title>
</head>
<body>

    <h1>회원 가입 페이지</h1>
    <form action="register" method="post">
      <p>아이디</p>    
      <input type="text" id="userId" name="userId" placeholder="아이디 입력">
      <div id="duplicate_output"></div>
      <p>패스워드</p>
      <input type="password" name="password" placeholder="비밀번호 입력">
      <p>이름</p>
      <input type="text" name="userName" placeholder="이름 입력">
      <p>닉네임</p>
      <input type="text" name="nickName" placeholder="닉네임 입력">
      <p>성별</p>
      <input type="radio" name="gender" value="man" > 남자
      <input type="radio" name="gender" value="woman" > 여자
      <p>나이</p>
      <input type="number" name="age" placeholder="나이 입력">
      <p>피부타입</p>
      <input type="radio" name="skinType" value="지성" checked="checked"> 지성
      <input type="radio" name="skinType" value="중성" > 중성
      <input type="radio" name="skinType" value="건성" > 건성
      <input type="radio" name="skinType" value="복합성" > 복합성
      <p>피부문제</p>
      <input type="checkbox" name="skinTrouble" value="해당없음" > 해당없음
      <input type="checkbox" name="skinTrouble" value="아토피" > 아토피
      <input type="checkbox" name="skinTrouble" value="여드름" > 여드름
      <input type="checkbox" name="skinTrouble" value="민감성" > 민감성
      <p>이메일</p>
      <input type="email" name="email" placeholder="이메일 입력">
      <p>핸드폰</p>
      <input type="text" name="phone" placeholder="번호 입력">
      <p>주소</p>
      <input type="text" name="address" placeholder="주소 입력">
      <br>
    <input type="submit" value="회원가입">
    </form>
    
    <script type="text/javascript">
    	$(document).ready(()=>{
    		$('#userId').blur(()=>{
    			var userId = $('#userId').val();
    			console.log(userId);
    			
    			$.ajax({
    				type : 'post',
    				url : '../member/idchk',
    				data : {
    					'userId' : userId
    				},
    				success : (result)=>{
    					var list = '';
    					console.log(result);
    					if (result == '1') {
        					list += '<p>' + userId + '는 중복된 아이디입니다.</p>';
							$('#duplicate_output').html(list);
						} else if (result == '0'){
							list += '<p>' + userId + '는 사용할 수 있는 아이디입니다.</p>';
							$('#duplicate_output').html(list);
						}
    				}// end of success
    			});// end of ajax;
    		}); // end of userId.blur
    	}); //end of document
    
    </script>
    
</body>
</html>