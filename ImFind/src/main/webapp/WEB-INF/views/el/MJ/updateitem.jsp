<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String id=(String)session.getAttribute("loginUser"); // 로그인한 사람만 접근할수 있도록 아이디 체크. 
%>

<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">

	<title>분실글 등록하기(물품)</title>
	
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



	<!-- 분실물 등록 게시판 은지 -->
	<div class="container">
		<form name="boardform" action="./itemInsert" method="post" enctype="multipart/form-data">
		
			<!-- 타이틀  -->
			<div class="item1">
				<h8>분실글 등록하기(물품)</h8>
				<h8>* 필수입력사항</h8>
			</div>
			
			<div class="item2">
				<h6>작성자</h6>
				<input type="hidden" name="id" value="<%=id %>">
				<h6><%=id %></h6>
	
			</div>
			<!-- 필수입력사항   -->
			<div class="item3">
				<h6>* 분실 물품</h6>
				<label><input type="radio" name="Lost_Item" onClick="this.form.textbox.disabled=true" value="핸드폰" checked="checked">핸드폰</label> 
				<label><input type="radio" name="Lost_Item" onClick="this.form.textbox.disabled=true" value="지갑"> 지갑</label> 
				<label><input type="radio" name="Lost_Item" onClick="this.form.textbox.disabled=true" value="가방"> 가방</label> 
				<label><input type="radio" name="Lost_Item" onClick="this.form.textbox.disabled=true" value="귀금속"> 귀금속</label>
				<label><input type="radio" name="Lost_Item" onClick="this.form.textbox.disabled=true" value="현금"> 현금</label>  
				<label><input type="radio" name="Lost_Item" onClick="this.form.textbox.disabled=false" value="etc"> 기타</label> 
				<label><input type="text" name="Lost_Item" id="textbox" class="form-control" placeholder="직접입력" disabled required></label>
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
				<input id="datepicker" type="text" name="Lost_Date" placeholder="날짜를 선택해주세요." required>
			</div>

	
			<div class="item6"><h6>분실 위치</h6></div>
			
			<!-- 지도 불러오기  -->
			<div class="container-fluid">
			
				<div id="Loc1" style="margin: -15px 10px 10px 100px;">
					<!-- Javascript가 필요없이 data-toggle에 collapse href에 대상 id을 설정합니다. -->
					<div id="Loc2"><input type="text" id="centerAddr2" name="Lost_Loc" placeholder="분실 위치를 입력해주세요." onclick="resizeMap(); relayout();" 
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
			<div class="item7_box"><input type="text" class="title" name="Lost_Title" placeholder="제목을 입력하세요" required></div>

			
			<!--  필수입력사항 --> 
			<div class="item8"><h6>내 용</h6></div>
			<!-- 원래태그 <div class="item8_1"><textarea id="summernote" name="Lost_Content"></textarea></div> -->
			<!--   <input type="text" name="title" class="form-control" id="inputTitle" placeholder="제목을 입력하세요">     -->
			<div class="item8_1"><textarea id="summernote" name="Lost_Content"></textarea></div>
						


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
								<label><input type="radio" name="Lost_Pay" onClick="this.form.paybox.disabled=true" value="5000" >5,000원</label><br> 
								<label><input type="radio" name="Lost_Pay" onClick="this.form.paybox.disabled=true" value="10000"> 10,000원</label> <br>
								<label><input type="radio" name="Lost_Pay" onClick="this.form.paybox.disabled=true" value="15000"> 15,000원</label> <br>
								<label><input type="radio" name="Lo0st_Pay" onClick="this.form.paybox.disabled=true" value="20000"> 20,000원</label><br>
								<label><input type="radio" name="Lost_Pay" onClick="this.form.paybox.disabled=true" value="25000"> 25,000원</label>  <br>
								<label><input type="radio" name="Lost_Pay" onClick="this.form.paybox.disabled=false" value="direct"> 직접입력</label> <br>
								<label><input type="text" name="Lost_Pay" id="paybox" class="paybox" onkeyup="cmaComma(this);" onchange="cmaComma(this);" 
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
				<!-- <a href="javascript:addboard()" >등록</a>&nbsp;&nbsp;  -->
				<!-- <a href="#" onclick="pay()">일반 결제</a><br><br> -->
				<a href="index">취소</a>
			</div>
			
		</form>
	</div>
		<script>
			var lost_PostNum =<%=request.getParameter("lost_PostNum") %>
			console.log(lost_PostNum)
		</script>
		<!--게시글 등록 js 시작-은지 -->
		<script src="${pageContext.request.contextPath}/resources/el/js/update_item.js"></script>
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

</body>
			
</html>