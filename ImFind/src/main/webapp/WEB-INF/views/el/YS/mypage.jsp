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
    
    <!-- 해당 페이지 스타일 202012311159-->
    
    <!--     <style type="text/css">
    
    form{
    width:500px;
    margin:10px auto;
    
    }
    
    -->
    
    
    
    
    
    
    
    </style>

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
    
    <!--sooAdd 202012311540  -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script> 
    <script type="text/javascript">
    //값불러올 작업 공간 
  //  http://localhost:8080/imfind/
    
    //=--------------------------------
    //목록 
	$(document).ready(function(){
		$('#output').empty(); 
		
		$.ajax({
			url:'/imfind/getElsedata.do',
			type:'POST',
			contentType:'application/x-www-form-urlencoded;charset=utf-8',
			
			success:function(data){
				$.each(data, function(index, item){	
					console.log(item);
					var output=' ' ;
					output += '<tr>';
					output += '<td>'+item.lost_PostNum+'</td>';
					output += '<td>'+item.lost_Title+'</td>';
					output += '<td>'+item.lost_Content+'</td>';
					output += '<td>'+item.lost_Re_Date+'</td>';
					output += '<td>'+item.lost_Re_Count+'</td>';
					output += '<td>'+item.lost_Pay+'</td>';
					output += '<td>'+item.lost_Item+'</td>';
					output += '<td>'+item.lost_Loc+'</td>';
					output += '<td>'+item.lost_Date+'</td>';
					output += '<tr>';
					console.log("output:"+output);
					$('#output').append(output);
				});
			},
				error:function(){
					alert("ajax통신 실패1!!!");			
				}
		});			
	});		
 //ready 끝
    
    
    </script>
    
    
    
    
</head>

