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
                    <a href="./logout" class="login-panel"><i class="fas fa-sign-out-alt fa-lg"></i>로그아웃</a>
                    <a href="./mypage" class="join-panel"><i class="fas fa-user-circle fa-lg"></i>마이페이지</a>                	
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
    
