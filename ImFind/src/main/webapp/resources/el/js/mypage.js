<<<<<<< HEAD

  //=--------------------------------
     // 데이터 불러오기 START
    //목록 
    
	$(document).ready(function(){
		
		$('#output').empty(); 
		
		$.ajax({
			url:'/imfind/getElsedata.do',
			type:'POST',
			contentType:'application/x-www-form-urlencoded;charset=utf-8',
			
			success:function(data){
				$.each(data, function(index, item){	
					console.log('i :' + index);
					var output=' ' ;
					output += '<tr>';				
					output += '<td class="mypage-line"  id="gotStar">'+'&nbsp;'+'&nbsp;'+item.lost_PostNum+'&nbsp;'+'</td>';//번호
					output += '<td class="mypage-line">'+item.lost_Title+'</td>';//제목				
					output += '<td class="mypage-line">'+item.lost_Pay+'</td>';//사례금
					output += '<td class="mypage-line">'+item.lost_Re_Date+'</td>';//등록날짜 					
					output += '<td class="mypage-line"><button type="button" class="btn btn-outline-primary" a href="/imfind/#.do">수정</button></td>'; 
					
					output += '<td class="mypage-line"><button type="button" class="btn btn-outline-primary" a href="/imfind/#.do">삭제</button></td>'; 
					output += '<td class="mypage-line"><button type="button" id="btnWhoGetStar" Zclass="btn btn-outline-primary" data-toggle="modal" data-target="#dialog">거래완료</button></td>'; 
					output += '</tr>';
					console.log("output:"+output); 
					$('#output').append(output);
					
				
				});
			},
			error:function(){
				alert("ajax통신 실패1!!!");			
			},
			complete : function(){ //등록글이 없으면, 페이지네이션이 계산할 tr카운팅수가 없으므로 무조건 수행 해도 상관 없다.
				 myfunction();  //위에 each가 반복문으로 계속 돌아 가니까 한번 돌때 마다. 카운팅하기때문이 주의!!!  그래서 밖으로 나옴. 페이지네이셔 호출! 
			}
		});	
		/* 작성글 DB불러오기 + 작성글 DB페이징 섹션 _END  */
		/*------------------------------------------------------------------------------------------------------------------*/
		/* 결제내역 DB불러오기 + 결제내역 DB페이징 섹션 START */
		$('#output_pay').empty(); 
			
			$.ajax({
				url:'/imfind/getElsePaydata.do',
				type:'POST',
				contentType:'application/x-www-form-urlencoded;charset=utf-8',
				
				success:function(data){
					$.each(data, function(index, item){	
						console.log(item);
						var output_pay=' ' ;
						output_pay += '<tr>';				
						output_pay += '<td class="mypage-line">'+'&nbsp;'+'&nbsp;'+item.pay_Date+'&nbsp;'+'</td>';//결제일자
						output_pay += '<td class="mypage-line">'+item.pay_Amount+'</td>';//결제금액(사례금액)				
						output_pay += '<td class="mypage-line">'+item.pay_Way+'</td>';//결제방법
						output_pay += '<td class="mypage-line">'+item.pay_State+'</td>';//결제상태				
						output_pay += '<td class="mypage-line"><button type="button" class="btn btn-outline-primary">환불요청</button></td>'; 	
						output_pay += '</tr>';
						console.log("output_pay:"+ output_pay);
						$('#output_pay').append(output_pay);
					});
				},
					error:function(){
						alert("ajax통신 실패2!!!");			
					},
					
					complete : function(){ //등록글이 없으면, 페이지네이션이 계산할 tr카운팅수가 없으므로 무조건 수행 해도 상관 없다.
						 myfunction2();  //위에 each가 반복문으로 계속 돌아 가니까 한번 돌때 마다. 카운팅하기때문이 주의!!!  그래서 밖으로 나옴. 페이지네이셔 호출! 
					}
				
			});
			/* 결제내역 DB불러오기 + 결제내역 DB페이징 섹션 END */
			//-------------------------------------------------------
		});		
