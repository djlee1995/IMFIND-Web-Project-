<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">

	<title>분실물품 게시글 등록</title>
	
			<!-- Google Font -->
			<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
			<!--섬머노트 3.3.1이랑 겹쳐서 올려봄 -->
			<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
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
			
			<!-- 아임포트 -->
			<!-- <script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
			<script src="http://service.iamport.kr/js/iamport.payment-1.1.5.js"></script> -->
			
			   <!-- Css Styles -->
		    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/css/font-awesome.min.css" type="text/css">
		    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/css/themify-icons.css" type="text/css">
		    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/css/elegant-icons.css" type="text/css">
		    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/css/owl.carousel.min.css" type="text/css">
		    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/css/nice-select.css" type="text/css">
		    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/css/slicknav.min.css" type="text/css">
		    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/css/style.css" type="text/css"> 
			
	</head>
<body>
	<!-- Header Section Begin -->
	<%-- <jsp:include page="${request.contextPath}/header"></jsp:include> --%>
	<!-- Header End -->


	<!-- 분실물 등록 게시판 은지 -->
	<div class="container">

		<form name="boardform" action="./itemInsert" method="post" enctype="multipart/form-data">
			<!-- 타이틀  -->
			<div class="item1">
				<h8>분실글 등록하기(물품)</h8>
				<h8>* 필수입력사항</h8>
			</div>

			<!-- 필수입력사항   -->
			<div class="item3">
				<h6>* 분실 물품</h6>
				<label><input type="radio" name="Lost_Item" onClick="this.form.textbox.disabled=true" value="핸드폰" checked="checked">핸드폰</label> 
				<label><input type="radio" name="Lost_Item" onClick="this.form.textbox.disabled=true" value="가방"> 가방</label> 
				<label><input type="radio" name="Lost_Item" onClick="this.form.textbox.disabled=true" value="책"> 책</label> 
				<label><input type="radio" name="Lost_Item" onClick="this.form.textbox.disabled=true" value="화장품"> 화장품</label> 
				<label><input type="radio" name="Lost_Item" onClick="this.form.textbox.disabled=false" value="기타"> 기타</label> 
				<label><input type="text" name="Lost_Item" id="textbox" class="form-control" placeholder="직접입력" disabled></label>
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
				<input id="datepicker" type="text" name="Lost_Date" placeholder="날짜를 선택해주세요">
			</div>


			<div class="item6"> 
				<h6>분실 위치</h6>
			</div> 
			<!-- 지도 불러오기  -->
			<div class="container-fluid">
				<div style="margin: -15px 10px 10px 100px;">
				<!-- Javascript가 필요없이 data-toggle에 collapse href에 대상 id을 설정합니다. -->
				<button onclick="resizeMap(); relayout();" data-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample">지도로 위치 찾기</button> 	
				<input type="text" id="centerAddr" name="Lost_Loc"  size=30 readonly >
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
			<div class="item7_box"><input type="text" class="title" name="Lost_Title" required></div>

			
			<%--  필수입력사항 class="content" --%> 
			<div class="item8"><h6>* 내 용</h6></div>
			<div class="item8_1"><textarea id="summernote" name="Lost_Content"></textarea></div>
	
			<div class="item10">
				<h6>사례금</h6>
				<label><input type="radio" name="Lost_Pay" onClick="this.form.selbox.disabled=true" checked="checked">무료글등록</label>
				<label><input type="radio" name="Lost_Pay" onClick="this.form.selbox.disabled=false">사례금등록</label> 
					<select id="selbox" name="Lost_Pay" disabled>
						<option value="">선택</option>
						<option value="10,000원" >10,000원</option>
						<option value="30,000원" >30,000원</option>
						<option value="50,000원" >50,000원</option>
						<option value="100,000원" >100,000원</option>
						<option value="direct" >직접입력</option>
					</select> 
					<input type="text" size="10" class="form-control" name="Lost_Pay" onkeyup="cmaComma(this);" onchange="cmaComma(this);" 
					oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
					pattern='\d*' placeholder="직접입력"  disabled>원
					<!-- minlength="4" -->
			</div>                                
			

			<div class="btn">
				<a href="javascript:boardform.submit()" onclick="pay()">등록</a>&nbsp;&nbsp; 
				<!-- <a href="#" onclick="pay()">일반 결제</a><br><br> -->
				<a href="index">취소</a>
			</div>
		</form>
	</div>
		<!--게시글 등록 js 시작-은지 -->
		<script src="${pageContext.request.contextPath}/resources/el/js/itemboard.js"></script>
		<!--게시글 등록 js 끝-은지 -->
		
		<!-- -->
		<script src="${pageContext.request.contextPath}/resources/el/js/jquery.countdown.min.js"></script>
	    <script src="${pageContext.request.contextPath}/resources/el/js/jquery.nice-select.min.js"></script>
	    <script src="${pageContext.request.contextPath}/resources/el/js/jquery.zoom.min.js"></script>
	    <script src="${pageContext.request.contextPath}/resources/el/js/jquery.dd.min.js"></script>
	    <script src="${pageContext.request.contextPath}/resources/el/js/jquery.slicknav.js"></script>
	    <script src="${pageContext.request.contextPath}/resources/el/js/owl.carousel.min.js"></script> 
	 	<script src="${pageContext.request.contextPath}/resources/el/js/main.js"></script> 
</body>
			
</html>