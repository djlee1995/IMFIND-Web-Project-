
$(document).ready(function() {	
    etc();
	
});

var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
mapOption = { 
    center: new kakao.maps.LatLng(37.56656, 126.97817), // 지도의 중심좌표
    level: 4 // 지도의 확대 레벨
};

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 마커 클러스터러를 생성합니다 
var clusterer = new kakao.maps.MarkerClusterer({
    map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
    averageCenter: true, // 클러스터러에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
    minClusterSize:1, 
    minLevel: 7 // 클러스터 할 최소 지도 레벨 
});


var imageSrc2 ="./resources/if/images/pine.png", // 마커이미지의 주소입니다    
imageSize2 = new kakao.maps.Size(44, 49), // 마커이미지의 크기입니다
imageOption2 = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
  
// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
var markerImage2 = new kakao.maps.MarkerImage(imageSrc2, imageSize2, imageOption2);
var markers=[];
 var imageSrc ="./resources/if/images/subway.png", // 마커이미지의 주소입니다    
    imageSize = new kakao.maps.Size(44, 49), // 마커이미지의 크기입니다
    imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
 var img = '<image width=44px; height=49px; src="./resources/if/images/subway.png">';

    // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
 // HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
    if (navigator.geolocation) {
        
        // GeoLocation을 이용해서 접속 위치를 얻어옵니다
        navigator.geolocation.getCurrentPosition(function(position) {
            
            var lat = position.coords.latitude, // 위도
                lon = position.coords.longitude; // 경도
            
            var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
                message = '<div style="width:100px;text-align:center;font-weight:bold;">내 위치</div>'; // 인포윈도우에 표시될 내용입니다
            
            // 마커와 인포윈도우를 표시합니다
            displayMarker(locPosition, message);
                
          });
        
    } else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
        
    
            message = 'geolocation을 사용할수 없어요..'
            
        displayMarker(message);
    }

    // 지도에 마커와 인포윈도우를 표시하는 함수입니다
    function displayMarker(locPosition, message) {

        // 마커를 생성합니다
        var marker = new kakao.maps.Marker({ 
        	image: markerImage2,
            map: map, 
            position: locPosition
        }); 
        
        var iwContent = message;

        // 인포윈도우를 생성합니다
        var infowindow = new kakao.maps.InfoWindow({
            content : iwContent,
            
        });
        
        // 인포윈도우를 마커위에 표시합니다 
        infowindow.open(map, marker);
        // 지도 중심좌표를 접속위치로 변경합니다
        map.setCenter(locPosition);
            
    }

    


//대중교통
function etc() {

	$.ajax({
		url: '/imfind/etc.if',
		//type: 'POST',
		//dataType : 'json',
		async:false,  
		contentType : 'application/x-www-form-urlencoded;charset=utf-8',
		success : function(data){
			console.log(data.length)		    
		 for(var i=0; i<data.length; i++){
			 var marker = new kakao.maps.Marker({
				 	image: markerImage,
	                position : new kakao.maps.LatLng(data[i].x, data[i].y),
	                title: data[i].depplace,
	                clickable: true,
	             
	            });
			 marker.name=data[i].depplace
			 marker.tel= data[i].tel;
			 markers.push(marker)
			
			
			 var infowindow = new kakao.maps.InfoWindow({
			        content:'<div style="width:150px;text-align:center;"><a href=/imfind/s_lostlist.if class=s_lostlist_data id='+marker.tel+'>'+marker.name+'</a></div>'
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
			
			 $(document).on('click', '.s_lostlist_data', function(event){
				console.log($(this).attr("id"))
				$.ajax({
					url : $(this).attr("href"),
					//type : 'POST',
					data : {'tel': $(this).attr("id")},
					contentType: 'application/x-www-form-urlencoded;charset=utf-8',
					//dataType:'json',
					success: function(data){
						console.log(data[0].depplace.replace(/(\s*)/g, "")+data[0].x+data[0].y)
						$('.police').empty();
						$('#output').empty();
						
						var link ='"https://map.kakao.com/link/to/'+data[0].depplace.replace(/(\s*)/g, "")+','+data[0].x+','+data[0].y+'","",""';
						var place ='<br><p style="font-size: x-large; font-weight:bold;"><a href=/imfind/s_lostlist.if class=s_lostlist_data id='+data[0].tel+'>'+img+data[0].depplace+img+'</a></p> <p style="font-size: larger;">'+data[0].addr+'&nbsp;&nbsp;<img style="cursor:pointer;" width=30px; height=30px; src="./resources/if/images/direct.png" onclick=window.open('+link+')><br>'+data[0].tel+'</p>';
						$('.police').append(place);
						$.each(data, function(index,item){
							var output = '';
							output +='<tr style="font-size: large; font-weight:bold;"><td><a href=/imfind/s_info.if class=s_info_data id='+item.code+'>'+item.item +'</a></td>';
							output +='<td>'+item.state+'</td></tr>';
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
			 
			 $(document).on('click', '.s_info_data', function(event){
					
					$.ajax({
						url : $(this).attr("href"),
						//type : 'POST',
						data : {'code': $(this).attr("id")},
						contentType: 'application/x-www-form-urlencoded;charset=utf-8',
						//dataType:'json',
						success: function(data){
							$('#output').empty();
							
							$.each(data, function(index,item){
								var output = '';
								output +='<tr style="font-size: large;"><td>'+ item.lost_date + '</td></tr>';
								output +='<tr style="font-size: large;"><td>'+ item.kind + '</td></tr>';
								output +='<tr style="font-size: large;"><td>'+ item.item + '</td></tr>';
								output +='<tr style="font-size: large;"><td>'+ item.state +'</td></tr>';
								output +='<tr style="font-size: large;"><td>'+ item.info + '</td></tr>';
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
			 
			
}

