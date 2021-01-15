<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "com.spring.imfind.imf.PoliceVO" %>
<%@ page import = "java.util.ArrayList" %>
<!DOCTYPE HTML>
<html>
    <!-- Header Section Begin -->
   	<jsp:include page="${request.contextPath}/NewHeader_CSS"></jsp:include>
    <!-- Header End -->

	<style>

		.box{
			/* border : 1px solid black; */
			width: 50vw;
			position: absolute;
			left: 50%;
			padding-top : 50px;
			
		}
		.fh5co-hero{
		
		}
 		.flexslider.js-fullheight{
			width : 50vw;
			
		}
		.slides{
			width : 200%;
		} 
		
		@media screen and (max-width: 992px){
		  .box{
			 width: 100vw;
			 left : 0;
		  }
		}
		.li-group {
			padding-left : 50px;

		}
		
		.li-group > ul{
			list-style : none;
		}
		.li-group > ul > li{
		    min-height: 40px !important;
		    border: none;
		    font-family: 'Noto Sans KR', sans-serif;
		    margin: 48px 33px 0 0;
		    padding: 0 0 0 0;
		    border: 0;
		    float: left;
		    font-size: 2.3rem;
		}
		.li-group > ul > li:hover{
			transform : scale(1.2);
			tarnsition : transform 1s;
		}
		
		.li-group > ul > li > a{
			color : black;
			font-family: 'Noto Sans KR', sans-serif;
			
		}
		.flex-active-slide > div:nth-child(2) > div:nth-child(1) > div:nth-child(2) > div:nth-child(2) > ul:nth-child(1) > li{
			background : white;
			
		}
		@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

		.notosanskr * { 
			font-family: 'Noto Sans KR', sans-serif;
		}

		nav{
			position: fixed;
			top: 0;
			width: 100vw;
			left: 0;
			z-index: 100;
			padding-right : 35px;
		}
		aside{
			padding-top : 6.76%;
		}
		.fh5co-nav #fh5co-logo{
			font-size : 34px;
		}
		#fh5co-services{
		    margin-top: 195px !important;
		}
		
		.overlay {
			position: absolute;
			bottom: 0;
			left: 0;
			right: 0;
			background-color: rgba(0, 0, 0, 0.2);
			overflow: hidden;
			width: 100%;
			height: 0;
			transition: .5s cubic-bezier(0.18, 0.85, 0.01, 1.21);
		}
		.services:hover .overlay {
		  	height: 100%;
		}

		.title{
			font-family: 'Noto Sans KR', sans-serif;
			font-size: 74px;	
		}
		.fh5co-nav ul li a {
			font-family: 'Noto Sans KR', sans-serif;
			font-weigth : bold;
		    font-size: 15px;
		    padding: 29px 15px;
		    color: rgba(0, 0, 0, 0.7);
		    -webkit-transition: 0.5s;
		    -o-transition: 0.5s;
		    transition: 0.5s;
		}
		
	</style>
	
	<script>
		
		function getXY (getUserLocation){
			
			if('geolocation' in navigator) {
				  /* 위치정보 사용 가능 */
				  var options = {
					  enableHighAccuracy: true,
				  };
				  navigator.geolocation.getCurrentPosition((position, options) => {
					  var coords =  {'y' : position.coords.latitude, 'x' : position.coords.longitude };
					  var result = getUserLocation(coords);
					  console.log(result)
					  return result;
				  });
				  
			} else {
				  /* 위치정보 사용 불가능 */
			}
		}
		
		function getUserLocation(coords){

		    //ajax 시작
			$.ajax({
				url : 'https://dapi.kakao.com/v2/local/geo/coord2regioncode.json',
				headers : { 'Authorization' : 'KakaoAK d5e7c97eeecbba70fa5f4e5f4bc57517' },
				type: 'GET',
				data : { 'x' : coords.x, 'y' : coords.y },
				success : function(data){
					//호출 성공하면 작성할 내용
		            if(data.documents.length != 0 ){ // 값이 있으면

						var result = data.documents[0]
						
						var item =  {'city' : result.region_1depth_name,
		            	        'gu' : result.region_2depth_name,
		            	        'x' : result.x,
		            	        'y' : result.y}
		            
		            	console.log(item.city)
		            	document.querySelector('#location').innerHTML =  '<i class="fas fa-street-view"></i> '+ item.city + ' ' + item.gu + ' 습득물'
		            	return item;
					}
				}, 
				error:function(request,status,error){
				    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			}).done(function(data){console.log(data);});	

		}
		
		document.addEventListener('DOMContentLoaded', function(){
			 var result = getXY(getUserLocation);
		});
	
	
	    
	</script>
</head>
	
	<body>
	<%
		// 경찰청 데이터
		ArrayList<PoliceVO> list = (ArrayList<PoliceVO>)request.getAttribute("police");
	%>

	
    <%
    	if(session.getAttribute("loginUser") == null && session.getAttribute("kakaoLoginUser") == null){
    %>
		   	<jsp:include page="${request.contextPath}/el/header"></jsp:include>		
	<%
    	} else{
    %>
		   	<jsp:include page="${request.contextPath}/el/afterLoginHeader"></jsp:include>		
	<%
    	}
	%>
	<aside id="fh5co-hero" class="js-fullheight">
		<div class="flexslider js-fullheight">
			<ul class="slides">
			   	<li>
			   		<div class="overlay-gradient"></div>
			   		<div class="container-fluid">
			   			<div class="row">
				   			<div class="col-md-6 col-md-offset-3 col-md-pull-3 js-fullheight slider-text slider-text-bg">
				   				<div class="slider-text-inner">
				   					<h1>공공기관이 습득한 분실물<br> 찾기</h1>
										<h2>경찰청 + 대중교통 + 택시 + 지하철 + 기타 <a href="http://freehtml5.co/" target="_blank"></a></h2>
										<p class="ct"><a href="index.if">이동하기 <i class="icon-arrow-right"></i></a></p>
				   				</div>
				   			</div> 
				   		 	<div class="box">
			   		 			<div id="fh5co-mission" style="padding-top: .2rem;">
									<div class="container">
										<div class="row">
											<div class="col-md-6 col-md-offset-3 text-center animate-box" style="margin-left : 7%;">
												<h2 style="	font-family: 'Noto Sans KR', sans-serif;">분실물 통합 조회</h2>
												<blockquote>
													<p style="font-family: 'Noto Sans KR', sans-serif;">지역별 관할 지구대, 대중교통 및 공공 기관에서 습득한 분실물을 지도 기반으로 통합 조회가 가능합니다.</p>
												</blockquote>
											</div>
											<div class="col-md-6 col-md-offset-3 text-center animate-box" style="margin-left : 7%;">
												<h2 style="	font-family: 'Noto Sans KR', sans-serif;">분실물 등록 서비스</h2>
												<blockquote>
													<p style="font-family: 'Noto Sans KR', sans-serif;">분실자가 등록한 분실물 게시글을 위치 기반 서비스로 가까이에 위치한 사용자에게 알려드립니다.</p>
												</blockquote>
											</div>
										</div>
									</div>
								</div>
								<div class="li-group">
					   				<ul>
					   					<li class=""><a href="./itemboard"><span>분실물 등록</span></a></li> 
					   					<li class=""><a href="./petboard"><span>분실 동물 등록</span></a></li> 
					   					<li class=""><a href="./item"><span>분실물 조회</span></a></li> 
					   					<li class=""><a href="#"><span>분실 동물 조회</span></a></li> 
					   				</ul>
								</div>
						   
				   		 	</div>		  
				   		</div>
			   		</div>
			   	</li>
		   <li style="background-image: url(images/img_bg_2.jpg);">
		   		<div class="overlay-gradient"></div>
		   		<div class="container-fluid">
		   			<div class="row">
			   			<div class="col-md-6 col-md-offset-3 col-md-pull-3 js-fullheight slider-text slider-text-bg">
			   				<div class="slider-text-inner">
			   					<h1>찾으시는 물건이 없나요?</h1>
									<h2>ImFind가 분실물 실시간 알람과 위치 기반<a href="http://freehtml5.co/" target="_blank"></a></h2>
									<p class="ct"><a href="/imfind/index">이동하기 <i class="icon-arrow-right"></i></a></p>
			   				</div>
			   			</div>
				   		 	<div class="box" >
			   		 			<div id="fh5co-mission" style="padding-top: .2rem;">
									<div class="container">
										<div class="row">
											<div class="col-md-6 col-md-offset-3 text-center animate-box" style="margin-left : 7%;">
												<h2 style="	font-family: 'Noto Sans KR', sans-serif;">분실물 통합 조회</h2>
												<blockquote>
													<p style="font-family: 'Noto Sans KR', sans-serif;">지역별 관할 지구대, 대중교통 및 공공 기관에서 습득한 분실물을 지도 기반으로 통합 조회가 가능합니다.</p>
												</blockquote>
											</div>
											<div class="col-md-6 col-md-offset-3 text-center animate-box" style="margin-left : 7%;">
												<h2 style="	font-family: 'Noto Sans KR', sans-serif;">분실물 등록 서비스</h2>
												<blockquote>
													<p style="font-family: 'Noto Sans KR', sans-serif;">분실자가 등록한 분실물 게시글을 위치 기반 서비스로 가까이에 위치한 사용자에게 알려드립니다.</p>
												</blockquote>
											</div>
										</div>
									</div>
								</div>
								<div class="li-group">
					   				<ul>
					   					<li class=""><a href="#"><span>분실물 등록</span></a></li> 
					   					<li class=""><a href="#"><span>분실 동물 등록</span></a></li> 
					   					<li class=""><a href="#"><span>분실물 조회</span></a></li> 
					   					<li class=""><a href="#"><span>분실 동물 조회</span></a></li> 
					   				</ul>
								</div>
						   
				   		 	</div>				  
			   		</div>
		   		</div>
		   	</li>
		  	</ul>
	  	</div>
		 
	</aside>


	<div id="fh5co-services">
		<h2 id="location" style="font-family: 'Noto Sans KR', sans-serif">위치 인식중...</h2>
		<div class="container">
			<h1>경찰청</h1>
			<div class="row">
		<% 
			for(int i = 0; i < list.size(); i++)
			{ 
		%>
				<div class="col-md-4 text-center animate-box">
					<div class="services">
						<span class="icon">
							<!-- <i class="icon-command"></i> -->
							<img src="<%=list.get(i).getPhoto() %>" alt="에러"  style="width:100%;"/>
						</span>
						<div class="desc">
							<h3><a href="#"><%=list.get(i).getItem() %></a></h3>
							<p><%=list.get(i).getInfo() %></p>
						</div>
						  <div class="overlay">
						    <div class="text">
						    	<div class="title"><a href="index.if">지도에서 보기</a> </div>
						    </div>
						  </div>
					</div>
				</div>
		<% } %>

			</div>
		</div>
	</div>
	
		<div id="fh5co-services">
		<div class="container">
		<h1>분실 물건</h1>
			<div class="row">
				<div class="col-md-4 text-center animate-box">
					<div class="services">
						<span class="icon">
							<i class="icon-command"></i>
						</span>
						<div class="desc">
							<h3><a href="#">Brand Identity</a></h3>
							<p>Dignissimos asperiores vitae velit veniam totam fuga molestias accusamus alias autem provident. Odit ab aliquam dolor eius.</p>
						</div>
						  <div class="overlay">
						    <div class="text">
						    	<div class="title"><a href="index.if">지도에서 보기</a> </div>
						    </div>
						  </div>
					</div>
				</div>
				<div class="col-md-4 text-center animate-box">
					<div class="services">
						<span class="icon">
							<i class="icon-drop2"></i>
						</span>
						<div class="desc">
							<h3><a href="#">Web Design &amp; UI</a></h3>
							<p>Dignissimos asperiores vitae velit veniam totam fuga molestias accusamus alias autem provident. Odit ab aliquam dolor eius.</p>
						</div>
						 <div class="overlay">
						    <div class="text">
						    	<div class="title"><a href="index.if">지도에서 보기</a> </div>
						    </div>
						  </div>
					</div>
				</div>
				<div class="col-md-4 text-center animate-box">
					<div class="services">
						<span class="icon">
							<i class="icon-anchor"></i>
						</span>
						<div class="desc">
							<h3><a href="#">Web Development</a></h3>
							<p>Dignissimos asperiores vitae velit veniam totam fuga molestias accusamus alias autem provident. Odit ab aliquam dolor eius.</p>
						</div>
						 <div class="overlay">
						    <div class="text">
						    	<div class="title"><a href="index.if">지도에서 보기</a> </div>
						    </div>
						  </div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
		<div id="fh5co-services">
		<div class="container">
			<h1>분실물 동물</h1>
			<div class="row">
				<div class="col-md-4 text-center animate-box">
					<div class="services">
						<span class="icon">
							<i class="icon-command"></i>
						</span>
						<div class="desc">
							<h3><a href="#">Brand Identity</a></h3>
							<p>Dignissimos asperiores vitae velit veniam totam fuga molestias accusamus alias autem provident. Odit ab aliquam dolor eius.</p>
						</div>
						  <div class="overlay">
						    <div class="text">
						    	<div class="title"><a href="index.if">지도에서 보기</a> </div>
						    </div>
						  </div>
					</div>
				</div>
				<div class="col-md-4 text-center animate-box">
					<div class="services">
						<span class="icon">
							<i class="icon-drop2"></i>
						</span>
						<div class="desc">
							<h3><a href="#">Web Design &amp; UI</a></h3>
							<p>Dignissimos asperiores vitae velit veniam totam fuga molestias accusamus alias autem provident. Odit ab aliquam dolor eius.</p>
						</div>
						 <div class="overlay">
						    <div class="text">
						    	<div class="title"><a href="index.if">지도에서 보기</a> </div>
						    </div>
						  </div>
					</div>
				</div>
				<div class="col-md-4 text-center animate-box">
					<div class="services">
						<span class="icon">
							<i class="icon-anchor"></i>
						</span>
						<div class="desc">
							<h3><a href="#">Web Development</a></h3>
							<p>Dignissimos asperiores vitae velit veniam totam fuga molestias accusamus alias autem provident. Odit ab aliquam dolor eius.</p>
						</div>
						 <div class="overlay">
						    <div class="text">
						    	<div class="title"><a href="index.if">지도에서 보기</a> </div>
						    </div>
						  </div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="fh5co-blog">
		<div class="container">
			<div class="row animate-box">
				<div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
					<h2>Recent Post</h2>
					<p>Dignissimos asperiores vitae velit veniam totam fuga molestias accusamus alias autem provident. Odit ab aliquam dolor eius.</p>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-6 col-md-6">
					<div class="fh5co-blog animate-box">
						<a href="#"><img class="img-responsive" src="${pageContext.request.contextPath}/resources/home/images/blog-1.jpg" alt=""></a>
						<div class="blog-text">
							<span class="posted_on">Nov. 15th</span>
							<span class="comment"><a href="">21<i class="icon-speech-bubble"></i></a></span>
							<h3><a href="#">We've grown from a regional</a></h3>
							<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
							<a href="#" class="btn btn-primary">Read More</a>
						</div> 
					</div>
				</div>
				<div class="col-lg-6 col-md-6">
					<div class="fh5co-blog animate-box">
						<a href="#"><img class="img-responsive" src="${pageContext.request.contextPath}/resources/home/images/blog-2.jpg" alt=""></a>
						<div class="blog-text">
							<span class="posted_on">Nov. 15th</span>
							<span class="comment"><a href="">21<i class="icon-speech-bubble"></i></a></span>
							<h3><a href="#">We've grown from a regional</a></h3>
							<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
							<a href="#" class="btn btn-primary">Read More</a>
						</div> 
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="fh5co-started" style="background-image:url(${pageContext.request.contextPath}/resources/home/images/img_bg_2.jpg);">
		<div class="overlay"></div>
		<div class="container">
			<div class="row animate-box">
				<div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
					<h2>Want To Write About Us!</h2>
					<p>Facilis ipsum reprehenderit nemo molestias. Aut cum mollitia reprehenderit. Eos cumque dicta adipisci architecto culpa amet.</p>
					<p><a href="#" class="btn btn-default btn-lg">Contact Us</a></p>
				</div>
			</div>
		</div>
	</div>

	<footer id="fh5co-footer" role="contentinfo">
		<div class="container">
			<div class="row row-pb-md">
				<div class="col-md-4 fh5co-widget">
					<h4>Ink's</h4>
					<p>Facilis ipsum reprehenderit nemo molestias. Aut cum mollitia reprehenderit. Eos cumque dicta adipisci architecto culpa amet.</p>
				</div>
				<div class="col-md-4 col-md-push-1">
					<h4>Links</h4>
					<ul class="fh5co-footer-links">
						<li><a href="#">if</a></li>
						<li><a href="#">else</a></li>
						<li><a href="#">Won Cases</a></li>
						<li><a href="#">Blog</a></li>
						<li><a href="#">About us</a></li>
					</ul>
				</div>

				<div class="col-md-4 col-md-push-1">
					<h4>Contact Information</h4>
					<ul class="fh5co-footer-links">
						<li>198 West 21th Street, <br> Suite 721 New York NY 10016</li>
						<li><a href="tel://1234567920">+ 1235 2355 98</a></li>
						<li><a href="mailto:info@yoursite.com">info@yoursite.com</a></li>
						<li><a href="http://gettemplates.co">gettemplates.co</a></li>
					</ul>
				</div>

			</div>

			<div class="row copyright">
				<div class="col-md-12 text-center">
					<p>
						<small class="block">&copy; 2016 Free HTML5. All Rights Reserved.</small> 
						<small class="block">Designed by <a href="http://freehtml5.co/" target="_blank">FreeHTML5.co</a> Demo Images: <a href="http://unsplash.co/" target="_blank">Unsplash</a></small>
					</p>
					<p>
						<ul class="fh5co-social-icons">
							<li><a href="#"><i class="icon-twitter"></i></a></li>
							<li><a href="#"><i class="icon-facebook"></i></a></li>
							<li><a href="#"><i class="icon-linkedin"></i></a></li>
							<li><a href="#"><i class="icon-dribbble"></i></a></li>
						</ul>
					</p>
				</div>
			</div>

		</div>
	</footer>
	</div> 

	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
	</div>
	
	
    <!-- Header Section Begin -->
   	<jsp:include page="${request.contextPath}/NewFooter_JS"></jsp:include>
    <!-- Header End -->

	</body>
</html>

    