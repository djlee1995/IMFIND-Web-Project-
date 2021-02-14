 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
   <head>
   <meta charset="UTF-8">
   <title>분실글 등록하기(물품)</title>
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
         <!-- datepicker 파일 - 은지 - -->
         <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/EJ/datepicker/air-datepicker/dist/css/datepicker.min.css">
         <!-- 게시판 style.css - 은지 - -->
         <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/EJ/style.css">
         <link href="https://fonts.googleapis.com/css?family=Space+Mono" rel="stylesheet">
         
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
      .container{
     	position: relative;
    	top: -42px;
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
         height : 73px !important;
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
          height: 112px;
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
      #fh5co-logo{
     	margin-top: 10px !important;
      }
      .item3{
      	justify-content: flex-start !important;
      }
      .item3 > label,
      .item3 > input{
      	margin-left : 22px !important;
      }
      #Loc2{
   	    position: relative !important;
	    left: -43px !important;
	  }
	  #datepicker{
	  	margin-left:33px !important;
	  }
	  .container-map > h3 {
	  	margin-left: 3px !important;
	  }
	  .note-btn{
	  	margin-top:20px !important;
	  }
	  .note-btn-group > button{
	  	height: 39px !important;
	  }
	  .modal-footer{
	    display: flex;
	    justify-content: center;
	    flex-direction: column;
	    align-items: center;
	  }
	  .modal-footer > button, 
	  .modal-footer > a{
	  	margin : 0;
	  }
	  .modal-footer > div.btn-set > button{
		border : none;
		background: none;
	  }
	  .modal-content{
	  	height : 48vh !important;
	  }
	  .modal-product{
	  	border-bottom: 1px solid #e5e5e5;
   	 	height: 15%;
	  }
	  .modal-body > label > input{
	  	margin-right:10px;
	  }
	  .chkNotice{
	  	display : flex;
	  	justify-content:center;
	  }
	  div.chkNotice > p:nth-child(1){
	  	margin-right:5px !important;
	  }
	  div.chkNotice > p:nth-child(2){
	  	margin-right:5px;
	  	color:red;
	  }
	  .info-price-parent{
	  	display: flex;
	    justify-content: center;
	    align-items: center;
	    width:50%;
	    border: 0.1px solid gray;
	  }
	  .info-price-parent > div.price{
	  	    width: 45%;
    		text-align: end;
	  }
	  .info-total{
	  	font-size: 2.5rem;
	  }
	  .modal-body{
	  	display:flex;
	  	flex-wrap:wrap;
	  }
	  .price-con{
	  	width:50%;
	  }
	  .price-con > label > input{
	  	margin-right:5px;
	  }
	  .modal-body > h7{
	  	width:100%;
	  	font-size: 1.5rem;
	  	margin-bottom:11px;
	  }	
	  .dolor{
	  	margin-left: 5px;
	  }
      </style>
      <script>
      var id = '${loginUser}';
      </script>    
   </head>
<body>
<!-- 헤더시작 -->
<%@ include file="/WEB-INF/views/el/Socket/alarm.jsp" %>


<header>
   <div class="fh5co-nav" role="navigation">
      <div class="top-menu">
         <div class="container-fluid">
            <div class="row">
               <div class="col-xs-2">
                  <div id="fh5co-logo" ><a href="./">ImFind<span>.</span></a></div>
               </div>
               <div class="col-xs-10 text-right menu-1">
                  <ul>
                    <li class="has-dropdown">
							<a href="#">습득물 조회 <i class="fas fa-sort-down"></i></a>
							<ul class="dropdown">
								<!-- Button to trigger modal -->
								<li><a href="index.if">경찰청</a></li>
								<li><a href="etc_index.if">etc</a></li>
								<li><a href="select.if">지역으로 찾기</a></li>
								<li> <a href="#" onclick="window.open('https://www.handphone.or.kr/','','height=800px, width=800px')">핸드폰찾기</a></li>
							</ul>
					  </li>
                      <li class="has-dropdown">
                        <a href="">분실물 등록<i class="fas fa-sort-down"></i></a>
                        <ul class="dropdown">
                           <li><a href="./itemboard">물건</a></li>
                           <li><a href="./petboard">동물</a></li>
                        </ul>
                     </li>
                     <li class="has-dropdown">
                        <a href="">분실물 조회 <i class="fas fa-sort-down"></i></a>
                        <ul class="dropdown">
                           <li><a href="./item">물건</a></li>
                           <li><a href="./pet">동물</a></li>
                        </ul>
                     </li>
                     <c:if test="${loginUser} eq null">
                        <li class="btn-cta"><a href="./login"><span>Login</span></a></li> 
                        <li class="btn-cta"><a href="./register"><span >회원가입</span></a></li> 
                     </c:if>
                        <li class="btn-cta"><a href="./logout"><span>Logout</span></a></li> 
                        <li class="btn-cta"><a href="./mypage"><span >마이페이지</span></a></li>                
                  </ul>
               </div>
            </div>
         </div>
      </div>
   </div>
</header>
<!-- 헤더 끝 -->