// 데이터 불러오기 END ----------------------------------------------------------------------------------------------
     /*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
   //분실물 글 목록의 페이지네이션 
    				function myfunction (){
    			

							/* 변수 생성 
							- rowPerPage 페이지당 보여줄 개수 5
							- rows 가로행의 tr  개수
							- rowsCount 개수 
							- pageCount 페이지네이션 개수=총 데이터/페이지당 보여줄 개수
							- numbers
							콘솔에서 pageCount 찍어서 확인해보기 
							*/
								var rowsPerPage = 5,
									/*rows= $('#my-table100 tbody tr'), 헤드가 테이블이랑 하나  */
									rows= $('#output tr'), /* => 헤드를 나누었을 때 : Soo: 반응형으로 나중에 바꾸면 헤드 다시 하나로 합치고 윗줄로 바꾸자. (202101071138)*/
									rowsCount=rows.length, 
									pageCount=Math.ceil(rowsCount/rowsPerPage),
									numbers=$('#numbers_mypage_post1');  
									
								console.log('row 개수 : ' + rowsCount);
								console.log('pageCount IFELSE0107 ='+ pageCount);
								console.log('rowsPerPage IFELSE0107 ='+ rowsPerPage);
								/* 페이지네이션 li를 생성 반복문*/
								for(var i=1; i <= pageCount; i++){
									
									console.log('페이징 번호 : ' + i);
									numbers.append('<li><a href="">' + i + '</a></li>');
								}
								
								
								numbers.find('li:first-child a').addClass('active');
								
								//페이지네이션 함수 displayRows
								function displayRows(idx){
									var start =(idx -1)*rowsPerPage;//시작인덱스
										end = start + rowsPerPage; //끝인덱스
									
									rows.hide();
									rows.slice(start, end).show();
									//<tr>전체가 rows에 저장되있으니까		
								//그것의 범위(시작인덱스, 끝인덱스)로 지정해서 자르고.보여준다.();
									}
								displayRows(1);//열자 마자는 숫자1
								
								//페이지네이션 클릭시 보여주기 
								/*클릭한 그 a tag에 active 추가 하고 
									클릭한 그 요소에 그 내용 그 숫자를 함수 displayRows의
									매개변수 지정.*/
								
								numbers.find('li').click(function(e){
									e.preventDefault();
									numbers.find('li a').removeClass('active');
									$(this).find('a').addClass('active');
									var index = $(this).index()+1;
									console.log('index ='+ index ); 
									displayRows(index);
								});
							
								console.log('================================================')
							};
					 
    /*-----------------------------------------------------------------------------------------------------------------------------------------------------*/	
	/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
	//결제 목록 페이지 네이션 						   
		    				function myfunction2 (){
		    			

									/* 변수 생성 
									- rowPerPage 페이지당 보여줄 개수 5
									- rows 가로행의 tr  개수
									- rowsCount 개수  해당 테이블 더미데이터 총 건수
									- pageCount 페이지네이션 개수=총 데이터 tr 건수 / 페이지당 보여줄 수/
									- numbers
									콘솔에서 pageCount 확인!!!
									*/
										var rowsPerPage = 3,
											/*rows= $('#my-table100 tbody tr'), 헤드가 테이블이랑 하나  */
											rows= $('#output_pay tr'), /* => 헤드를 나누었을 때 : Soo: 반응형으로 나중에 바꾸면 헤드 다시 하나로 합치고 윗줄로 바꾸자. (202101071138)*/
											rowsCount=rows.length, 
											pageCount=Math.ceil(rowsCount/rowsPerPage),
											numbers=$('#numbers_mypage_post2');  
											
										console.log('row 개수 : ' + rowsCount);
										console.log('pageCount IFELSE0107 ='+ pageCount);
										console.log('rowsPerPage IFELSE0107 ='+ rowsPerPage);
										/* 페이지네이션 li를 생성 반복문*/
										for(var i=1; i <= pageCount; i++){
											
											console.log('페이징 번호 : ' + i);
											numbers.append('<li><a href="">' + i + '</a></li>');
										}
										
										
										numbers.find('li:first-child a').addClass('active');
										
										//페이지네이션 함수 displayRows
										function displayRows(idx){
											var start =(idx -1)*rowsPerPage;//시작인덱스
												end = start + rowsPerPage; //끝인덱스
											
											rows.hide();
											rows.slice(start, end).show();
											//<tr>전체가 rows에 저장되있으니까		
										//그것의 범위(시작인덱스, 끝인덱스)로 지정해서 자르고.보여준다();
											}
										displayRows(1);//열자 마자는 숫자1
										
										//페이지네이션 클릭시 보여주기 
										/*클릭한 그 a tag에 active 추가 하고 
											클릭한 그 요소에 그 내용 그 숫자를 함수 displayRows의
											매개변수 지정.*/
										
										numbers.find('li').click(function(e){
											e.preventDefault();
											numbers.find('li a').removeClass('active');
											$(this).find('a').addClass('active');
											var index = $(this).index()+1;
											console.log('index ='+ index ); 
											displayRows(index);
										});
									
										console.log('================================================')
									};
							 
					  
    /*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
    /*테스트 페이징(DB값이 아닌 html로 만든 테이블의 페이징 아래 )*/
    /*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
    /*테스트 페이징(DB값이 아닌 html로 만든 테이블의 페이징 아래 )*/
   //평점 만들기 시도 

   /*클래스명 rating마다 할일을 변수로 !!!*/
