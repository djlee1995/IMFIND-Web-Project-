<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
 
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/css/style.css?after" type="text/css">
 	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/home/css/css_YH.css?after" type="text/css">
 	    
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
    <!-- <link href="https://fonts.googleapis.com/css?family=Work+Sans:300,400,500,700,800" rel="stylesheet">	 -->
	<link href="https://fonts.googleapis.com/css?family=Space+Mono" rel="stylesheet">
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
	
	
	
    <!-- 유희 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/YH/css/login.css?after" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/home/css_YH.css?after" type="text/css">
</head>
 <!-- 모든 페이지에 적용되는 head 설정 끝-->
 
<style>
 .row{
 
 }
</style>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Header Section Begin -->
   	<jsp:include page="${request.contextPath}/el/header"></jsp:include>
    <!-- Header End -->
	
	<!-- 아이디 찾기, 비밀번호 찾기 선택 모달창 -->
	<div class="modal_overlay-1 hidden">
		<div class="modal_box-1">
			<div class="container-1">
		     	<div class="fas-con 1"><i class="fas fa-times close" id="close"></i></div>
				<div class="give-me id">아이디 찾기</div>
				<div class="give-me pw">비밀번호 찾기</div>
			</div>
		</div>
	</div>
	<!-- 아이디 찾기 모달창 -->
	<div class="modal_overlay-2 hidden">
		<div class="modal_box-1" style="width:24vw;">
			<div class="container-1">
				<div class="modal-header">
					<i class="fas fa-chevron-left"></i>
					<span name="head">아이디 찾기</span>
			     	<div class="fas-con"><i class="fas fa-times close" id="close"></i></div>
				</div>
				<form action="" method="POST" id="getID">
					<div class="find-id">
						<div class="group-input label">
			                <label for="irum">이름 *</label>
			                <label for="pw">E-mail *</label>
			                <label for="code-id" class="input-code-id first">인증번호 *</label>
			            </div>
						<div class="group-input input">
			                <input type="text" id="irum" >
			                <input type="email" placeholder="회원가입시 입력한 이메일">
			                <input type="text" id="code-id" class="input-code-id first" placeholder="인증번호를 입력하세요"/>
			                <div id="code-id-inputfield" class="input-code-id first timer"></div>
			            </div>
			            <div class="find-btn-container">
				            <button type="button" class="find-btn id" >인증번호 발송</button>
				            <button type="button" class="input-code-id find-btn" id="submit-btn-1" >인증하기</button>
			            </div>
					</div>
		            <div class="link-tag find-pw">비밀번호 찾기</div>
				</form>
			</div>
		</div>
	</div>
	<!-- 비밀번호 찾기 모달창 -->
	<div class="modal_overlay-3 hidden">
		<div class="modal_box-1" style="width:24vw;">
			<div class="container-1">
				<div class="modal-header">
					<i class="fas fa-chevron-left 2"></i>
					<span name="head-pw">비밀번호 찾기</span>
			     	<div class="fas-con"><i class="fas fa-times close" id="close"></i></div>
				</div>
				<form action="" method="POST" id="getPW">
					<div class="find-id pw">
						<div class="group-input label">
			                <label for="user-id">아이디 *</label>
			                <label for="pw">E-mail *</label>
			                <label for="code-pw" class="input-code-pw first">인증번호 *</label>
			            </div>
						<div class="group-input input">
			                <input type="text" id="user-id" >
			                <input type="email" id="pw">
			                <input type="text" id="code-pw" class="input-code-pw first" placeholder="인증번호를 입력하세요"/>
			                <div id="code-pw-inputfield" class="input-code-pw first timer"></div>
			            </div>
			            <div class="find-btn-container">
				            <button type="button" class="find-btn pw" >인증번호 발송</button>
				            <button type="button" class="input-code-pw find-btn" id="submit-btn-2" >인증하기</button>
			            </div>
					</div>
		            <div class="link-tag find-id">아이디 찾기</div>
				</form>
			</div>
		</div>
	</div>
	
	

  <!-- Register Section Begin -->
  <div class="register-login-section spad">
      <div class="container">
          <div class="row">
              <div class="col-lg-6 offset-lg-3">
                  <div class="login-form">
                      <h2>Login</h2>
                      <form action="#" id="loginForm">
               			<!-- 아이디, 비번 입력  -->
                          <div class="group-input id">
                              <label for="username">ID *</label>
                              <input type="text" id="username">
                          </div>
                          <div class="group-input pass">
                              <label for="pass">Password *</label>
                              <input type="password" id="pass">
                          </div>
                          <div class="group-input gi-check">
                              <div class="gi-more">
                                  <label for="save-pass">
                                      Save Password
                                      <input type="checkbox" id="savePass" name="savePass">
                                      <span class="checkmark"></span>
                                  </label>
                                  <!-- 아이디, 비밀번호 찾기 -->
                                  <span class="forget-pass">Forget your ID/Password</span>
                              </div>
                          </div> 
                          <!-- 로그인 버튼 -->
                          <button type="submit" class="site-btn login-btn">로그인</button>
                          <img id="kakao-login-btn" src="${pageContext.request.contextPath}/resources/el/img/kakao_login_medium_wide.png" alt="" />
                      </form>
                      <div class="switch-login">
                          <a href="./register" class="or-login">회원가입</a>
                      </div>
                  </div>
              </div>
          </div>
      </div>
  </div>
  <!-- Register Form Section End -->

</body>
    <!-- YH -->
    <script src="${pageContext.request.contextPath}/resources/el/YH/js/login.js?after"></script>

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

</html>