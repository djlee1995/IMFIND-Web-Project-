$(document).ready(function() {
//  ------ 달력 js 시작 ------
$("#petdatepicker").datepicker({
   language : 'ko',
   maxDate : new Date()
   
});
//  ------ 글 내용 js 시작 ------
   $.ajax({
      url: "petdatainfo.do", 
      //type: "POST",
      enctype: 'multipart/form-data',
      data: {'Pet_PostNum': pet_PostNum },
      async:false,
      contentType: 'application/x-www-form-urlencoded;charset=utf-8',
      
      success: function(data){

      if(data[0].pet_Name=="없음"){
    	$("input:radio[name='Pet_Name']:radio[value='"+data[0].pet_Name+"']").prop('checked', true); 
      }
      else{
    	  $("input:radio[name='Pet_Name']:radio[value='있음']").prop('checked', true); 
    	  $("input:radio[name='Pet_Name']:radio[value='있음']").click();
    	  $('#p_textbox').val(data[0].pet_Name);
      }
      $('.postnum').html('<input type="hidden" name="Pet_PostNum" value="'+data[0].pet_PostNum+'">');
     
      $('#petdatepicker').val(moment(data[0].pet_lostDate).format('YYYY-MM-DD'));
      $('#petcenterAddr2').val(data[0].pet_Loc);
      $('.Pet_Title').val(data[0].pet_Title);
      $('#summernote').summernote({
    		height :300,
    		minHeight:null,
    		maxHeight:null,
    		focus:true,
    		lang : "ko-KR",
    		placeholder: '내용을 입력해주세요',
    		toolbar: [
               // [groupName, [list of button]]
               ['Font Style', ['fontname']],
               ['style', ['bold', 'italic', 'underline']],
               ['font', ['strikethrough']],
               ['fontsize', ['fontsize']],
               ['color', ['color']],
               ['para', ['paragraph']],
               ['height', ['height']],
               ['Insert', ['picture']],
               ['Insert', ['link']],
               ['Misc', ['fullscreen']]
            ],
    		callbacks: {
    			//onImageUpload : function(files){
    				//sendFile(files[0]);
    			 onImageUpload: function(files, editor, welEditable) {
    				 for (var i = files.length - 1; i >= 0; i--) {
                        sendFile(files[i], this);
                     }
    			}
    		}
    	});
    	
    	function sendFile(file, el) {
    	       var form_data = new FormData();
    	       form_data.append('file', file);
    	   
    	       $.ajax({
    	         data: form_data,
    	         type: "post",
    	         url: './profileImage',
    	         cache: false,
    	         contentType: false,
    	         enctype: 'multipart/form-data',
    	         processData: false,
    	         success: function(url) {
    	        	 	var decodeURL = decodeURIComponent(url, 'utf-8');
    	        		 $(el).summernote('editor.insertImage', url);
    	         }
    	       });
    	     }
      if(data[0].pet_Up_File!='0'){
          $('#summernote').summernote('editor.pasteHTML',data[0].pet_Up_File);
      }
      $('#summernote').summernote('editor.pasteHTML', data[0].pet_Content);
      },
      error: function(e){console.log(e);}  
   });   
   


   
 //ready
//  ------ 글 내용 js 끝 ------
            
         
//  ------ 위치 js 시작 ------
// 1- 접속 위치

});

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
         var infoDiv = document.getElementById('petcenterAddr2');
         
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
      var infoDiv = document.getElementById('petcenterAddr2');

      for (var i = 0; i < result.length; i++) {
         // 행정동의 region_type 값은 'H' 이므로
         if (result[i].region_type === 'H') {
            infoDiv.innerHTML = result[i].address_name;
            break;
         }
      }
   }
}

//4. 검색창으로 위치검색

//엔터키 눌렀을때 위치검색
function enter(){
   if(event.keyCode==13){
      var Lost_Loc=$('#petcenterAddr2').val();

       // 장소 검색 객체를 생성합니다
       var ps = new kakao.maps.services.Places();
       // 키워드로 장소를 검색합니다
       ps.keywordSearch(Lost_Loc, placesSearchCB);
       // 키워드 검색 완료 시 호출되는 콜백함수 입니다
       function placesSearchCB (data, status, pagination) {
          if (status === kakao.maps.services.Status.OK) {
             // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
             // LatLngBounds 객체에 좌표를 추가합니다
             var bounds = new kakao.maps.LatLngBounds();
             for (var i=0; i<data.length; i++) {
                bounds.extend(new kakao.maps.LatLng(data[0].y, data[0].x));
             }
             // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
             map.setBounds(bounds);
          }
       }
   }
}
 
//위치검색 눌렀을때 위치검색 
 $("#Loc2Btn").click(function(){
    var Lost_Loc=$('#petcenterAddr2').val();
      
       // 장소 검색 객체를 생성합니다
       var ps = new kakao.maps.services.Places();
       // 키워드로 장소를 검색합니다
       ps.keywordSearch(Lost_Loc, placesSearchCB);
       // 키워드 검색 완료 시 호출되는 콜백함수 입니다
       function placesSearchCB (data, status, pagination) {
          if (status === kakao.maps.services.Status.OK) {
             // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
             // LatLngBounds 객체에 좌표를 추가합니다
             var bounds = new kakao.maps.LatLngBounds();
             for (var i=0; i<data.length; i++) {
                bounds.extend(new kakao.maps.LatLng(data[0].y, data[0].x));
             }
             // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
             map.setBounds(bounds);
          }
       }
 })
//  ------ 위치 js 끝 ------
      
      
//  ------ 사례금 js 시작 ------

// 모달 버튼에 이벤트를 건다.
$('#openModalBtn').on('click', function(){
   $('#modalBox').modal('show');
});
// 모달 안의 취소 버튼에 이벤트를 건다.
$('#closeModalBtn').on('click', function(){
   $('#modalBox').modal('hide');
});
   


function getFormatDate(date){
    var year = date.getFullYear();
    var month = (1 + date.getMonth());
    month = month >= 10 ? month : '0' + month;
    var day = date.getDate();
    day = day >= 10 ? day : '0' + day;
    
    return year + month  + day;
}


function addboard(){
   boardform.submit();
}

function inputcheck(){
   var lostitem = $("input[name=Pet_Name]:checked").val();
   var lostdate = $("input[name=Pet_LostDate]").val();
   var losttitle = $("input[name=Pet_Title]").val();
   
   if (lostitem == "etc"){
      var lostitem =$("#textbox").val();
      if (lostitem == ""){
         alert('동물이름을 입력해주세요.')
         return false;
      }
   }
   if (lostdate == ""){
      alert('분실날짜를 선택해주세요.')
      
      return false;
   }   
   if (losttitle == ""){
      alert('제목을 입력해주세요.')
      
      return false;
   }   
   
   $(".item10").children('button').attr('data-toggle', 'modal')
   $(".item10").children('button').attr('data-target', '#myModal')
   //e.preventDefault();
   // pay()
   return true;
}


// 결제요청(결제자 정보를 어떻게 넣을 것인가?) -> 결제성공 ( 결제테이블 정보 서버전송, 디비 저장) ->폼 양식 submit ->폼 입력된 정보 디비 저장
// 무료글 등록 클릭 -> 폼 양식 submit -> 폼 입력된 정보 디비 저장}