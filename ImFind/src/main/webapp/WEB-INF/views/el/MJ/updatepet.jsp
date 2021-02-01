<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html>
   <head>
   <meta charset="UTF-8">

   <title>분실글 등록하기(애완동물)</title>
   
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
         
         <!-- Css Styles -->
          <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/css/font-awesome.min.css" type="text/css">
          <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/css/themify-icons.css" type="text/css">
          <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/css/elegant-icons.css" type="text/css">
          <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/css/owl.carousel.min.css" type="text/css">
          <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/css/nice-select.css" type="text/css">
          <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/css/slicknav.min.css" type="text/css">
          <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/css/style.css" type="text/css"> 
               
   </head>
<body>



   <!-- 분실물 등록 게시판 은지 -->
   <div class="container">
      <form name="boardform" action="./petupdate.do" method="post" enctype="multipart/form-data">
          
          
      <!-- 타이틀  -->

         <div class="item1">
            <h8>분실글 등록하기(애완동물)</h8>
            <h8>* 필수입력사항</h8>
         </div>
         
         <div class="item2">
            <h6>작성자</h6>
            <input type="hidden" name="id" value="${loginUser}">
            <h6>${loginUser}</h6>
   
         </div>
         <!-- 필수입력사항   -->
         <div class="item3">
            <h6>* 동물 이름</h6>

                 <label><input type="radio" name="Pet_Name" onClick="this.form.p_textbox.disabled=true" value="없음" checked="checked">없음</label> 
            <label><input type="radio" name="Pet_Name" onClick="this.form.p_textbox.disabled=false" value="있음" >있음</label>
            <label><input type="text" name="Pet_Name" id="p_textbox" class="form-control" placeholder="직접입력" disabled required></label>
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
            <input id="petdatepicker" type="text" name="Pet_LostDate" placeholder="날짜를 선택해주세요." required>
         </div>

   
         <div class="item6"><h6>분실 위치</h6></div>
         
         <!-- 지도 불러오기  -->
         <div class="container-fluid">
         
            <div id="Loc1" style="margin: -15px 10px 10px 100px;">
               <!-- Javascript가 필요없이 data-toggle에 collapse href에 대상 id을 설정합니다. -->
               <div id="Loc2">
               <input type="text" id="petcenterAddr2" name="Pet_Loc" placeholder="분실 위치를 입력해주세요." onclick="resizeMap(); relayout();" 
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
         

         <!-- 필수입력사항 -->
         <div class="item7"><h6>* 제 목</h6></div>      
         <div class="item7_box"><input type="text" class="Pet_Title" name="Pet_Title" placeholder="제목을 입력하세요" required></div>

         
         <!--  필수입력사항 --> 
         <div class="item8"><h6>내 용</h6></div>
         <div class="item8_1"><textarea id="summernote" name="Pet_Content"></textarea></div>
                  

         
         
         <div class="btn">
            <button type="submit">수정</button>
            <a href="#" onclick="history.back();">취소</a>
         </div>
         <div class="postnum"></div>

      </form>
   </div>
   <script>
	var pet_PostNum =<%=request.getParameter("Pet_PostNum") %>

		console.log(pet_PostNum)

	var loginUser='<%=(String)session.getAttribute("loginUser")%>'

</script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
      <!--게시글 등록 js 시작-은지 -->
      <script src="${pageContext.request.contextPath}/resources/el/js/update_pet.js"></script>
      <!--게시글 등록 js 끝-은지 -->
      
      <!-- -->
      <script src="${pageContext.request.contextPath}/resources/el/js/jquery.countdown.min.js"></script>
       <script src="${pageContext.request.contextPath}/resources/el/js/jquery.nice-select.min.js"></script>
       <script src="${pageContext.request.contextPath}/resources/el/js/jquery.zoom.min.js"></script>
       <script src="${pageContext.request.contextPath}/resources/el/js/jquery.dd.min.js"></script>
       <script src="${pageContext.request.contextPath}/resources/el/js/jquery.slicknav.js"></script>
       <script src="${pageContext.request.contextPath}/resources/el/js/owl.carousel.min.js"></script> 
       <script src="${pageContext.request.contextPath}/resources/el/js/main.js"></script> 
       
       <!-- 아임포트 시작-->
      <script src="http://service.iamport.kr/js/iamport.payment-1.1.5.js"></script> 
      <!-- 아임포트 끝-->

</body>
         
</html>