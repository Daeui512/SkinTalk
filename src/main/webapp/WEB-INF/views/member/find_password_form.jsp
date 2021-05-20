<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
      
      <div>
         <h3>비밀번호 찾기</h3>
      </div>
      <div>
         <p>
            <label>아이디</label>
            <input type="text" id="userId" name="userId" placeholder="아이디" required>
         </p>
         
         <p>
            <label>이메일</label>
            <input type="email" id="email" name="email" placeholder="이메일" required>
         </p>
         
         <p>
            <button type="button" id="passwordFindBtn">비밀번호찾기</button>
            <button type="button" onclick="history.go(-1);">로그인으로</button>
         </p>
      </div>
   
   
   
   <script type="text/javascript">
      $(function(){
         $("#passwordFindBtn").click(function(){ // #passwordFindBtn버튼을 누르면
            var userId = $('#userId').val(); // 입력한 userId 값 저장
            var email = $('#email').val(); // 입력한 email 값 저장
            console.log(userId + ',' + email);
            $.ajax({
               url : "./find_password",
               type : 'post',
               data : {
                  'userId' : userId,
                  'email' : email
               },
               success : function (findUserPassword_result) {
                  confirmFindPasswordResult(); // confirmFindPasswordResult() 호출
                  function confirmFindPasswordResult() {
                     
                     if (findUserPassword_result == 'success') { // success 받아올 시 alert
                        alert('임시비밀번호 이메일 발송완료');
                        var target = encodeURI('./login');
                        location = target;
                     } else if (findUserPassword_result == 'wrong_userid') { // wrong_userid 받아올 시 alert
                        alert('등록되지 않은 아이디 입니다');
                     } else if (findUserPassword_result == 'wrong_email') {
                        alert('등록되지 않은 이메일 입니다');
                     } 
                  } // end of confirmFindPasswordResult()
               }
            }) // end of #passwordFindBtn ajax()
         }); // end of #passwordFindBtn.click()
      }) // end of function()
   </script>
</body>
</html>











