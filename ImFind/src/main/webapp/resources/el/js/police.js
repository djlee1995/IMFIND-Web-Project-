
$(document).ready(function() { 
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
mapOption = { 
    center: new kakao.maps.LatLng(37.56656, 126.97817), // 지도의 중심좌표
    level: 4 // 지도의 확대 레벨
};

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 마커 클러스터러를 생성합니다 
var clusterer = new kakao.maps.MarkerClusterer({
    map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
    averageCenter: true,// 클러스터러에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정
    minClusterSize:1, 
    minLevel: 7 // 클러스터 할 최소 지도 레벨 
});


var imageSrc2 ="./resources/if/images/pine.png", // 마커이미지의 주소입니다    
imageSize2 = new kakao.maps.Size(44, 49), // 마커이미지의 크기입니다
imageOption2 = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
  
// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
var markerImage2 = new kakao.maps.MarkerImage(imageSrc2, imageSize2, imageOption2);
var markers=[];
 var imageSrc ="./resources/if/images/police.png", // 마커이미지의 주소입니다    
    imageSize = new kakao.maps.Size(44, 49), // 마커이미지의 크기입니다
    imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
 var img = '<image width=44px; height=49px; src="./resources/if/images/police.png">';
    // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
  //경찰청
            
                $.ajax({
                   url :'./p_info.if',
                   //type : 'POST',
                   data : {'code': code},
                   contentType: 'application/x-www-form-urlencoded;charset=utf-8',
                   //dataType:'json',
                   success: function(data){
                      var marker = new kakao.maps.Marker({
                         map:map,
                          image: markerImage,
                             position : new kakao.maps.LatLng(y,x)

                         });
                      var infowindow = new kakao.maps.InfoWindow({
                          
                          position : new kakao.maps.LatLng(y,x), 
                           content:'<div style="width:150px;text-align:center;">'+data[0].depplace+'</div>', 
                          
                    }); 
                    
                    infowindow.open(map, marker);
                       map.setCenter(new kakao.maps.LatLng(y,x));
                    $('.tableif').empty();
                    $('.movie').empty();
                   	$('.manual').empty();
                   	$('.police').empty();
                      var link ='"https://map.kakao.com/link/to/'+data[0].depplace+','+data[0].y+','+data[0].x+'",""';
                      var place ='<br><p style="font-size: x-large; font-weight:bold;">'+img+data[0].depplace+img+'</p> <p style="font-size: larger;">'+data[0].addr+'&nbsp;&nbsp;<img style="cursor:pointer;" width=30px; height=30px; src="./resources/if/images/direct.png" onclick=window.open('+link+')><br>'+data[0].tel+'</p>';
                      $('.police').append(place);
                      $.each(data, function(index,item){
                    	 var output = '<div  class="info_data">';
                  		output +='<p> 습득 날짜: &nbsp; '+ item.lost_date + '</p>';
                  		output +='<p>'+ item.item + '</p>';
                  		output +='<img src="'+ item.photo + '">';
                  		output +='<p>'+item.info.substring(2) +'</p></div>';
                  		$('.tableif').append(output);
                
                      });
                      },
                      
                   error : function() {

                      alert("ajax통신 실패2")

                   }
                
             
             });
                
          
       

    
});
