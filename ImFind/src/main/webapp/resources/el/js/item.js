<<<<<<< HEAD

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
								console.log(item.lost_Up_File)
								var cardElem = document.querySelector('#ajax-test-div');
								var card = document.createElement('div');
								card.className = "col-lg-4 col-md-6";
							 	var singlelatestblog = document.createElement('div');
								singlelatestblog.className = "single-latest-blog";
								singlelatestblog.innerHTML = '<a href = "./iteminfo?lost_PostNum='+item.lost_PostNum+'">'+item.lost_Up_File;
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
						
						for(var i=1; i <= pageCount; i++){
					
						numbers.append('<li><a href="">' + i + '</a></li>');
					}
					numbers.find('li:first-child a').addClass('active');
					function displayRows(idx){
						var start =(idx -1)*rowsPerPage;//시작인덱스
							end = start + rowsPerPage; //끝인덱스
							
						rows.hide();
						rows.slice(start, end).show();
						}
					displayRows(1);//열자마자 보여주는 숫자1
						numbers.find('li').click(function(e){
						e.preventDefault();
						numbers.find('li a').removeClass('active');
						$(this).find('a').addClass('active');
						var index = $(this).text();
						displayRows(index);
					});
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
	                alert("잠시만 기다려주세요!");
	                $.each(data,function(index,item) {
	                var cardElem = document.querySelector('#ajax-test-div');
					var card = document.createElement('div');
					card.className = "col-lg-4 col-md-6";
				 	var singlelatestblog = document.createElement('div');
					singlelatestblog.className = "single-latest-blog";
					singlelatestblog.innerHTML = '<a href = "./iteminfo?lost_PostNum='+item.lost_PostNum+'">'+item.lost_Up_File;				
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
                alert("잠시만 기다려주세요!");
                $.each(data,function(index,item) {
                var cardElem = document.querySelector('#ajax-test-div');
				var card = document.createElement('div');
				card.className = "col-lg-4 col-md-6";
			 	var singlelatestblog = document.createElement('div');
				singlelatestblog.className = "single-latest-blog";
				singlelatestblog.innerHTML = '<a href = "./iteminfo?lost_PostNum='+item.lost_PostNum+'">'+item.lost_Up_File;
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

=======
// 시군구동 검색 
      var lost_Loc='';
      var si;
      var gu;
      var dong;
jQuery(document).ready(function(){
   listdata();
    
   $(".js-example-basic-single").select2();
      
   
  //sido option 추가
  jQuery.each(hangjungdong.sido, function(idx, code){
    //append를 이용하여 option 하위에 붙여넣음
    jQuery('#sido').append(fn_option(code.sido, code.codeNm));
  });
  //sido 변경시 시군구 option 추가
  jQuery('#sido').change(function(){
    jQuery('#sigugun').show();
    jQuery('#sigugun').empty();
    jQuery('#sigugun').append(fn_option('','시/군/구 선택하세요'));
    jQuery('#dong').empty();
    jQuery('#dong').append(fn_option('','읍/면/동 선택하세요'));//
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
    si = $('#sido :selected').text();
    if(si=='시/도 선택하세요'){
       si = "";
    }
    lost_Loc=si
    console.log(lost_Loc)
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
    gu = $('#sigugun :selected').text();
    if(gu=='시/군/구 선택하세요'){
       gu = "";
       
    }
    lost_Loc=si+gu
    console.log(lost_Loc)
  });
  jQuery('#dong').change(function(){
    var sido = jQuery('#sido option:selected').val();
    var sigugun = jQuery('#sigugun option:selected').val();
    var dong = jQuery('#dong option:selected').val();
    var dongCode = sido + sigugun + dong + '00';
    dong = $('#dong :selected').text();
    
    if(dong=='읍/면/동 선택하세요'){
       dong = "";
    }
   
    lost_Loc=si+gu+dong
    console.log(lost_Loc)
  });

});
function selectBtn() {

   if(lost_Loc=='' && $("#payChk").is(":checked")==false){
        listdata();
   }
   else if($("#payChk").is(":checked")==true){
      $.ajax({
            url :'sido.do',
            //type : 'POST',
            data : {'lost_Loc': lost_Loc },
            async:false,
            contentType: 'application/x-www-form-urlencoded;charset=utf-8',
            //dataType:'json',
            success: function(data){
               $('#output').empty();
               $.each(data,function(index,item) { 
            	   if(item.lost_Up_File == '0'){
					   lost_up_file = '<img src="./resources/el/images/no_img.png"/>';
					}
					else{
					   lost_up_file = item.lost_Up_File;
					}
					
					if(item.lost_Loc == null){
						lost_Loc = '';
					}
					else{
						lost_Loc = item.lost_Loc;
					}
                  if(item.lost_Pay!=0){
                     var output = '';
                     output +='<tr><td><a href = "./iteminfo?lost_PostNum='+item.lost_PostNum+'">'+item.lost_Up_File+'</td>';
                     output +='<td>'+(moment(item.lost_Date).format('YYYY-MM-DD'))+'</td>';
                     output +='<td>'+item.lost_Title+'</td>';
                     output +='<td>'+item.lost_Pay+'</td></tr>';
                     $('#output').append(output);
                     }
               });
               },
               
            error : function() {

               alert("ajax통신 실패2")

            }
      });
   }else{
      $.ajax({
            url :'sido.do',
            //type : 'POST',
            data : {'lost_Loc': lost_Loc },
            async:false,
            contentType: 'application/x-www-form-urlencoded;charset=utf-8',
            //dataType:'json',
            success: function(data){
               $('#output').empty();
               $.each(data,function(index,item) {   
            	   if(item.lost_Up_File == '0'){
					   lost_up_file = '<img src="./resources/el/images/no_img.png"/>';
					}
					else{
					   lost_up_file = item.lost_Up_File;
					}
					
					if(item.lost_Loc == null){
						lost_Loc = '';
					}
					else{
						lost_Loc = item.lost_Loc;
					}
                  var output = '';
                  output +='<tr><td><a href = "./iteminfo?lost_PostNum='+item.lost_PostNum+'">'+item.lost_Up_File+'</td>';
                  output +='<td>'+(moment(item.lost_Date).format('YYYY-MM-DD'))+'</td>';
                  output +='<td>'+item.lost_Title+'</td>';
                  output +='<td>'+item.lost_Pay+'</td></tr>';
                  $('#output').append(output);
               });
               },
               
            error : function() {

               alert("ajax통신 실패2")

            }
      });
   }
     
   
}
function listdata() {
     
     $.ajax({
         url : '/imfind/list.do',
         contentType : 'application/x-www-form-urlencoded;charset=utf-8',
         success : function(data) {
        	 
               $('.card-wrapper').empty();
               var output = '';
               
               $.each(data,function(index,item) {   
					if(item.lost_Up_File == '0'){
					   lost_up_file = '<img src="./resources/el/images/no_img.png"/>';
					}
					else{
					   lost_up_file = item.lost_Up_File;
					}
					
					if(item.lost_Loc == null){
						lost_Loc = '';
					}
					else{
						lost_Loc = item.lost_Loc;
					}
				  console.log(item)
				  output += '<div class="card-con">';
				  output +=     '<a href="./iteminfo?lost_PostNum='+item.lost_PostNum+'">';
				  output +=       '<div class="photo">' + lost_up_file +'</div>'
				  output +=       '<div class="simpleinfo">'
				  output +=         '<div class="title">'+ item.lost_Title +'</div>'
				  output +=          '<div class="subinfo">'
				  output +=           '<div class="pay">' + item.lost_Pay + '</div>'
				  output +=           '<div class="date">'+ (moment(item.lost_Date).format('YY-MM-DD')) +'</div>'
				  output +=         '</div>'
				  output +=       '</div>'
				  output +=       '<div class="loc">' + lost_Loc + '</div>'
				  output +=     '</a>'
				  output +=   '</div>'
					  
				  $('.card-wrapper').append(output);
               }); 
         },
         error : function() {
            alert("ajax 통신 실패!!!");
         }
   });// ajax 끝.
}

function fn_option(code, name){
	return '<option value="' + code +'">' + name +'</option>';
}

 //<!-- 민정 페이징 -->
 function myfunction (){
          var rowsPerPage = 27,
          rows= $('#ajax-test-div').find(".single-latest-blog"),
          rowsCount=rows.length,
          pageCount=Math.ceil(rowsCount/rowsPerPage),
          numbers=$('#numbers_mypage_post1');
          
          for(var i=1; i <= pageCount; i++){
       
          numbers.append('<li><a href="">' + i + '</a></li>');
       }
       numbers.find('li:first-child a').addClass('active');
       function displayRows(idx){
          var start =(idx -1)*rowsPerPage;//시작인덱스
             end = start + rowsPerPage; //끝인덱스
             
          rows.hide();
          rows.slice(start, end).show();
          }
       displayRows(1);//열자마자 보여주는 숫자1
          numbers.find('li').click(function(e){
          e.preventDefault();
          numbers.find('li a').removeClass('active');
          $(this).find('a').addClass('active');
              var index = $(this).text();
              displayRows(index);
           });
        };
   //<!-- 민정 검색버튼 -->
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
	      success : function(data) {
		    $('#output').empty();
		    $.each(data,function(index,item) { 
		    	if(item.lost_Up_File == '0'){
					   lost_up_file = '<img src="./resources/el/images/no_img.png"/>';
					}
					else{
					   lost_up_file = item.lost_Up_File;
					}
					
					if(item.lost_Loc == null){
						lost_Loc = '';
					}
					else{
						lost_Loc = item.lost_Loc;
					}
		       var output = '';
		       output +='<tr><td><a href = "./iteminfo?lost_PostNum='+item.lost_PostNum+'">'+item.lost_Up_File+'</td>';
		       output +='<td>'+(moment(item.lost_Date).format('YYYY-MM-DD'))+'</td>';
		       output +='<td>'+item.lost_Title+'</td>';
		       output +='<td>'+item.lost_Pay+'</td></tr>';
		       $('#output').append(output);
		    });
		 },
		 error : function() {
		    alert("ajax 통신 실패!!!");
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
          success : function(data) {
        	  
    	   $('.card-wrapper').empty();
    	   $.each(data,function(index,item) {  
               var output = '';
              
               if(item.lost_Up_File == '0'){
				   lost_up_file = '<img src="./resources/el/images/no_img.png"/>';
				}
				else{
				   lost_up_file = item.lost_Up_File;
				}
				
				if(item.lost_Loc == null){
					lost_Loc = '';
				}
				else{
					lost_Loc = item.lost_Loc;
				}
	          output += '<div class="card">';
	          output +=     '<a href="./iteminfo?lost_PostNum='+item.lost_PostNum+'">';
	          output +=       '<div class="photo">' + lost_up_file +'</div>'
	          output +=       '<div class="simpleinfo">'
	          output +=         '<div class="title">'+ item.lost_Title +'</div>'
	          output +=          '<div class="subinfo">'
	          output +=           '<div class="pay">' + item.lost_Pay + '</div>'
	          output +=           '<div class="date">'+ (moment(item.lost_Date).format('YYYY-MM-DD')) +'</div>'
	          output +=         '</div>'
	          output +=       '</div>'
	          output +=       '<div class="loc"></div>'
	          output +=     '</a>'
	          output +=   '</div>'

             $('.card-wrapper').append(output);
             
            });

         },
         error : function() {
            alert("ajax 통신 실패!!!");
         },
      });
    }
>>>>>>> main_dev
}