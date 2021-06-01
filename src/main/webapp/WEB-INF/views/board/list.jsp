<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
table, th, td {
  border-style: solid;
  border-width: 1px;
  text-align: center;
}

ul {
  list-style-type: none;
}

li {
  display: inline-block;
}
</style>
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
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../resources/design/styles.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>게시판 메인 페이지</title>
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
  <h1>게시판 메인</h1>
  <br>
  <a href="register"><input type="button" value="글작성"></a>
  <hr>
  <table>
    <thead>
      <tr>
        <th style="width: 60px">번호</th>
        <th style="width: 700px">제목</th>
        <th style="width: 60px">작성자</th>
        <th style="width: 100px">작성일</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="vo" items="${list }">
        <tr>
          <td>${vo.boardNo }</td>
          <td><a href="detail?boardNo=${vo.boardNo}&page=${pageMaker.criteria.page }">${vo.boardTitle }</a></td>
          <td>${vo.userId }</td>
          <fmt:formatDate value="${vo.boardCdate }"
            pattern="yyyy-mm-dd HH:mm:ss"
            var ="boardCdate"/>
          <td>${boardCdate }</td>
        </tr>
      </c:forEach>
    </tbody>
  </table>

  <hr>
  <ul>
    <c:if test="${pageMaker.hasPrev }">
      <li><a href="list?page=${pageMaker.startPageNo - 1 }">이전</a></li>
    </c:if>
    <c:forEach begin="${pageMaker.startPageNo }"
      end="${pageMaker.endPageNo }" var="num">
      <li><a href="list?page=${num }">${num }</a></li>
    </c:forEach>
    <c:if test="${pageMaker.hasNext }">
      <li><a href="list?page=${pageMaker.endPageNo + 1 }">다음</a></li>
    </c:if>
  </ul>
 
  <!-- BoardController -> registerPOST() 에서 보낸 데이터 저장 -->  
  <input id="insertAlert" type="hidden" value="${insert_result }">
  
  <script type="text/javascript">
  	$(document).ready(()=>{
  		confirmInsertResult(); // 호출
  		function confirmInsertResult(){
  			var result = $('#insertAlert').val();
  			if(result=='success'){
  				alert('새글 작성 성공');
  			}else if(result=='fail'){
  				alert('새글 작성 실패');
  			}
  		}
  	}); // end document
  </script>
</body>
</html>