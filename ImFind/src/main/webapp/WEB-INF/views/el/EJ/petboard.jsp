<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">

	<title>분실글 등록하기(애완동물)</title>
	
			<!-- Google Font -->
			<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
			
			<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
		    <script src="${pageContext.request.contextPath}/resources/el/js/jquery-ui.min.js"></script>

			<!--  썸머노트 시작  --> 						
 			<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 			<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet"> 
			<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script> 
			<!--  썸머노트 끝  --> 
			
			<link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">
			<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
			<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"> 
					
			<!-- 게시판 style.css - 은지 - -->
			<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/EJ/style.css">
		
			<!-- datepicker 파일 - 은지 - -->
			<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/EJ/datepicker/air-datepicker/dist/css/datepicker.min.css">
				<!-- Animate.css -->
			<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/home/css/animate.css">
			<!-- Icomoon Icon Fonts-->
			<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/home/css/icomoon.css">
			<!-- Bootstrap  -->
			<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/home/css/bootstrap.css"> 
		
			<!-- Magnific Popup -->
			<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/home/css/magnific-popup.css">
		
			<!-- Flexslider  -->
			<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/home/css/flexslider.css">
		
			<!-- Theme style  -->
			<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/home/css/style.css?after">
		    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/home/css/css_YH.css" type="text/css">
			<style>
			article{
				position: fixed;
				top: 0;
				width: 100vw;
				left: 0;
				z-index: 100;
				padding-right : 35px;
				background: white;
			}
			.fh5co-nav #fh5co-logo{
				font-size : 34px;
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
			section{
				position: relative;
	    		top: 147px;
			}
		</style>
	</head>
<body>
	<% String id = (String) request.getAttribute("loginUser"); %>
	<article class="fh5co-nav">
		<div class="top-menu">
				<div class="container-fluid">
					<div class="row">
						<div class="col-xs-2">
							<div id="fh5co-logo" ><a href="./">ImFind<span>.</span></a></div>
						</div>
						<div class="col-xs-10 text-right menu-1">
							<ul>
								<li class="active"><a href="index.if">if</a></li>
								<li><a href="./">ELSE</a></li>
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
								<% 
								if(id == null){ %>
									<li class="btn-cta"><a href="./login"><span>Login</span></a></li> 
									<li class="btn-cta"><a href="./register"><span >회원가입</span></a></li> 
								<%} else{%>
									<li class="btn-cta"><a href="./logout"><span>Logout</span></a></li> 
									<li class="btn-cta"><a href="./mypage"><span >마이페이지</span></a></li> 
								<%} %>
							</ul>
						</div>
					</div>
					
				</div>
			</div>
	</article>
	<!-- 분실물 등록 게시판 은지 -->
