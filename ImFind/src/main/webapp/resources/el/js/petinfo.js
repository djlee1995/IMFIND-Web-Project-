var loc;
var arr = [];
$(document).ready(function() {
	console.log(loginUser)

	info();
	img();
	

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
$('.petupdateBtn').click(function(){
	$(location).attr("href", "petupdatepage?Pet_PostNum="+Pet_PostNum+"");
});
$('.petdeleteBtn').click(function(){
	$(location).attr("href", "petdeletepage?Pet_PostNum="+Pet_PostNum+"");

});

});

// 최근 본 게시물 함수
function insertIntoHistory(data, Pet_PostNum){
	
	// 최근 본 게시글
	let flag = false;
	const bookmark = {
		lost_up_file : pet_Up_File,
		lost_Title : data.pet_Title,
		postnum : 'petinfo?Pet_PostNum=' + Pet_PostNum + '&getId='+ data.id,
		pk : Pet_PostNum
	}

	if (sessionStorage.getItem('test') == null) {
		arr.push(bookmark)
		sessionStorage.setItem('test', JSON.stringify(arr))
		let test = sessionStorage.getItem('test')
		console.log(test)
		// ShowStorage();
	} else {
		var oldBKInfo = JSON.parse(sessionStorage.getItem("test"));
		// now let's check if the stored value is an array
		for (let i = 0; i < oldBKInfo.length; i++) {

			if (oldBKInfo[i].pk == Pet_PostNum) {
				flag = true;
				break;
			}
		}
		if (flag == false) {
			
			if(oldBKInfo.length == 4){
				oldBKInfo.shift();
			}
			
			if (!(oldBKInfo instanceof Array))
				oldBKInfo = [ oldBKInfo ]; // if not, create
											// one
			oldBKInfo.push(bookmark); // push a new student
										// inside of it
			sessionStorage.setItem("test", JSON.stringify(oldBKInfo));
		}
	}
}

