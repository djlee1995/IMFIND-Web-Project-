<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="kr">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Fashi Template">
    <meta name="keywords" content="Fashi, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>I'm Find</title>
    
    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">
    
     <!-- DataTables -->
      <link rel="stylesheet" href="https://cdn.datatables.net/1.10.23/css/jquery.dataTables.min.css" />
     <!-- Css Styles -->
     <!-- Header Section Begin -->
      <jsp:include page="${request.contextPath}/NewHeader_CSS"></jsp:include>
     <!-- Header End -->
    
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/css/bootstrap.min.css" type="text/css"> 
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/css/YS_css/newstyle.css" type="text/css">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/css/themify-icons.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/css/slicknav.min.css" type="text/css">    
  
    <!-- Bootstrap cdn 설정  for 페이징  -->   
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">   
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">   
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">   
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>   
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>   
     
    
</head>

<body>
   <script>
      var user = '${loginUser}';
        
      $('#memberModifyBtn').click(function(){
           $(location).attr("href", "/imfind/modify");
      });
   </script>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>
    
     <jsp:include page="${request.contextPath}/el/afterLoginHeader"></jsp:include>      
    <!-- Header End -->
   
 <!-- Register Section Begin -->
 <div class="register-login-section spad">
     <div class="row">
          <div class="col-lg-6 offset-lg-3" style="padding-left: 0px; margin-left: 23%; padding-top: 145px;">
             <div class="section-mypage-title">                
                 <div class="container"><h3>My Page</h3></div>
             </div>
             &nbsp;&nbsp;
            <div class="containerBtn" style="padding-left: 17px;">
                 <div class="card-body clearfix">
                   <blockquote class="quote-secondary">
                         <div class="row">
                            <div class="col"> &nbsp;<h4> ${kakaoLoginUser}  ${loginUser} </h4></div>
                            <div class="col" style="padding-top: 22px;"> <button type="button" id="memberModifyBtn" class="btn btn-default btn-block" style="padding-top:6px;"><a href="./modify">수정</a></button></div>
                            <div class="col" style="padding-top: 22px;"> <button type="button" id="memberModifyBtn" class="btn btn-default btn-block" style="padding-top:6px;"><a href="./delete">회원탈퇴</a></button></div>
                            <div class="col" style="padding-left: 38px; padding-top:20px"><h4>나의 매너 점수</h4></div>
                            <!------------------ 매너평가의 별점의 결과를 출력 하는 공간 START 1.28 연수----------------------------------->                
							 <div class="col" ID=show_Grade_Rating> 
							    <!--   <p>★★★★★</p>   -->
							      <div class="grade">   
								<div class="showGrade">
									   <svg class="svg-inline--fa fa-star fa-w-18" aria-hidden="true" focusable="false"
									    width="1.8em" height="1.8em" data-prefix="fas" data-icon="star" role="img"
									     xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" data-fa-i2svg="">
								         <path fill="currentColor" d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z">
								         </path>         
								       </svg>
							          <svg class="svg-inline--fa fa-star fa-w-18" aria-hidden="true" focusable="false"
									    width="1.8em" height="1.8em" data-prefix="fas" data-icon="star" role="img"
									     xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" data-fa-i2svg="">
								         <path fill="currentColor" d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z">
								         </path>         
								       </svg>
							          <svg class="svg-inline--fa fa-star fa-w-18" aria-hidden="true" focusable="false"
									    width="1.8em" height="1.8em" data-prefix="fas" data-icon="star" role="img"
									     xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" data-fa-i2svg="">
								         <path fill="currentColor" d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z">
								         </path>         
								       </svg>
							          <svg class="svg-inline--fa fa-star fa-w-18" aria-hidden="true" focusable="false"
									    width="1.8em" height="1.8em" data-prefix="fas" data-icon="star" role="img"
									     xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" data-fa-i2svg="">
								         <path fill="currentColor" d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z">
								         </path>         
								         </svg>
							          <svg class="svg-inline--fa fa-star fa-w-18" aria-hidden="true" focusable="false"
									    width="1.8em" height="1.8em" data-prefix="fas" data-icon="star" role="img"
									     xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" data-fa-i2svg="">
								        <path fill="currentColor" d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z">
								        </path>         
								        </svg>     
								</div>
							</div>	
							<!------------------ 매너평가의 별점의 결과를 출력 하는 공간 END ---------------------------->    
                            <div class="col"> &nbsp; </div>
                         </div>
                   </blockquote>
                 </div>
            </div>
         </div>
      </div>
 </div>
      
