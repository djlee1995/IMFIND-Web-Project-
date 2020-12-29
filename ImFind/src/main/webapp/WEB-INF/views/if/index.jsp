<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<title>Sidebar 04</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- <link type="text/css" href="style/jquery.jscrollpane.css" rel="stylesheet" media="all" />
 --><link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/if/css/style.css">


</head>
<body>




	<div class="wrapper d-flex align-items-stretch">
		<!-- style="background-image: url(${pageContext.request.contextPath}/resources/if/images/bg_1.jpg); -->
		
		<nav id="sidebar" class="order-last" class="img">
		
			<div class="custom-menu">
				<button type="button" id="sidebarCollapse" class="btn btn-primary">
				</button>
			</div>
			
			<div class="">
				<h1>
					<a href="#" class="logo">IF <span>분실물 조회</span></a>
				</h1>
				<ul class="list-unstyled components mb-5">
				<!-- 메뉴 버튼 추가시 li 태그 추가하면 됨. -->
					<li class="active">
						<a href="#"><span class="fa fa-home mr-3"></span> 지도</a>
					</li>
					<li>
						<a href="#"><span class="fa fa-user mr-3"></span>조회</a>
					</li>
				</ul>
				<div class="police">
				
				</div>
				<!-- 조회 리스트 뿌려줄 공간 -->
				<!-- 구역 표시때문에 border색 지정해줌 바꾸삼 -->
				<div class="nav-content" style="overflow: auto;">
					<table id="output" border="1"></table>
				</div>

				
				
			</div>

		</nav>

		<!-- Page Content  -->
		<div id="content" >
			
			<!-- 지도 -->
			 
			<div id="map" style="width:100%; height:100%;">
			
			</div>
		</div>
	</div>
	<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js" ></script> 
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5e9646f261380e768a278eb16f4f6768&libraries=clusterer"></script>
	<script src="${pageContext.request.contextPath}/resources/if/js/map.js"></script>
<%-- 
<!-- the mousewheel plugin - optional to provide mousewheel support -->
<script type="text/javascript" src="script/jquery.mousewheel.js"></script>

<!-- the jScrollPane script -->
<script type="text/javascript" src="script/jquery.jscrollpane.min.js"></script>
	 <script src="${pageContext.request.contextPath}/resources/if/js/popper.js"></script> --%>
	<script
		src="${pageContext.request.contextPath}/resources/if/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/if/js/main.js"></script>
	 
</body>
</html>