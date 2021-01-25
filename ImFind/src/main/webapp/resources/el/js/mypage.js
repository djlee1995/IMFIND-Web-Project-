
  var params;
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
               output += '<td class="mypage-line">'+item.lost_PostNum +'</td>';//번호//id 부여하고 경고발생
               output += '<td class="mypage-line">'+item.lost_Title+'</td>';//제목            
               output += '<td class="mypage-line">'+item.lost_Pay+'</td>';//사례금
               output += '<td class="mypage-line">'+item.lost_Re_Date+'</td>';//등록날짜                
               output += '<td class="mypage-line"><button type="button" class="btn btn-outline-primary" a href="/imfind/#.do">수정</button></td>';                
               output += '<td class="mypage-line"><button type="button" class="btn btn-outline-primary" a href="/imfind/#.do">삭제</button></td>';                
               if(item.deal_State=='completed'){
                  output +='<td class="mypage-line">거래완료</td>';
               }         
               
               //202101131304_modaltest_below      
               //모달먼저 해결 NONO -> 여기부터 해결. 
               //아래 '거래완료'버튼을 임시로'파인더출력'으로 변경한다. 202101141956)
               //파인더 출력 버튼 
               /*if(평가완려)
                * <Td > 거래완료 </td>
                *else{}
                **/
               //
               //if ()
               output += '<td class="mypage-line"><button type="button" class="btnWhoGetStar" Zclass="btn btn-outline-primary" data-toggle="modal" data-target="#dialog">거래완료</button></td>'; 
               //output += '<td class="mypage-line"><button type="button" class="btn btn-outline-primary" a href="/imfind/#.do">거래완료</button></td>'; 
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
                myfunction3(); 
                grade_insert_btn ();
             
         },
   
         
      });   
      /* 작성글 DB불러오기 + 작성글 DB페이징 섹션 _END  */
      /*------------------------------------------------------------------------------------------------------------------*/
      //임시로 위치 변경 분실물 테이블 과 결제 테이블  셀렉트 사이에 버튼 (파인더 평가) 이벤트 가져옴. 202101151314_+ 202101151443
      /*------------------------------------------------------------------------------------------------------------------*/
      /* 댓글내역 DB불러오기 + 파인터 평가 대상 ID출력 섹션 START */ 
      /* 작성글 DB불러오기 + 작성글 DB페이징 섹션 _END  */
      /*------------------------------------------------------------------------------------------------------------------*/
      //반려동물 찾기 게시글 시작
      $('#output_PetPost').empty(); 
      
      $.ajax({
         url:'/imfind/getPetElsedata.do',
         type:'POST',
         contentType:'application/x-www-form-urlencoded;charset=utf-8',
         
         success:function(data){
            $.each(data, function(index, item){   
               console.log('i :' + index);
               var output_PetPost=' ' ;
               output_PetPost += '<tr>';            
               output_PetPost += '<td class="mypage-line">'+item.pet_PostNum +'</td>';//번호//id 부여하고 경고발생
               output_PetPost += '<td class="mypage-line">'+item.pet_Title+'</td>';//제목            
               output_PetPost += '<td class="mypage-line">'+item.pet_Pay+'</td>';//사례금
               output_PetPost += '<td class="mypage-line">'+item.pet_Re_Date+'</td>';//등록날짜          
               
               output_PetPost += '<td class="mypage-line"><button type="button" class="btn btn-outline-primary"><a href="/imfind/#.do">수정</button></td>';                
               output_PetPost += '<td class="mypage-line"><button type="button" class="btn btn-outline-primary"><a href="/imfind/#.do">삭제</button></td>';                
               
               output_PetPost += '<td class="mypage-line"><button type="button" class="btnWhoGetStar" Zclass="btn btn-outline-primary" data-toggle="modal" data-target="#dialog">거래완료</button></td>'; 
            
               output_PetPost += '</tr>';
               console.log("output_PetPost:"+output_PetPost); 
               $('#output_PetPost').append(output_PetPost);

                        
            });
         },
         error:function(){
            alert("ajax통신 실패1pet!!");         
         },   
         
         
         complete : function(){ 
             myfunction_Petpage();  
              myfunction3(); 
             //starfunction();
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
    	      var output_pay=' ' ;
    		  output_pay += '<tr>';            
    		  output_pay += '<td class="mypage-line">'+'&nbsp;'+'&nbsp;'+ moment(item.pay_Date).format('YY-MM-DD')+'&nbsp;'+'</td>';//결제일자
    		  output_pay += '<td class="mypage-line">'+item.pay_Amount+'</td>';//결제금액(사례금액)    
    		  output_pay += '<td class="mypage-line"><input type="hidden" class="payCode" value="'+item.payCode+'"></td>';//결제코드 
    		  //output_pay += '<td class="mypage-line">'+item.pay_Way+'</td>';//결제방법
    		  output_pay += '<td class="mypage-line">카카오페이</td>';//결제방법
    		  output_pay += '<td class="mypage-line"><input type="hidden" class="payState" value="'+item.pay_State+'</td>';//결제상태        
    		  
    		  if (item.pay_State == 'paid') {
    			  output_pay += '<td class="mypage-line">결제완료</td>';
    			  output_pay += '<td class="mypage-line"><button type="button" class="btn btn-outline-primary" id="refundBtn" >환불요청</button></td>';    
    		  } 
    		  if (item.pay_State == 'refund') {
    			  output_pay += '<td class="mypage-line">환불접수</td>';
    			  output_pay += '<td class="mypage-line"><button type="button" class="btn btn-outline-primary" id="refundBtn2" >환불접수중</button></td>'; 
    		  } 
    		  if (item.pay_State == 'cancel') {
    			  output_pay += '<td class="mypage-line">환불완료</td>';
    			  output_pay += '<td class="mypage-line"><button type="button" class="btn btn-outline-primary" id="refundBtn3" >환불완료</button></td>'; 
    		  }
    		  
    			  output_pay += '</tr>';
    		  $('#output_pay').append(output_pay);
    	  });
    	},
    	error:function(){
          alert("ajax통신 실패2!!!");         
        },
        complete : function(){ 
       // myfunction2();  
        
        }
     });
     /* 결제내역 DB불러오기 + 결제내역 DB페이징 섹션 END */

    // 환불 신청
      document.addEventListener('click', function(event){
    	  console.log(event.target)
    	  
    	  if(event.target.id == 'refundBtn'){
    		 alert("환불신청 후 취소가 불가합니다.");
    		 
    		 var paycode = event.target.parentElement.parentElement.childNodes[2].firstChild.value;
    		 
    		 console.log(paycode)

    		 var params =  {'Id' : user, 'PayCode' : paycode};
    		 
    		 $.ajax({
    			url :"el/refund",
    			data :JSON.stringify(params),
    			type : 'POST',
    			contentType : 'application/json',
    			success : function(data){
    				console.log(data[0])
    				if(data == 1) 
    				alert("환불신청완료");
    				
    				$('#output_pay').empty(); 
    				  $.ajax({
    				    url:'/imfind/getElsePaydata.do',
    				    type:'POST',
    				    contentType:'application/x-www-form-urlencoded;charset=utf-8',
    				    success:function(data){
    				    	$.each(data, function(index, item){   
    					      var output_pay=' ' ;
    						  output_pay += '<tr>';            
    						  output_pay += '<td class="mypage-line">'+'&nbsp;'+'&nbsp;'+ moment(item.pay_Date).format('YY-MM-DD')+'&nbsp;'+'</td>';//결제일자
    						  output_pay += '<td class="mypage-line">'+item.pay_Amount+'</td>';//결제금액(사례금액)    
    						  output_pay += '<td class="mypage-line"><input type="hidden" id="payCode" value="'+item.payCode+'"></td>';//결제금액(사례금액) 
    						 // output_pay += '<td class="mypage-line">'+item.pay_Way+'</td>';//결제방법
    						  output_pay += '<td class="mypage-line">카카오페이</td>';//결제방법
    						  output_pay += '<td class="mypage-line"><input type="hidden" class="payState" value="'+item.pay_State+'</td>';//결제상태              
    						  //output_pay += '<td class="mypage-line"><button type="button" class="btn btn-outline-primary" id="refundBtn2" >환불접수중</button></td>';    
    						  if (item.pay_State == 'paid') {
    							  output_pay += '<td class="mypage-line">결제완료</td>';
    							  output_pay += '<td class="mypage-line"><button type="button" class="btn btn-outline-primary" id="refundBtn" >환불요청</button></td>';    
    						  } 
    						  if (item.pay_State == 'refund') {
    							  output_pay += '<td class="mypage-line">환불접수</td>';
    							  output_pay += '<td class="mypage-line"><button type="button" class="btn btn-outline-primary" id="refundBtn2" >환불접수중</button></td>'; 
    						  } 
    						  if (item.pay_State == 'cancel') {
    							  output_pay += '<td class="mypage-line">환불완료</td>';
    							  output_pay += '<td class="mypage-line"><button type="button" class="btn btn-outline-primary" id="refundBtn3" >환불완료</button></td>'; 
    						  }
    						  output_pay += '</tr>';
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
    			},
    			error : function(data){
    				alert("실패!");
    			}
    			 
    		 });

    	  }
      })
      
    });  

    document.addEventListener('click', function(event){
    	  console.log(event.target)
    	  if(event.target.id == 'refundBtn2'){
    		 alert("접수중입니다");
    	  }
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
                     function myfunction_Petpage (){
                         
                           var rowsPerPage = 5,                              
                              rows= $('#output_PetPost tr'),
                              rowsCount=rows.length, 
                              pageCount=Math.ceil(rowsCount/rowsPerPage),
                              numbers=$('#mypage_post_pet');  
                              
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
                /*---------------------------------------------------------*/
            //댓글단 파인더 ID를 출력하기 위해: LostPostNo값을 넘김.    
                var lostPostNum;     
                function myfunction3 (){
                                                       
                    $('.btnWhoGetStar').click(function(e){ //202101172043   
                         params=$(this).parent().parent().find('td')[0].textContent;
                         lostPostNum = params;
                         //barams=$(this).parent().parent().find('td')[0].textContent;
                         console.log(e)
                       console.log('PplWhomToldYou:'+ params);      
                                                                 
                         $.ajax({
                          url:'/imfind/getElseWhoReplied.do',//여기에 sql을 join으로 lostpost_table이랑 lost_com?을 써서 부르자. 
                          type:'POST',
                          data:{"params":params},//서버로 선택된 행의 lostpostNo를 넘기겠.
                          contentType:'application/x-www-form-urlencoded;charset=utf-8',
                          dataType: 'json',
                                                                
                          success:function(data){
                          $('#output_WhoReplied').empty(); 
                          $.each(data, function(index, item){   
                          console.log(item);
                          var output_WhoReplied=' ' ;
                       //라디오 박스_파인더들을 붙이기. new
                       output_WhoReplied += '<input type="radio" name="finder" value="'+ item.id +'">'+item.id+'</br>';//댓글을 단 파인더   
                          //상기 반복문 라디오 박스 출력 형식 바꾸면 출력 안됨202101211200)=> 바꾸었던 괄호 안에 +item.id+가 들거간 버전은 콘솔에만 값을 가져 온것이고
                       //상기와 같이 (최종: 202110211652) 나오는 것은출력 도 되고 값도 가져 오는것. 
                       console.log("output_WhoReplied:"+ output_WhoReplied);
                          $('#output_WhoReplied').append(output_WhoReplied);
                          });
                          },
                         error:function(){
                        alert("ajax통신 실패4!!!");         
                          },
                                                                      
                       //   complete : function(){ //라디오 박스에 붙으면 이때 이구역을 이용해서 점수를 넘기게 될까? 다른 구역을 통해서 넘기게 될까? 
                        // myfunction4();  //위에 each가 반복문으로 계속 돌아 가니까 한번 돌때 마다. 카운팅하기때문이 주의!!!  그래서 밖으로 나옴. 페이지네이셔 호출! 
                      // grade_insert_btn();//시점을 이걸로 해주면 될까 싶어서. (202101211526)_응 안되.되나/???
                        //   },
                          //<input type="radio" name="lecture" value="html"> HTML <br>
                         });
                        });
                                                        
                         //..                        
                        };
                                          
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
 /*테스트 페이징(DB값이 아닌 html로 만든 테이블의 페이징 아래 )*/
                                                    
                               
//펑션들------------------------------------------                          
                                                      
//평점 평가 스타레이팅 ----------------------------------------------------------------------------------------------
             var targetNum;
              /*클래스명 rating마다 할일을 변수로 !!!*/
                     $(function(){
                     //var rating = $('.rating'); //상/하 별점 표시하기 및 별점 주기 모두 적용됨.
                     var rating = $('.review .rating'); //별점표시하기 영역으로만 한정 (부모 .리뷰 안의 .레이팅으로 한정 했기 때문.)
                     //각 각 할 일이니까 each 로~!       
                     //함수이름 없어도 되나? soo 익명함수 기명함수 공부?         
                    //(2 )id로 제한 하기 (별점주기)         
                     var userScore = $('#makeStar');
                     userScore.change(function(){
                    //var userScoreNum = $(this).value(); //js
                     var userScoreNum = $(this).val();
                     console.log('userScoreNum:'+userScoreNum);
                     //userScore.find('.rating').find('svg:nth-child(-n+'+ userScoreNum + ')').css({color:'#F05522'});
                      $('.make_star svg').css({color:'#000'});//찍고 나서 블랙으로 다시 초기화 그래야 작은 단위로 내려올수 있어
                      $('.make_star svg:nth-child(-n+'+ userScoreNum + ')').css({color:'#F05522'});
                      }); 
                                     
                      $('.make_star svg').click(function(){
                       targetNum = $(this).index()+1 ;
                       console.log('targetNum:'+ targetNum);
                       $('.make_star svg').css({color:'#000'});//찍고 나서 블랙으로 다시 초기화 그래야 작은 단위로 내려올수 있어
                       $('.make_star svg:nth-child(-n+'+ targetNum + ')').css({color:'#F05522'});
                         });      
                       }); 
  //------------------------------------------------------------------------------------------------------------------------------
  //-------------------------------------------------------:function grade_insert_btn ()-> 하나의 펑션에 내용 모두 밀어 넣기 (별점이랑 id)
       //모달_파인더 평가 요청 커멘드 버튼 
        function grade_insert_btn (){         
           $('#input_grade').click(function(){ 
                                     
             
              params=$('#output_WhoReplied input[name="finder"]:checked').val();
              console.log('checkboxValue;)===>'+params);
              
              var str = "";
              str += params + "님을 선택하셨습니다." ;
              $('#finder_name').append(str);//시점을 바꿔야 
              console.log('user:'+ user);
              
              alert(params, targetNum, user);         
            
                                                   
              // 서버로 전송
              $.ajax({
                  url:'/imfind/insertGrade.do',
                  type:'POST',
                  // {"A100" : "A100"}
                  data:{"F_ID":params,"grade":targetNum,"Id":user, "Lost_PostNum":lostPostNum},
                  contentType:'application/x-www-form-urlencoded;charset=utf-8',
                  datatype:'json',
                  success:function(retVal){
                     if(retVal.res=="OK"){
                      //selectData();
                      //초기화 
                        
                      //$('#dialog').modal("hide"); //모달 닫기 이벤트  dialog --> 닫아 지는데 ... 
                      $('.modal fade in show').modal("hide");//모달을 꺼도 리프레쉬 해줘야 하니까. 리로드 하는 걸로 바꾸기. 
                      $('#output_WhoReplied').val('');
                      $('#finder_name').val('');  
                      
                      // 버튼 태그 가져와서 //
                      // button 파인더 평가하기
                      // 태그를 변경한다. 자바스크립트로
                      // button 지워버리고 <td>평가완료</td>로 변경 
                     }
                     else
                       {
                      alert("파인더평가가 완료 되지 않았습니다.insertFail");
                       }
                    },
                  error:function(){
                alert("ajax통신 실패!!!");                
             }
              });
              //기본이벤트 제거 
              event.preventDefault();
              });
           
        };              
    
    
    /*-------------------------------------------------------------------------------------------------------------------------------------------------------*/
      