<!-- Modal --> 
<form id="post_list" method="post"> 
   <div class="modal fade" role="dialog" id="dialog">
     <div class="modal-dialog">
       <!-- Modal content-->
       <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal">&times;</button>
              <h6 class="modal-title">거래 완료 전 파인더님의 평점을 입력해 주세요.</h6>
            </div>
            <div class="modal-body">
                 <p>거래 완료 파인더 선택하기 </p>
                  <hr>            
                  <p>채팅한 파인더</p>
                 <div class="container" id=output_WhoReplied style="width: 430px;"></div>
                <hr>
                <div class="container-fluid" style="height: 155px; width: 400px;">
                   <p> 위치 테스트(ㅇㅇㅇ님 평가하기)</p>
                     <!--HTML 별점 평가 테스트 START -->   
                  <hr>
                  <h2>별점주기</h2>
                  <div class="make_star">
                        <div class="rating" data-rate="3">
                           <svg class="svg-inline--fa fa-star fa-w-18" aria-hidden="true" focusable="false"  width="1.8em" height="1.8em" data-prefix="fas" data-icon="star" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" data-fa-i2svg="">
                           <path fill="currentColor" d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z">
                              </path></svg>
                              
                           <svg class="svg-inline--fa fa-star fa-w-18" aria-hidden="true" focusable="false" width="1.8em" height="1.8em" data-prefix="fas" data-icon="star" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" data-fa-i2svg="">
                           <path fill="currentColor" d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z">
                              </path></svg>
                              
                           <svg class="svg-inline--fa fa-star fa-w-18" aria-hidden="true" focusable="false" width="1.8em" height="1.8em" data-prefix="fas" data-icon="star" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" data-fa-i2svg="">
                           <path fill="currentColor" d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z">
                              </path></svg>
                              
                           <svg class="svg-inline--fa fa-star fa-w-18" aria-hidden="true" focusable="false" width="1.8em" height="1.8em" data-prefix="fas" data-icon="star" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" data-fa-i2svg="">
                           <path fill="currentColor" d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z">
                              </path></svg>
                              
                           <svg class="svg-inline--fa fa-star fa-w-18" aria-hidden="true" focusable="false" width="1.8em" height="1.8em" data-prefix="fas" ata-icon="star" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" data-fa-i2svg="">
                           <path fill="currentColor" d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z">
                              </path></svg>
                         </div>
                  </div>
                </div>    <!-- 202101240429_test -->
                <div class="modal-footer">
                     <button type="button" class="btn btn-primary" id="input-grade" >파인더 평점 입력 완료</button> 
                     <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
           </div>
           <!--modal body  -->
           </div>
      </div>
   </div>
</form>
 <!-- modal  end ------------------------------------------------------------------------------------>                                        

    <!-- Mypage Form Section End -->
     <div class="col-md-9" style="padding-left: 300px;">
         <div class="card">
             <div class="card-header p-2">
               <ul class="nav nav-pills">
               <!-- 1.28 은지 유희 -->
				<li class="nav-item"><button class="btn btn-default btn-block"  onclick="getItemList()" data-toggle="tab">분실물 작성글</button></li>
                 <li class="nav-item"><button class="btn btn-default btn-block"  onclick="getCommentList()"data-toggle="tab">분실물 댓글</button></li>
                 <li class="nav-item"><button class="btn btn-default btn-block"  onclick="getPetList()"data-toggle="tab">분실동물 작성글</button></li>
                 <li class="nav-item"><button class="btn btn-default btn-block"  onclick="getPetCommentList()"data-toggle="tab">분실동물 댓글</button></li>
                 <li class="nav-item"><button class="btn btn-default btn-block"  onclick="getPayList()" data-toggle="tab">사례금 결제내역</button></li>
                 <li class="nav-item"><button class="btn btn-default btn-block"  onclick="getMoeny()" data-toggle="tab">정산내역</button></li>
               </ul>
             </div>
             <!-- /.card-header -->
            <div class="card-body">
              <div class="table-container">
               <table id="output" class="table table-bordered table-hover display" style="font-size:1.5rem;"></table>
            </div>
            </div>
             <!-- /.card-body -->
          </div>
    </div>
 
    <!--마이페이지 js 시작-연수 -->
    <script src="${pageContext.request.contextPath}/resources/el/js/mypage.js"></script>
    <!--마이페이지 js 끝-연수 -->
   <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
    <!-- DataTables -->
    <script src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.js"></script>
    <!-- Js Plugins -->
    <script src="${pageContext.request.contextPath}/resources/el/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/el/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/el/js/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/el/js/jquery.countdown.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/el/js/jquery.nice-select.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/el/js/jquery.zoom.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/el/js/jquery.dd.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/el/js/jquery.slicknav.js"></script>
    <script src="${pageContext.request.contextPath}/resources/el/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/el/js/main.js"></script>
    <!-- Header Section Begin -->
        <jsp:include page="${request.contextPath}/NewFooter_JS"></jsp:include>
    <!-- Header End -->
    <script src="${pageContext.request.contextPath}/resources/el/YH/adminlte/dist/js/adminlte.min.js"></script>
   <script src="${pageContext.request.contextPath}/resources/el/YH/adminlte/dist/js/demo.js"></script>

</body>
   <script type="text/javascript">
    $(document).ready(function() {
        $.noConflict();
          $("#output").DataTable({
                "paging": true,
            "lengthChange": true,
            "searching": true,
            "ordering": true,
            "info": true,
            "autoWidth": false,
            "responsive": true,
              "columnDefs": [
                 { "width": "30%", "targets": 0 },
               ],
            "autoWidth": true,
            "buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"]
          }).buttons().container().appendTo('#output_wrapper .col-md-6:eq(0)');
      });
   </script>
</html>