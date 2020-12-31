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

    




