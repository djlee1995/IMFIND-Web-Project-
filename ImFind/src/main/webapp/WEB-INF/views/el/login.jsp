<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">


<body>
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
                    <div class="login-form">
                        <h2>Login</h2>
                        <form action="#" id="loginForm">
                            <div class="group-input">
                                <label for="username">ID *</label>
                                <input type="text" id="username">
                            </div>
                            <div class="group-input">
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
                                    <a href="#" class="forget-pass">Forget your Password</a>
                                </div>
                            </div>
                            
                            <!-- 로그인 버튼 -->
                            <button type="submit" class="site-btn login-btn">로그인</button>
                            <img id="kakao-login-btn" src="${pageContext.request.contextPath}/resources/el/img/kakao_login_medium_wide.png" alt="" />
                             <!--   -->
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
    
    <!--유희 로그인 js 코드. 수정하지 마세요!-->
	<script>
	
		function loginValidate(loginBoxElem){
			
			var id = loginBoxElem.elements[0];
			var pw = loginBoxElem.elements[1];
			
			const labelForID = loginBoxElem.querySelector('#username');
			const labelForPW = loginBoxElem.querySelector('#pass');
			
			const inputElem = document.querySelector('.group-input').nextElementSibling;
			
 			$.ajax({
 				
			    url: "/imfind/loginCheck", 
			    data: { "id": id.value,
			    		"pw": pw.value},  
			    type: "POST",     
			    
				success : function(data){
					console.log(data);
					if(data == 'unpass'){
						
						id.setAttribute("style", " border: 1px solid red;");
						pw.setAttribute("style", " border: 1px solid red;");
						
						if(document.getElementsByClassName('warn').length == 0){
							
							const warn_id = document.createElement('div');
							
							warn_id.className = 'warn';
							warn_id.innerHTML = 
								'아이디와 패스워드를 확인해 주세요';
							
							warn_id.style.color = 'red';
							warn_id.style.marginTop = '10px';
							
							inputElem.appendChild(warn_id);
						}
					}
					else{
						//sessionStorage.setItem('id', id.value)
						window.location.href = "index";
					}
				},
				error : function(){
					console.log("통신 실패");
				}
 			});
		}
		
		function loginBoxNotNullCheck(id, pw){
			
			if(id.value == ""){
				id.setAttribute("style", " border: 1px solid red;");
			}
			else{
				id.setAttribute("style", " border: 1px solid #ebebe;");
			}
			if(pw.value == ""){
				pw.setAttribute("style", " border: 1px solid red;");
			}
			else{
				pw.setAttribute("style", " border: 1px solid #ebebe;");
			}
			if(id.value != "" && pw.value != ""){
				
				id.setAttribute("style", " border: 1px solid #ebebe;");
				pw.setAttribute("style", " border: 1px solid #ebebe;");
				
				return true;			
			}		
			return false;
		}
		
		function loginSubmit(e){
			
			e.preventDefault();
			
			var loginBoxElem = document.querySelector('#loginForm');
			var id = loginBoxElem.elements[0];
			var pw = loginBoxElem.elements[1];		
			
			var flag = loginBoxNotNullCheck(id, pw);
			console.log(flag);
			
			if(flag){
				loginValidate(loginBoxElem);
			}
		}	
		
		function kakaoLogin(){
				
/* 				url  = 'https://kauth.kakao.com/oauth/authorize?client_id=d5e7c97eeecbba70fa5f4e5f4bc57517&'
						+ 'redirect_uri=http://localhost:8080/imfind/login/oauth_kakao&response_type=code'
				console.log(url);
				location.href = url; */
				
				$.ajax({
					url : "./el/getKakaoAuthUrl",
					type : "GET",
					success : function(data){
						location.href = data;
					}
				})
		}
		document.addEventListener("DOMContentLoaded", function() {
			
			// 로그인 요청
			var loginBtnElem = document.querySelector('.site-btn.login-btn');
			loginBtnElem.addEventListener('click', loginSubmit);
			
			// 카카오 로그인 요청
			var kakaoLoginBtn = document.querySelector('#kakao-login-btn');
			kakaoLoginBtn.addEventListener('click', kakaoLogin) 
			 
		});
		
	</script>
	<!--!유희 로그인 script end-->

</body>

</html>