<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.spring.imfind.imf.PoliceVO"%>
<%@ page import="com.spring.imfind.el.YH.LoginDTO"%>
<%@ page import="com.spring.imfind.el.EJ.BoardVO"%>
<%@ page import="com.spring.imfind.el.EJ.PetVO"%>
<%@ page import="com.spring.imfind.el.MJ.ItemVO"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML>
<html>
<!-- Header Section Begin -->
<jsp:include page="${request.contextPath}/NewHeader_CSS"></jsp:include>
<!-- Header End -->

<!-- swiper 플러그인 -->
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css">
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

<%
	List<BoardVO> boardvo = (List<BoardVO>) request.getAttribute("boardvo");
	List<PetVO> petvo = (List<PetVO>) request.getAttribute("petvo");
	//lost_pay_rank
    List<ItemVO> list3 = (List<ItemVO>) request.getAttribute("lost_pay_rank");
    //pet_pay_rank
    List<PetVO> list4 = (List<PetVO>) request.getAttribute("pet_pay_rank");
    //lost_like_rank
    List<ItemVO> lostRank = (List<ItemVO>) request.getAttribute("lost_like_rank");
    //pet_like_rank
    List<PetVO> petRank = (List<PetVO>) request.getAttribute("pet_like_rank");
    SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
    SimpleDateFormat format2= new SimpleDateFormat("yyyy-MM-dd");
    SimpleDateFormat format3 = new SimpleDateFormat("yyyy-MM-dd");
    SimpleDateFormat format4 = new SimpleDateFormat("yyyy-MM-dd");
%>

