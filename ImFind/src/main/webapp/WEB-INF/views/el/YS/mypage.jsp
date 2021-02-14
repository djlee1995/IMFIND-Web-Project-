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
     
     <style>
     .star-con{
   	    display: flex;
	    flex-direction: column;
	    align-items: center;
	    margin-top:22px;
 	    margin-bottom: 22px; 
     }
     div.star-con > .col{
     	max-width:max-content;
     }
     .btnWhoGetStar,
     .btnWhoGetStar-pet{
     	margin-bottom: 0;
	    font-weight: 400;
	    text-align: center;
	    white-space: nowrap;
	    vertical-align: middle;
	    -ms-touch-action: manipulation;
	    touch-action: manipulation;
	    cursor: pointer;
	    background-image: none;
	    background-color: #6c757d;
	    color:white;
	    border: 1px solid transparent;
	    padding: 6px 12px;
	    font-size: 14px;
	    line-height: 1.42857143;
	    border-radius: 4px;
     }
     .container-fluid{
   	    display: flex;
    	flex-direction: column;
     }
     .container-fluid > h5, 
     .container-fluid > div{
      	margin : 0;
      	padding : 0;
      }
     .modal-dialog{
     	display:flex;
     	justify-content:center;
     }
     #input-grade{
     	margin:0 auto;
     }
     #sidebar-wrapper{
   	    position: relative;
    	top: 153px;
     }
     </style>
    
</head>

<body>
   <script>
      var user = '${loginUser}';

   </script>
     <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>
    
     <jsp:include page="${request.contextPath}/el/afterLoginHeader"></jsp:include>      
    <!-- Header End -->
    
      <!-- Sidebar -->
   <div class="mypagebox">   
    
   </div> 
  
  <div class="mypg_content">
	   <div class="bg-light border-right" id="sidebar-wrapper" style=" width:200px;">
	   <div class="star-con">
	      <div class="col" ><h4> ${kakaoLoginUser}  ${loginUser}   님 </h4></div>
	      <div class="col" ><h5> 나의 매너점수</h5></div>
	      <div class="col" ID="show_Grade_Rating"> 
	      	 <div class="grade" >  	
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
	      </div>   
	   </div>
	     
	      <div class="list-group list-group-flush">   
	        <div class="list-group-item list-group-item-action bg-light" style="border-top: 1px solid #DCDCDC; height: 42px;">
	        	<h4 style="font-weight: 400;">분실물품 게시판</h4>
	        </div>
	        	<a href="javascript:getItemList();" class="list-group-item list-group-item-action bg-light" style="padding-left: 25px; padding-bottom: 0px;">분실물 작성글</a>
	        	<a href="javascript:getCommentList();" class="list-group-item list-group-item-action bg-light"style="padding-left: 25px;">분실물 댓글</a>
	        	
	        <div class="list-group-item list-group-item-action bg-light" style="border-top: 1px solid #DCDCDC; height: 42px;">
	        	<h4 style="font-weight: 400;">분실동물 게시판</h4>
	        </div>
	       	 	<a href="javascript:getPetList();" class="list-group-item list-group-item-action bg-light" style="padding-left: 25px; padding-bottom: 0px;">분실동물 작성글</a>
	        	<a href="javascript:getPetCommentList();" class="list-group-item list-group-item-action bg-light"style="padding-left: 25px;">분실동물 댓글</a>
	        
	        <div class="list-group-item list-group-item-action bg-light" style="border-top: 1px solid #DCDCDC; height: 42px;">
	        	<h4 style="font-weight: 400;">개인정보</h4>
	        </div>
		        <a href="./modify" class="list-group-item list-group-item-action bg-light" style="padding-left: 25px; padding-bottom: 0px;">개인정보수정</a>
		        <a href="javascript:getPayList();" class="list-group-item list-group-item-action bg-light" style="padding-left: 25px; padding-bottom: 0px;">결제내역</a>
		        <a href="javascript:getMoeny();" class="list-group-item list-group-item-action bg-light" style="padding-left: 25px; padding-bottom: 0px;">정산내역</a>
		        <a href="./delete" class="list-group-item list-group-item-action bg-light" style="padding-left: 25px;">회원탈퇴</a>
	        <div class="list-group-item list-group-item-action bg-light" style="border-top: 1px solid #DCDCDC; height: 42px;">
	        	<h4 style="font-weight: 400;">알람</h4>
	        </div>
		        <a href="javascript:getLiketo();" class="list-group-item list-group-item-action bg-light" style="padding-left: 25px; padding-bottom: 0px;">내가 누른 올리기</a>
		        <a href="javascript:getAlarm();" class="list-group-item list-group-item-action bg-light" style="padding-left: 25px; padding-bottom: 0px;">내글에 달린 댓글</a>
	        </div>
   		  </div> 
   
		   <!-- <div class="col-md-6" > -->
	    <div class="section-mypage-title" >          
    		  <div class="mypg_container" style="margin-top: 169px; margin-left: 50px;"><h1>My Page</h1></div>

	         <div class="mypg-card" style="width: 800px; margin-top: 50px;">
	            <table id="mypgform"></table>
	            <div class="table-container" style=" margin-left: 50px;">
	            <table id="output" class="table table-bordered table-hover display" style="font-size:1.5rem; width:918px;"></table>
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
             <!--  <h6 class="modal-title">거래 완료 전 파인더님의 평점을 입력해 주세요.</h6> -->
            </div>
            <div class="modal-body">
                <!--  <p>거래 완료 파인더 선택하기 </p>
                  <hr> -->
                  <div class="finder-con">
                  <h4><i class="far fa-question-circle">  파인더 매너평가란?</i></h4>
                  <p>내 분실물을 찾아준 파인더를 평가할 수 있어요! <br>
                   	 사례금이 있는 글의 경우 파인더에게 사례금이 지급돼요!<br>
                     분실물을 찾아준 파인더를 평가해주세요!</p>
                 
                  </div>
                
                 <hr>
                <div class="container-fluid" style="height: 155px; width: 100%;">
                   <h5>누구의 매너를 평가하시겠어요?</h5>
                    <div class="container" id="output_WhoReplied" style="width: 100%;"></div>
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
                   <button type="button" class="btn btn-block bg-gradient-danger" id="input-grade" style="width: 150px;">매너 평가 완료</button> 
                   
                 <!--   <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
                </div>
             </div>
           <!--modal body  -->
           </div>
      </div>
   </div>
</form>
 <!-- modal  end ------------------------------------------------------------------------------------>                                        

   <!--   <!-- Mypage Form Section End -->
     
 	 
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