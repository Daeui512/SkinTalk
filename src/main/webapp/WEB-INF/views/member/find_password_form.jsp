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
         <h3>��й�ȣ ã��</h3>
      </div>
      <div>
         <p>
            <label>���̵�</label>
            <input type="text" id="userId" name="userId" placeholder="���̵�" required>
         </p>
         
         <p>
            <label>�̸���</label>
            <input type="email" id="email" name="email" placeholder="�̸���" required>
         </p>
         
         <p>
            <button type="button" id="passwordFindBtn">��й�ȣã��</button>
            <button type="button" onclick="history.go(-1);">�α�������</button>
         </p>
      </div>
   
   
   
   <script type="text/javascript">
      $(function(){
         $("#passwordFindBtn").click(function(){ // #passwordFindBtn��ư�� ������
            var userId = $('#userId').val(); // �Է��� userId �� ����
            var email = $('#email').val(); // �Է��� email �� ����
            console.log(userId + ',' + email);
            $.ajax({
               url : "./find_password",
               type : 'post',
               data : {
                  'userId' : userId,
                  'email' : email
               },
               success : function (findUserPassword_result) {
                  confirmFindPasswordResult(); // confirmFindPasswordResult() ȣ��
                  function confirmFindPasswordResult() {
                     
                     if (findUserPassword_result == 'success') { // success �޾ƿ� �� alert
                        alert('�ӽú�й�ȣ �̸��� �߼ۿϷ�');
                        var target = encodeURI('./login');
                        location = target;
                     } else if (findUserPassword_result == 'wrong_userid') { // wrong_userid �޾ƿ� �� alert
                        alert('��ϵ��� ���� ���̵� �Դϴ�');
                     } else if (findUserPassword_result == 'wrong_email') {
                        alert('��ϵ��� ���� �̸��� �Դϴ�');
                     } 
                  } // end of confirmFindPasswordResult()
               }
            }) // end of #passwordFindBtn ajax()
         }); // end of #passwordFindBtn.click()
      }) // end of function()
   </script>
</body>
</html>