<style>
.box {
	/* border : 1px solid black; */
	width: 50vw;
	position: absolute;
	left: 50%;
	padding-top: 50px;
}
.flexslider.js-fullheight {
	width: 50vw;
}
.slides {
	width: 200%;
}
.swiper-container2 > #swiper-wrapper > div.swiper-slide{
	width:100%;
}
#slide-1,
#slide-2{
	width: 100%;
}
@media screen and (max-width: 992px) {
	.box {
		width: 100vw;
		left: 0;
	}
}
.li-group {
	padding-left: 50px;
}
.li-group>ul {
	list-style: none;
}
.li-group>ul>li {
	min-height: 40px !important;
	border: none;
	font-family: 'Noto Sans KR', sans-serif;
	margin: 48px 33px 0 0;
	padding: 0 0 0 0;
	border: 0;
	float: left;
	font-size: 2.3rem;
}
.li-group>ul>li:hover {
	transform: scale(1.2);
	tarnsition: transform 1s;
}
.li-group>ul>li>a {
	color: black;
	font-family: 'Noto Sans KR', sans-serif;
}
.flex-active-slide>div:nth-child(2)>div:nth-child(1)>div:nth-child(2)>div:nth-child(2)>ul:nth-child(1)>li
	{
	background: white;
}
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
.notosanskr * {
	font-family: 'Noto Sans KR', sans-serif;
}
nav {
	position: fixed;
	top: 0;
	width: 100vw;
	left: 0;
	z-index: 100;
	padding-right: 35px;
}
aside {
	padding-top: 6.76%;
}
.fh5co-nav #fh5co-logo {
	font-size: 31px;
}
#fh5co-services {
	margin-top: 195px !important;
}
.overlay {
	position: absolute;
	bottom: 28px;
	left: 14px;
	right: 0;
	background-color: rgba(0, 0, 0, 0.2);
	overflow: hidden;
	width: 90%;
	height: 95.03%;
	padding: 0;
}
.services:hover .overlay {
	height: 100%;
}
div.col-lg-3:hover .overlay {
	height: 100%;
	z-index: 1000;
}
div.col-lg-3 {
	height: 100%;
	padding: 0 7px 0 7px;
}
#fh5co-blog>div>div.row {
	margin: 0 auto;
}
.title {
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 74px;
}
.fh5co-nav ul li a {
	font-family: 'Noto Sans KR', sans-serif;
	font-weigth: bold;
	font-size: 15px;
	padding: 29px 15px;
	color: rgba(0, 0, 0, 0.7);
	-webkit-transition: 0.5s;
	-o-transition: 0.5s;
	transition: 0.5s;
}
.fh5co-blog .blog-text {
	padding: 16px !important;
	margin-top: 1px;
	font-size: 1.5rem;
	max-height: 146px;
	overflow: hidden;
	vertical-align: top;
	text-overflow: ellipsis;
	word-break: break-word;
	border-radius:11px;
}
.blog-text, #fh5co-blog>div>div>div>div>div>h3, h2, p {
	font-family: 'Noto Sans KR', sans-serif !important;
}
@media ( max-width : 500px) {
	.row.siren {
		display: flex;
		flex-direction: column;
	}
}
@media ( min-width : 1200px) {
	.col-lg-3 {
		width: 20%;
		max-height: 493px;
	}
	.row.siren {
		display: flex;
	}
	div.thumb>img {
		width: 200px;
		max-height: 200px !important;
		object-fit: cover;
	}
	.fh5co-blog.siren {
		display: flex;
		justify-content: center;
		align-items: center;
		margin-right: 15px;
		border: 1px solid rgb(238, 238, 238);
	}
	.blog-text.siren {
		max-height: 225px;
		height: 199px;
		width: 367px;
		margin: 0;
	}
}
section {
	position: relative;
	top: 76px;
}
section#first {
	background: #FBF7F2;
	padding-top: 28px;
	height:90vh;
}
footer {
	position: relative;
	top: 300px;
}
.fh5co-blog .img-responsive, .police-photo {
	object-fit: contain;
	overflow: hidden;
	height: 182px !important;
}
.text.map {
	display: flex;
	justify-content: flex;
	align-items: flex;
}
div.container-fluid:nth-child(1)>div:nth-child(1) {
	display: flex;
	justify-content: center;
	align-items: center;
	margin-bottom: 8px;
	position: relative;
	top: -15px;
}
.fh5co-nav {
	padding-right: 18px !important;
	background: white;
}
.swiper-container {
	width: 100%;
	height: 340px;
}
.swiper-container.row {
	width: 100%;
	height: 320px;
}
.arrow-container {
	display: flex;
	justify-content: center;
	align-items: center;
	position: relative;
	top: -175px;
}
.arrow-next, .arrow-prev, .arrow-next2, .arrow-prev2 {
	margin: 0 595px;
	color: rgba(0, 0, 0, 0.3);
	cursor: pointer;
}
.swipe-slide {
	box-shadow: 0 2px 4px 0 hsla(0, 0%, 80.8%, .5);
}
.hidden-panel {
	opacity: 100%;
}
.hidden-panel:hover {
	opacity: 0%;
	background: black;
	width: 100%;
	height: 100%;
}
/* 인덱스 css 다시하기 */
.container-police, .container-poeplelost, .container-animal,
	.container-btn {
	width: 75vw;
	margin: 0 auto;
}
@media ( min-width : 1900px) {
	.container-police, .container-poeplelost, .container-animal {
		width: 60vw;
		margin: 0 auto;
	}
}
#fh5co-blog {
	padding-top: 0;
	padding-bottom: 16px;
	
}
/* 경찰청 분실물 row */
.container-police>div:nth-child(1)>div:nth-child(1) {
	margin: 0 auto;
	width: 1170pw;
	padding: 0;
}
.container-police > #fh5co-blog,
.section.lostpost,
.section.petpost{
	margin-top:25px;
}
.col-md-8.col-md-offset-2.text-center.fh5co-heading {
	margin-bottom: 16px;
}
.cover {
	opacity: 0; /* for demo purpose  */
}
.stack-top {
	z-index: 9;
	background: rgba(36, 49, 70, 0.76);
	width: 98%;
	height: 97%;
	position: absolute;
	margin: 0;
	padding: 0;
	top: 0;
	left: 0;
	border-radius:11px;
}
.cover:hover {
	opacity: 0.6;
}
h3.lost-title>a {
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 1.5rem;
}
.banner {
	width: 100%;
	margin-left: 0 !important;
	height: 342px !important;
}
.fh5co-blog.lost {
	max-width: 220px;
	max-height: 209.3px !important;
}
.fh5co-blog.lost>a>img {
	width: 100% !important;
    object-fit: cover !important;
    border-radius: 11px;
    height: 200px;
}
.slider-text-bg {
	min-height: 221px !important;
}
.flex-control-nav {
	top: 290px;
}
.container-btn {
	margin-top: 0;
	z-index: 8;
	position: relative;
}
.container-btn>.row {
	display: flex;
	justify-content: space-between;
}
span.posted_on {
	margin-right: 72px !important;
}
.col-sm-3>div.card {
	border: rgb(238, 238, 238);
}
/*MJ footer*/
.col-md-push-1 {
	position: relative;
	top: 50px;
}
.col-md-12 {
	display: flex;
	justify-content: space-between;
}
#imfindlogo {
	width: 250px;
	height: 180px;
	position: relative;
	right: 250px;
	top: 50px;
}
.block {
	position: relative;
	left: 436px;
	margin: 0 auto;
}
.row row-pb-md {
	position: relative;
	height: 300px;
}
#siren {
	width: 33px;
	margin-bottom: 5px;
}
.swiper-container.siren {
	width: 500px;
	height: 100%;
	margin: 0;
}
.swiper-container.siren2 {
	width: 400px;
	height: 100%;
}
.swiper-slide.fh5co-blog.siren {
	width: 500px;
}
div.container-left {
	width: 45%;
	height: 700px;
	float: left;
	box-sizing: border-box;
	float: left;
}
div.container-right {
	width: 513px;
	height: 700px;
	float: right;
	box-sizing: border-box;
	margin-top: 8%;
}
.slider-box {
	width: 100%
}
.swiper-container2 {
	width: 100%;
	height: 100%;
}
.like_rank, .pay_rank{
/* 	margin-top:30px; */
	height: 40%;
    display: flex;
    flex-direction: column;
}
.photo{
	width: 120px !important;
}
.photo > img{
	width : 100% !important;
	border-radius:11px;
    height: 114px;
    object-fit: cover;
        border: 1px solid rgb(221, 221, 221) !important;
    border-radius: 12px !important;
}
.title{
	font-size:15px !important;
}
.img-responsive{
	border-radius:11px;
	width:220px;
	height:200px;
}
.img-con{
	padding-top:30px;
}
#like_rank > div > div > a > div.simpleinfo,
div.pay_rank > div > div > a > div.simpleinfo{
	margin-left:20px;
	padding: auto 0;
}
/* .like_rank_lost{
	border: 1px solid gray;
    border-radius: 11px;
} */
.like_rank_lost{
	display:flex;
	z-index:10;
	-webkit-box-direction: normal !important;
    -webkit-box-orient: horizontal !important;
    display: flex !important;
    flex-direction: row !important;
    overflow: hidden !important;
    border: 1px solid rgb(221, 221, 221) !important;
    border-radius: 12px !important;
    padding: 12px 16px 12px 12px !important;
    background:white;
    margin-bottom: 16px;
}
	
}
</style>

