<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
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
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="../resources/design/styles.css" rel="stylesheet" />
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
      
        <style type="text/css">
        .btn-primary{
          background-color: #343A40;
          border-color: #ffffff;
        }
        </style>
        
<meta charset="EUC-KR">
<title>Insert title here</title>
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
                    <li class="nav-item"><a class="nav-link" href="../member/login">�α���</a></li>
                  </c:if>
                  <c:if test="${not empty sessionScope.userId }">
                    <li class="nav-item"><a class="nav-link" href="../member/member-detail">����������</a></li>
                    <li class="nav-item"><a class="nav-link" href="../member/logout">�α׾ƿ�</a></li>
                  </c:if>
                  <li class="nav-item"><a class="nav-link" href="../cart/cartList">��ٱ���</a></li>
                  <li class="nav-item"><a class="nav-link" href="../board/list">������</a></li>
              </ul>
          </div>
      </div>
  </nav>
  
  
  <div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2" style="position: absolute; left: 50%; transform: translateX(-50%); padding-top: 115px">
    <div class="panel panel-success">
      <div class="panel-body">
          <div style="padding-bottom: 20px">
            <input type="text" class="form-control" name="userId" placeholder="ID" autofocus required>
          </div>
          <div style="padding-bottom: 20px">
            <input type="text" class="form-control" name="email" placeholder="E-MAIL" required>
          </div>
          <div style="padding-bottom: 20px">
            <button type="button" class="form-control btn btn-primary" id="passwordFindBtn">��й�ȣ ã��</button>
          </div>
       <div style="padding-bottom: 20px">
         <a href="../member/login">
          <button type="button" class="form-control btn btn-primary">�α��� �������� �̵�</button>
         </a>
       </div>
      </div>
    </div>
  </div>
  
   <script type="text/javascript">
      $(function(){
         $("#passwordFindBtn").click(function(){ // #passwordFindBtn��ư�� ������
            var userId = $('#userId').val(); // �Է��� userId �� ����
            var email = $('#email').val(); // �Է��� email �� ����
			
            if (userId != null && email != null) {
                $.ajax({
                   url : "../member/find_password_form",
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
			}else{			// end of if
				alert('���̵�� �̸����� �Է����ּ���');
			}
         }); // end of #passwordFindBtn.click()
      }) // end of function()
   </script>
</body>
</html>











