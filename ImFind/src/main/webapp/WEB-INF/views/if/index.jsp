<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<title>분실물 조회</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- <link type="text/css" href="style/jquery.jscrollpane.css" rel="stylesheet" media="all" />
 -->
 <jsp:include page="${request.contextPath}/NewHeader_CSS"></jsp:include>
<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/home/css/css_YH.css?after" type="text/css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/if/css/style.css?after">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Poor+Story&display=swap" rel="stylesheet">
<%-- <script src="${pageContext.request.contextPath}/resources/home/js/main.js"></script> --%>

<style>
.fh5co-nav .top-menu {
  padding: 28px 0;
}
.fh5co-nav #fh5co-logo {
  font-size: 24px;
  margin: 0;
  padding: 0;
  text-transform: uppercase;
  font-weight: 700;
  font-family: 'Noto Sans KR', sans-serif;
}
.fh5co-nav #fh5co-logo a span {
  color: #317AE1;
}
.fh5co-nav a {
  padding: 5px 10px;
  color: #000;
}
@media screen and (max-width: 768px) {
  .fh5co-nav .menu-1 {
    display: none;
  }
}
.fh5co-nav ul {
  padding: 0;
  margin: 5px 0 0 0;
}
.fh5co-nav ul li {
  padding: 0;
  margin: 0;
  list-style: none;
  display: inline;
  text-transform: uppercase;
  letter-spacing: 2px;
}
.fh5co-nav ul li a {
  font-size: 12px;
  padding: 30px 15px;
  color: rgba(0, 0, 0, 0.7);
  -webkit-transition: 0.5s;
  -o-transition: 0.5s;
  transition: 0.5s;
}
.fh5co-nav ul li a:hover, .fh5co-nav ul li a:focus, .fh5co-nav ul li a:active {
  color: black;
}
.fh5co-nav ul li.has-dropdown {
  position: relative;
}
.fh5co-nav ul li.has-dropdown .dropdown {
  width: 140px;
  -webkit-box-shadow: 0px 14px 33px -9px rgba(0, 0, 0, 0.75);
  -moz-box-shadow: 0px 14px 33px -9px rgba(0, 0, 0, 0.75);
  box-shadow: 0px 14px 33px -9px rgba(0, 0, 0, 0.75);
  z-index: 1002;
  visibility: hidden;
  opacity: 0;
  position: absolute;
  top: 40px;
  left: 0;
  text-align: left;
  background: #000;
  padding: 20px;
  -webkit-border-radius: 4px;
  -moz-border-radius: 4px;
  -ms-border-radius: 4px;
  border-radius: 4px;
  -webkit-transition: 0s;
  -o-transition: 0s;
  transition: 0s;
}
.fh5co-nav ul li.has-dropdown .dropdown:before {
  bottom: 100%;
  left: 40px;
  border: solid transparent;
  content: " ";
  height: 0;
  width: 0;
  position: absolute;
  pointer-events: none;
  border-bottom-color: #000;
  border-width: 8px;
  margin-left: -8px;
}
.fh5co-nav ul li.has-dropdown .dropdown li {
  display: block;
  margin-bottom: 7px;
}
.fh5co-nav ul li.has-dropdown .dropdown li:last-child {
  margin-bottom: 0;
}
.fh5co-nav ul li.has-dropdown .dropdown li a {
  padding: 2px 0;
  display: block;
  color: #999999;
  line-height: 1.2;
  text-transform: none;
  font-size: 13px;
  letter-spacing: 0;
}
.fh5co-nav ul li.has-dropdown .dropdown li a:hover {
  color: #fff;
}
.fh5co-nav ul li.has-dropdown:hover a, .fh5co-nav ul li.has-dropdown:focus a {
  color: #000;
}
.fh5co-nav ul li.btn-cta a {
  padding: 30px 0px !important;
  color: #fff;
}
.fh5co-nav ul li.btn-cta a span {
  background: #317ae1;
  padding: 4px 10px;
  display: -moz-inline-stack;
  display: inline-block;
  zoom: 1;
  *display: inline;
  -webkit-transition: 0.3s;
  -o-transition: 0.3s;
  transition: 0.3s;
  -webkit-border-radius: 100px;
  -moz-border-radius: 100px;
  -ms-border-radius: 100px;
  border-radius: 100px;
}
.fh5co-nav ul li.btn-cta a:hover span {
  -webkit-box-shadow: 0px 14px 20px -9px rgba(0, 0, 0, 0.75);
  -moz-box-shadow: 0px 14px 20px -9px rgba(0, 0, 0, 0.75);
  box-shadow: 0px 14px 20px -9px rgba(0, 0, 0, 0.75);
}
.fh5co-nav ul li.active > a {
  color: #000 !important;
  position: relative;
}
.fh5co-nav ul li.active > a:after {
  position: absolute;
  bottom: 25px;
  left: 0;
  right: 0;
  content: '';
  width: 30px;
  height: 2px;
  background: #317AE1;
  margin: 0 auto;
}
.fh5co-nav a {
    padding: 5px 10px;
    color: #000;
}
.fh5co-nav #fh5co-logo {
    font-size: 31px;
}
.fh5co-nav #fh5co-logo {
    text-transform: uppercase;
    font-weight: 700;
    font-family: 'Noto Sans KR', sans-serif;
}
.fh5co-nav ul li a {
    font-family: 'Noto Sans KR', sans-serif;
    font-size: 15px;
    padding: 29px 15px;
    color: rgba(0, 0, 0, 0.7);
 
    transition: 0.5s;
}
.fh5co-nav ul li {
    padding: 0;
    margin: 0;
    list-style: none;
    display: inline;
    text-transform: uppercase;
    letter-spacing: 2px;
}
#fh5co-offcanvas ul li.offcanvas-has-dropdown > a {
  display: block;
  position: relative;
}
#fh5co-offcanvas ul li.offcanvas-has-dropdown > a:after {
  position: absolute;
  right: 0px;
  font-family: 'icomoon';
  speak: none;
  font-style: normal;
  font-weight: normal;
  font-variant: normal;
  text-transform: none;
  line-height: 1;
  /* Better Font Rendering =========== */
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  content: "\e921";
  font-size: 20px;
  color: rgba(255, 255, 255, 0.2);
  -webkit-transition: 0.5s;
  -o-transition: 0.5s;
  transition: 0.5s;
}
#fh5co-offcanvas ul li.offcanvas-has-dropdown.active a:after {
  -webkit-transform: rotate(-180deg);
  -moz-transform: rotate(-180deg);
  -ms-transform: rotate(-180deg);
  -o-transform: rotate(-180deg);
  transform: rotate(-180deg);
}
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
.fh5co-nav-toggle {
  width: 25px;
  height: 25px;
  cursor: pointer;
  text-decoration: none;
  top: 25px !important;
}
.fh5co-nav-toggle.active i::before, .fh5co-nav-toggle.active i::after {
  background: #444;
}
.fh5co-nav-toggle:hover, .fh5co-nav-toggle:focus, .fh5co-nav-toggle:active {
  outline: none;
  border-bottom: none !important;
}
.fh5co-nav-toggle i {
  position: relative;
  display: inline-block;
  width: 25px;
  height: 2px;
  color: #252525;
  font: bold 14px/.4 Helvetica;
  text-transform: uppercase;
  text-indent: -55px;
  background: #252525;
  transition: all .2s ease-out;
}
.fh5co-nav-toggle i::before, .fh5co-nav-toggle i::after {
  content: '';
  width: 25px;
  height: 2px;
  background: #252525;
  position: absolute;
  left: 0;
  transition: all .2s ease-out;
}
.fh5co-nav-toggle.fh5co-nav-white > i {
  color: #fff;
  background: #000;
}
.fh5co-nav-toggle.fh5co-nav-white > i::before, .fh5co-nav-toggle.fh5co-nav-white > i::after {
  background: #000;
}
.fh5co-nav-toggle i::before {
  top: -7px;
}
.fh5co-nav-toggle i::after {
  bottom: -7px;
}
.fh5co-nav-toggle:hover i::before {
  top: -10px;
}
.fh5co-nav-toggle:hover i::after {
  bottom: -10px;
}
.fh5co-nav-toggle.active i {
  background: transparent;
}
.fh5co-nav-toggle.active i::before {
  top: 0;
  -webkit-transform: rotateZ(45deg);
  -moz-transform: rotateZ(45deg);
  -ms-transform: rotateZ(45deg);
  -o-transform: rotateZ(45deg);
  transform: rotateZ(45deg);
  background: #fff;
}
.fh5co-nav-toggle.active i::after {
  bottom: 0;
  -webkit-transform: rotateZ(-45deg);
  -moz-transform: rotateZ(-45deg);
  -ms-transform: rotateZ(-45deg);
  -o-transform: rotateZ(-45deg);
  transform: rotateZ(-45deg);
  background: #fff;
}
.fh5co-nav-toggle {
  position: absolute;
  right: 0px;
  top: 65px;
  z-index: 21;
  padding: 6px 0 0 0;
  display: block;
  margin: 0 auto;
  display: none;
  height: 44px;
  width: 44px;
  z-index: 2001;
  border-bottom: none !important;
}
.container {
	display: flex;
	margin-top: 45px;
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/el/Socket/alarm.jsp" %>

<nav class="fh5co-nav" role="navigation">
	<div class="top-menu">
		<div class="container-fluid main-nav">
			<div class="row">
				<div class="col-xs-2"> <!-- padding-left: 251px; -->
					<div id="fh5co-logo" style=" margin-top: 0px;"><a href="./home.do">ImFind<span>.</span></a></div>
				</div>
				<div class="col-xs-10 text-right menu-1">
					<ul>
						<li class="has-dropdown">  <!-- style="padding-left: 700px;" -->
							<a href="#">습득물 조회 <i class="fas fa-sort-down"></i></a>
							<ul class="dropdown">
								<li><a href="index.if">경찰청</a></li>
								<li><a href="etc_index.if">etc</a></li>
								<li><a href="select.if">지역으로 찾기</a></li>
								<li> <a href="#" onclick="window.open('https://www.handphone.or.kr/','','height=800px, width=800px')">핸드폰찾기</a></li>
							</ul>
						</li>
						<li class="has-dropdown">
							<a href="#">분실물 등록 <i class="fas fa-sort-down"></i></a>
							<ul class="dropdown">
								<li><a href="./itemboard">물건</a></li>
								<li><a href="./petboard">동물</a></li>
							</ul>
						</li>
						<li class="has-dropdown">
							<a href="#">분실물 조회 <i class="fas fa-sort-down"></i></a>
							<ul class="dropdown">
								<li><a href="./item">물건</a></li>
								<li><a href="./pet">동물</a></li>
							</ul>
						</li>
						<c:set var="user" value='${loginUser}'/>
							<c:choose>
								    <c:when test="${user eq null}">
										<li class="btn-cta"><a href="./login"><span>Login</span></a></li> 
										<li class="btn-cta"><a href="./register"><span >회원가입</span></a></li> 
								    </c:when>
								    <c:when test="${user eq 'admin'}">
										<li class="btn-cta"><a href="./logout"><span>Logout</span></a></li> 
										<li class="btn-cta"><a href="./admintest"><span >관리자페이지</span></a></li> 		
								    </c:when>
								    <c:otherwise>
										<li class="btn-cta"><a href="./logout"><span>Logout</span></a></li> 
										<li class="btn-cta"><a href="./mypage"><span >마이페이지</span></a></li> 		
								    </c:otherwise>
							</c:choose>
					</ul>
				</div>
			</div>
		</div>
	</div>
</nav>
	<div class="wrapper d-flex align-items-stretch">
		<!-- style="background-image: url(${pageContext.request.contextPath}/resources/if/images/bg_1.jpg); -->
		<nav id="sidebar" class="order-last" class="img">
			
				<!-- 조회 리스트 뿌려줄 공간 -->
				<!-- 구역 표시때문에 border색 지정해줌 바꾸삼 -->
				<div class="nav-content">
					<div class="manual">
						<h4 class="h2o2">이용방법</h4>
						<ul>
							<li>주소 옆 이미지를 누르면 쉽게 길을 찾을 수 있어요.</li>
							<li>이미지를 클릭하면 공공기관 이름이 나와요.</li>
							<li>공공 기관명을 클릭하면 분실물 정보와 해당 기관을 확인할 수 있어요.</li>
							<li>분실물을 선택하면 해당 분실물의 상세정보를 알 수 있어요.</li>
						</ul>
					</div>
					<div class="movie">
						<iframe width="450" height="315"
							src="https://www.youtube.com/embed/3XYyHq2JBn4" frameborder="0"
							allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
							allowfullscreen></iframe>
						</table>
					</div>
					<div align="center" class="police"></div>
					<div class="tableif"></div>
				</div>
			
		</nav>
		<!-- Page Content  -->
		<div id="content">
			<!-- 지도 -->
			<div id="map" style="width: 100%; height: 100%;"></div>
		</div>
	</div>

	<!-- footer 시작 -->
	<footer id="fh5co-footer" role="contentinfo"
		style="position: fixed; bottom: 0; width: 100%; padding-top: 0px;padding-bottom: 0px;background-color: #efefef;height: 130px;">
		<div class="container" style="padding-bottom: 0px;height: 130px; margin-top: 9px;">
		<%-- <img style="height: 130px;" id="imfindlogo" src="${pageContext.request.contextPath}/resources/el/img/55.PNG"/> --%>
			<div class="iseoulu" style=" margin-top: 30px;">
                <img style="cursor:pointer; width:200px;height:60px;" onclick="window.open('https://www.lost112.go.kr/','','height=800px, width=800px')" width="45%" height="80px" src="./resources/if/images/p_mark.PNG" title="경찰청 분실물 홈페이지로 이동합니다">
                <img style="cursor:pointer; width:200px;height:60px;" onclick="window.open('https://www.seoul.go.kr/main/index.jsp','','height=800px, width=800px')" width="45%" height="80px" src="./resources/if/images/s_mark.PNG" title="대중교총 분실물 홈페이지로 이동합니다">
            </div>
               
            <div class="col-md-4 col-md-push-1" style="margin-top: 33px;margin-left: 229px;">
            
           		<h3>IMFIND</h3>
				<ul class="fh5co-footer-links">
					<li>69, Jong-ro, Jongno-gu, Seoul, Republic of Korea YMCA <br></li>
				</ul>
			</div>   
		</div>
	</footer>
	<!-- footer 끝 -->
	
	<!--End Modal-->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.js"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5e9646f261380e768a278eb16f4f6768&libraries=clusterer"></script>
	<script
		src="${pageContext.request.contextPath}/resources/if/js/police.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/if/js/bootstrap.min.js"></script>

      
      <!-- jQuery Easing -->
   <script src="${pageContext.request.contextPath}/resources/home/js/jquery.easing.1.3.js"></script>
   <!-- Waypoints -->
   <script src="${pageContext.request.contextPath}/resources/home/js/jquery.waypoints.min.js"></script>
   <!-- Flexslider -->
   <script src="${pageContext.request.contextPath}/resources/home/js/jquery.flexslider-min.js"></script>
   <!-- Magnific Popup -->
   <script src="${pageContext.request.contextPath}/resources/home/js/jquery.magnific-popup.min.js"></script>
   <script src="${pageContext.request.contextPath}/resources/home/js/magnific-popup-options.js"></script>
   <!-- Main -->
   <script src="${pageContext.request.contextPath}/resources/home/js/main.js"></script>



</body>
</html>