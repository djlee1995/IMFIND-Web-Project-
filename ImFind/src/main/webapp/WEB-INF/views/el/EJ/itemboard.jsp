<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Home</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<style>
.container {
	margin-left: 300px;
	margin-right: 300px;
	width: 950px;
}

.item1 {
	display: flex;
	justify-content: space-between;
	border-bottom: 4px solid black;
	font-size: small;
	padding-top: 20px;
	padding-bottom: 20px;
	align-items: baseline;
}
/* 분실 물품 */
.item3 {
	display: flex;
	justify-content: space-between;
	border-bottom: 1px solid black;
	padding-top: 20px;
	padding-bottom: 20px;
}

.item3>radio_check {
	display: flex;
	justify-content: space-between;
	border-bottom: 1px solid black;
	padding-top: 20px;
	padding-bottom: 20px;
}
/* 분실 날짜 */
.item5 {
	display: flex;
	justify-content: space-between;
	border-bottom: 1px solid black;
	padding-top: 20px;
	padding-bottom: 20px;
}
/* 분실 위치 
.item6 {
	padding: 20px 0 20px 10px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	border-bottom: 1px solid black;
}
*/
#test {
	height: 45px;
	display: flex;
	justify-content: center;
	align-items: baseline;
	margin: 0;
}

#test p {
	width: 50px;
	margin: 0;
}
/* 글 제목 */
.item7 {
	display: flex;
	border-bottom: 1px solid black;
	padding-top: 20px;
	padding-bottom: 20px;
}
/* 글 내용 */
.item8 {
	display: flex;
	justify-content: space-between;
	border-bottom: 1px solid black;
	padding-top: 20px;
	padding-bottom: 20px;
}
/* 파일 첨부 */
.item9 {
	display: flex;
	justify-content: space-between;
	border-bottom: 1px solid black;
	padding-top: 20px;
	padding-bottom: 20px;
}
/* 사례금 */
.item10 {
	display: flex;
	justify-content: space-between;
	border-bottom: 4px solid black;
	padding-top: 20px;
	padding-bottom: 20px;
}
/* 등록 취소 버튼 */
.btn {
	display: flex;
	justify-content: center;
	margin-top: 20px;
	margin-bottom: 20px;
}
</style>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	//사례금선택시에 직접입력 선택하면 인풋창 활성화 
	$(document).on("change", "select[name=Lost_Pay]", function() {
		var value = $(this).find("option[name=Lost_Pay]:selected").val();
		var inputText = $(this).closest('.item10').find('.form-control');
		var flag = true;

		if (value == 'direct') {
			flag = false;
		}

		$(inputText).attr("disabled", flag);
	});

	//사례금 입력시에 자동으로 콤마 추가
	function cmaComma(obj) {
		var firstNum = obj.value.substring(0, 1); // 첫글자 확인 변수
		var strNum = /^[/,/,0,1,2,3,4,5,6,7,8,9,/]/; // 숫자와 , 만 가능
		var str = "" + obj.value.replace(/,/gi, ''); // 콤마 제거  
		var regx = new RegExp(/(-?\d+)(\d{3})/);
		var bExists = str.indexOf(".", 0);
		var strArr = str.split('.');

		if (!strNum.test(obj.value)) {
			alert("숫자만 입력하십시오.\n1,000원 이상의 금액을 입력하세요.");
			obj.value = 1000;
			obj.focus();
			return false;
		}

		if ((firstNum < "0" || "9" < firstNum)) {
			alert("숫자만 입력하십시오.");
			obj.value = 1000;
			obj.focus();
			return false;
		}

		while (regx.test(strArr[0])) {
			strArr[0] = strArr[0].replace(regx, "$1,$2");
		}
		if (bExists > -1) {
			obj.value = strArr[0] + "." + strArr[1];
		} else {
			obj.value = strArr[0];
		}
	}

	function commaSplit(n) {// 콤마 나누는 부분
		var txtNumber = '' + n;
		var rxSplit = new RegExp('([0-9])([0-9][0-9][0-9][,.])');
		var arrNumber = txtNumber.split('.');
		arrNumber[0] += '.';
		do {
			arrNumber[0] = arrNumber[0].replace(rxSplit, '$1,$2');
		} while (rxSplit.test(arrNumber[0]));
		if (arrNumber.length > 1000) {
			return arrNumber.join('');
		} else {
			return arrNumber[0].split('.')[0];
		}
	}