<section>
	<div class="container">
		<form name="p_boardform" action="./petInsert" method="post" enctype="multipart/form-data">
			<!-- 타이틀  -->
			<div class="item1">
				<h8>분실글 등록하기(애완동물)</h8>
				<h8>* 필수입력사항</h8>
			</div>

			<!-- 필수입력사항   -->
			<div class="item3">
				<h6>* 동물 이름</h6>
				<label><input type="radio" name="Pat_Name" onClick="this.form.p_textbox.disabled=true" value="없음" checked="checked">없음</label> 
				<label><input type="radio" name="Pat_Name" onClick="this.form.p_textbox.disabled=false" value="있음" >있음</label>
				<label><input type="text" name="Pat_Name" id="p_textbox" class="form-control" placeholder="직접입력" disabled required></label>
			</div>

			<!-- datepicker js 시작 -->
			<script src="${pageContext.request.contextPath}/resources/el/EJ/datepicker/air-datepicker/dist/js/datepicker.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/el/EJ/datepicker/air-datepicker/dist/js/i18n/datepicker.ko.js"></script>
			<!-- datepicker js 끝	-->
			
			<!-- 카카오맵 시작 -->
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4434d2cc6bcfc1d87507d4afab43bdfb&libraries=services"></script>
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4434d2cc6bcfc1d87507d4afab43bdfb"></script>
			<!-- 카카오맵 끝 -->
			
			<!-- 필수입력사항 -->
			<div class="item5">
				<h6>* 분실 날짜</h6>
				<input id="datepicker" type="text" name="Pat_LostDate" placeholder="날짜를 선택해주세요." required>
			</div>

	
			<div class="item6"><h6>분실 위치</h6></div>
			
			<!-- 지도 불러오기  -->
			<div class="container-fluid">
			
				<div id="Loc1" style="margin: -15px 10px 10px 100px;">
					<!-- Javascript가 필요없이 data-toggle에 collapse href에 대상 id을 설정합니다. -->
					<div id="Loc2"><input type="text" id="centerAddr2" name="Pat_Loc" placeholder="분실 위치를 입력해주세요." onclick="resizeMap(); relayout();" 
							data-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample" onKeypress="enter();" />
					<button type="button" id="Loc2Btn" onclick="resizeMap(); relayout();" >위치 검색</button></div>
					<!-- <button onclick="resizeMap(); relayout();" data-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample">내위치에서 위치 찾기</button>  -->	
					<input type="text" id="centerAddr" name="Lost_Loc" style="background-color: #e2e2e2;" readonly/>
				</div>
						
				<!-- collapse 대상 태그는 class를 collapse로 설정합니다. -->
				<div class="collapse" id="collapseExample">
					<div class="well">
				<!-- <input type="text" id="centerAddr" name="Lost_Loc" disabled>인근 -->
					<div id="map" style="width: 350px; height: 350px;"></div>
					</div>
				</div>
				
			</div>
			

			<!-- 필수입력사항 -->
			<div class="item7"><h6>* 제 목</h6></div>		
			<div class="item7_box"><input type="text" class="title" name="Pat_Title" placeholder="제목을 입력하세요" required></div>

			
			<!--  필수입력사항 --> 
			<div class="item8"><h6>내 용</h6></div>
			<div class="item8_1"><textarea id="summernote" name="Pat_Content"></textarea></div>
						


			<div class="item10"><h6>사례금</h6>
			<!-- 모달을 열기 위한 버튼 data-toggle="modal" data-target="#myModal" -->
			<button type="button" onClick="return inputcheck()" >결제하기</button></div>
		
			<!-- 모달 영역 -->
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
										<span aria-hidden="true">×</span></button>
								<h4 class="modal-title" id="myModalLabel">사례금 결제하기</h4>
							</div>
							
							<div class="modal-body" id="lostpay">
								<h7>사례금선택</h7> <br>
								<label><input type="radio" name="Pat_Pay" onClick="this.form.paybox.disabled=true" value="5000" >5,000원</label><br> 
								<label><input type="radio" name="Pat_Pay" onClick="this.form.paybox.disabled=true" value="10000"> 10,000원</label> <br>
								<label><input type="radio" name="Pat_Pay" onClick="this.form.paybox.disabled=true" value="15000"> 15,000원</label> <br>
								<label><input type="radio" name="Pat_Pay" onClick="this.form.paybox.disabled=true" value="20000"> 20,000원</label><br>
								<label><input type="radio" name="Pat_Pay" onClick="this.form.paybox.disabled=true" value="25000"> 25,000원</label>  <br>
								<label><input type="radio" name="Pat_Pay" onClick="this.form.paybox.disabled=false" value="direct"> 직접입력</label> <br>
								<label><input type="text" name="Pat_Pay" id="paybox" class="paybox" onkeyup="cmaComma(this);" onchange="cmaComma(this);" 
								oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" pattern='\d*' placeholder="직접입력" disabled required></label>
							</div>
							
							<div class="modal-footer">
								<a href="javascript:void(0);" onClick="return pay();" >확인</a>&nbsp;&nbsp;
							<!-- <button type="button" class="btn btn-primary" onclick="return pay()">확인</button> -->
								<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
							</div>
					 </div>
				</div>
			</div>
			
			<div class="btn">
				<button type="submit">확인</button>
				<a href="index">취소</a>
			</div>
			
		</form>
	</div>
</section>
	<script>
		var loginUser='<%=(String)session.getAttribute("loginUser")%>'
		
	</script>
		<!--게시글 등록 js 시작-은지 -->
		<script src="${pageContext.request.contextPath}/resources/el/js/petboard.js"></script>
		<!--게시글 등록 js 끝-은지 -->
		
		<!-- -->
		<script src="${pageContext.request.contextPath}/resources/el/js/jquery.countdown.min.js"></script>
	    <script src="${pageContext.request.contextPath}/resources/el/js/jquery.nice-select.min.js"></script>
	    <script src="${pageContext.request.contextPath}/resources/el/js/jquery.zoom.min.js"></script>
	    <script src="${pageContext.request.contextPath}/resources/el/js/jquery.dd.min.js"></script>
	    <script src="${pageContext.request.contextPath}/resources/el/js/jquery.slicknav.js"></script>
	    <script src="${pageContext.request.contextPath}/resources/el/js/owl.carousel.min.js"></script> 
	 	<script src="${pageContext.request.contextPath}/resources/el/js/main.js"></script> 
	 	
	 	<!-- 아임포트 시작-->
		<script src="http://service.iamport.kr/js/iamport.payment-1.1.5.js"></script> 
		<!-- 아임포트 끝-->
		

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