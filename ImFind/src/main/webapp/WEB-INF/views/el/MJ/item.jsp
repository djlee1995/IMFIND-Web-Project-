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
</style>
</head>

<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header Section Begin -->
	<header class="header-section">
		<div class="header-top">
			<div class="container">
				<div class="ht-left">
					<div class="mail-service">
						<i class=" fa fa-envelope"></i> hello.colorlib@gmail.com
					</div>
					<div class="phone-service">
						<i class=" fa fa-phone"></i> +65 11.188.888
					</div>
				</div>
				<div class="ht-right">
					<a href="#" class="login-panel"><i class="fa fa-user"></i>Login</a>
					<div class="lan-selector">
						<!-- 이미지 못 찾는 영역  
                        <select class="language_drop" name="countries" id="countries" style="width:300px;">
                            <option value='yt' data-image="img/flag-1.jpg" data-imagecss="flag yt"
                                data-title="English">English</option>
                            <option value='yu' data-image="img/flag-2.jpg" data-imagecss="flag yu"
                                data-title="Bangladesh">German </option>
                        </select> -->
					</div>
					<div class="top-social">
						<a href="#"><i class="ti-facebook"></i></a> <a href="#"><i
							class="ti-twitter-alt"></i></a> <a href="#"><i
							class="ti-linkedin"></i></a> <a href="#"><i class="ti-pinterest"></i></a>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="inner-header">
				<div class="row">
					<div class="col-lg-2 col-md-2">
						<div class="logo">
							<a href="./index"> <img
								src="${pageContext.request.contextPath}/resources/el/img/logo.png"
								alt="">
							</a>
						</div>
					</div>
					<div class="col-lg-7 col-lg-7">
						<div class="advanced-search">
							<button type="button" class="category-btn">All
								Categories</button>
							<form action="#" class="input-group">
								<input type="text" placeholder="What do you need?">
								<button type="button">
									<i class="ti-search"></i>
								</button>
							</form>
						</div>
					</div>
					<div class="col-lg-3 text-right col-lg-3">
						<ul class="nav-right">
							<li class="heart-icon"><a href="#"> <i
									class="icon_heart_alt"></i> <span>1</span>
							</a></li>
							<li class="cart-icon"><a href="#"> <i
									class="icon_bag_alt"></i> <span>3</span>
							</a>
								<div class="cart-hover">
									<div class="select-items">
										<table>
											<tbody>
												<tr>
													<td class="si-pic"><img
														src="${pageContext.request.contextPath}/resources/el/img/select-product-1.jpg"
														alt=""></td>
													<td class="si-text">
														<div class="product-selected">
															<p>$60.00 x 1</p>
															<h6>Kabino Bedside Table</h6>
														</div>
													</td>
													<td class="si-close"><i class="ti-close"></i></td>
												</tr>
												<tr>
													<td class="si-pic"><img
														src="${pageContext.request.contextPath}/resources/el/img/select-product-2.jpg"
														alt=""></td>
													<td class="si-text">
														<div class="product-selected">
															<p>$60.00 x 1</p>
															<h6>Kabino Bedside Table</h6>
														</div>
													</td>
													<td class="si-close"><i class="ti-close"></i></td>
												</tr>
											</tbody>
										</table>
									</div>
									<div class="select-total">
										<span>total:</span>
										<h5>$120.00</h5>
									</div>
									<div class="select-button">
										<a href="#" class="primary-btn view-card">VIEW CARD</a> <a
											href="#" class="primary-btn checkout-btn">CHECK OUT</a>
									</div>
								</div></li>
							<li class="cart-price">$150.00</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="nav-item">
			<div class="container">
				<div class="nav-depart">
					<div class="depart-btn">
						<i class="ti-menu"></i> <span>All departments</span>
						<ul class="depart-hover">
							<li class="active"><a href="#">Women’s Clothing</a></li>
							<li><a href="#">Men’s Clothing</a></li>
							<li><a href="#">Underwear</a></li>
							<li><a href="#">Kid's Clothing</a></li>
							<li><a href="#">Brand Fashion</a></li>
							<li><a href="#">Accessories/Shoes</a></li>
							<li><a href="#">Luxury Brands</a></li>
							<li><a href="#">Brand Outdoor Apparel</a></li>
						</ul>
					</div>
				</div>
				<nav class="nav-menu mobile-menu">
					<ul>
						<li><a href="./index">Home</a></li>
						<li><a href="./shop">Shop</a></li>
						<li><a href="#">Collection</a>
							<ul class="dropdown">
								<li><a href="#">Men's</a></li>
								<li><a href="#">Women's</a></li>
								<li><a href="#">Kid's</a></li>
							</ul></li>
						<li><a href="./blog">Blog</a></li>
						<li><a href="./contact">Contact</a></li>
						<li><a href="#">Pages</a>
							<ul class="dropdown">
								<li><a href="./blog-details">Blog Details</a></li>
								<li><a href="./shopping-cart">Shopping Cart</a></li>
								<li><a href="./check-out">Checkout</a></li>
								<li><a href="./faq">Faq</a></li>
								<li><a href="./register">Register</a></li>
								<li><a href="./login">Login</a></li>
							</ul></li>
					</ul>
				</nav>
				<div id="mobile-menu-wrap"></div>
			</div>
		</div>
	</header>
	<!-- Header End -->

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
	<div class="dropdown">
		<div class="dropdown-select">
			<select>
				<option value="">시 선택</option>
				<option value="부천시">부천시</option>
				<option value="의정부시">의정부시</option>
				<option value=""></option>
			</select> <select>
				<option value="">구 선택</option>
				<option value="원미구">원미구</option>
				<option value="소사구">소사구</option>
			</select> <select>
				<option value="">동 선택</option>
				<option value="중동">중동</option>
				<option value="여월동">여월동</option>
			</select> <i class="fa fa-caret-dow`n icon"></i>
			<button type="submit" class="select-btn">검색</button>
		</div>
	</div>

<h1 id="paging-head">df</h1>
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
	<!--게시글 등록 js 시작-MJ -->
        <script src="${pageContext.request.contextPath}/resources/el/js/item.js"></script>
        <!--게시글 등록 js 끝-<J -->
	
</body>


</html>