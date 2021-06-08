<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<title>Insert title here</title>
</head>
<body>

<h1 align="center"> 결제목록</h1>
  <table border="1" width="100%">
    <tr>
      <th>상품명</th>
      <th>단가</th>
      <th>수량</th>
    </tr>
    <c:set var="sumMoney" value="0"></c:set>
    
    <c:forEach var="list" items="${list }">
      <tr>
        <td>${list.productName}</td>
        <td>${list.price} <c:set var="sumMoney" value="${sumMoney + list.price }" /></td>
        <td>${list.amount}</td>
      </tr>
    </c:forEach>

    <tr>
      <td colspan="5" align="right">장바구니 금액 합계 : <fmt:formatNumber value="${sumMoney}" pattern="#,###,###" /><br> 
        총합계 : <c:out value="${sumMoney }"></c:out>
      </td>
    </tr>
  </table>

</body>
</html>