</script>
</head>
<body>

	<div class="container">

		<form name="boardform" action="./boardinsert" method="post"
			enctype="multipart/form-data">
			<!-- 타이틀  -->
			<div class="item1">
				<h8>분실글 등록하기(물품)</h8>
				<h8>* 필수입력사항</h8>
			</div>

			<!-- 필수입력사항  -->
			<div class="item3">
				<h6>* 분실 물품</h6>
				<label><input type="radio" name="Lost_Item"
					onClick="this.form.textbox.disabled=true" checked="checked">
					핸드폰</label> <label><input type="radio" name="Lost_Item"
					onClick="this.form.textbox.disabled=true"> 지갑</label> <label><input
					type="radio" name="Lost_Item"
					onClick="this.form.textbox.disabled=true"> 가방</label> <label><input
					type="radio" name="Lost_Item"
					onClick="this.form.textbox.disabled=true"> 책</label> <label><input
					type="radio" name="Lost_Item"
					onClick="this.form.textbox.disabled=true"> 화장품</label> <label><input
					type="radio" name="Lost_Item"
					onClick="this.form.textbox.disabled=false"> 기타</label> <label><input
					type="text" name="Lost_Item" id="textbox" class="form-control"
					placeholder="직접입력" disabled></label>
			</div>

			<!-- 필수입력사항 -->
			<div class="item5">
				<h6>* 분실 날짜</h6>
				<span><input type="date"></span>

			</div>

			<div class="item6">
				<!--<h6>분실 위치</h6>
				   <div id="test">
	                    <input type="text" class="form-control" disabled>
	                    <p>인근</p>
	                </div>
	               
				<div class="item6_1">