function info() {
	$.ajax({
		url :'petdatainfo.do',
		//type : 'POST',
		data : {'Pet_PostNum': Pet_PostNum },
		async:false,
		contentType: 'application/x-www-form-urlencoded;charset=utf-8',
		//dataType:'json',
		success: function(data){
			console.log(data[0].id)
			if($.trim(loginUser)==(data[0].id)){
				$('#output').html('<div class="container-btn"><th colspan="5"><input type="button" class="petupdateBtn" value="수정"><input type="button" class="petdeleteBtn" value="삭제"></th></div>');
			}
			if($.trim(data[0].pet_Up_File) == '0'){
				 pet_Up_File = '<img src="./resources/el/images/no_img.png"/>';
	        	 //$('#file').html('<img src="./resources/el/images/no_img.png"/>');
			}
			else{
				pet_Up_File = data[0].pet_Up_File;
				 //$('#file').html(data[0].pet_Up_File);
			}
			
			// 최근 본 게시물 저장
			insertIntoHistory(data[0], Pet_PostNum);
	
			formattedDate = getChangeDateString(data[0].pet_Re_Date)
			loc=data[0].pet_Loc
			$('#lost_Re_Date').html('<i class="far fa-calendar-alt"></i> ' + formattedDate);
			$('#pet').text(data[0].pet_Name);
			$('#title').html(data[0].pet_Title+'<div id="like-con"><a href="javascript:like_func();" class="like-btn"><i id="like_img" class="far fa-thumbs-up"></i><span id="like_cnt"></span></a></div>');
			$('#content-body-text').html(data[0].pet_Content);
			$('#file').html(pet_Up_File);
			$('#pay').text(data[0].pet_Pay);
			$('#loc').text(data[0].pet_Loc);
			$('#lostdate').text(moment(data[0].pet_LostDate).format('YYYY-MM-DD'));
			$('#id').text(data[0].id);
		},

		error : function() {
			alert("ajax통신 실패2")
		}
	});
}
function img(){
	 $.ajax({
		    url: "./likeChk",
		    //type : 'POST',
		      async:false,
		      contentType: 'application/x-www-form-urlencoded;charset=utf-8',
		      //dataType:'json',
		      
		    success: function(data) {
		    	console.log(data)
		    	if(data.length==0){
		    		$("#like_img").attr("src", "./resources/el/images/like1.png");
			    	$('#like_cnt').text("0");
	    			
		    	}else{
		    		 $("#like_img").attr("src", "./resources/el/images/like1.png");
	    			 $.ajax({
	    				    url: "./pet_likeCount",
	    				    //type : 'POST',
	    				    data : {'Pet_PostNum':Pet_PostNum},
	    				      async:false,
	    				      contentType: 'application/x-www-form-urlencoded;charset=utf-8',
	    				      //dataType:'json',
	    				    success: function(data) {
	    				    	console.log(data)
	    				    	$('#like_cnt').text(data);
	    				    	
	    				    	//좋아요 버튼 색 변경
	    				    	$("#like-con").attr("style", "background:white");
	    				    	$("#like_img").attr("style", "color:gray");
	    				    	$("#like_cnt").attr("style", "color:gray");

	    				    },
	    				    error: function(request, status, error){
	    				      alert("좋아요 에러");
	    				    }
	    				  });
	    			 
		    	 $.each(data,function(index,item) {
		    		 
		    		 if(loginUser==item.id && Pet_PostNum == item.pet_PostNum){
		    			 $("#like_img").attr("src", "./resources/el/images/like2.png");

		    			 $.ajax({
		    				    url: "./pet_likeCount",
		    				    //type : 'POST',
		    				    data : {'Pet_PostNum':Pet_PostNum},
		    				      async:false,
		    				      contentType: 'application/x-www-form-urlencoded;charset=utf-8',
		    				      //dataType:'json',
		    				    success: function(data) {
		    				    	console.log(data)
		    				    	$('#like_cnt').text(data);
		    				    	
		    				    	//좋아요 버튼 색 변경
		    				    	$("#like-con").attr("style", "background:dodgerblue");
		    				    	$("#like_img").attr("style", "color:white");
		    				    	$("#like_cnt").attr("style", "color:white");
		    				    },
		    				    error: function(request, status, error){
		    				      alert("좋아요 에러1313");
		    				    }
		    				  });
		    		 }
		    	 });
		    	}
		    },
		    error: function(request, status, error){
		      alert("좋아요 에러");
		    }
		  });
	 
}
function like_func(){
	  $.ajax({
	    url: "./likeChk",
	    //type : 'POST',
	     
	      async:false,
	      contentType: 'application/x-www-form-urlencoded;charset=utf-8',
	      //dataType:'json',
	    success: function(data) {
	    	console.log(data)
	    	if(data.length==0){
   			 $.ajax({
				    url: "./pet_likeplus",
				  //type : 'POST',
				      data : {'Pet_PostNum':Pet_PostNum,'id':loginUser},
				      async:false,
				      contentType: 'application/x-www-form-urlencoded;charset=utf-8',
				      //dataType:'json',
				    success: function(data) {
				    	//$("#like_img").attr("src", "./resources/el/images/like2.png");
				    	img();
				    	
				    },
				    error: function(request, status, error){
					      alert("좋아요 에러3");
				    }
			 });
	    	}else{
	    		$.ajax({
				    url: "./pet_likeplus",
				  //type : 'POST',
				      data : {'Pet_PostNum':Pet_PostNum,'id':loginUser},
				      async:false,
				      contentType: 'application/x-www-form-urlencoded;charset=utf-8',
				      //dataType:'json',
				    success: function(data) {
				    	img();
				    	//$("#like_img").attr("src", "./resources/el/images/like2.png");
				    },
				    error: function(request, status, error){
					      alert("좋아요 에러5");
				    }
			 });
	    	 $.each(data,function(index,item) {
	    		 if(loginUser==item.id && Pet_PostNum == item.pet_PostNum){
	    			 $.ajax({
	    				    url: "./pet_likecancel",
	    				  //type : 'POST',
	    				      data : {'Pet_PostNum':Pet_PostNum,'id':loginUser},
	    				      async:false,
	    				      contentType: 'application/x-www-form-urlencoded;charset=utf-8',
	    				      //dataType:'json',
	    				    success: function(data) {
	    				    	img();
	    				    	//$("#like_img").attr("src", "./resources/el/images/like1.png");

	    				    },
	    				    error: function(request, status, error){
	    					      alert("좋아요 에러4");
	    				    }
	    			 });
	    		 }
	    		
	    	 });
	    	}
	    
	    },
	    error: function(request, status, error){
	      alert("좋아요 에러6");
	    }
	  });
	}



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