<script>
function doPopupopen(x,y,code) { 
       openWin = window.open("./police?x="+x+"&y="+y+"&code="+code+"", "");
}
function getXY (getUserLocation){
   
   if('geolocation' in navigator) {
        /* 위치정보 사용 가능 */
        var options = {
           enableHighAccuracy: true,
        };
        navigator.geolocation.getCurrentPosition((position, options) => {
           var coords =  {'y' : position.coords.latitude, 'x' : position.coords.longitude };
           getUserLocation(coords); // 현재위치 주소 얻기
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
      //async : false,
      data : { 'x' : coords.x, 'y' : coords.y },
      success : function(data){
         //호출 성공하면 작성할 내용
            if(data.documents.length != 0 ){ // 값이 있으면
            var result = data.documents[0]
            
            var item =  {'city' : result.region_1depth_name,
                       'gu' : result.region_2depth_name,
                       'x' : result.x,
                       'y' : result.y}
        
               document.querySelector('.fh5co-heading h2').innerHTML =  '<i class="fas fa-street-view"></i> '+ item.city + ' ' + item.gu + ' 습득물'
               return item;
         }
      }, 
      error:function(request,status,error){
          alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
      }
   }).done(function(data){
       getListNearMe(coords);
   });   
}
//유희 추가함
function getChangeDateString(originalDate) {
	var fromNow = moment(originalDate).startOf('day').fromNow();
	console.log(fromNow)
	var fromNowTrim = fromNow.substr(0, 2).trim();
	console.log(fromNowTrim)
	if (fromNow.includes('days')) {
		if (fromNowTrim == '2' || fromNowTrim == '3' || fromNowTrim == '4'
				|| fromNowTrim == '5' || fromNowTrim == '6') {
			return fromNowTrim + '일전';
			// $('#lost_Re_Date').text(fromNow +'일전');
		} else {
			return moment(originalDate).format('YYYY-MM-DD');
			// $('#lost_Re_Date').text(moment(originalDate).format('YYYY-MM-DD'));
		}
	} else if (fromNow == 'a day ago') {
		return '어제';
		// $('#lost_Re_Date').text('어제');
	} else if (fromNow.includes('hours')) {
		return fromNowTrim + '시간 전';
		// $('#lost_Re_Date').text(fromNowTrim + ' 시간 전')
	}
}
document.addEventListener('DOMContentLoaded', function(){
    
    // swiper 초기화 시키기
    var mySwiper1 = new Swiper('.swiper-container.police',{
       
      slidesPerView: 5,
      direction : 'horizontal',
      loop : true,
      spaceBetween: 10,
      observer: true,
      autoplay : {
         delay : 2500,
      },
/*       pagination : {
         el: '.swiper-pagination.first',
         type: 'progressbar',
      }, */
    
      navigation : {
         nextEl: '.arrow-next',
         prevEl: '.arrow-prev',
      },
    });
    
    // swiper 초기화 시키기
    var mySwiper2 = new Swiper('.swiper-container.lost',{
       
      slidesPerView: 5,
      direction : 'horizontal',
      loop : true,
      spaceBetween: 10,
      observer: true,
      autoplay : {
         delay : 2500,
      },
      pagination : {
         el: '.swiper-pagination.second',
          type: 'progressbar',
      },
    
      navigation : {
         nextEl: '.arrow-next2',
         prevEl: '.arrow-prev2',
      },
    });
    
     // swiper 초기화 시키기
    var mySwiper = new Swiper('.swiper-container',{
       
      slidesPerView: 5,
      direction : 'horizontal',
      loop : true,
      spaceBetween: 10,
      observer: true,
      
      pagination : {
         el: '.swiper-pagination',
          type: 'progressbar',
      },
    
      navigation : {
         nextEl: '.arrow-next',
         prevEl: '.arrow-prev',
      },
    }); 
     
    // swiper 초기화 시키기
    var swiperSiren = new Swiper('.swiper-container.siren',{
       
      slidesPerView: 1,
      direction : 'horizontal',
      loop : true,
      
    }); 
    
    // swiper 초기화 시키기
    var swiperSiren = new Swiper('.swiper-container.siren2',{
       
      slidesPerView: 1,
      direction : 'horizontal',
      loop : true,
      pagination : {
         el: '.swiper-pagination.siren2',
         clickable: true,
      },
    }); 
    // 랭크 swiper 초기화 시키기
    var swiperSiren = new Swiper('.swiper-container.topRank',{
       
      slidesPerView: 1,
      direction : 'horizontal',
      mousewheel: true,
      loop:true,
      pagination : {
          type: 'bullets',
          clickable: true,
       },
  
    }); 
    
    var result = getXY(getUserLocation);
    
});
</script>
</head>

<body>


	<jsp:include page="${request.contextPath}/el/afterLoginHeader"></jsp:include>


	<root>
	<div class="page"></div>
	<section id="first">
			
			<div class="container">
				<div class="container-left">
				<div id="fh5co-hero" class="js-fullheight">
						<div class="flexslider js-fullheight top">
							<ul class="slides" style="width:100%;">
								<li style="width: 100%;">
									<div class="js-fullheight slider-text slider-text-bg">
										<div class="imgcrop">
											<div class="img-con">
												<img src="./resources/el/images/IMFIND.jpg" alt="" style="top:-111px;"> 
											</div>
										</div>
									</div>
								</li>
								<li style="width: 100%;">
									<div class="js-fullheight slider-text slider-text-bg">
										<div class="imgcrop">
											<div class="img-con">
												<img src="./resources/el/images/imf.jpg" alt="" >
											</div>
										</div>
									</div>
								</li>
						  	</ul>
						</div>
					</div>
				</div>
				<div class="container-right">
					<div class="icon-scroll"></div>
					<div class="swiper-container topRank">
						<div class="swiper-wrapper topRank">
							<div class="swiper-slide topRank">
								<div class="swiper-slide-con">
									<div id="like_rank" class="like_rank"> 
									<div class="like-rank-title">
										<h2>많은 사람들이 찾기를 바라고 있어요!</h2>
										<p>가장 많은 올리기를 받은 분실물 입니다.</p>
									</div>
									
									</div>
								</div>
								<!-- end like_rank -->
							</div>
							<!-- slide 1 -->
							<div class="swiper-slide topRank"> 
								<div class="swiper-slide-con">
									<div class="pay_rank">
										<div class="pay_rank-title">
											<div class="best-icon pay ">
												<img src="./resources/home/images/cash3.png" alt="" /> 
											</div>
											<h2>간절하게 찾고 있어요!</h2>
											<p>가장 많은 사례금이 달린 분실물 입니다.</p>
										</div>
									
									 </div>
								 </div>
							</div>
							<!-- slide 2 -->
						</div>
						<!--  <div class="swiper-pagination topRank" style="top:59%;"></div> -->
					</div>
				</div>
			</div>
	</section>
	<!-- 공공데이터 구역  -->
	<section>
		<div class="container-police" id="police">
			<div id="fh5co-blog">
				<div class="container">
					<div class="row animate-box">
						<div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
							<h2>Recent Post</h2>
							<p>사용자의 현재 위치 근처에 있는 분실물과 습득물입니다.</p>
						</div>
					</div>
					<div class="swiper-container police">
						<div class="swiper-wrapper first"></div>
					</div>
				</div>
				<div class="arrow-container">
					<div class="arrow-prev">
						<i class="fas fa-chevron-left fa-3x"></i>
					</div>
					<div class="arrow-next">
						<i class="fas fa-chevron-right fa-3x"></i>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 공공데이터 구역 끝  --> <!-- 분실물 구역 시작 -->
	<section>
		<div class="container-poeplelost" id="people">
			<div id="fh5co-blog" class="section lostpost">
				<div class="container">
					<div class="row animate-box">
						<div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
							<h2>
								분실물 찾아주세요
								<svg xmlns="http://www.w3.org/2000/svg" viewBox="4 -10 24 24"
									width="64" height="48">
									<path fill-rule="evenodd"
										d="M3.267 1.457c.3.286.312.76.026 1.06A6.475 6.475 0 001.5 7a6.472 6.472 0 001.793 4.483.75.75 0 01-1.086 1.034 8.89 8.89 0 01-.276-.304l.569-.49-.569.49A7.971 7.971 0 010 7c0-2.139.84-4.083 2.207-5.517a.75.75 0 011.06-.026zm9.466 0a.75.75 0 011.06.026A7.975 7.975 0 0116 7c0 2.139-.84 4.083-2.207 5.517a.75.75 0 11-1.086-1.034A6.475 6.475 0 0014.5 7a6.475 6.475 0 00-1.793-4.483.75.75 0 01.026-1.06zM8.75 8.582a1.75 1.75 0 10-1.5 0v5.668a.75.75 0 001.5 0V8.582zM5.331 4.736a.75.75 0 10-1.143-.972A4.983 4.983 0 003 7c0 1.227.443 2.352 1.177 3.222a.75.75 0 001.146-.967A3.483 3.483 0 014.5 7c0-.864.312-1.654.831-2.264zm6.492-.958a.75.75 0 00-1.146.967c.514.61.823 1.395.823 2.255 0 .86-.31 1.646-.823 2.255a.75.75 0 101.146.967A4.983 4.983 0 0013 7a4.983 4.983 0 00-1.177-3.222z"></path></svg>
							</h2>
							<p>최근 분실 신고된 분실물입니다.</p>
						</div>
					</div>
					<div class="swiper-container lost">
						<div class="swiper-wrapper lost"></div>
						<!-- <div class="swiper-pagination second"></div> -->
					</div>
				</div>
				<div class="arrow-container">
					<div class="arrow-prev2">
						<i class="fas fa-chevron-left fa-3x"></i>
					</div>
					<div class="arrow-next2">
						<i class="fas fa-chevron-right fa-3x"></i>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 분실물 구역 끝 --> <!-- 동물 분실 시작 -->
	<section>
		<div class="container-animal" id="animal">
			<div id="fh5co-blog" class="section petpost">
				<div class="container">
					<div class="row animate-box">
						<div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
							<h2>반려동물을 찾아주세요</h2>
							<p>사용자의 현재 위치에서 분실신고된 반려동물입니다.</p>
						</div>
					</div>
					<div class="row swiper-container pet">
						<div class="swiper-wrapper pet" >
						</div>
					</div>
				</div>
				<div class="arrow-container">
					<div class="arrow-prev">
						<i class="fas fa-chevron-left fa-3x"></i>
					</div>
					<div class="arrow-next">
						<i class="fas fa-chevron-right fa-3x"></i>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 동물 분실 끝 --> </root>
	<!-- footer 시작 -->	
	<footer id="fh5co-footer" role="contentinfo"
		style="padding-top: 0px; padding-bottom: 0px; height: 130px;">
		<div class="container" style="display: flex; padding-bottom: 0px;">
			<div class="iseoulu" style="display: flex; margin-top: 30px;">
			
                <img style="cursor:pointer; width:200px;height:60px;" onclick="window.open('https://www.lost112.go.kr/','','height=800px, width=800px')" width="45%" height="80px" src="./resources/if/images/p_mark.PNG" title="경찰청 분실물 홈페이지로 이동합니다">
                <img style="margin-left: 30px; cursor:pointer; width:200px;height:60px;" onclick="window.open('https://www.seoul.go.kr/main/index.jsp','','height=800px, width=800px')" width="45%" height="80px" src="./resources/if/images/s_mark.PNG" title="대중교총 분실물 홈페이지로 이동합니다">
            </div>
            
				<div class="col-md-4 col-md-push-1" style="margin-bottom: 50px; margin-left: 229px;">
						<h3 style="margin-bottom: 0px;">
						IMFIND</h3>
					<div class="fh5co-footer-links" style="color: gray; width: 400px;">
						<p>69, Jong-ro, Jongno-gu, Seoul, Republic of Korea YMCA <br></p>
					</div>
				</div> 
			
	 	</div>
	</footer>  
	<!-- footer 끝 -->

	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
	</div>

	<!-- Header Section Begin -->
	<jsp:include page="${request.contextPath}/NewFooter_JS"></jsp:include>
	<!-- Header End -->

</body>
</html>