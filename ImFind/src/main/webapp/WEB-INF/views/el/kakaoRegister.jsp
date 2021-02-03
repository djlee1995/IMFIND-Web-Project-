<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

 
 <!-- 모든 페이지에 적용되는 head 설정 -->
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Fashi Template">
    <meta name="keywords" content="Fashi, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>I'm Find</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">
<%--      <!-- Header Section Begin -->
      <jsp:include page="${request.contextPath}/NewHeader_CSS"></jsp:include>
    <!-- Header End --> --%>

    <!-- Css Styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/css/themify-icons.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/css/style.css" type="text/css">
    	<!-- Theme style  -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/home/css/style.css?after">
	<!-- <link href="https://fonts.googleapis.com/css?family=Work+Sans:300,400,500,700,800" rel="stylesheet">	 -->
	<link href="https://fonts.googleapis.com/css?family=Space+Mono" rel="stylesheet">
	<!-- 폰트 어썸 css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
    <!-- Animate.css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/home/css/animate.css">
    <!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/home/css/icomoon.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/home/css/icomoon.css">
	
	<!-- Magnific Popup -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/home/css/magnific-popup.css">
	<!-- Flexslider  -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/home/css/flexslider.css">
	
	<!-- Modernizr JS -->
	<script src="${pageContext.request.contextPath}/resources/home/js/modernizr-2.6.2.min.js"></script>
	
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/home/css/css_YH.css?after" type="text/css">

</head>

<!-- 유희 css -->
<style>
 @import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
   .notosanskr * { 
         font-family: 'Noto Sans KR', sans-serif;
   }
   
   form{
         font-family: 'Noto Sans KR', sans-serif !important;
   }
   .col-lg-5{
      margin : 0 auto !important;
   }
   .group-input.label{
      margin-left:10px !important;
   }
   input[id="tel"]{
      width:80px !important;
   }
   .site-btn.certification-api{
      width : 85px;
      height: 49px;
      padding : 0;
      padding-top : 14px;
      margin-left : 10px;
      text-align : center;
      border-radius : 3px;
   }  
   .group-input.tel{
      display: flex;
      align-items: center;
      flex-wrap:wrap;
   }
   .site-btn.policy{
      margin : 0 auto;
      display : block;
      background : #317AE1;
   }
    .grid-form{
      display : grid;
      grid-template-columns: 0.4fr 1fr !important;
      /* grid-template-rows : 80px 150px 80px 80px 205px 100px 100px !important; */
      grid-template-rows :150px 80px 80px 205px 100px 100px !important;
   } 
   .register-form form .group-input label, .login-form form .group-input label{
      font-size : 14px !important;;
/*       //width : 80%; */
   }
   button[class ~= "register-btn"]{
      grid-column: auto / span 2;
   }
   input[type="number"]::-webkit-outer-spin-button,
   input[type="number"]::-webkit-inner-spin-button {
       -webkit-appearance: none;
       margin: 0;
   }
   .register-form form .group-input input, .login-form form .group-input input {
       border: 1px solid #ebebeb;
       height: 37px;
       width: 93%;
       padding-left: 20px;
       padding-right: 15px;
       margin-right : 9px;
   }
   .col-lg-5{
      padding-top: 35px !important;
      border: 1px solid rgba(0, 0, 0, .2) !important;
      margin-top: 69px !important;
      border-radius : 2px !important;
   }
   .col-lg-5 h2{
      font-family: 'Noto Sans KR', sans-serif;
   }
   div.site-btn:nth-child(4){
      width: 93%;
      position: relative;
      left: -10px;
      height: 19%;
      top: 9px;
      text-align: center;
      background : #317AE1;
   }
   .site-btn.certification-api.account, 
   .site-btn.policy{
      display : flex;
      justify-content: center;
      align-items: center;
   }
   .site-btn-policy{
         margin : 0;
         width: 93%;
      height: 39px;
      border-radius: 3px;
   }
   .site-btn.certification-api.account > div{
      margin-bottom : 14px;
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
   .col-xs-2 {
       width: 16.66667%;
       padding-left:15px;
   }
   .col-xs-10 {
       width: 83.33333%;
       padding-right:15px;
   }
   .fh5co-nav a {
       padding: 5px 10px;
       color: #000;
   }
   input::placeholder {
     color: gray;
     font-size : 0.8em;
     font-style: italic;
   }
   .site-btn.certification-api.account {
     witdh: 52px;
     height: 36px;
   }
   #account {
     witdh: 160px;
   }
   .account_box {
     display: flex;
     margin-right: 22px;
   }
   .input-group.mb-1 {
     width: 305px;
   }
   .input-group.mb-1 {
   	 display: flex;
   }
   #inputGroupBirth {
    margin: 0px; 
   }
   .site-btn.register-btn {
     width: 221px;
     height: 46px;
     margin-left: 130px;
   }
