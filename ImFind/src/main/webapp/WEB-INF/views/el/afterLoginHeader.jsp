<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

   
<nav class="fh5co-nav" role="navigation">
	<div class="top-menu">
		<div class="container-fluid">
			<div class="row">
				<div class="col-xs-2">
					<div id="fh5co-logo" ><a href="./">ImFind<span>.</span></a></div>
				</div>
				<div class="col-xs-10 text-right menu-1">
					<ul>
						<li class="active"><a href="index.if">if</a></li>
						<li><a href="./home.do">ELSE</a></li>
							<li class="has-dropdown">
							<a href="./itemboard">분실물 등록 <i class="fas fa-sort-down"></i></a>
							<ul class="dropdown">
								<li><a href="./itemboard">물건</a></li>
								<li><a href="./petboard">동물</a></li>
							</ul>
						</li>
						<li class="has-dropdown">
							<a href="./item">분실물 조회 <i class="fas fa-sort-down"></i></a>
							<ul class="dropdown">
								<li><a href="./item">물건</a></li>
								<li><a href="#">동물</a></li>

							</ul>
						</li>
						<li class="btn-cta"><a href="./logout"><span>Logout</span></a></li> 
						<li class="btn-cta"><a href="./mypage"><span >마이페이지</span></a></li> 
						<!-- 세션에 담긴 로그인 유저. 로그인한 아이디 확인하시라고 만들어 놨습니다. -->
						<li class="btn-cta"><a href="./mypage"><span >${kakaoLoginUser}  ${loginUser}</span></a></li> 
					</ul>
				</div>
			</div>
			
		</div>
	</div>
</nav>
   
   