$(function(){
//var rating = $('.rating'); //상/하 별점 표시하기 및 별점 주기 모두 적용됨.
	var rating = $('.review .rating'); //별점표시하기 영역으로만 한정 (부모 .리뷰 안의 .레이팅으로 한정 했기 때문.)
//각 각 할 일이니까 each 로~! 


	
	//(2 )id로 제한 하기 (별점주기)
	
	var userScore = $('#makeStar');
	userScore.change(function(){
		var userScoreNum = $(this).val();
		console.log('userScoreNum:'+userScoreNum);
		$('.make_star svg').css({color:'#000'});//찍고 나서 블랙으로 다시 초기화 그래야 작은 단위로 내려올수 있어
		$('.make_star svg:nth-child(-n+'+ userScoreNum + ')').css({color:'#F05522'});
	}); 
		
	$('.make_star svg').click(function(){
		var targetNum = $(this).index()+1 ;
		console.log('targetNum:'+ targetNum);
		$('.make_star svg').css({color:'#000'});//찍고 나서 블랙으로 다시 초기화 그래야 작은 단위로 내려올수 있어
		$('.make_star svg:nth-child(-n+'+ targetNum + ')').css({color:'#F05522'});
	});
	
	
 }); 

    //------------------------------------------------------------------------------------------------------------------------------
    
    
    
    /*-------------------------------------------------------------------------------------------------------------------------------------------------------*/
	   
