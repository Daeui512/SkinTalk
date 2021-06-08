<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <!-- jQuery -->
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>




    <form action="nonmember-payment" method="post">
              <input type="text" id="userId" name="userId" value="${nonUserId }" readonly="readonly"><br>
      전화번호 : <input type="text" id="phone" name="phone" placeholder="전화번호 입력" required="required"><br>
      이메일 : <input type="email" id="email" name="email" placeholder="이메일 입력" required="required"><br>
      <input type="submit" value="비회원 결제정보 등록" >
      
    </form>


</body>
</html>