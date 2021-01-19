// 시군구동 검색 
jQuery(document).ready(function(){
  //sido option 추가
  jQuery.each(hangjungdong.sido, function(idx, code){
    //append를 이용하여 option 하위에 붙여넣음
    jQuery('#sido').append(fn_option(code.sido, code.codeNm));
  });
  //sido 변경시 시군구 option 추가
  jQuery('#sido').change(function(){
    jQuery('#sigugun').show();
    jQuery('#sigugun').empty();
    jQuery('#sigugun').append(fn_option('','시/군/구 선택하세요')); //
    jQuery.each(hangjungdong.sigugun, function(idx, code){
      if(jQuery('#sido > option:selected').val() == code.sido)
        jQuery('#sigugun').append(fn_option(code.sigugun, code.codeNm));
    });
    //세종특별자치시 예외처리
    //옵션값을 읽어 비교
    if(jQuery('#sido option:selected').val() == '36'){
      jQuery('#sigugun').hide();
      //index를 이용해서 selected 속성(attr)추가
      //기본 선택 옵션이 최상위로 index 0을 가짐
      jQuery('#sigugun option:eq(1)').attr('selected', 'selected');
      //trigger를 이용해 change 실행
      jQuery('#sigugun').trigger('change');
    }
  });
  //시군구 변경시 행정동 옵션추가
  jQuery('#sigugun').change(function(){
    //option 제거
    jQuery('#dong').empty();
    jQuery.each(hangjungdong.dong, function(idx, code){
      if(jQuery('#sido > option:selected').val() == code.sido && jQuery('#sigugun > option:selected').val() == code.sigugun)
        jQuery('#dong').append(fn_option(code.dong, code.codeNm));
    });
    //option의 맨앞에 추가
    jQuery('#dong').prepend(fn_option('','읍/면/동 선택하세요'));
    //option중 선택을 기본으로 선택
    jQuery('#dong option:eq("")').attr('selected', 'selected');
  });
  jQuery('#dong').change(function(){
    var sido = jQuery('#sido option:selected').val();
    var sigugun = jQuery('#sigugun option:selected').val();
    var dong = jQuery('#dong option:selected').val();
    var dongCode = sido + sigugun + dong + '00';
  });
});
  function fn_option(code, name){
	  return '<option value="' + code +'">' + name +'</option>';
	}
