<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
   
    <!-- 폰트 어썸 -->
   	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
	
	
	<style>
	.container-fluid{
/* 		border: 1px solid black; */
		width: 75vw;
		margin: 0 auto;
		padding: 0;
	}
	@media(min-width: 1900px){
		.container-fluid.main-nav{
/* 			border: 1px solid black; */
			width: 62vw;
			margin: 0 auto;
			padding: 0;
		}
	
	}
	.top-menu{
	    box-shadow: 0 2px 4px 0 hsla(0,0%,80.8%,.5);
		height : 73px !important;
	}
	</style>
<!--     <div id="page"> -->
	<nav class="fh5co-nav" role="navigation">
		<div class="top-menu">
			<div class="container-fluid main-nav">
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
									<li><a href="./pet">동물</a></li>
								</ul>
							</li>
							<li class="btn-cta"><a href="./login"><span>Login</span></a></li> 
							<li class="btn-cta"><a href="./register"><span >회원가입</span></a></li> 
						</ul>
					</div>
				</div>		
			</div>
		</div>
	</nav>
