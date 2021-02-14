<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
   <head>
   <meta charset="UTF-8">

   <title>분실글 수정하기(물품)</title>
   
         <!-- Google Font -->
         <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
         
         <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
          <script src="${pageContext.request.contextPath}/resources/el/js/jquery-ui.min.js"></script>

         <!--  썸머노트 시작  -->                   
          <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
          <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet"> 
         <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script> 
         <!--  썸머노트 끝  --> 
         
         <link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">
         <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
         <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"> 
               
         <!-- 게시판 style.css - 은지 - -->
         <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/EJ/style.css">
      
         <!-- datepicker 파일 - 은지 - -->
         <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/EJ/datepicker/air-datepicker/dist/css/datepicker.min.css">
              
            <!-- 헤더 -->
          <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
         <!-- Animate.css -->
         <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/home/css/animate.css">
         <!-- Icomoon Icon Fonts-->
         <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/home/css/icomoon.css">   
         <!-- Magnific Popup -->
         <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/home/css/magnific-popup.css">
         <!-- Flexslider  -->
         <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/home/css/flexslider.css">
            <!-- Theme style  -->
         <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/home/css/style.css?after">
         <!-- Modernizr JS -->
         <script src="${pageContext.request.contextPath}/resources/home/js/modernizr-2.6.2.min.js"></script>    
         <style>
      @import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
      .notosanskr * { 
         font-family: 'Noto Sans KR', sans-serif;
      }
      form, h6{
         font-family: 'Noto Sans KR', sans-serif;
      }
      .fh5co-nav{
         position: fixed;
         top: 0;
         width: 100vw;
         left: 0;
         z-index: 100;
         padding-right : 35px;
         padding-right : 18px !important;
         background : white;
      }
      .fh5co-nav #fh5co-logo{
         font-size : 31px;
      }
      .fh5co-nav ul li a {
         font-family: 'Noto Sans KR', sans-serif;
         font-weigth : bold;
          font-size: 15px;
          padding: 29px 15px;
          color: rgba(0, 0, 0, 0.7);
          -webkit-transition: 0.5s;
          -o-transition: 0.5s;
          transition: 0.5s;
      }
      section{
         position: relative;
         top: 160px !important;
      }
      .top-menu{
         box-shadow: 0 2px 4px 0 hsla(0,0%,80.8%,.5);
         height : 88px !important;
      }
      div.container-fluid:nth-child(1) > div:nth-child(1) {
          display: flex;
          justify-content: center;
          align-items: center;
          margin-bottom: 8px;
          position: relative;
          top: -15px;
      }
      .btn{
         font-size: 11px !important;
         padding: 5px 20px;
         align-items : center;
      }
      .btn-group>.btn:first-child {
          margin-left: -5px
      }
      .note-toolbar {
          position: relative;
          height: 84px;
      }
      .note-Font > div:nth-child(1) > button:nth-child(1){
         margin-left:2px;
      }
      div.note-btn-group:nth-child(9) > button:nth-child(1),
      .btn-fullscreen{
         margin : 11px 4px 4px 12px;
      }
      div.note-btn-group.btn-group.note-Font.Style > div > button{
         margin-left: 12px;
      }
      .note-editor .note-toolbar>.note-btn-group, .note-popover .popover-content>.note-btn-group {
          margin-top: -10px;
          margin-left: 0;
          margin-right: 5px;
      }
      .container-fluid {
          /* border: 1px solid black; */
          width: 75vw;
          margin: 0 auto;
          padding: 0;
      }
      </style>
          
   </head>
<body>
<!-- 헤더시작 -->

<jsp:include page="${request.contextPath}/el/afterLoginHeader"></jsp:include>
<!-- 헤더 끝 -->