<!-- 민정 조회페이지 -->
			$('#ajax-test-div').empty();
			$.ajax({
						url : '/imfind/list.do',
						contentType : 'application/x-www-form-urlencoded;charset=utf-8',
						success : function(data) {
							$.each(data,function(index,item) {	
								//console.log(item)
								var cardElem = document.querySelector('#ajax-test-div');
								var card = document.createElement('div');
								card.className = "col-lg-4 col-md-6";
							 	var singlelatestblog = document.createElement('div');
								singlelatestblog.className = "single-latest-blog";
								singlelatestblog.innerHTML = '<a href = "./iteminfo?lost_PostNum='+item.lost_PostNum+'">,<img src="'+item.lost_Up_File+'" alt="">';
								var cardbox = document.createElement('div');
								var blog = document.createElement('div');
								blog.className = "blog";
								blog.innerHTML =index + '    ' + item.lost_Title;
								var pay = document.createElement('div');
								pay.className = "pay";
								pay.innerHTML = item.lost_Pay;
								singlelatestblog.append(blog);
								singlelatestblog.append(pay); 
								card.appendChild(singlelatestblog); 
								cardElem.appendChild(card);
							});
						},
						error : function() {
							alert("ajax 통신 실패!!!");
						},
					complete : function() {
						myfunction();
					}
				});// ajax 끝.
			<!-- 민정 페이징 -->
			function myfunction (){
						var rowsPerPage = 27,
						rows= $('#ajax-test-div').find(".single-latest-blog"),
						rowsCount=rows.length,
						pageCount=Math.ceil(rowsCount/rowsPerPage),
						numbers=$('#numbers_mypage_post1');
						console.log('rowsCount 개수 : ' + rowsCount);
						console.log('pageCount = '+ pageCount);
						console.log('rowsPerPage  ='+ rowsPerPage);
						for(var i=1; i <= pageCount; i++){
						console.log('페이징 번호 : ' + i);
						numbers.append('<li><a href="">' + i + '</a></li>');
					}
					numbers.find('li:first-child a').addClass('active');
					function displayRows(idx){
						var start =(idx -1)*rowsPerPage;//시작인덱스
							end = start + rowsPerPage; //끝인덱스
							console.log('start = ' + start);
							console.log('end = ' + end);
						rows.hide();
						rows.slice(start, end).show();
						}
					displayRows(1);//열자마자 보여주는 숫자1
						numbers.find('li').click(function(e){
						e.preventDefault();
						numbers.find('li a').removeClass('active');
						$(this).find('a').addClass('active');
						var index = $(this).text();
						console.log(index);
						displayRows(index);
						console.log('테스트');
					});
					console.log('================================================')
				};
 		<!-- 민정 검색버튼 -->
		document.querySelector('.btn').addEventListener('click', function click() {
			var lost_Title = $("input[name=input-search]").val();
			if (lost_Title ==""){
				alert('검색어를 입력해주세요')
				return false;
			}//if 
			$.ajax({
		        url : "/imfind/search.do",
		        contentType : 'application/x-www-form-urlencoded;charset=utf-8',
		        data : { "lost_Title" : lost_Title },
		        //type : 'POST',
		        success : function(data){
		        	console.log(data)
	                alert("잠시만 기다려주세요!");
	                $.each(data,function(index,item) {
	                	console.log(item)
	                var cardElem = document.querySelector('#ajax-test-div');
					var card = document.createElement('div');
					card.className = "col-lg-4 col-md-6";
				 	var singlelatestblog = document.createElement('div');
					singlelatestblog.className = "single-latest-blog";
					singlelatestblog.innerHTML = '<a href = "">,<img src="'+item.lost_Up_File+'" alt="">';
					var cardbox = document.createElement('div');
					var blog = document.createElement('div');
					blog.className = "blog";
					blog.innerHTML = item.lost_Title;
					var pay = document.createElement('div');
					pay.className = "pay";
					pay.innerHTML = item.lost_Pay;
					singlelatestblog.append(blog);
					singlelatestblog.append(pay); 
					card.appendChild(singlelatestblog); 
					cardElem.appendChild(card);
	                })
		        },
			})
		})
		//엔터
function enterkey() {
    if (window.event.keyCode == 13) {
    	var lost_Title = $("input[name=input-search]").val();
		if (lost_Title ==""){
			alert('검색어를 입력해주세요')
			return false;
		}//if 
		$('#ajax-test-div').empty();
		$.ajax({
	        url : "/imfind/search.do",
	        contentType : 'application/x-www-form-urlencoded;charset=utf-8',
	        data : { "lost_Title" : lost_Title },
	        //type : 'POST',
	        success : function(data){
	        	console.log(data)
                alert("잠시만 기다려주세요!");
                $.each(data,function(index,item) {
                	console.log(item)
                var cardElem = document.querySelector('#ajax-test-div');
				var card = document.createElement('div');
				card.className = "col-lg-4 col-md-6";
			 	var singlelatestblog = document.createElement('div');
				singlelatestblog.className = "single-latest-blog";
				singlelatestblog.innerHTML = '<a href = "">,<img src="'+item.lost_Up_File+'" alt="">';
				var cardbox = document.createElement('div');
				var blog = document.createElement('div');
				blog.className = "blog";
				blog.innerHTML = item.lost_Title;
				var pay = document.createElement('div');
				pay.className = "pay";
				pay.innerHTML = item.lost_Pay;
				singlelatestblog.append(blog);
				singlelatestblog.append(pay); 
				card.appendChild(singlelatestblog); 
				cardElem.appendChild(card);
                })
	        },
		})
    }
}