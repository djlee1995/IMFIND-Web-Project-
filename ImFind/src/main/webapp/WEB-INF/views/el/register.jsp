<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">

<!-- 유희 css -->
<style>
	col-lg-6.offset-lg-3{
		
	}
	.group-input.label{
		margin-left:10px
	}
	input[id="tel"]{
		width:70px !important;
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
		grid-template-rows : 80px 150px 80px 80px 150px 80px 80px;
	} 
	button[class ~= "register-btn"]{
		grid-column: auto / span 2;
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

    <!-- Register Section Begin -->
    <div class="register-login-section spad">
        <div class="container">
             <div class="row">
                <div class="col-lg-6 offset-lg-3">
                    <div class="register-form">
                        <h2>회원가입</h2>
                        <form action="#" class="grid-form">
                            <div class="group-input label">
                                <label for="username">ID *</label>
                            </div>
                            <div class="group-input box">
                                <input type="text" id="username">
                            </div>
                            <div class="group-input label">
                                <label for="pass">Password *</label>
                            </div>
                            <div class="group-input box">
                                <input type="password" id="pass" placeholder="비밀번호를 입력해주세요">
                                <input type="password" id="pass2" placeholder="비밀번호 확인을 위해 다시 한 번 입력해주세요">
                                <span style="font-size:0.7rem;">최소 8자리 이상 : 영어 대문자, 소문자, 숫자, 특수문자 중 3종류 조합</span>
                            </div>
                            <div class="group-input label">
                                <label for="name">이름 *</label>
                            </div>
                            <div class="group-input box">
                                <input type="text" id="email">
                            </div>
                            <div class="group-input label">
                                <label for="email">이메일 *</label>
                            </div>
                            <div class="group-input box">
                                <input type="text" id="name">
                            </div>
                            <div class="group-input label">
                                <label for="account">계좌인증 *</label>
                            </div>
                            <div class="group-input box">
                                <input type="text" id="account">
                                <div class="site-btn certification-api account" >인증</div>
                            </div>
                            <div class="group-input label">
                                <label for="tel">휴대전화 *</label>
                            </div>
                            <div class="group-input box tel" width="100%">
                                <input type="text" id="tel"  readonly="readonly" value="010">-<input type="text" id="tel">-<input type="text" id="tel">
                                <div class="site-btn certification-api" >인증</div>
                            </div>
                            <div class="group-input label">
                                <label for="policy">개인정보 제공동의 *</label>
                            </div>
                            <div class="group-input box" >
                                <button type="" class="site-btn policy" >동의하기</button>
                            </div>
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
		     
		const accountElem = document.querySelector('.certification-api.account');
		accountElem.addEventListener('click', function(){
			alert('inin');
			
			$.ajax({
				url : './getOpenBankingCode',
				type : 'POST'
			})
		});
	});
	
</script>


<%--     <!-- Footer Section Begin -->
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
    </footer> --%>
    <!-- Footer Section End -->

</body>

</html>