</style>
<body onload="bankList();">

    <%
       if(session.getAttribute("loginUser") == null && session.getAttribute("kakaoLoginUser") == null){
    %>
            <jsp:include page="${request.contextPath}/el/header"></jsp:include>      
    <%
       } else{
    %>
            <jsp:include page="${request.contextPath}/el/afterLoginHeader"></jsp:include>      
   <%
       }
   %>


    <!-- Register Section Begin -->
    <div class="register-login-section spad">
        <div class="container">
             <div class="row">
                <div class="col-lg-5 offset-lg-4">
                    <div class="register-form">
                        <h2 style="font-size:1.5rem;">회원정보 등록하고 IMFIND를 이용해주세요</h2>
                        
                        <form action="./processJoin" class="grid-form" method="post">
                   		    <input type="hidden" id="username" name="id" value="${kakaoLoginUser}">
                    		<div class="group-input label">
                                <label for="pass" >Password *</label>
                            </div>
                            <div class="group-input">
                                <input type="password" id="pass" placeholder="비밀번호를 입력해주세요" style="margin-bottom: 4px;" name="pw" autocomplete="false" required>
                                <input type="password" id="pass2" placeholder="비밀번호 확인을 위해 다시 한 번 입력해주세요" autocomplete="false" required>
                                <span style="font-size:0.7rem;">최소 8자리 이상 <br> 영어 대문자, 소문자, 숫자, 특수문자 중 3종류 조합</span>
                            </div> 
                            <div class="group-input label">
                                <label for="name">이름 *</label>
                            </div>
                            <div class="group-input">
                                <input type="text" id="name" name="name" required>
                            </div>
                            <div class="group-input label">
                                <label for="email">이메일 *</label>
                            </div>
                            <div class="group-input">
                                <input type="text" id="email" name="email" required>
                                <span style="font-size : 0.5rem"></span>
                            </div>
                            <div class="group-input label">
                                <label for="account">계좌인증 *</label>
                            </div>
                         
                           <div class="group-input account" style="padding:0; margin-bottom : 0;">
                               <div class="input-group mb-1" style="margin-bottom:0; width: 303px;">
	                            	 <div class="input-group-prepend" style="height:38px; width: 66px; ">
                               		  <label class="input-group-text" for="inputGroupBirth" style="margin:0; height:38px; padding-left: 6px; width: 65px;">생년월일</label>
                           		   </div>
                                      <input type="date" id="inputGroupBirth" style="height:38px;width: 238px;"/>
                               </div>
								
                            	<div class="input-group mb-1" style="margin-bottom:0;">
									  <div class="input-group-prepend">
									    <label class="input-group-text" for="inputGroupSelect01" style="margin:0; height:38px;">은행명</label>
									  </div>
									  <select class="custom-select" id="inputGroupSelect01" style="height:38px; width:140px; padding-left: 22px; margin-right: 2px;" required onchange="getBank();">
									    <option selected id="defaultOption" disabled selected>선택</option>
									  </select>
								 	  <input type="hidden" name="bank"/>
								</div>
								
                                <div class="account_box">
		                             <input type="hidden" name="account_holder"> <!-- 추가 1.28 민정 -->
		                               <input type="number" id="account" name="account_num" style="margin-right: 0px;" placeholder="계좌번호를 입력하세요" required>
		                               <div class="site-btn certification-api account" style="margin-right: 3px;"><div>인증</div></div>
		                        </div>
                            </div>
                           
                            <div class="group-input label">
                                <label for="tel">휴대전화 *</label>
                            </div>
                            <div class="group-input tel" >
                              	 <input type="tel" id="phone" name="contact" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" required><br><br>
  								 <small>형식: 010-1234-5678</small><br><br>
                            </div>
                           
                            <input type="hidden" name="join_date"/>
                            <button type="submit" class="site-btn register-btn">REGISTER</button>
                        </form>
                    </div>
                </div>
			 </div>
        </div>
    </div>
