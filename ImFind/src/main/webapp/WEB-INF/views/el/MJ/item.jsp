<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="UTF-8">
<meta name="description" content="Fashi Template">
<meta name="keywords" content="Fashi, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>I'm Find</title>
<!-- Google Font --
    <link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">
    <!-- Css Styles -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/el/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/el/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/el/css/themify-icons.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/el/css/elegant-icons.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/el/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/el/css/nice-select.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/el/css/jquery-ui.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/el/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/el/css/style.css"
	type="text/css">
<!-- 조회페이지 css (mj) -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/el/MJ/item.css" type="text/css">
<!-- Bootstrap cdn 설정  for 페이징  -->	
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">	
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">	
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">	
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>	
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
#paging-head{
position : fixed;
z-index : 100;
}
.dropbtn {
  background-color: #ea2129;
  color: white;
  padding: 16px;
  font-size: 16px;
  border: none;
}
.dropdown {
  position: relative;
  display: inline-block;
}
.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f1f1f1;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}
.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}
.dropdown-content a:hover {background-color: #ddd;}
.dropdown:hover .dropdown-content {display: block;}
.dropdown:hover .dropbtn {background-color: #3e8e41;}
</style>
</head>
<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>
	<!-- <div class="container1"> -->
	<div class="container1">
		<div class="row1">
			<div id="custom-search-input">
				<div class="input-group col-md-12">
					<input type="text" class="input-lg" name="input-search" 
						onKeypress="enterkey();" placeholder="search.."/ > 
						<span class="input-group-btn" >
						<button class="btn" type="button" >
							<i class="ti-search"></i>
						</button>
					</span>
				</div>
			</div>
		</div>
	</div>
	 <div class = "si">
    <select id="sido">
      <option value="">시/도 선택하세요</option>
    </select>
    <select id="sigugun">
      <option value="">시/군/구 선택하세요</option>
    </select>
    <select id="dong">
      <option value="">읍/면/동 선택하세요</option>
    </select>
  </div>
	<div class="card-list-con">
		<div id="ajax-test-div" style="width: 70vw;">
	</div>
	<nav aria-label="...">
  <ul class="pagination pagination-sm" id = "numbers_mypage_post1">
  </ul>
	</nav>
	</div>
	<!-- Footer Section Begin -->
	<footer class="footer-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="footer-left">
						<div class="footer-logo">
							<a href="#"><img
								src="${pageContext.request.contextPath}/resources/el/img/footer-logo.png"
								alt=""></a>
						</div>
						<ul>
							<li>Address: 60-49 Road 11378 New York</li>
							<li>Phone: +65 11.188.888</li>
							<li>Email: hello.colorlib@gmail.com</li>
						</ul>
						<div class="footer-social">
							<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
								class="fa fa-instagram"></i></a> <a href="#"><i
								class="fa fa-twitter"></i></a> <a href="#"><i
								class="fa fa-pinterest"></i></a>
						</div>
					</div>
				</div>
				<div class="col-lg-2 offset-lg-1">
					<div class="footer-widget">
						<h5>Information</h5>
						<ul>
							<li><a href="#">About Us</a></li>
							<li><a href="#">Checkout</a></li>
							<li><a href="#">Contact</a></li>
							<li><a href="#">Serivius</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-2">
					<div class="footer-widget">
						<h5>My Account</h5>
						<ul>
							<li><a href="#">My Account</a></li>
							<li><a href="#">Contact</a></li>
							<li><a href="#">Shopping Cart</a></li>
							<li><a href="#">Shop</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="newslatter-item">
						<h5>Join Our Newsletter Now</h5>
						<p>Get E-mail updates about our latest shop and special
							offers.</p>
						<form action="#" class="subscribe-form">
							<input type="text" placeholder="Enter Your Mail">
							<button type="button">Subscribe</button>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="copyright-reserved">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="copyright-text">
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							Copyright &copy;
							<script>
								document.write(new Date().getFullYear());
							</script>
							All rights reserved | This template is made with <i
								class="fa fa-heart-o" aria-hidden="true"></i> by <a
								href="https://colorlib.com" target="_blank">Colorlib</a>
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						</div>
						<div class="payment-pic">
							<img
								src="${pageContext.request.contextPath}/resources/el/img/payment-method.png"
								alt="">
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- Footer Section End -->
	<!-- Js Plugins -->
	<script
		src="${pageContext.request.contextPath}/resources/el/js/jquery-3.3.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/el/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/el/js/jquery-ui.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/el/js/jquery.countdown.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/el/js/jquery.nice-select.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/el/js/jquery.zoom.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/el/js/jquery.dd.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/el/js/jquery.slicknav.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/el/js/owl.carousel.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/el/js/main.js"></script>
	<!--게시글 조회 js 시작-MJ -->
        <script src="${pageContext.request.contextPath}/resources/el/js/item.js"></script>
    <!--게시글 조회 js 끝-MJ -->
    <!--게시글 조회 행정동js 시작-MJ -->
    	  <script src="${pageContext.request.contextPath}/resources/el/MJ/hangjungdong.js"></script>
    <!--게시글 조회 행정동js 끝-MJ -->
</body>
</html>