=======

 
	 jQuery(document).ready(function ($) {
        var value = '@Request.RequestContext.HttpContext.Session["loginUser"]';
    });
    


	$(document).ready(function(){
		alert(user);
		$('#output').empty(); 
		
		$.ajax({
			url:'/imfind/getElsedata.do',
			type:'POST',
			contentType:'application/x-www-form-urlencoded;charset=utf-8',
			
			success:function(data){
				$.each(data, function(index, item){	
					console.log('i :' + index);
					var output=' ' ;
					output += '<tr>';				
					output += '<td class="mypage-line">'+item.lost_PostNum +'</td>';//번호
					output += '<td class="mypage-line">'+item.lost_Title+'</td>';//제목				
					output += '<td class="mypage-line">'+item.lost_Pay+'</td>';//사례금
					output += '<td class="mypage-line">'+item.lost_Re_Date+'</td>';//등록날짜 					
					output += '<td class="mypage-line"><button type="button" class="btn btn-outline-primary" a href="/imfind/#.do">수정</button></td>'; 
					
					output += '<td class="mypage-line"><button type="button" class="btn btn-outline-primary" a href="/imfind/#.do">삭제</button></td>'; 
					output += '<td class="mypage-line"><button type="button" class="btnWhoGetStar" Zclass="btn btn-outline-primary" data-toggle="modal" data-target="#dialog">거래완료</button></td>'; 
					output += '</tr>';
					console.log("output:"+output); 
					$('#output').append(output);
					
				
				});
			},
			error:function(){
				alert("ajax통신 실패1!!!");			
			},
			complete : function(){ 
				 myfunction();  // 페이지네이셔 호출! 
				 myfunction3(); 
				 starfunction();
			},
		});	
		/* 작성글 DB불러오기 + 작성글 DB페이징 섹션 _END  */
		/*------------------------------------------------------------------------------------------------------------------*/
		//반려동물 찾기 게시글 시작
		$('#output_PatPost').empty(); 
		
		$.ajax({
			url:'/imfind/getElsedata.do',
			type:'POST',
			contentType:'application/x-www-form-urlencoded;charset=utf-8',
			
			success:function(data){
				$.each(data, function(index, item){	
					console.log('i :' + index);
					var output_PatPost=' ' ;
					output_PatPost += '<tr>';				
					output_PatPost += '<td class="mypage-line">'+item.Pat_PostNum +'</td>';//번호//id 부여하고 경고발생
					output_PatPost += '<td class="mypage-line">'+item.Pat_Title+'</td>';//제목				
					output_PatPost += '<td class="mypage-line">'+item.Pat_Pay+'</td>';//사례금
					output_PatPost += '<td class="mypage-line">'+item.Pat_Re_Date+'</td>';//등록날짜 					
					output_PatPost += '<td class="mypage-line"><button type="button" class="btn btn-outline-primary" a href="/imfind/#.do">수정</button></td>'; 					
					output_PatPost += '<td class="mypage-line"><button type="button" class="btn btn-outline-primary" a href="/imfind/#.do">삭제</button></td>'; 					
					
					output_PatPost += '<td class="mypage-line"><button type="button" class="btnWhoGetStar" Zclass="btn btn-outline-primary" data-toggle="modal" data-target="#dialog">거래완료</button></td>'; 
				
					output_PatPost += '</tr>';
					console.log("output_PatPost:"+output_PatPost); 
					$('#output_PatPost').append(output_PatPost);

								
				});
			},
			error:function(){
				alert("ajax통신 실패1pat!!");			
			},	
			
			
			complete : function(){ 
				 myfunction_Patpage();  
			     myfunction3(); 
				 starfunction();
			},		
			
			
		});	
		/* 작성글 DB불러오기 + 작성글 DB페이징 섹션 _END  */
		/*------------------------------------------------------------------------------------------------------------------*/
		/* 결제내역 DB불러오기 + 결제내역 DB페이징 섹션 START */
		$('#output_pay').empty(); 
			
			$.ajax({
				url:'/imfind/getElsePaydata.do',
				type:'POST',
				contentType:'application/x-www-form-urlencoded;charset=utf-8',
				
				success:function(data){
					$.each(data, function(index, item){	
						console.log(item);
						var output_pay=' ' ;
						output_pay += '<tr>';				
						output_pay += '<td class="mypage-line">'+'&nbsp;'+'&nbsp;'+item.pay_Date+'&nbsp;'+'</td>';//결제일자
						output_pay += '<td class="mypage-line">'+item.pay_Amount+'</td>';//결제금액(사례금액)				
						output_pay += '<td class="mypage-line">'+item.pay_Way+'</td>';//결제방법
						output_pay += '<td class="mypage-line">'+item.pay_State+'</td>';//결제상태				
						output_pay += '<td class="mypage-line"><button type="button" class="btn btn-outline-primary">환불요청</button></td>'; 	
						output_pay += '</tr>';
						console.log("output_pay:"+ output_pay);
						$('#output_pay').append(output_pay);
					});
				},
					error:function(){
						alert("ajax통신 실패2!!!");			
					},
					
					complete : function(){ 
						 myfunction2();  
					}
				
			});
			/* 결제내역 DB불러오기 + 결제내역 DB페이징 섹션 END */
			
		});		
