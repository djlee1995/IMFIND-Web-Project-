
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
				
				
			
				// 1- 접속 위치
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				mapOption = {
					center : new kakao.maps.LatLng(33.450701,
							126.570667), // 지도의 중심좌표
					level : 2
				// 지도의 확대 레벨 
				};

				var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

				function resizeMap() {
					var mapContainer = document.getElementById('map');
					mapContainer.style.width = '100%';
					mapContainer.style.height = '350px';
				}

				function relayout() {

					// 지도를 표시하는 div 크기를 변경한 이후 지도가 정상적으로 표출되지 않을 수도 있습니다
					// 크기를 변경한 이후에는 반드시  map.relayout 함수를 호출해야 합니다 
					// window의 resize 이벤트에 의한 크기변경은 map.relayout 함수가 자동으로 호출됩니다
					setTimeout(function() {
						map.relayout();
					}, 0);
				}

				// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
				if (navigator.geolocation) {

					// GeoLocation을 이용해서 접속 위치를 얻어옵니다
					navigator.geolocation.getCurrentPosition(function(position) {

								var lat = position.coords.latitude, // 위도
								lon = position.coords.longitude; // 경도

								var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
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
					kakao.maps.event.addListener(map, 'click',function(mouseEvent) {
								//클락한 위도, 경도 정보를 가져온다.
								var latlng = mouseEvent.latLng;
								// 마커 위치를 클릭한 위치로 옮깁니다.
								marker.setPosition(latlng);
								//var message = '클릭한 위치의 위도는' + latlng.getLat() + '이고,';
								//message += '경도는' + latlng.getLng() + '입니다';
								var resultDiv = document.getElementById('clickLatlng');
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
				kakao.maps.event.addListener(map,'click',function(mouseEvent) {
									searchDetailAddrFromCoords(mouseEvent.latLng,function(result, status) {
												if (status === kakao.maps.services.Status.OK) {
													var infoDiv = document.getElementById('centerAddr');
													
													var detailAddr = !!result[0].road_address ? '<div>도로명주소 : '
															+ result[0].road_address.address_name
															+ '</div>'
															: '';
													detailAddr += '<div>지번 주소 : '
															+ result[0].address.address_name
															+ '</div>';

													var content = '<div class="bAddr">'
															//+ '<span class="title">법정동 주소정보</span>'
															+ detailAddr
															+ '</div>';
													
													// 마커를 클릭한 위치에 표시합니다 
													marker.setPosition(mouseEvent.latLng);
													marker.setMap(map);

													// 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
													infowindow.setContent(content);
													infowindow.open(map,marker);
													infoDiv.value = result[0].address.address_name;
													
													
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
					geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);
				}

				function searchDetailAddrFromCoords(coords, callback) {
					// 좌표로 법정동 상세 주소 정보를 요청합니다
					geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
				}

				// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
				function displayCenterInfo(result, status) {
					if (status === kakao.maps.services.Status.OK) {
						var infoDiv = document.getElementById('centerAddr');

						for (var i = 0; i < result.length; i++) {
							// 행정동의 region_type 값은 'H' 이므로
							if (result[i].region_type === 'H') {
								//infoDiv.innerHTML = result[i].address_name;
								infoDiv.innerHTML = result[i].address_name;
								//console.log(result[i])
								break;
							}
						}
					}
				}
				
				
				
				
				
				$("#datepicker").datepicker({
					 
					language : 'ko',
					maxDate : new Date()

				});
				
				$(document).ready(function() {
				     $('#summernote').summernote({
				          height: 300,                 // set editor height
				          minHeight: null,             // set minimum height of editor
				          maxHeight: null,             // set maximum height of editor
				          focus: true,                  // set focus to editable area after initializing summernote
				         
				     });
				});
			
				
				function pay(){
					var IMP = window.IMP; // 생략가능
					var code = "imp55973725"; // 가맹점 식별코드
					IMP.init(code);
					   
					   	IMP.request_pay({
					       name : '주문명: 결제 테스트',	// order 테이블에 들어갈 주문명 혹은 주문 번호
					       amount : '100',	// 결제 금액 (필수항목)
					       merchant_uid : '1234', // 주문번호 (필수항목) 결제가 된 적이 있는 merchant_uid로는 재결제 불가
					       m_redirect_url : '/khx/payEnd.action',	// 결제 완료 후 보낼 컨트롤러의 메소드명
					       buyer_tel : '010-1234-1234' // 연락처
					   	}, function(rsp) {
						if ( rsp.success ) { // 성공시
							var msg = '결제가 완료되었습니다.';
							msg += '결제 금액 : ' + rsp.paid_amount;
							msg += '카드 승인번호 : ' + rsp.apply_num;
						} else { // 실패시
							var msg = '결제에 실패하였습니다.';
							msg += '고유ID : ' + rsp.imp_uid;
							msg += '상점 거래 ID : ' + rsp.merchant_uid;
							msg += '결제 금액 : ' + rsp.paid_amount;
							msg += '카드 승인번호 : ' + rsp.apply_num;
						}
					});
				}