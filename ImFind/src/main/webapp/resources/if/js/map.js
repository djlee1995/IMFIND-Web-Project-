
$(document).ready(function() {	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	mapOption = { 
	    center: new kakao.maps.LatLng(37.56656, 126.97817), // 지도의 중심좌표
	    level: 7 // 지도의 확대 레벨
	};

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	// 마커 클러스터러를 생성합니다 
    var clusterer = new kakao.maps.MarkerClusterer({
        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
        averageCenter: true, // 클러스터러에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
        minLevel: 7 // 클러스터 할 최소 지도 레벨 
    });
	var markers=[];

	
	$.ajax({
		url: '/imfind/place.if',
		//type: 'POST',
		//dataType : 'json',
		async:false, // 
		contentType : 'application/x-www-form-urlencoded;charset=utf-8',
		success : function(data){
			console.log(data.length)		    
		 for(var i=0; i<data.length; i++){
			 var marker = new kakao.maps.Marker({
				 	map:map,
	                position : new kakao.maps.LatLng(data[i].y, data[i].x),
	                title: data[i].depplace,
	                clickable: true,
	             
	            });
			 marker.id= data[i].placeid;
			 markers.push(marker)
			
			 var infowindow = new kakao.maps.InfoWindow({
			        content:'<a href=/imfind/lostlist.if class=update_data id='+marker.id+'>분실물보기</a>' 
			    }); 
			 
			  kakao.maps.event.addListener(marker, 'click', clickListener(map, marker, infowindow));
			 kakao.maps.event.addListener(map, 'click', clickOutListener(infowindow)); 
			}
			
			function clickListener(map, marker, infowindow) {
			    return function() {
			        infowindow.open(map, marker);
			    };
			}
			// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
			function clickOutListener(infowindow) {
			    return function() {
			        infowindow.close();
			    };
			}
			        // 클러스터러에 마커들을 추가합니다
			    clusterer.addMarkers(markers);
			    						       
		},
		error : function() {

			alert("ajax통신 실패2")

		}
			

	});
			
			 $(document).on('click', '.update_data', function(event){
				
				$.ajax({
					url : $(this).attr("href"),
					//type : 'POST',
					data : {'placeid': $(this).attr("id")},
					contentType: 'application/x-www-form-urlencoded;charset=utf-8',
					//dataType:'json',
					success: function(data){
						$('.police').empty();
						$('#output').empty();
						var place ='<br><p style="font-size: xx-large; font-weight:bold; ">'+data[0].depplace+'</p> <p style="font-size: large;">'+data[0].addr+'<br>'+data[0].tel+'</p>';
						$('.police').append(place);
						var form ='<tr><td>날짜</td><td>물품종류</td><td>물품</td><td>상세내용</td><td>사진</td></tr>';
						$('#output').append(form);
						$.each(data, function(index,item){
							var output = '';
							output +='<tr align="center">';
							output +='<td>'+ item.lost_date + '</td>';
							output +='<td>'+ item.kind + '</td>';
							output +='<td>'+ item.item + '</td>';
							output +='<td>'+ item.info + '</td>';
							output +='<td><img width="200px"; height="200px"; src="'+ item.photo + '"></td>';
							/*output +='<td>'+ item.depplace + '</td>';
							output +='<td>'+ item.addr + '</td>';
							output +='<td>'+ item.tel + '</td>';*/
							output +='</tr>';
							console.log(item.photo);
							$('#output').append(output);
				
						});
						},
						
					error : function() {

						alert("ajax통신 실패2")

					}
				
			
			});
				//기본 이벤트 제거
				event.preventDefault();
			 });
			 
			

	
});
