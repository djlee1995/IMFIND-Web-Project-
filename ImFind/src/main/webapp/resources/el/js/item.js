
<!-- 민정 조회페이지 -->
 		$(document).ready(function() {
			$('#ajax-test-div').empty();
			$.ajax({
						url : '/imfind/list.do',
						contentType : 'application/x-www-form-urlencoded;charset=utf-8',
						success : function(data) {
							console.log()
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
			
						var rowsPerPage = 3,
						
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
					//페이지네이션 함수 displayRows
					function displayRows(idx){
						var start =(idx -1)*rowsPerPage;//시작인덱스
							end = start + rowsPerPage; //끝인덱스
							console.log('start = ' + start);
							console.log('end = ' + end);
						rows.hide();
						rows.slice(start, end).show();
						//<tr>전체가 rows에 저장되있으니까		
					//그것의 범위(시작인덱스, 끝인덱스)로 지정해서 자르고.보여준다.();
						}
					displayRows(1);//열자마자 보여주는 숫자1
					//페이지네이션 클릭시 보여주기
					/*클릭한 그 a tag에 active 추가 하고
						클릭한 그 요소에 그 내용 그 숫자를 함수 displayRows의
						매개변수 지정.*/
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
				

		});//ready 끝
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
			console.log('ddd')
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