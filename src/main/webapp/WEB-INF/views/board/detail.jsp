

<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<style>
h2 {
  text-align: center;
  padding: 50px 0;
  font-weight: lighter;
  font-size: 2em;
  letter-spacing: 10px;
  color: #FF7493;
}

button {
  background-color: #FF9CBB;
  border-radius: 50%;
}
textarea {
  background-color: #FFF0F0;
  width: 300px;
  border: 1px solid #CD3861;
  padding: 20px;
  margin: 120px;
}
div {
    text-align: center;
}


</style>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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
<title>${vo.boardTitle }</title>
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
                          <li class="nav-item"><a class="nav-link" href="../member/login">?????????</a></li>
                        </c:if>
                        <c:if test="${not empty sessionScope.userId }">
                          <li class="nav-item"><a class="nav-link" href="../member/member-detail">???????????????</a></li>
                          <li class="nav-item"><a class="nav-link" href="../member/logout">????????????</a></li>
                        </c:if>
                        <li class="nav-item"><a class="nav-link" href="../cart/cartList">????????????</a></li>
                        <li class="nav-item"><a class="nav-link" href="../board/list">????????????</a></li>
                    </ul>
                </div>
            </div>
        </nav>
  <h2>????????? ??????</h2>
  <hr>
  <a href="list?page=${page }"><input type="button" value="??? ??????"></a>
  <a href="update?boardNo=${vo.boardNo }&page=${page}"><input
    type="button" value="????????????"></a>
  <a href="delete?boardNo=${vo.boardNo }"><input type="button"
    value="????????? ??????"></a>
  <br>
  <hr>
  <div>
    <p>??? ?????? : ${vo.boardNo }</p>
  </div>
  <div>
    <p>
      ?????? <input type="text" value="${vo.boardTitle }"
        readonly="readonly">
    </p>
  </div>
  <div>
    <p>????????? : ${vo.userId }</p>
    <fmt:formatDate value="${vo.boardCdate }"
      pattern="yyyy???mm???dd??? HH???mm???" var="cdate" />
    <p>????????? : ${vo.boardCdate }</p>
  </div>
  <div>
    <textarea id="text1" rows="20" cols="120" readonly="readonly">${vo.boardContent }</textarea>
  </div>
  
  <div style="text-align: center">
    <div>
      <input type="hidden" id="replyBno" value="${vo.boardNo }"> 
      <input type="text" id="replyAdminId"> 
      <input type="text" id="replyContent">
      <button type="button" id="btn_add">??????</button>
    </div>
  </div>
  <hr>
  <div style="text-align: center;">
    <div id="replies"></div>
  </div>


  <script type="text/javascript">
            $(document).ready(function(){
               var replyBno = $('#replyBno').val();  // ????????? ?????? ???
               getAllReplies();
               
               // ?????? ?????? ??????
               $('#btn_add').click(function(){
                  var replyContent = $('#replyContent').val(); // ?????? ??????
                  var replyAdminId = $('#replyAdminId').val(); // ????????? ?????????
                  var obj = {
                        'replyBno' : replyBno,
                        'replyContent' : replyContent,
                        'replyAdminId' : replyAdminId
                  };
                  console.log(obj);
                  var JSONObj = JSON.stringify(obj);
                  
                  // $.ajax??? ??????
                  $.ajax({
                     type : 'post',
                     url : '../replies',
                     headers : {
                        'Content-Type' : 'application/json',
                        'X-HTTP-Method-Override' : 'POST'
                     },
                     data : JSONObj,
                     success : function(result, status){
                        console.log(result);
                        console.log(status);
                        if(result == 1) {
                           alert('?????? ?????? ??????');
                           getAllReplies();
                           $('#replyContent').val('');
                           $('#replyAdminId').val('');
                        }
                     } //end success
                  }); // end ajax()
               }); // end btn_add.click()
               
               // ???????????? ?????? ?????? ????????????
              function getAllReplies(){
                 var url =  '../replies/all/' + replyBno;
                 $.getJSON(
                       url,
                       function(jsonData){
                          console.log(jsonData);
                          var list = ''; // JSON ???????????? ????????? ??????
                          $(jsonData).each(function(){
                              // this : ??????????????? ??? ???????????? ????????? ??????
                                  console.log(this);
                                  var replyCdate = new Date(this.replyCdate);
                                 
                                      list += '<div class="reply_item">'
                                        + '<pre>'
                                        + '<input type="hidden" id="replyNo" value="' + this.replyNo + '" />'
                                        + '<input type="hidden" id="replyAdminId" value="' + this.replyAdminId + '" />'
                                        + this.replyAdminId 
                                        + '&nbsp;&nbsp;' // ??????
                                        + '<input type="text" id="replyContent" value="' + this.replyContent + '" />'
                                        + '&nbsp;&nbsp;'
                                        + replyCdate
                                        + '&nbsp;&nbsp;'
                                        + '<button class="btn_update" type="button">??????</button>'
                                        + '<button class="btn_delete" type="button">??????</button>'
                                        + "</pre>"
                                        + "</div>";
                          }); // end each()
                          $('#replies').html(list);
                       } // end callback()
                       ); // end getJSON()
              } //end getAllReplies()
              
              // ?????? ????????? ???????????? ????????? ?????? ??????
              $('#replies').on('click', '.reply_item .btn_update', function() {
                 console.log(this);   
                 
                 // ????????? ?????? replyNo, replyContent ?????? ??????
                 var replyNo = $(this).prevAll('#replyNo').val();   // this -> button class= "btn_update"
                 var replyContent = $(this).prevAll('#replyContent').val();
                 console.log("????????? ?????? ??????  : " + replyNo + ", ?????? ?????? : " + replyContent );
                 
                 // ajax ??????
                 $.ajax({
                    type : 'put',
                    url : '../replies/' + replyNo,
                    headers : {   // ????????? ?????? headers
                       'Content-Type' : 'application/json',
                       'X-HTTP-Method-Override' : 'PUT'
                    },
                    data : JSON.stringify({
                       'replyBno' : replyBno,
                       'replyContent' : replyContent
                    }),
                    success : function(result){
                       if(result == 'success'){
                          alert('?????? ?????? ??????');
                          getAllReplies();
                       }
                    } //end callback()
                 }); // end ajax()
              }); // end btn_update()
              
              //?????? ????????? ???????????? ????????? ?????? ??????
              $('#replies').on('click', '.reply_item .btn_delete', function(){
                 console.log(this);
                 
                 // ????????? ?????? replyNo
                 var replyNo = $(this).prevAll('#replyNo').val();
                 console.log("????????? ?????? ?????? : " + replyNo);
                 
                 // ajax ??????
                 $.ajax({
                    type : 'delete',
                    url : '../replies/' + replyNo,
                    headers : {
                       'Content-Type' : 'application/json',
                       'X-HTTP-Method-Override' : 'DELETE'
                    },
                    data : JSON.stringify({
                       'replyBno' : replyBno
                    }),
                    success : function(result){
                       if(result == 'success') {
                          alert('?????? ?????? ??????');
                          getAllReplies();
                       }
                    } // end callback()
                 }) // end ajax()
              }); // end btn_delete()
            }); // end document()
      </script>
      

</body>
</html>