<body>
<!-- 데이터 뿌려줄 바디안 -->
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
                        <i class=" fa fa-envelope"></i>
                        hello.colorlib@gmail.com
                    </div>
                    <div class="phone-service">
                        <i class=" fa fa-phone"></i>
                        +65 11.188.888
                    </div>
                </div>
                <div class="ht-right">
                    <a href="#" class="login-panel"><i class="fa fa-user"></i>Login</a>
                    <div class="lan-selector">
                    <!-- 이미지못찾는 영역 -->
                    <!--  
                        <select class="language_drop" name="countries" id="countries" style="width:300px;">
                            <option value='yt' data-image="img/flag-1.jpg" data-imagecss="flag yt"
                                data-title="English">English</option>
                            <option value='yu' data-image="img/flag-2.jpg" data-imagecss="flag yu"
                                data-title="Bangladesh">German </option>
                        </select>
                        -->
                    </div>
                    <div class="top-social">
                        <a href="#"><i class="ti-facebook"></i></a>
                        <a href="#"><i class="ti-twitter-alt"></i></a>
                        <a href="#"><i class="ti-linkedin"></i></a>
                        <a href="#"><i class="ti-pinterest"></i></a>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="inner-header">
                <div class="row">
                    <div class="col-lg-2 col-md-2">
                        <div class="logo">
                            <a href="./index">
                                <img src="${pageContext.request.contextPath}/resources/el/img/logo.png" alt="">
                            </a>
                        </div>    
                    </div>
                    <div class="col-lg-7 col-md-7">
                        <div class="advanced-search">
                            <button type="button" class="category-btn">All Categories</button>
                            <form action="#" class="input-group">
                                <input type="text" placeholder="What do you need?">
                                <button type="button"><i class="ti-search"></i></button>
                            </form>
                        </div>
                    </div>
                    <div class="col-lg-3 text-right col-md-3">
                        <ul class="nav-right">
                            <li class="heart-icon"><a href="#">
                                <i class="icon_heart_alt"></i>
                                <span>1</span>
                            </a>
                            </li>
                            <li class="cart-icon"><a href="#">
                                <i class="icon_bag_alt"></i>
                                <span>3</span>
                            </a>
                            <div class="cart-hover">
                                <div class="select-items">
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td class="si-pic"><img src="${pageContext.request.contextPath}/resources/el/img/select-product-1.jpg" alt=""></td>
                                                <td class="si-text">
                                                    <div class="product-selected">
                                                        <p>$60.00 x 1</p>
                                                        <h6>Kabino Bedside Table</h6>
                                                    </div>
                                                </td>
                                                <td class="si-close">
                                                    <i class="ti-close"></i>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="si-pic"><img src="${pageContext.request.contextPath}/resources/el/img/select-product-2.jpg" alt=""></td>
                                                <td class="si-text">
                                                    <div class="product-selected">
                                                        <p>$60.00 x 1</p>
                                                        <h6>Kabino Bedside Table</h6>
                                                    </div>
                                                </td>
                                                <td class="si-close">
                                                    <i class="ti-close"></i>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="select-total">
                                    <span>total:</span>
                                    <h5>$120.00</h5>
                                </div>
                                <div class="select-button">
                                    <a href="#" class="primary-btn view-card">VIEW CARD</a>
                                    <a href="#" class="primary-btn checkout-btn">CHECK OUT</a>
                                </div>
                            </div>
                        </li>
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
                        <i class="ti-menu"></i>
                        <span>All departments</span>
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
                            </ul>
                        </li>
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
                                <!-- sooADD (202012311052) -->
                                <li><a href="./mypage">mypage</a></li>
                            </ul>
                        </li>
                    </ul>
                </nav>
                <div id="mobile-menu-wrap"></div>
            </div>
        </div>
    </header>
    <!-- Header End -->

    <!-- Breadcrumb Section Begin -->
    <div class="breacrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <a href="#"><i class="fa fa-home"></i> Home</a>
                        <span>Register</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Form Section Begin -->





    <!-- Register Section Begin -->
    <div class="register-login-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3">
                    <div class="register-form">
                        <h2>마이페이지</h2>
                        <!-- 202012311536_BD값 끌고 오는거 보려고함  sooAdd-->
                        <table id="output"></table> 
                        
                      <!--  <form action="#">-->  
                        <form id="post_list" method="post"> <!-- 202012311156 -->
                        <fieldset>
                        
                        <legend> 등록글 목록 </legend>
                        
                            <div class="group-input">
                                <label for="username">테스트 아이디 출력  *</label>
                                <input type="text" id="username">
                            </div>
                            <div class="group-input">
                                <label for="pass">입력한 분실물 내역 출력 *</label>
                                <input type="text" id="pass">
                            </div>
                            <div class="group-input">
                                <label for="con-pass">결제내역 출력 *</label>
                                <input type="text" id="con-pass">
                            </div>
                            <button type="submit" class="site-btn register-btn">버튼 사이즈 바꾸기</button>
                            
                          </fieldset>  
                          
                        </form>   
                        
                        
                        
                        
                                           
                        <div class="switch-login">
                            <a href="./login" class="or-login">Or Login :나중에 로그인 말고 다른화면 연결</a>
                        </div>
                        <br>
                        <P>테스트 DB값을 연결해서 출력 해보는 단계 </P>
                        <P>(1) db값 뽑아 보기  </P>
                        <P>(2) 체크박스 지우기  </P>
                        <P>(3) 특정 아이디의 존재 데이터 모두 뽑아 오기 </P>
                        <br>
                    </div>
                </div>
            </div>
        </div>
    </div>
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





    <!-- Footer Section Begin -->
    <footer class="footer-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="footer-left">
                        <div class="footer-logo">
                            <a href="#"><img src="${pageContext.request.contextPath}/resources/el/img/footer-logo.png" alt=""></a>
                        </div>
                        <ul>
                            <li>Address: 60-49 Road 11378 New York</li>
                            <li>Phone: +65 11.188.888</li>
                            <li>Email: hello.colorlib@gmail.com</li>
                        </ul>
                        <div class="footer-social">
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-instagram"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-pinterest"></i></a>
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
                        <p>Get E-mail updates about our latest shop and special offers.</p>
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
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        </div>
                        <div class="payment-pic">
                            <img src="${pageContext.request.contextPath}/resources/el/img/payment-method.png" alt="">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- Footer Section End -->

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
</body>

</html>