<section style="height:150vh;">
   <!-- 분실물 등록 게시판 은지 -->
   <div class="container">
      <form name="boardform" action="./update.do" method="post" enctype="multipart/form-data">
          
          
      <!-- 타이틀  -->

         <div class="item1">
            <h8>분실글 수정하기(물품)</h8>
            <h8>* 필수입력사항</h8>
         </div>
         
         <div class="item2">
            <h6>작성자</h6>
            <input type="hidden" name="id" value="${loginUser}">
            <h6>${loginUser}</h6>
   
         </div>
         <!-- 필수입력사항   -->
         <div class="item3">
            <h6>* 분실 물품</h6>
            <label><input type="radio" name="Lost_Item" onClick="this.form.textbox.disabled=true" value="핸드폰" checked="checked">핸드폰</label> 
            <label><input type="radio" name="Lost_Item" onClick="this.form.textbox.disabled=true" value="지갑"> 지갑</label> 
            <label><input type="radio" name="Lost_Item" onClick="this.form.textbox.disabled=true" value="가방"> 가방</label> 
            <label><input type="radio" name="Lost_Item" onClick="this.form.textbox.disabled=true" value="귀금속"> 귀금속</label>
            <label><input type="radio" name="Lost_Item" onClick="this.form.textbox.disabled=true" value="현금"> 현금</label>  
            <label><input type="radio" name="Lost_Item" onClick="this.form.textbox.disabled=false" value="etc"> 기타</label> 
            <label><input type="text" name="Lost_Item" id="textbox" class="form-control" style="width: 250px;" placeholder="직접입력" disabled required></label>
         </div>

         <!-- datepicker js 시작 -->
         <script src="${pageContext.request.contextPath}/resources/el/EJ/datepicker/air-datepicker/dist/js/datepicker.min.js"></script>
         <script src="${pageContext.request.contextPath}/resources/el/EJ/datepicker/air-datepicker/dist/js/i18n/datepicker.ko.js"></script>
         <!-- datepicker js 끝   -->
         
         <!-- 카카오맵 시작 -->
         <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4434d2cc6bcfc1d87507d4afab43bdfb&libraries=services"></script>
         <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4434d2cc6bcfc1d87507d4afab43bdfb"></script>
         <!-- 카카오맵 끝 -->
         
         <!-- 필수입력사항 -->
         <div class="item5">
            <h6>* 분실 날짜</h6>
            <input id="datepicker" type="text" name="Lost_Date" placeholder="날짜를 선택해주세요." required>
         </div>

         <div class="item6">
         	<h6>분실 위치</h6>
         
         <!-- 지도 불러오기  -->
         <div class="container-fluid" style="width: 1000px;">
         
            <div id="Loc1" style="margin: -15px 10px 10px 100px;">
               <!-- Javascript가 필요없이 data-toggle에 collapse href에 대상 id을 설정합니다. -->
               <div id="Loc2">
               <input type="text" id="centerAddr2" name="Lost_Loc" placeholder="분실 위치를 입력해주세요." onclick="resizeMap(); relayout();" 
                     data-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample" onKeypress="enter();" />
               <button type="button" id="Loc2Btn" onclick="resizeMap(); relayout();" >위치 검색</button></div>
            
            </div>
                  
            <!-- collapse 대상 태그는 class를 collapse로 설정합니다. -->
            <div class="collapse" id="collapseExample">
               <div class="well">
               <div id="map" style="width: 350px; height: 350px;"></div>
               </div>
             </div>         
           </div>
         </div>

         <!-- 필수입력사항 -->
         <div class="item7">
         	<h6>* 제 목</h6>     
         	<div class="item7_box"><input type="text" class="lost_title" name="Lost_Title" placeholder="제목을 입력하세요" required></div>
		</div> 
         
         <!--  필수입력사항 --> 
         <div class="item8"><h6>내 용</h6></div>
         <div class="item8_1"><textarea id="summernote" name="Lost_Content"></textarea></div>
                  

         
         
         <div class="btn">
            <button type="submit">수정</button>
            <a href="#" onclick="history.back();">취소</a>
         </div>
         <div class="postnum"></div>

      </form>
   </div>
</section>   
   <script>
var lost_PostNum =<%=request.getParameter("lost_PostNum") %>
console.log(lost_PostNum+1)
var loginUser='<%=(String)session.getAttribute("loginUser")%>'
</script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
      <!--게시글 등록 js 시작-은지 -->
      <script src="${pageContext.request.contextPath}/resources/el/js/update_item.js"></script>
      <!--게시글 등록 js 끝-은지 -->
      
      <!-- jQuery Easing -->
   <script src="${pageContext.request.contextPath}/resources/home/js/jquery.easing.1.3.js"></script>
   <!-- Waypoints -->
   <script src="${pageContext.request.contextPath}/resources/home/js/jquery.waypoints.min.js"></script>
   <!-- Flexslider -->
   <script src="${pageContext.request.contextPath}/resources/home/js/jquery.flexslider-min.js"></script>
   <!-- Magnific Popup -->
   <script src="${pageContext.request.contextPath}/resources/home/js/jquery.magnific-popup.min.js"></script>
   <script src="${pageContext.request.contextPath}/resources/home/js/magnific-popup-options.js"></script>
   <!-- Main -->
   <script src="${pageContext.request.contextPath}/resources/home/js/main.js"></script>
       
       <!-- 아임포트 시작-->
      <script src="http://service.iamport.kr/js/iamport.payment-1.1.5.js"></script> 
      <!-- 아임포트 끝-->

</body>
         
</html>