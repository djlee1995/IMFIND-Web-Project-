
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
	            $('#update').html('<th colspan="5"><input type="button" class="updateBtn" value="수정"><input type="button" class="deleteBtn" value="삭제"></th>');
	         }

 
		console.log(data)
		formattedDate = getChangeDateString(data[0].lost_Re_Date)
		loc=data[0].lost_Loc;
		$('#lost_Re_Date').text(formattedDate);
		$('#title').text(data[0].lost_Title);
		$('#content-body-text').html(data[0].lost_Content);
		/*$('#file').html(data[0].lost_Up_File);*/
		$('#file').html('<img src="./resources/el/images/no_img.png"/>');
		$('#pay').text(data[0].lost_Pay);
		$('#loc').text(data[0].lost_Loc);
		$('#lostdate').text(moment(data[0].lost_Date).format('YYYY-MM-DD'));
		$('#id').text(data[0].id);
		
		
		
      },
      error : function() {
         alert("ajax통신 실패2")
      }
   });
   
   
	   var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  

	var map = new kakao.maps.Map(mapContainer, mapOption); 


	console.log(loc)
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	// 주소로 좌표를 검색합니다
	geocoder.addressSearch(loc, function(result, status) {

	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {

	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });

	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:200px;text-align:center;padding:6px 0;">'+loc+'</div>'
	        });
	        infowindow.open(map, marker);

	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});    
	$('.updateBtn').click(function(){
	   $(location).attr("href", "updatepage?lost_PostNum="+lost_PostNum+"");
	});
	$('.deleteBtn').click(function(){
	   $(location).attr("href", "deletepage?lost_PostNum="+lost_PostNum+"");
	});
	   
	});

function getChangeDateString(originalDate){
	
	var fromNow = moment(originalDate).startOf('day').fromNow();
	//alert(fromNow)
	var fromNowTrim = fromNow.substr(0, 2).trim();
	//alert(fromNowTrim)
	
	if(fromNow.includes('days')){
		if(fromNowTrim == '2' || fromNowTrim == '3' ){
			return fromNowTrim + '일전';
			//$('#lost_Re_Date').text(fromNow +'일전');			
		}
		else{
			return moment(originalDate).format('YYYY-MM-DD');
			//$('#lost_Re_Date').text(moment(originalDate).format('YYYY-MM-DD'));			
		}
	}
	else if(fromNow == 'a day ago'){
		return '어제';
		//$('#lost_Re_Date').text('어제');	
	}
	else if(fromNow.includes('hours')){
		return fromNowTrim + ' 시간 전';
		//$('#lost_Re_Date').text(fromNowTrim + ' 시간 전')
	}
}
