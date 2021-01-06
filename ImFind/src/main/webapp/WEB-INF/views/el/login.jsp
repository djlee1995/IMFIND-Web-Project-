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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/css/style.css" type="text/css">

</head>
 <!-- 모든 페이지에 적용되는 head 설정 끝-->
 
<style>
.modal_overlay{
	display : flex;
	justify-content : center;
	align-items: center;
	position: fixed;
	left : 0;
	right : 0;
	top : 0;
	bottom : 0;
	z-index : 10000;
	height : 100vh;
	background : rgba(0, 0, 0, 0.6); 
}
.modal_box{
	width : 30vw;
	height : 60vh;
	padding : 1em;
	border-radius : 0.2em;
	background : white;
	padding: 16px 0;
}
.hidden{
	display : none;
}
.forget-pass:hover{
	cursor : pointer;
}
.modal_box > .container{
	height : 100%;
	display : flex;
	flex-direction : column;
}
.modal_box > .container section{
	flex-basis : 90%;
	padding : auto 5px;
	font-size : 14px;
}
.modal_box > .container header{
	align-self : center;
}
.find-id > .group-input.label{
	display : flex;
	flex-direction : column;
	width : 22%;
	margin-right:23px;
}
.find-id > .group-input.input{
	display : flex;
	flex-direction : column;
	width : 70%;
}
.find-id > .group-input input, label{
	margin-bottom: 9px;
}
.find-id > .group-input input{
	border : 1px solid #ebebeb;
}
.find-id{
	display : flex;
	width: 100%;
	margin-top : 1rem;
	flex-wrap : wrap;
}
.find-btn{
	background : #ebebeb;
	border : none;
	color : gray;
	padding : 5px;
	margin : 0 auto;
	display : block;
	font-size : 11px;
}
.find-btn:hover{
	background : gray;
	color : #ebebeb;
}
.input-code {
	display : none;
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
	
	<!-- 모달창 -->
	<div class="modal_overlay hidden">
		<div class="modal_box">
			<div class="container">
				<header>
					<p>아이디/비밀번호 찾기</p>
				</header>
				<section>
						아이디 찾기
					<form action="" method="POST" id="getID">
						<div class="find-id">
							<div class="group-input label">
				                <label for="irum">이름 *</label>
				                <label for="pw">E-mail *</label>
				                <label for="code-id " class="input-code hidden">인증번호 *</label>
				            </div>
							<div class="group-input input">
				                <input type="text" id="irum" >
				                <input type="email" id="pw">
				                <input type="text" id="code-id " class="input-code hidden" placeholder="인증번호를 입력하세요"/>
				            </div>
				            <button class="find-btn id" class="input-code hidden">인증번호 발송</button>
						</div>
					</form>
						비밀번호 찾기
					<form action="" id="getPW">
						<div class="find-id pass">
							<div class="group-input label">
				                <label for="id-find">아이디 *</label>
				                <label for="pw-find">E-mail *</label>
				                <label for="code-pw" class="input-code">인증번호 *</label>
				            </div>
							<div class="group-input input">
				                <input type="text" id="id-find">
				                <input type="email" id="pw-find"> 
				                <input type="text" id="code-pw " class="input-code hidden" placeholder="인증번호를 입력하세요"/>
				           
				            </div>
				            <button class="find-btn pw">인증번호 발송</button>
						</div>
					</form>
				</section>
				<footer>
		            <button class="close">닫기</button>
				</footer>
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
                                      <input type="checkbox" id="save-pass">
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
    <script src="${pageContext.request.contextPath}/resources/el/js/login.js"></script>

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