// 데이터 불러오기 END ----------------------------------------------------------------------------------------------
     
//분실물 글 목록의 페이지네이션 /*------------------------------------------------------------------------------------------*/
    				function myfunction (){    			

							
								var rowsPerPage = 5,									
									rows= $('#output tr'), 
									rowsCount=rows.length, 
									pageCount=Math.ceil(rowsCount/rowsPerPage),
									numbers=$('#numbers_mypage_post1');  
									
								console.log('row 개수 : ' + rowsCount);
								console.log('pageCount IFELSE0107 ='+ pageCount);
								console.log('rowsPerPage IFELSE0107 ='+ rowsPerPage);
								/* 페이지네이션 li 생성 반복문*/
								for(var i=1; i <= pageCount; i++){
									
									console.log('페이징 번호 : ' + i);
									numbers.append('<li><a href="">' + i + '</a></li>');
									
								}
								
							
								numbers.find('li:first-child a').addClass('active');
								
								//페이지네이션 함수 displayRows
								function displayRows(idx){
									var start =(idx -1)*rowsPerPage;//시작인덱스
										end = start + rowsPerPage; //끝인덱스
									
									rows.hide();
									rows.slice(start, end).show();
									
									}
								displayRows(1);//열자 마자는 숫자1
								
								//페이지네이션 클릭시 보여주기 
								
								
								numbers.find('li').click(function(e){
									e.preventDefault();
									numbers.find('li a').removeClass('active');
									$(this).find('a').addClass('active');
									var index = $(this).index()+1;
									console.log('index ='+ index ); 
									displayRows(index);
								});
							
								console.log('================================================')
							};
					 
    /*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
	//반려 동물 찾기 글 목록 페이지 네이션 
							function myfunction_Patpage (){
				    			
									var rowsPerPage = 5,										
										rows= $('#output_PatPost tr'),
										rowsCount=rows.length, 
										pageCount=Math.ceil(rowsCount/rowsPerPage),
										numbers=$('#numbers_mypage_post2');  
										
									console.log('row 개수 : ' + rowsCount);
									console.log('pageCount IFELSE0107 ='+ pageCount);
									console.log('rowsPerPage IFELSE0107 ='+ rowsPerPage);
									/* 페이지네이션 li 생성 반복문*/
									for(var i=1; i <= pageCount; i++){
										
										console.log('페이징 번호 : ' + i);
										numbers.append('<li><a href="">' + i + '</a></li>');
										
									}
									
									//<li class="page-item"><a class="page-link" href="#">2</a></li>
									
									//#numbers li:first-child a
									numbers.find('li:first-child a').addClass('active');
									
									//페이지네이션 함수 displayRows
									function displayRows(idx){
										var start =(idx -1)*rowsPerPage;//시작인덱스
											end = start + rowsPerPage; //끝인덱스
										
										rows.hide();
										rows.slice(start, end).show();
	
										}
									displayRows(1);//열자 마자는 숫자1
									

									numbers.find('li').click(function(e){
										e.preventDefault();
										numbers.find('li a').removeClass('active');
										$(this).find('a').addClass('active');
										var index = $(this).index()+1;
										console.log('index ='+ index ); 
										displayRows(index);
									});
								
									console.log('================================================')
								};
	/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
	//결제 목록 페이지 네이션 						   
		    				function myfunction2 (){
		    			

										var rowsPerPage = 3,											
											rows= $('#output_pay tr'), 
											rowsCount=rows.length, 
											pageCount=Math.ceil(rowsCount/rowsPerPage),
											numbers=$('#numbers_mypage_post2');  
											
										console.log('row 개수 : ' + rowsCount);
										console.log('pageCount IFELSE0107 ='+ pageCount);
										console.log('rowsPerPage IFELSE0107 ='+ rowsPerPage);
										/* 페이지네이션 li 생성*/
										for(var i=1; i <= pageCount; i++){
											
											console.log('페이징 번호 : ' + i);
											numbers.append('<li><a href="">' + i + '</a></li>');
											
										}
										numbers.find('li:first-child a').addClass('active');
										
										//페이지네이션 함수 displayRows
										function displayRows(idx){
											var start =(idx -1)*rowsPerPage;//시작인덱스
												end = start + rowsPerPage; //끝인덱스
											
											rows.hide();
											rows.slice(start, end).show();
											}
										displayRows(1);//열자 마자는 숫자1
										
										//페이지네이션 클릭시 보여주기 
										
										numbers.find('li').click(function(e){
											e.preventDefault();
											numbers.find('li a').removeClass('active');
											$(this).find('a').addClass('active');
											var index = $(this).index()+1;
											console.log('index ='+ index ); 
											displayRows(index);
										});
									
										console.log('================================================')
									};
							 
					  
    /*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
    /*테스트 페이징(DB값이 아닌 html로 만든 테이블의 페이징 아래 )*/
