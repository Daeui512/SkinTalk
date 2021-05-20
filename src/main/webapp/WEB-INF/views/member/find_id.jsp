<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<meta charset="UTF-8">
<title>아이디 찾기</title>
</head>
<body>
	<div>
		<h3>아이디 찾기 검색결과</h3>
	</div>
	<div>
		<h5>
			아이디 : ${userId}
		</h5>
		<p>
			<button type="button" id="loginBtn">로그인으로</button>
			<button type="button" onclick="history.go(-1)">아이디찾기</button>
		</p>
	</div>

	<!-- MemberController -> updatePost() 에서 보낸 데이터 저장 -->
	<input id=findUserIdAlert type="hidden" value="${findUserId_result }">

	<script type="text/javascript">
		$(document).ready(function(){
			confirmFindUserIdResult(); // confirmFindeUserIdResult() 호출 
			function confirmFindUserIdResult() {
				var result = $('#findUserIdAlert').val();
				if (result == 'fail') { // MemberController에서 받아온 findUserId_result 값이 fail
					alert('해당하는 아이디정보가 없습니다.')
					history.go(-1)
				} else if(result == 'success') { // MemberController에서 받아온 findUserId_result 값이 success
					$("#loginBtn").click(function(){ // #loginBtn버튼 클릭시
						location.href='../member/login'
					}); // end of #loginBtn
				}
			} // end of confirmFindUserIdResult()
			
		}); // end of document
	</script>
</body>
</html>