-->
					<!-- 테스트  -->
					<div class="container-fluid"
						style="min-height: calc(100vh - 100px);">
						<div style="margin: 10px;">
							<!-- Javascript가 필요없이 data-toggle에 collapse href에 대상 id을 설정합니다. -->
							<button data-toggle="collapse" href="#collapseExample"
								aria-expanded="false" aria-controls="collapseExample">분실 위치</button>
						</div>
						
						<!-- collapse 대상 태그는 class를 collapse로 설정합니다. -->
											<div class="collapse" id="collapseExample">
						<div class="well">
							<div id="map" style="width: 500px; height: 350px;"></div>
						</div>
					</div>
					</div>
					


					<script type="text/javascript"
						src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4434d2cc6bcfc1d87507d4afab43bdfb&libraries=services"></script>
					<script type="text/javascript"
						src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4434d2cc6bcfc1d87507d4afab43bdfb"></script>
					<script>
						// 1- 접속 위치
						var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
						mapOption = {
							center : new kakao.maps.LatLng(33.450701,
									126.570667), // 지도의 중심좌표
							level : 3
						// 지도의 확대 레벨 
						};

						var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

						// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
						if (navigator.geolocation) {

							// GeoLocation을 이용해서 접속 위치를 얻어옵니다
							navigator.geolocation
									.getCurrentPosition(function(position) {

										var lat = position.coords.latitude, // 위도
										lon = position.coords.longitude; // 경도

										var locPosition = new kakao.maps.LatLng(
												lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
										message = '<div style="padding:5px;">내위치</div>'; // 인포윈도우에 표시될 내용입니다

										// 마커와 인포윈도우를 표시합니다
										displayMarker(locPosition, message);

									});

						} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

							var locPosition = new kakao.maps.LatLng(33.450701,
									126.570667), message = '위치정보 사용불가.'

							displayMarker(locPosition, message);
						}

						// 2- 클릭한 곳에 마커 생성

						// 지도에 마커와 인포윈도우를 표시하는 함수입니다
						function displayMarker(locPosition, message) {

							// 마커를 생성합니다
							var marker = new kakao.maps.Marker({
								map : map,
								position : locPosition
							});

							var iwContent = message, // 인포윈도우에 표시할 내용
							iwRemoveable = true;

							// 인포윈도우를 생성합니다
							var infowindow = new kakao.maps.InfoWindow({
								content : iwContent,
								removable : iwRemoveable
							});

							// 인포윈도우를 마커위에 표시합니다 
							infowindow.open(map, marker);

							// 지도 중심좌표를 접속위치로 변경합니다
							map.setCenter(locPosition);

							marker.setMap(map);
							// 지도에 클릭 이벤트를 등록합니다.
							// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
							kakao.maps.event.addListener(map, 'click',
									function(mouseEvent) {
										//클락한 위도, 경도 정보를 가져온다.
										var latlng = mouseEvent.latLng;
										// 마커 위치를 클릭한 위치로 옮깁니다.
										marker.setPosition(latlng);
										//var message = '클릭한 위치의 위도는' + latlng.getLat() + '이고,';
										//message += '경도는' + latlng.getLng() + '입니다';
										var resultDiv = document
												.getElementById('clickLatlng');
										//resultDiv.innerHTML = message;
									});
						}

						//3- 주소띄우기

						// 주소-좌표 변환 객체를 생성합니다
						var geocoder = new kakao.maps.services.Geocoder();

						var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
						infowindow = new kakao.maps.InfoWindow({
							zindex : 1
						}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

						// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
						searchAddrFromCoords(map.getCenter(), displayCenterInfo);

						// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
						kakao.maps.event
								.addListener(
										map,
										'click',
										function(mouseEvent) {
											searchDetailAddrFromCoords(
													mouseEvent.latLng,
													function(result, status) {
														if (status === kakao.maps.services.Status.OK) {
															var detailAddr = !!result[0].road_address ? '<div>도로명주소 : '
																	+ result[0].road_address.address_name
																	+ '</div>'
																	: '';
															detailAddr += '<div>지번 주소 : '
																	+ result[0].address.address_name
																	+ '</div>';

															var content = '<div class="bAddr">'
																	+ '<span class="title">법정동 주소정보</span>'
																	+ detailAddr
																	+ '</div>';

															// 마커를 클릭한 위치에 표시합니다 
															marker
																	.setPosition(mouseEvent.latLng);
															marker.setMap(map);

															// 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
															infowindow
																	.setContent(content);
															infowindow
																	.open(map,
																			marker);
														}
													});
										});

						//중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
						kakao.maps.event.addListener(map, 'idle', function() {
							searchAddrFromCoords(map.getCenter(),
									displayCenterInfo);
						});

						function searchAddrFromCoords(coords, callback) {
							// 좌표로 행정동 주소 정보를 요청합니다
							geocoder.coord2RegionCode(coords.getLng(), coords
									.getLat(), callback);
						}

						function searchDetailAddrFromCoords(coords, callback) {
							// 좌표로 법정동 상세 주소 정보를 요청합니다
							geocoder.coord2Address(coords.getLng(), coords
									.getLat(), callback);
						}

						// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
						function displayCenterInfo(result, status) {
							if (status === kakao.maps.services.Status.OK) {
								var infoDiv = document
										.getElementById('centerAddr');

								for (var i = 0; i < result.length; i++) {
									// 행정동의 region_type 값은 'H' 이므로
									if (result[i].region_type === 'H') {
										infoDiv.innerHTML = result[i].address_name;
										break;
									}
								}
							}
						}
					</script>

					<!--<button onclick="window.open('map.html','startpop',
	                    'width=430,height=500,location=no,status=no,scrollbars=yes');">button</button>  -->
					<!-- <button onclick="window.open('map.html', 'startpop', 'status=no, height=500, width=430, left='+ popupX + ', top='+ popupY);">button</button> -->
				<!--</div>

				 테스트-->
			</div>



			<!-- 필수입력사항 -->
			<div class="item7">
				<div class="col-sm-3">
					<h6>* 제 목</h6>
					<div class="item7_box">
						<input type="text" class="form-control" name="Lost_Title" required>
					</div>
				</div>
			</div>

			<!-- 필수입력사항 -->
			<div class="item8">
				<div class="row-lg-10">
					<h6>* 내 용</h6>
					<textarea rows="5" class="form-control" name="Lost_Content"
						required></textarea>
				</div>
			</div>


			<div class="item9">
				<h6>파일 첨부</h6>
				<span><input type="file" name="Lost_Or_File"></span>
			</div>


			<div class="item10">
				<h6>사례금</h6>
				<label><input type="radio" name="Lost_Pay"
					onClick="this.form.selbox.disabled=true" checked="checked">무료글등록</label>
				<label><input type="radio" name="Lost_Pay"
					onClick="this.form.selbox.disabled=false">사례금등록</label> <select
					id="selbox" name="Lost_Pay" disabled>
					<option value="">선택</option>
					<option value="1">10,000원</option>
					<option value="1">30,000원</option>
					<option value="1">50,000원</option>
					<option value="1">100,000원</option>
					<option value="direct" name="Lost_Pay">직접입력</option>
				</select> <input type="text" size="10" class="form-control" name="Lost_Pay"
					onkeyup="cmaComma(this);" onchange="cmaComma(this);"
					oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
					pattern='\d*' placeholder="직접입력" minlength="4" disabled>원


				<!-- name="cma_test" -->
			</div>

			<div class="btn">
				<a href="javascript:boardform.submit()">등록</a>&nbsp;&nbsp; <a
					href="./boardlist">취소</a>
				</td>
				<!-- 
	            <button type="button" class="btn btn-primary btn-sm">등록</button>&nbsp;&nbsp;  
	            <button type="button" class="btn btn-primary btn-sm">취소</button>
	         -->
			</div>
		</form>
	</div>

</body>
</html>