/*---------------------------------------------------------*/
//댓글단 파인더 ID를 출력하기 위해: LostPostNo값을 넘김. 
									function myfunction3 (){
										
										 $('.btnWhoGetStar').click(function(e){ 
												
												
											 var params=$(this).parent().parent().find('td')[0].textContent;
											 console.log(e)
												console.log('PplWhomToldYou:'+ params);		

									
												
													$.ajax({
														url:'/imfind/getElseWhoReplied.do',
														type:'POST',
														data:{"params":params},
														contentType:'application/x-www-form-urlencoded;charset=utf-8',
														dataType: 'json',
														
														
													success:function(data){
														$('#output_WhoReplied').empty(); 
															$.each(data, function(index, item){	
																console.log(item);
																var output_WhoReplied=' ' ;
																
																output_WhoReplied += '<input type="radio" name="finder" value="id">'+item.id+'</br>';
																
																console.log("output_WhoReplied:"+ output_WhoReplied);
																$('#output_WhoReplied').append(output_WhoReplied);
															});
														},
															error:function(){
																alert("ajax통신 실패4!!!");			
															},
													});
											});										 
																	
								  	};
					  
   /*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
   /*평점 */
								  	function starfunction(){
										
										var rating = $('.review .rating');
											
											var userScore = $('#makeStar');
											userScore.change(function(){
												 
												var userScoreNum = $(this).val();
												console.log('userScoreNum:'+userScoreNum);
										
												$('.make_star svg').css({color:'#000'});
												$('.make_star svg:nth-child(-n+'+ userScoreNum + ')').css({color:'#F05522'});
											}); 
												
											$('.make_star svg').click(function(){
												var targetNum = $(this).index()+1 ;
												console.log('targetNum:'+ targetNum);
												$('.make_star svg').css({color:'#000'});
												$('.make_star svg:nth-child(-n+'+ targetNum + ')').css({color:'#F05522'});
											});
										
										
										
									};

    //------------------------------------------------------------------------------------------------------------------------------
    
    
    
    /*-------------------------------------------------------------------------------------------------------------------------------------------------------*/
	   
>>>>>>> 1bc2d5d6e29ce0f76b38df57bebec67ff8eaa466
