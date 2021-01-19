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
    
    
    

    <!-- Css Styles -->
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/css/bootstrap.min.css" type="text/css"> <!-- 지우면 안됨. -->
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/css/themify-icons.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/css/slicknav.min.css" type="text/css">    
  
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/css/YS_css/style2.css" type="text/css">
    
    
	     <!-- Bootstrap cdn 설정  for 페이징  -->	
	  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">	
	  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">	
	  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">	
	  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>	
	  <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>	
     
    
    
   <style type="text/css">	
    
      table {
        width: 100%;
        border: 1px solid #333333;
      }
   
      .a {
        border-collapse: separate;
      }
      .b {
        border-collapse: collapse;
        border-bottom:1px solid red;
      }

    
	   form{
		width:800px;
		margin:10px auto;
		}	
	
		
		label{
		width:150px;
		float:left;
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
     <!--   <div class="container"> -->
            <div class="row">
                <div class="col-lg-6 offset-lg-3">
                	  <div class="section-mypage-title">                
                <!--  <div class="register-form">    -->  
                	   <div class="container">
                	    <!--   <div class="col"> -->
                	    
                        <div class="mypageitem0">        
                        <h2>마이페이지</h2>
                        </div>
                         </div>  
                        </div>
                        &nbsp;&nbsp;
                        <!-- 아이디 들어갈 자리. --------------------------------------------------------------------------------------->
                        		  <div class="container">
														  <div class="row">
															    <div class="col">
															      &nbsp;bnm1128
															    </div>
															    <div class="col">
															       <button type="button" class="btn btn-primary" a href="/imfind/#.do">수정</button>
															    </div>
															    <div class="col">
															     &nbsp;
															    </div>
															    <div class="col">
															      &nbsp;
															    </div>
															    
														  </div>
														  &nbsp;&nbsp;
														  <div class="row">
															    <div class="col">
																<h6>매너평가</h6>     
															    </div>
															    <div class="col">
															   <p>★★★★★</p>   
															    </div>
															    <div class="col">
															      &nbsp;
															    </div>
															    <div class="col">
															     &nbsp;
															    </div>
														  </div>
													
							   					 </div>                    
                        
                        <!-- 아이디 자리 끝 ------------------------------------------------------------------------------------------ -->
                        
                          <form id="post_list" method="post"> <!-- 202012311156 -->
                       <!--  <fieldset> -->
                        
                       <!--  분실물게시판 작성 글 목록  --> 
                         &nbsp;
                      <div class="mypageitem1">    
                       <h5>작성글</h5>
                       </div>
                       	
                        &nbsp;
                        
                       		 <table style="width:100%">
										<tr style="background-color:lightgrey">
											<th>&nbsp;번호</th>
											<th>제목</th>	
											<th>사례금</th>
											<th>등록날짜</th>
								          <th>수정</th>
								          <th>삭제</th>
								          <th>거래완료</th>
										</tr>
										</table>
		
                     <!--  <table id="output" style="width:100%"> -->
                        
                            <table id="output"  border="0" width="100%">
                         </table>
                        <!-- 페이지네이션 테스트1-2 START-->
                           <div class="text-center"> 
						<!--  <nav aria-label="..."> -->
						  <ul class="pagination" id="numbers_mypage_post1">
						  
						   
						  </ul>
						<!--  </nav> -->
						 </div>
					<!--  	</nav> -->
                        <!-- 페이지네이션  테스트1-2 END-->                       
                        
      
    <!-- Register Form Section End -->
    
    <!-- PayTable Start -->
     &nbsp;
                      <div class="mypageitem1">    
                       <h5>결제내역</h5>
                       </div>
                       	
                        &nbsp;
                        <!-- 페이징 테스트 2-1 -->
							                    
													     <table style="width:100%">
													     
															<tr style="background-color:lightgrey">
																<th>결제날짜</th>
																<th>결제금액</th>	
																<th>결제방법</th>
																<th>결제상태</th>
													          <th>환불요청 </th>
													    
															</tr>
															</table>
    
												     <table id="output_pay"  border="0" width="100%"> 
												    
												 
												      
												                         </table>
						                           
						                         
						                         <!-- 페이징 테스트 2-1 -->
						                      <!--   <nav aria-label="Page navigation example">-->
						                      <div class="text-center">
													  <ul id="numbers_mypage_post2" class="pagination justify-content-center">
													   
													  </ul>
													  </div>
													  
											<!-- 	</nav> -->
						                         
						                          <!-- 페이징 테스트 2-2 -->
	  <!-- Modal --> 
		<!-- Modal ---------------------------------------------------> 
<div class="modal fade" role="dialog" id="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h6 class="modal-title">거래 완료 전 파인더님의 평점을 입력해 주세요.</h6>
      </div>
      <div class="modal-body">
        <p>거래 완료 파인더 선택하기 </p>
				<hr>				
				<p>채팅한 파인더</p>
				
				<!-- <div class="container-fluid">--> <!--Fluid containers-->
				<div class="container" id=output_WhoReplied> 
				<!-- 라디오 일반 START --> 
			<!-- 	<div id=output_WhoReplied>  -->
		<input type="radio" name="lecture" value="html"> HTML <br>
		<input type="radio" name="lecture" value="css"> CSS <br>
		<input type="radio" name="lecture" value="java"> JAVA <br>
		<input type="radio" name="lecture" value="cpp"> C++ <br>
			<!--  	</div> -->
				<!-- 라디오 일반 END -->
<!-- -------------------------------------------------------------------------------------------------------- -->					
				</div> <!--Fluid containers-->
	<!-- Grading 	spot --> 			
					<hr>
			<div class="container-fluid">
		<p> 위치 테스트(ㅇㅇㅇ님 평가하기)    <p>
		<p>  평점 선택 위치  <p>	
		
		<!--HTML 별점 평가 테스트 START -->
		

<hr>
<h2>별점주기</h2>
<div class="make_star">

	<div class="rating" data-rate="3">
		<svg class="svg-inline--fa fa-star fa-w-18"
				 aria-hidden="true"
				 focusable="false"
				 width="1.8em"
				 height="1.8em"
				 data-prefix="fas"
				 data-icon="star"
				 role="img"
				 xmlns="http://www.w3.org/2000/svg"
				 viewBox="0 0 576 512"
				 data-fa-i2svg="">
			<path fill="currentColor" d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z">
			</path>
			</svg>
			
			<svg class="svg-inline--fa fa-star fa-w-18"
				 aria-hidden="true"
				 focusable="false"
				 width="1.8em"
				 height="1.8em"
				 data-prefix="fas"
				 data-icon="star"
				 role="img"
				 xmlns="http://www.w3.org/2000/svg"
				 viewBox="0 0 576 512"
				 data-fa-i2svg="">
			<path fill="currentColor" d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z">
			</path>
			</svg>
			
			<svg class="svg-inline--fa fa-star fa-w-18"
				 aria-hidden="true"
				 focusable="false"
				 width="1.8em"
				 height="1.8em"
				 data-prefix="fas"
				 data-icon="star"
				 role="img"
				 xmlns="http://www.w3.org/2000/svg"
				 viewBox="0 0 576 512"
				 data-fa-i2svg="">
			<path fill="currentColor" d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z">
			</path>
			</svg>
			
			<svg class="svg-inline--fa fa-star fa-w-18"
				 aria-hidden="true"
				 focusable="false"
				 width="1.8em"
				 height="1.8em"
				 data-prefix="fas"
				 data-icon="star"
				 role="img"
				 xmlns="http://www.w3.org/2000/svg"
				 viewBox="0 0 576 512"
				 data-fa-i2svg="">
			<path fill="currentColor" d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z">
			</path>
			</svg>
			
		<svg class="svg-inline--fa fa-star fa-w-18"
				 aria-hidden="true"
				 focusable="false"
				 width="1.8em"
				 height="1.8em"
				 data-prefix="fas"
				 data-icon="star"
				 role="img"
				 xmlns="http://www.w3.org/2000/svg"
				 viewBox="0 0 576 512"
				 data-fa-i2svg="">
			<path fill="currentColor" d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z">
			</path>
			</svg>
		
		
		
	</div>
</div>

		
		
		<!--HTML 별점 평가  테스트 END -->
			<div>
				
  <!-- Grading 	spot --> 					
				
				
      </div>
		
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				  <button type="button" class="btn btn-primary">파인더 평점 입력 완료</button>
      </div>
    </div>

  </div>
</div>
  </div>
</div>
  <!-- modal test1 end ------------------------------------------------------------------------------------>					                         
						                  
						                         
     </form>
                         
                      </div> 
                        
                   </div>                        
                        
                    </div>
             
    <!-- PayTable End -->
 
                          
    
    <!-- Mypage Form Section End -->
    
    
    
    
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
    
    <!--마이페이지 js 시작-연수 -->
	<script src="${pageContext.request.contextPath}/resources/el/js/mypage.js"></script>
	<!--마이페이지 js 끝-연수 -->

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