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
</head>

<!-- 유희 css -->
<style>
	col-lg-6.offset-lg-3{
		
	}
	.group-input.label{
		margin-left:10px
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
	.group-input.box.tel{
		display: flex;
		align-items: center;
		flex-wrap:wrap;

	}
	.site-btn.policy{
		margin : 0 auto;
		display : block;
	}

 	.grid-form{
		display : grid;
		grid-template-columns: 0.5fr 1fr;
		grid-template-rows : 80px 150px 80px 80px 240px 100px 100px;
	} 
	.register-form form .group-input label, .login-form form .group-input label{
		font-size : 14px;
/* 		//width : 80%; */
	}
	button[class ~= "register-btn"]{
		grid-column: auto / span 2;
	}
	input[type="number"]::-webkit-outer-spin-button,
	input[type="number"]::-webkit-inner-spin-button {
	    -webkit-appearance: none;
	    margin: 0;
	}
</style>

<body onload="bankList();">
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Header Section Begin -->
   	<jsp:include page="${request.contextPath}/el/header"></jsp:include>
    <!-- Header End -->

    <!-- Register Section Begin -->
    <div class="register-login-section spad">
        <div class="container">
             <div class="row">
                <div class="col-lg-6 offset-lg-3">
                    <div class="register-form">
                        <h2 style="font-size:1.5rem;">회원가입</h2>
                        
                        <form action="./processJoin" class="grid-form" method="post">
                            <div class="group-input label">
                                <label for="username">ID *</label>
                            </div>
                            <div class="group-input box">
                                <input type="text" id="username" name="id" required>
        						<span id="warn_id" style="font-size : 0.5rem;"></span>
                            </div>
                            <div class="group-input label">
                                <label for="pass" >Password *</label>
                            </div>
                            <div class="group-input box">
                                <input type="password" id="pass" placeholder="비밀번호를 입력해주세요" name="pw" autocomplete="false" required>
                                <input type="password" id="pass2" placeholder="비밀번호 확인을 위해 다시 한 번 입력해주세요" autocomplete="false" required>
                                <span style="font-size:0.7rem;">최소 8자리 이상 : 영어 대문자, 소문자, 숫자, 특수문자 중 3종류 조합</span>
                            </div>
                            <div class="group-input label">
                                <label for="name">이름 *</label>
                            </div>
                            <div class="group-input box">
                                <input type="text" id="name" name="name" required>
                                <input type="hidden" name="account_holder">
                            </div>
                            <div class="group-input label">
                                <label for="email">이메일 *</label>
                            </div>
                            <div class="group-input box">
                                <input type="text" id="email" name="email" required>
                            </div>
                            <div class="group-input label">
                                <label for="account">계좌인증 *</label>
                            </div>
                            <!-- 계좌정보 입력 -->
                            <div class="group-input box account" style="padding:0;">
	                            <div class="input-group mb-1" style="width:100%; margin-bottom:0;">
	                            	 <div class="input-group-prepend">
									    <label class="input-group-text" for="inputGroupBirth" style="margin:0; height:38px;">생년월일</label>
									 </div>
									 <input type="date" id="inputGroupBirth" style="height:38px; width:73%;"/>
								</div>
								
                            	<div class="input-group mb-1" style="width:100%; margin-bottom:0;"">
								  <div class="input-group-prepend">
								    <label class="input-group-text" for="inputGroupSelect01" style="margin:0; height:38px;">은행명 </label>
								  </div>
								  <select class="custom-select" id="inputGroupSelect01" style="height:38px; width:140px;" required onchange="getBank();">
								    <option selected id="defaultOption" disabled selected>Choose...</option>
								  </select>
								  <input type="hidden" name="bank"/>
								</div>
                                <input type="number" id="account" name="account_num" placeholder="계좌번호를 입력하세요" required>
                                <div class="site-btn certification-api account">인증</div>
                            </div>
                            <!-- 계좌 정보 끝 -->
                            <div class="group-input label">
                                <label for="tel">휴대전화 *</label>
                            </div>
                            <div class="group-input box tel" >
                              	 <input type="tel" id="phone" name="contact" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" required><br><br>
  								 <small>형식: 010-1234-5678</small><br><br>
                            </div>
                            <div class="group-input label">
                                <label for="policy">개인정보 제공동의 *</label>
                            </div>
                            <div class="group-input box" >
                                <div class="site-btn policy" >동의하기</div>
                            </div>
                            <input type="hidden" name="join_date"/>
                            <button type="submit" class="site-btn register-btn">REGISTER</button>
                        </form>
                        <div class="switch-login">
                            <a href="./login" class="or-login">Or Login</a>
                        </div>
                    </div>
                </div>
			 </div>
        </div>
    </div>
    <!-- 3-legged -->
<form id="authorizeFrm" name="authorizeFrm" method="get" action="https://testapi.openbanking.or.kr/oauth/2.0/authorize" target="_authForm">
	    <input type="hidden" name="client_id" value="1245365a-f9f6-4ad8-b86d-fb42f8a9deb8"/>
	    <input type="hidden" name="scope" value="login inquiry transfer"/>
	    <input type="hidden" name="redirect_uri" value="http://localhost:8080/imfind/"/>
	    <input type="hidden" name="auth_type" value="0"/>
	    <input type="hidden" name="response_type" value="code"/>
	    <input type="hidden" name="state" value="12345678901234567890123456789012"/>
</form>
<!-- <form id="authorizeFrm" name="authorizeFrm" method="post" action="https://testapi.openbanking.or.kr/oauth/2.0/token" target="_authForm">
	    <input type="hidden" name="client_id" value="1245365a-f9f6-4ad8-b86d-fb42f8a9deb8"/>
	    <input type="hidden" name="client_secret" value="efa082ac-cad6-41ab-a97d-7e15a5734622"/>
	    <input type="hidden" name="scope" value="oob"/>
	    <input type="hidden" name="grant_type" value="client_credentials"/>
</form> -->


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
    
     <script src="${pageContext.request.contextPath}/resources/el/js/register.js"></script>
     
     <script>
		document.addEventListener('DOMContentLoaded', function(){
			
			// 클릭 이벤트
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
			
			// input focusout 이벤트
			document.addEventListener('focusout', function(e){
				
				if(e.target.id == 'pass'){
					//chkPW();
				}
				if(e.target.id == 'pass2'){
				    chkEqualpw();
				}
				if(e.target.id == 'username'){
					chkID(e);
				}
				if(e.target.id == "name"){
					getName(e);
				}
				event.target.style.background = 'rgb(255, 255, 255)';
		});
	});
	 </script>	

</body>
  <!-- 모든 페이지에 공통 적용되는 js 파일입니다.  -->
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

</html>