<section style="height:150vh;">
   <!-- 분실물 등록 게시판 은지 -->
   <div class="container">
      <form name="boardform" action="./itemInsert" method="post" enctype="multipart/form-data">
         <!-- 타이틀  -->
         <div class="item1">
            <h8>분실글 등록하기(물품)</h8>
            <h8>* 필수입력사항</h8>
         </div>
         <div class="item2">
            <h6>작성자</h6>
            <input type="hidden" name="id" value="${loginUser}">
            <h6>${loginUser}</h6>
         </div>
         <!-- 필수입력사항   -->
         <div class="item3">
            <h6>분실 물품(*)</h6>
            <label><input type="radio" name="Lost_Item" onClick="this.form.textbox.disabled=true" value="핸드폰" checked="checked">핸드폰</label> 
            <label><input type="radio" name="Lost_Item" onClick="this.form.textbox.disabled=true" value="지갑"> 지갑</label> 
            <label><input type="radio" name="Lost_Item" onClick="this.form.textbox.disabled=true" value="가방"> 가방</label> 
            <label><input type="radio" name="Lost_Item" onClick="this.form.textbox.disabled=true" value="귀금속"> 귀금속</label>
            <label><input type="radio" name="Lost_Item" onClick="this.form.textbox.disabled=true" value="현금"> 현금</label>  
            <label><input type="radio" name="Lost_Item" onClick="this.form.textbox.disabled=false" value="etc"> 기타</label> 
            <input type="text" name="Lost_Item" id="textbox" class="form-control" placeholder="직접입력" disabled required>
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
            <h6>분실 날짜(*)</h6>
            <input id="datepicker" type="text" name="Lost_Date" placeholder="날짜를 선택해주세요." required autocomplete="off">
         </div>
         <div class="item6">
            <h6>분실 위치</h6>
            <!-- 지도 불러오기  -->
            <div class="container-fluid map" style="width: 1000px;">
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
               <!-- <input type="text" id="centerAddr" name="Lost_Loc" disabled>인근 -->
                  <div id="map" style="width: 350px; height: 350px;"></div>
                  </div>
               </div>
            </div>
         </div>
         <!-- 필수입력사항 -->
         <div class="item7">
            <h6>제 목(*)</h6>
            <div class="item7_box"><input type="text" class="lost_title" name="Lost_Title" placeholder="제목을 입력하세요" required  required autocomplete="off"></div>
         </div>      
         <!--  필수입력사항 --> 
         <div class="item8"><h6>내 용</h6></div>
         <div class="item8_1"><textarea id="summernote" name="Lost_Content"></textarea></div>
         
         <div class="item10"><h6>사례금</h6>
         <!-- 모달을 열기 위한 버튼 data-toggle="modal" data-target="#myModal" -->
         <button type="button" onClick="return inputcheck()" id="paybtn">결제하기</button></div>
         <input type="hidden" name="PayCode">
         <!-- 모달 영역 -->
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
               <div class="modal-dialog" role="document">
                  <div class="modal-content">
                     <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              <span aria-hidden="true">×</span></button>
                        <h4 class="modal-title" id="myModalLabel">사례금 결제하기</h4>
                     </div>
                     <div class="modal-body" id="lostpay">
                        <h7>사례금선택</h7>
                        <div class="price-con">
	                        <label><input type="radio" name="Lost_Pay" onClick="this.form.paybox.disabled=true" value="5000" >5,000원</label><br> 
	                        <label><input type="radio" name="Lost_Pay" onClick="this.form.paybox.disabled=true" value="10000"> 10,000원</label> <br>
	                        <label><input type="radio" name="Lost_Pay" onClick="this.form.paybox.disabled=true" value="15000"> 15,000원</label> <br>
	                        <label><input type="radio" name="Lost_Pay" onClick="this.form.paybox.disabled=true" value="20000"> 20,000원</label><br>
	                        <label><input type="radio" name="Lost_Pay" onClick="this.form.paybox.disabled=true" value="25000"> 25,000원</label>  <br>
	                        <label><input type="radio" name="Lost_Pay" onClick="this.form.paybox.disabled=false" value=""> 직접입력</label> <br>
	                        <label><input type="text" name="Lost_Pay" id="paybox" class="paybox" onkeyup="cmaComma(this);" onchange="cmaComma(this);" 
	                        oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" pattern='\d*' placeholder="직접입력" disabled required></label>
                        </div>
                       	<div class="info-price-parent">
							<div class="info-total">결제금액</div>
							<div class="price" id="price">0</div>
							<div class="dolar">원</div>
						</div>
                     </div>
                     <div class="modal-footer">
	                     <div class="pay-confirm">
	                     	<div class="chkNotice">
	                     		<input type="radio" name="pay-clause"/> 
                     			<p>[필수]</p> 
                     			<p>결제한 사례금의 2주 거치기간 만료 후 자동 환불에 동의합니다.</p>
	                     	</div>
	                     </div>
	                     <div class="btn-set">
	                        <a href="javascript:void(0);" onClick="return pay();" >확인</a>&nbsp;&nbsp;
	                        <button type="button" class="" data-dismiss="modal">취소</button>
	                     </div>
                     </div>
                </div>
            </div>
         </div>
         <div class="btn">
            <button type="submit">확인</button>
            <a href="index">취소</a>
         </div>
      </form>
   </div>
</section>
      <!--게시글 등록 js 시작-은지 -->
      <script src="${pageContext.request.contextPath}/resources/el/js/itemboard.js"></script>
    <!--게시글 등록 js 끝-은지 -->
       <!-- 아임포트 시작-->
      <script src="http://service.iamport.kr/js/iamport.payment-1.1.5.js"></script> 
      <!-- 아임포트 끝-->
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
      
</body>
</html>