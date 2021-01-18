
$(document).ready(function() {
	
	console.log(lost_PostNum)
	var loc;
	$.ajax({
		url :'datainfo.do',
		//type : 'POST',
		data : {'lost_PostNum': lost_PostNum },
		async:false,
		contentType: 'application/x-www-form-urlencoded;charset=utf-8',
		//dataType:'json',
		success: function(data){
			console.log(loginUser)
			if($.trim(loginUser)==(data[0].id)){
				$('#update').html('<th colspan="5"><input type="button" class="updateBtn" value="수정"></th>');
			}
			else if($.trim(kakaoLoginUser)==(data[0].id)){
				$('#update').html('<th colspan="5"><input type="button" class="updateBtn" value="수정"></th>');
			}
			console.log()
				loc=data[0].lost_Loc
				//$('#postnum').text(data[0].lost_PostNum);
				$('#title').text(data[0].lost_Title);
				$('#content').html(data[0].lost_Content);
				//$('#postnum').text(data[0].lost_Re_Date);
				//$('#postnum').text(data[0].lost_Re_Count);
				$('#file').html('<img height="50%" width="70%" src="'+data[0].lost_Up_File+'">');
				$('#pay').text(data[0].lost_Pay);
				//$('#postnum').text(data[0].lost_Item);
				$('#loc').text(data[0].lost_Loc);
				$('#lostdate').text(moment(data[0].lost_Date).format('YYYY-MM-DD'));
				$('#id').text(data[0].id);
				//$('#postnum').text(data[0].contact);
			},
			
		error : function() {

			alert("ajax통신 실패2")

		}
		


	});
	console.log(loc)
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();
// 키워드로 장소를 검색합니다
ps.keywordSearch(loc, placesSearchCB);
// 키워드 검색 완료 시 호출되는 콜백함수 입니다
function placesSearchCB (data, status, pagination) {
	 if (status === kakao.maps.services.Status.OK) {
		 
		 // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
		 // LatLngBounds 객체에 좌표를 추가합니다
		 var bounds = new kakao.maps.LatLngBounds();
		 for (var i=0; i<data.length; i++) {
			 bounds.extend(new kakao.maps.LatLng(data[0].y, data[0].x));
			// 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: new kakao.maps.LatLng(data[0].y, data[0].x)
		        });
		 }
		 // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
		 map.setBounds(bounds);
	 }
}
$('.updateBtn').click(function(){
	$(location).attr("href", "updatepage?lost_PostNum="+lost_PostNum+"");
});
	
});
