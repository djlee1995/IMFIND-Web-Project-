$(document).ready(function(){
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
mapOption = { 
    center: new kakao.maps.LatLng(37.56656, 126.97817), // 지도의 중심좌표
    level: 6 // 지도의 확대 레벨
};

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 마커 클러스터러를 생성합니다 
var clusterer = new kakao.maps.MarkerClusterer({
    map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
    averageCenter: true, // 클러스터러에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
    minClusterSize:1, 
    minLevel: 7 // 클러스터 할 최소 지도 레벨 
});


});
var select=[];
function search() {
		
	$("select[name=data]").each(function(){
		sel= $(this).val();
		select.push(sel);
	});
	console.log(select)
	
	/*$.ajax({
		url: '/imfind/police.if',
		//type: 'POST',
		//dataType : 'json',
		async:false,  
		contentType : 'application/x-www-form-urlencoded;charset=utf-8',
		success : function(data){
			console.log(data.length)		    
		 for(var i=0; i<data.length; i++){
			 var marker = new kakao.maps.Marker({
				 	image: markerImage,
	                position : new kakao.maps.LatLng(data[i].y, data[i].x),
	                title: data[i].depplace,
	                clickable: true,
	             
	            });
			 marker.name=data[i].depplace
			 marker.id= data[i].placeid;
			 marker.len= data[i].size;
			 markers.push(marker)
			
			
			 var infowindow = new kakao.maps.InfoWindow({
			        content:'<div style="width:150px;text-align:center;"><a href=/imfind/p_lostlist.if class=p_lostlist_data id='+marker.id+'>'+marker.name+'</a></div>', 
			       
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
				console.log(marker)
			        // 클러스터러에 마커들을 추가합니다
			    clusterer.addMarkers(markers);
			    						       
		},
		error : function() {

			alert("ajax통신 실패2")

		}*/
			

}
    