<!-- 3-legged  -->
<form id="authorizeFrm" name="authorizeFrm" method="get" action="https://testapi.openbanking.or.kr/oauth/2.0/authorize" target="_authForm">
	    <input type="hidden" name="client_id" value="1245365a-f9f6-4ad8-b86d-fb42f8a9deb8"/>
	    <input type="hidden" name="scope" value="login inquiry transfer"/>
	    <input type="hidden" name="redirect_uri" value="http://localhost:8080/imfind/"/>
	    <input type="hidden" name="auth_type" value="0"/>
	    <input type="hidden" name="response_type" value="code"/>
	    <input type="hidden" name="state" value="12345678901234567890123456789012"/>
</form>

    <!-- Register Form Section End -->
    
    <!-- Partner Logo Section Begin -->
    <div class="partner-logo">
        <div class="container">
            <div class="logo-carousel owl-carousel">
                <div class="logo-item">
                    <div class="tablecell-inner">
                        <img src="${pageContext.request.contextPath}/resources/el/img/logo-carousel/logo-1.png" alt="">
                    </div>
                </div>
                <div class="logo-item">
                    <div class="tablecell-inner">
                        <img src="${pageContext.request.contextPath}/resources/el/img/logo-carousel/logo-2.png" alt="">
                    </div>
                </div>
                <div class="logo-item">
                    <div class="tablecell-inner">
                        <img src="${pageContext.request.contextPath}/resources/el/img/logo-carousel/logo-3.png" alt="">
                    </div>
                </div>
                <div class="logo-item">
                    <div class="tablecell-inner">
                        <img src="${pageContext.request.contextPath}/resources/el/img/logo-carousel/logo-4.png" alt="">
                    </div>
                </div>
                <div class="logo-item">
                    <div class="tablecell-inner">
                        <img src="${pageContext.request.contextPath}/resources/el/img/logo-carousel/logo-5.png" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Partner Logo Section End -->
    
    
     <script>
		document.addEventListener('DOMContentLoaded', function(){
			
			// click 이벤트
			 document.addEventListener('click', function(event){
				 //console.log(event);
				 if(event.target.classList.contains('certification-api')){
					 getBankToken(); 
				 }
			 });
			
			// input 이벤트 
			document.addEventListener('input', function(event){
				
				if(event.target.id == 'inputGroupSelect01'){
					optionStyle(event);
				}
				
				if(event.target.id){
					event.target.style.background = '#F2F7FB';
				} 
				//console.log(event.target.id)
			})
			
			// focusout 이벤트
			document.addEventListener('focusout', function(e){
				
				if(e.target.id == 'pass'){
					// 테스트를 위해 주석처리함.
					//chkPW(); 
				}
				if(e.target.id == 'pass2'){
				    chkEqualpw();
				}
				if(e.target.id == 'username'){
					chkID(e);
				}
				if(e.target.id == 'name'){
					getName(e);
				}
				//event.target.style.background = 'rgb(255, 255, 255)';
		});
	});
	 </script>	

</body>
  <!-- Js Plugins -->
   <script src="${pageContext.request.contextPath}/resources/el/YH/js/register.js"></script>
  <!-- 모든 페이지에 공통 적용되는 js 파일입니다.  -->
   <jsp:include page="${request.contextPath}/NewFooter_JS"></jsp:include>


</html>