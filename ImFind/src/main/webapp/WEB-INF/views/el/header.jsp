<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

    <script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
    <!-- fontawesome 아이콘 사용을 위한 스크립트입니다. 유희 -->
    <script src="https://kit.fontawesome.com/b5c4fcc5c0.js" crossorigin="anonymous"></script>
    <style>
		a[class="login-panel"]{
			color : black;
		}
		a[class="join-panel"]{
			margin-left: 30px;
			color : black;
		}
		.fa, 
		.fas{
			margin-right : 8px !important;
		}
    </style>
	<!-- 유희 로그인 session 처리 코드 -->
    <script>
    	document.addEventListener("DOMContentLoaded", function() {
    		
       		var kakao_id = '<%= request.getAttribute("kakao_id")%>';
       		var id = '<%= request.getAttribute("id")%>';
    		//session_flag = sessionStorage.length;
    		//console.log(session_flag);
    		
    		/* 로그인 여부 체크 */
    		if( kakao_id != 'null' || id != 'null'){
    			console.log("login");
    			var loginPanel =  document.querySelector('.login-panel');

    			loginPanel.innerText = '';
    			loginPanel.innerHTML = '<i class="fas fa-sign-out-alt fa-lg"></i>로그아웃';
    			
    			var joinPanel =  document.querySelector('.join-panel');
    			joinPanel.innerHTML = '<i class="fas fa-user-circle fa-lg"></i>마이페이지'
    		}
    		
			var loginPanel =  document.querySelector('.login-panel');
    		
    		/* 세션 유무에 따른 로그인, 로그아웃 처리  */
    		loginPanel.addEventListener('click', function(){
    			
    			if(loginPanel.innerText == '로그아웃'){
    				event.preventDefault();
    				
    				//sessionStorage.clear();
    				window.location.href = "logout";
    			}
    			else{
    				window.location.href = "login";
    			}
    		});
    		
    	});
    </script>

    <!-- Header Section Begin -->
    <header class="header-section">
        <div class="header-top">
            <div class="container">
                <div class="ht-left">
                    <div class="mail-service">
                        <i class=" fa fa-envelope"></i>
                        hello.if@gmail.com
                    </div>
                    <div class="phone-service">
                        <i class=" kr kr-phone"></i>
                        +82 10.1234.1234
                    </div>
                </div>
                <div class="ht-right">
	                <i class="far fa-bell fa-lg" style="width:30px;"></i>
                    <a href="login" class="login-panel"><i class="fas fa-sign-in-alt fa-lg"></i>로그인</a>
                    <a href="register" class="join-panel"><i class="fa fa-user fa-lg"></i>회원가입</a>                	
                </div>
            </div>
        </div>
        <div class="container">
            <div class="inner-header">
                <div class="row">
                 
                </div>
            </div>
        </div>
        <div class="nav-item">
            <div class="container">
                <div class="nav-depart">
               
                </div>
                <nav class="nav-menu mobile-menu">
                    <ul>
                        <li class="active"><a href="./index">Home</a></li>
                     
                        <li><a href="#">분실물등록</a>
                            <ul class="dropdown">
                                <li><a href="#">물건</a></li>
                                <li><a href="#">반려동물</a></li>
                            </ul>
                        </li>
                        <li><a href="./shopping-cart">분실물조회</a>
                       		 <ul class="dropdown">
                                <li><a href="#">물건</a></li>
                                <li><a href="#">반려동물</a></li>
                            </ul>
                        </li> 
               
                    </ul>
                </nav>
                <div id="mobile-menu-wrap"></div>
            </div>
        </div>
    </header>
    <!-- Header End -->
    
