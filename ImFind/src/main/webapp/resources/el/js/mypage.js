// 연수 1.28
var params;
 var show_Grade_Star;
 var showScore;

$(document).ready(function(){
   getItemList();
   $.ajax({
       url:'/imfind/getStarGrade.do',
       type:'POST',
       contentType:'application/x-www-form-urlencoded;charset=utf-8',
       data: {'F_Id' : user},
       success:function(data){
      	 show_Grade_Star = data;
       },
		error:function(){
			alert("매너 평가 점수를 출력하지 못했습니다.");			
	   },
       complete : function(){ 
        	starfunction ();
       },
   });		
});

//데이터 불러오기 END -----------------------------------------------연수 1.28-----------------------------------------------
//매너평가등급:출력 (별점) 
	  function starfunction (){    
		var rating=$('.grade .showGrade');
		rating.each(function(){
		showScore = show_Grade_Star ;
		$(this).find('svg:nth-child(-n+'+showScore+')').css({color:'#F05522'});  		
	});  	
};

//분실글 목록
function getItemList(){
   $('#output').empty(); 
   $('#mypgform').empty();
   $('#input-grade').attr('id', 'input-grade');
   
   var title= '<h4 style="font-weight: 300; padding-left: 9px;">분실물품 게시판 > 분실물 작성글 </h4>'
   var form = '<tr style="text-align: center;"><td>글번호</td><td>제목</td><td>사례금</td><td>등록날짜</td><td>수정</td><td>삭제</td><td>거래완료</td></tr>';
   $('#mypgform').append(title);
   $('#output').append(form);
    
   $.ajax({
      url:'/imfind/getElsedata.do',
      type:'POST',
      contentType:'application/x-www-form-urlencoded;charset=utf-8',
      success:function(data){
        $.each(data, function(index, item){   
         console.log(item)
         var output=' ' ;         
             output += '<tr>';            
             output += '<td class="mypage-line">'+item.lost_PostNum +'</td>';//번호//id 부여하고 경고발생
             output += '<td class="mypage-line"><a href="./iteminfo?lost_PostNum='+item.lost_PostNum+'&getId='+item.id+'">'+item.lost_Title+'</a></td>';//제목            
             output += '<td class="mypage-line">'+item.lost_Pay+'</td>';//사례금
             output += '<input type="hidden" value="'+ item.paycode + '">' // 결제코드
             output += '<td class="mypage-line">'+ moment(item.lost_Re_Date).format('YY-MM-DD')+'</td>';//등록날짜                       
             output += '<td class="mypage-line"><button id="updateBtn" type="button" class="btn btn-block bg-gradient-secondary">수정</button></td>';                
             output += '<td class="mypage-line"><button id="deleteBtn" type="button"class="btn btn-block bg-gradient-danger">삭제</button></td>';   
             
             if(item.deal_State=='completed'){
                output +='<td class="mypage-line">거래확정</td>';
             }  
             else{
            	 output += '<td class="mypage-line"><button type="button" class="btnWhoGetStar" Zclass="btn btn-block bg-gradient-danger"  data-toggle="modal" data-target="#dialog">거래완료</button></td>'; 
             }
             output += '</tr>';
     
             $('#output').append(output);
             
             $('#updateBtn').click(function(){
                $(location).attr("href", "updatepage?lost_PostNum="+item.lost_PostNum+"");              
             });
              $('#deleteBtn').click(function(){
                $(location).attr("href", "deletepage?lost_PostNum="+item.lost_PostNum+"");
              });
         });
      },
       error:function(){
          alert("ajax통신 실패1!!!");         
      },
    });  
}  

//분실동물 목록
function getPetList(){
    $('#output').empty(); 
    $('#mypgform').empty();
    $('#input-grade').attr('id', 'input-grade-pet')
    
    var title= '<h4 style="font-weight: 300; padding-left: 9px;">분실동물 게시판 > 분실동물 작성글 </h4>'
    var form = '<tr style="text-align: center;"><td>글번호</td><td>제목</td><td>사례금</td><td>등록날짜</td><td>수정</td><td>삭제</td><td>거래완료</td></tr>';
    $('#mypgform').append(title); 
    $('#output').append(form);
    
    $.ajax({
      url:'/imfind/getPetElsedata.do',
      type:'POST',
      contentType:'application/x-www-form-urlencoded;charset=utf-8',
      success:function(data){
        $.each(data, function(index, item){   
          console.log(item)
         var output=' ' ;
            output += '<tr>';            
            output += '<td class="mypage-line">'+item.pet_PostNum +'</td>';//번호//id 부여하고 경고발생
            output += '<td class="mypage-line"><a href="./petinfo?Pet_PostNum='+item.pet_PostNum+'&getId='+item.id+'">'+item.pet_Title+'</a></td>';//제목            
            output += '<td class="mypage-line">'+item.pet_Pay+'</td>';//사례금
            output += '<td class="mypage-line">'+ moment(item.pet_LostDate).format('YY-MM-DD')+'</td>';//등록날짜          
            output += '<td class="mypage-line"><button type="button" id="updateBtn" class="btn btn-block bg-gradient-secondary">수정</button></td>';                
            output += '<td class="mypage-line"><button type="button" id="deleteBtn" class="btn btn-block bg-gradient-danger">삭제</button></td>';    
            
            if(item.deal_State=='completed'){
                output +='<td class="mypage-line">거래확정</td>';
             }  
             else{
            	 output += '<td class="mypage-line"><button type="button" class="btnWhoGetStar-pet btn btn-default btn-block"  data-toggle="modal" data-target="#dialog">거래완료</button></td>'; 
             }
             output += '</tr>';
        
            $('#output').append(output);
            $('#updateBtn').click(function(){
                $(location).attr("href", "petupdatepage?Pet_PostNum="+item.pet_PostNum+"");              
             });
              $('#deleteBtn').click(function(){
                $(location).attr("href", "petdeletepage?Pet_PostNum="+item.pet_PostNum+"");
              });
        });
      },
       error:function(){
          alert("ajax통신 실패1pet!!");         
       },   
   });  
}
//내가 쓴 댓글 목록 - 은지 1.28
function getCommentList(){
    $('#output').empty(); 
    $('#mypgform').empty();
    
    var title= '<h4 style="font-weight: 300; padding-left: 9px;">분실물 게시판 > 분실물 댓글 </h4>'
    var form = '<tr style="text-align: center;"><td>글번호</td><td>댓글내용</td><td>등록날짜</td><td>수정</td><td>삭제</td></tr>';
    
    $('#mypgform').append(title);
    $('#output').append(form);
    
    $.ajax({
      url:'/imfind/getCommentList',
      type:'POST',
      data: {'id' : user},
      contentType:'application/x-www-form-urlencoded;charset=utf-8',
      success:function(data){
        $.each(data, function(index, item){   
         var output=' ' ;
            output += '<tr>';            
            output += '<td class="mypage-line">'+item.lost_PostNum +'</td>';//글번호
            output += '<td class="mypage-line"><a href="./iteminfo?lost_PostNum='+item.lost_PostNum+'&getId='+item.id+'">'+item.re_content+'</a></td>';//댓글내용        
            output += '<td class="mypage-line">'+ moment(item.com_Date).format('YY-MM-DD')+'</td>';//등록날짜
            //output += '<td class="mypage-line">'+item.pet_Re_Date+'</td>';//등록날짜          
            output += '<td class="mypage-line"><button type="button" id="updateBtn" class="btn btn-block bg-gradient-secondary">수정</button></td>';                
            output += '<td class="mypage-line"><button type="button" id="deleteBtn" class="btn btn-block bg-gradient-danger">삭제</button></td>';                
//            output += '<td class="mypage-line"><button type="button" class="btnWhoGetStar" Zclass="btn btn-default btn-block"  data-toggle="modal" data-target="#dialog">거래완료</button></td>'; 
            output += '</tr>';
        
            $('#output').append(output);
            $('#updateBtn').click(function(){
                $(location).attr("href", "iteminfo?lost_PostNum="+item.lost_PostNum+"&getId="+item.id+"");              
             });
              $('#deleteBtn').click(function(){
                $(location).attr("href", "iteminfo?lost_PostNum="+item.lost_PostNum+"&getId="+item.id+"");
              });
        });
      },
       error:function(){
          alert("ajax통신 실패1pet!!");         
       },   
   });  
}
//결제내역 목록
function getPayList(){
   $('#output').empty(); 
   $('#mypgform').empty();
   
   var title= '<h4 style="font-weight: 300; padding-left: 9px;">개인정보 > 결제내역 </h4>'
   var form = '<tr style="text-align: center;"><td>결제일자</td><td>결제금액</td><td>결제방법</td><td>결제상태</td><td>환불요청</td></tr>';
   $('#mypgform').append(title); 
   $('#output').append(form);
     
    $.ajax({
      url:'/imfind/getElsePaydata.do',
      type:'POST',
      contentType:'application/x-www-form-urlencoded;charset=utf-8',
      success:function(data){
         $.each(data, function(index, item){   
           var output=' ' ;
              output += '<tr>';            
              output += '<td class="mypage-line">'+'&nbsp;'+'&nbsp;'+ moment(item.pay_Date).format('YY-MM-DD')+'&nbsp;'+'</td>';//결제일자
              output += '<td class="mypage-line">'+item.pay_Amount  //결제금액(사례금액)    
              			+ '<input type="hidden" class="payCode" value="'+ item.payCode +'">' + '</td>';//결제코드 
             output += '<td class="mypage-line">카카오페이</td>';//결제방법
             output += '<td class="mypage-line"><input type="hidden" class="payState" value="'+item.pay_State+'</td>';//결제상태        
             
             if (item.pay_State == 'paid') {
                output += '<td class="mypage-line">결제완료</td>';
                output += '<td class="mypage-line"><button type="button" class="btn btn-block bg-gradient-danger" id="refundBtn" >환불요청</button></td>';    
             } 
             if (item.pay_State == 'refund') {
                output += '<td class="mypage-line">환불접수</td>';
                output += '<td class="mypage-line"><button type="button" class="btn btn-block bg-gradient-danger" id="refundBtn2" >환불접수중</button></td>'; 
             } 
             if (item.pay_State == 'cancel') {
                output += '<td class="mypage-line">환불완료</td>';
                output += '<td class="mypage-line"><button type="button" class="btn btn-block bg-gradient-danger" id="refundBtn3" >환불완료</button></td>'; 
             }
             output += '</tr>';
             $('#output').append(output);
       });
     },
     error:function(){
        alert("ajax통신 실패2!!!");         
    }
 });
}    
//내가 쓴 댓글 목록(동물) - 1.28 은지
function getPetCommentList(){
    $('#output').empty(); 
    $('#mypgform').empty();
    
    var title= '<h4 style="font-weight: 300; padding-left: 9px;">분실동물 게시판 > 분실동물 댓글 </h4>'
    var form = '<tr style="text-align: center;"><td>글번호</td><td>댓글내용</td><td>등록날짜</td><td>수정</td><td>삭제</td></tr>';
    
    $('#mypgform').append(title);
    $('#output').append(form);
    
    $.ajax({
      url:'/imfind/getPetCommentList',
      type:'POST',
      data: {'id' : user},
      contentType:'application/x-www-form-urlencoded;charset=utf-8',
      success:function(data){
        $.each(data, function(index, item){   
        	console.log(item)
        
         var output=' ' ;
            output += '<tr>';            
            output += '<td class="mypage-line">'+item.lost_PostNum +'</td>';//글번호
            output += '<td class="mypage-line"><a href="./petinfo?Pet_PostNum='+item.lost_PostNum+'&getId='+item.id+'">'+item.re_content+'</td>';//댓글내용        
            output += '<td class="mypage-line">'+ moment(item.com_Date).format('YY-MM-DD')+'</td>';//등록날짜  
            output += '<td class="mypage-line"><button type="button" id="updateBtn" class="btn btn-block bg-gradient-secondary">수정</button></td>';                
            output += '<td class="mypage-line"><button type="button" id="deleteBtn" class="btn btn-block bg-gradient-danger">삭제</button></td>';                
//            output += '<td class="mypage-line"><button type="button" class="btnWhoGetStar" Zclass="btn btn-default btn-block"  data-toggle="modal" data-target="#dialog">거래완료</button></td>'; 
            output += '</tr>';
        
            $('#output').append(output);
            $('#updateBtn').click(function(){
                $(location).attr("href", "iteminfo?lost_PostNum="+item.lost_PostNum+"&getId="+item.id+"");              
             });
              $('#deleteBtn').click(function(){
                $(location).attr("href", "iteminfo?lost_PostNum="+item.lost_PostNum+"&getId="+item.id+"");
              });
        });
      },
       error:function(){
          alert("ajax통신 실패1pet!!");         
       },   
   });  
}
//환불 신청
document.addEventListener('click', function(event){
     console.log(event.target)
     
   if(event.target.id == 'refundBtn'){
      alert("환불신청 후 취소가 불가합니다.");
	   
      // 머지하면 여기 자꾸 옛날 코드로 돌아가네요 주의 부탁드려요
	   var paycode = event.target.parentElement.parentElement.childNodes[1].lastElementChild.value;
	   var params =  {'Id' : user, 'PayCode' : paycode};
	       
	   $.ajax({
	     url :"el/refund",
	     data :JSON.stringify(params),
	     type : 'POST',
	     contentType : 'application/json',
	     success : function(data){
	      if(data == 1) 
	    	  alert("환불신청완료");
	      $('#output').empty(); 
	      $.ajax({
	        url:'/imfind/getElsePaydata.do',
	         type:'POST',
	         contentType:'application/x-www-form-urlencoded;charset=utf-8',
	         success:function(data){
	           $.each(data, function(index, item){   
	           var output=' ' ;
	               output += '<tr>';            
	               output += '<td class="mypage-line">'+'&nbsp;'+'&nbsp;'+ moment(item.pay_Date).format('YY-MM-DD')+'&nbsp;'+'</td>';//결제일자
	               output += '<td class="mypage-line">'+item.pay_Amount+'</td>'//결제금액(사례금액)    
	               			+'<input type="hidden" id="payCode" value="'+item.payCode+'"></td>';//결제금액(사례금액) 
	               output += '<td class="mypage-line">카카오페이</td>';//결제방법
	               output += '<td class="mypage-line"><input type="hidden" class="payState" value="'+item.pay_State+'</td>';//결제상태              
	              if (item.pay_State == 'paid') {
	                 output += '<td class="mypage-line">결제완료</td>';
	                 output += '<td class="mypage-line"><button type="button" class="btn btn-block bg-gradient-danger" id="refundBtn" >환불요청</button></td>';    
	              } 
	              if (item.pay_State == 'refund') {
	                 output += '<td class="mypage-line">환불접수</td>';
	                 output += '<td class="mypage-line"><button type="button" class="btn btn-block bg-gradient-danger" id="refundBtn2" >환불접수중</button></td>'; 
	              } 
	              if (item.pay_State == 'cancel') {
	                 output += '<td class="mypage-line">환불완료</td>';
	                 output += '<td class="mypage-line"><button type="button" class="btn btn-block bg-gradient-danger" id="refundBtn3" >환불완료</button></td>'; 
	              }
	              output += '</tr>';
	              $('#output').append(output);
	          });
	       },
	       error:function(){
	         alert("ajax통신 실패2!!!");         
	       },
	     });
	     },
	     error : function(data){
	      alert("실패!");
	     }
	    });
   }
})

//환불신청후 버튼 이벤트
document.addEventListener('click', function(event){
   console.log(event.target)
   if(event.target.id == 'refundBtn2'){
     alert("접수중입니다");
   }
});

var params;
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
};
   //반려 동물 찾기 글 목록 페이지 네이션 
 function myfunction_Petpage (){
     
      var rowsPerPage = 5,                              
      rows= $('#output_PetPost tr'),
      rowsCount=rows.length, 
      pageCount=Math.ceil(rowsCount/rowsPerPage),
      numbers=$('#mypage_post_pet');  
          
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

          numbers.find('li').click(function(e){
          e.preventDefault();
          numbers.find('li a').removeClass('active');
          $(this).find('a').addClass('active');
          var index = $(this).index()+1;
          console.log('index ='+ index ); 
          displayRows(index);
       });
};
//결제 목록 페이지 네이션                      
function myfunction2 (){

   var rowsPerPage = 3,                                 
   rows= $('#output_pay tr'), 
   rowsCount=rows.length, 
   pageCount=Math.ceil(rowsCount/rowsPerPage),
   numbers=$('#numbers_mypage_post2');  

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
  
     numbers.find('li').click(function(e){
        e.preventDefault();
        
        numbers.find('li a').removeClass('active');
        $(this).find('a').addClass('active');
        var index = $(this).index()+1;
         displayRows(index);
     });
};
                      

// 대화한 파인더 목록 출력, 별점 평가         
   var lostPostNum;     
   function myfunction3 (lostPostNum){
      $.ajax({
         url:'/imfind/getElseWhoReplied.do',//여기에 sql을 join으로 lostpost_table이랑 lost_com?을 써서 부르자. 
         type:'POST',
         data:{"params" : lostPostNum},//서버로 선택된 행의 lostpostNo를 넘기겠.
         contentType:'application/x-www-form-urlencoded;charset=utf-8',
         dataType: 'json',
         success:function(data){

            $('#output_WhoReplied').empty(); 
            var output_WhoReplied= '';
            
            $.each(data, function(index, item){   
               output_WhoReplied += '<input type="radio" id="f-radio" name="finder" value="'+item.id +'">'+item.id+'</br>';//댓글을 단 파인더   
            });
            $('#output_WhoReplied').append(output_WhoReplied);
         },
         error:function(){
            alert("ajax통신 실패4!!!");         
         },
      });                     
   };
   function getElseWhoRepliedPet (lostPostNum){
      $.ajax({
         url:'/imfind/getElseWhoRepliedPet.do',//여기에 sql을 join으로 lostpost_table이랑 lost_com?을 써서 부르자. 
         type:'POST',
         data:{"params" : lostPostNum},//서버로 선택된 행의 lostpostNo를 넘기겠.
         contentType:'application/x-www-form-urlencoded;charset=utf-8',
         dataType: 'json',
         success:function(data){

            $('#output_WhoReplied').empty(); 
            var output_WhoReplied= '';
            
            $.each(data, function(index, item){   
               output_WhoReplied += '<input type="radio" id="f-radio" name="finder" value="'+ item.id +'">'+item.id+'</br>';//댓글을 단 파인더   
            });
            $('#output_WhoReplied').append(output_WhoReplied);
         },
         error:function(){
            alert("ajax통신 실패4!!!");         
         },
      });                     
   };
       
// 파인더 평가, 거래완료
document.addEventListener('click', function(e){

   if(e.target.className == 'btnWhoGetStar'){
       lostPostNum = e.target.parentElement.parentElement.childNodes[0].innerText;
       myfunction3(lostPostNum);
   }
   if(e.target.id == 'input-grade'){
      alert(1111)
      grade_insert_btn();
   }
   if(e.target.className == 'btnWhoGetStar-pet btn btn-default btn-block'){
	   lostPostNum = e.target.parentElement.parentElement.childNodes[0].innerText;
	   getElseWhoRepliedPet(lostPostNum);
   }
   if(e.target.id == 'input-grade-pet'){
	      alert(1111)
	      grade_insert_btnPet();
	   }
});


 var targetNum;
 $(function(){
     var rating = $('.review .rating'); //별점표시하기 영역으로만 한정 (부모 .리뷰 안의 .레이팅으로 한정 했기 때문.)
     var userScore = $('#makeStar');
     
     userScore.change(function(){
        var userScoreNum = $(this).val();
        console.log('userScoreNum:'+userScoreNum);
        
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

   //모달_파인더 평가 요청 커멘드 버튼 
function grade_insert_btn (){         
   
     params = $('#output_WhoReplied input[name="finder"]:checked').val();
     console.log('checkboxValue;)===>'+params);
     
     var str = "";
     str += params + "님을 선택하셨습니다." ;
     $('#finder_name').append(str);
     
//     alert('params ' + params);   
//     alert('targetNum ' + targetNum)
//     alert('user ' + user);
   
     data = {"F_Id" : params, "grade" : targetNum, "Id" : user, "Lost_PostNum" : lostPostNum};                         
     // 서버로 전송
     $.ajax({
         url:'/imfind/insertGrade.do',
         type:'POST',
         data: JSON.stringify(data),
         contentType : 'application/json',
         datatype:'json',
         success:function(retVal){
        	 console.log("retVal " + retVal.res)
            if(retVal.res=="OK"){
            	window.location.href='./mypage'
          }
            else{
               alert("파인더평가가 완료 되지 않았습니다.insertFail");
             }
         },
         error:function(){
            alert("ajax통신 실패!!!");                
         }
     });
     //기본이벤트 제거 
     event.preventDefault();
};              
//동물 모달_파인더 평가 요청 커멘드 버튼 
function grade_insert_btnPet (){         
     alert('동물 모달')
     params = $('#output_WhoReplied input[name="finder"]:checked').val();
     
//     alert('params ' + params);   
//     alert('targetNum ' + targetNum)
//     alert('user ' + user);
   
     data = {"F_Id" : params, "grade" : targetNum, "Id" : user, "Pet_PostNum" : lostPostNum};                         
     // 서버로 전송
     $.ajax({
         url:'/imfind/insertGradePet.do',
         type:'POST',
         data: JSON.stringify(data),
         contentType : 'application/json',
         datatype:'json',
         success:function(retVal){
        	 console.log("retVal " + retVal.res)
            if(retVal.res=="OK"){
            	window.location.href='./mypage'
          }
            else{
               alert("파인더평가가 완료 되지 않았습니다.insertFail");
             }
         },
         error:function(){
            alert("ajax통신 실패!!!");                
         }
     });
     //기본이벤트 제거 
     event.preventDefault();
};  

function getMoeny(){

	  $('#output').empty(); 
	  $('#mypgform').empty();
	  
	  var title= '<h4 style="font-weight: 300; padding-left: 9px;">개인정보 > 정산내역 </h4>'
	 
      $('#mypgform').append(title);	  
	    
	  $.ajax({
	         url:'/imfind/getMoneyList',
	         data: {"id" : user},
	         contentType : 'application/json',
	         datatype:'json',
	         success:function(data){

	        	  var output = '<tr style="text-align: center;">'
	        		  			+'<td>글번호</td>'
	        		  			+'<td>거래자</td>'
	        		  			+'<td>거래완료일</td>'
	        		  			+'<td>정산 금액</td>'
	        		  			+'<td>정산 계좌</td>'
	        		  			+'<td>은행</td>'
	        		  			+'<td>계좌주</td>'
	        		  			+'<td>정산 상태</td>'
	        		  			+'<td>정산날짜</td>'
        		  			+'</td>'
	        	  
	        	  $.each(data, function(index, item){   
	        		  console.log(item)
	        		  
	        		  var adjustment_state;
	        		  var adjustment_date;
	        		  
	        		  if(item.lost_PostNum == null){
	        			  postnum = item.pat_PostNum
	        			  href = './petinfo?Pet_PostNum='
	        		  }
	        		  else{
	        			  postnum = item.lost_PostNum
	        			  href = './iteminfo?lost_PostNum='
	        		  }
	        		  
	        		  if(item.adjustment_state == null){
	        			  adjustment_state = '정산 진행중';
	        			  adjustment_date = '-'
	        		  }else{
	        			  adjustment_state = item.adjustment_state
	        			  adjustment_date = moment(item.adjustment_date).format('YY-MM-DD HH:MM:SS')
	        		  }
	        		  
	        		  
	        		  
	                     output += '<tr>';            
	                     output += '<a href="'+ href+postnum +'"><td class="mypage-line">'+'&nbsp;'+'&nbsp;'+ postnum +'</td></a>';//글번호 
	                     output += '<td class="mypage-line">'+'&nbsp;'+'&nbsp;'+ item.id +'</td>';//글번호 
	                     output += '<td class="mypage-line">'+ item.Deal_Date +'</td>';// 정산날짜
	                     output += '<td class="mypage-line"><input type="hidden" id="payCode" value="'+ item.pay_Amount+'">' + item.pay_Amount +'</td>' //정산금액
	                     output += '<td class="mypage-line"><input type="hidden" class="payState" value="'+ item.account_Num + '">'+ item.account_Num +'</td>' //정산계좌         
	                     output += '<td class="mypage-line">'+ item.bank +'</td>';//은행
	                     output += '<td class="mypage-line">'+ item.account_holder +'</td>';//계좌주
	                     output += '<td class="mypage-line">'+ adjustment_state +'</td>';// 정산상태
	                     output += '<td class="mypage-line">'+ adjustment_date +'</td>';// 정산날짜

	                     output += '</tr>';
	                 });
	        	  $('#output').append(output);
	         },
	         error:function(){
	            alert("ajax통신 실패!!!");                
	         }
	     });
	     //기본이벤트 제거 
	     event.preventDefault();
}

function getLiketo() {
    $('#output').empty(); 
    $('#mypgform').empty();
    // $('#input-grade').attr('id', 'input-grade-pet')
     
   //  var title= '<h4 style="font-weight: 300; padding-left: 9px;">분실동물 게시판 > 분실동물 작성글 </h4>'
     var form = '<tr style="text-align: center;"><td>글번호</td><td>제목</td>';
    // $('#mypgform').append(title); 
     $('#output').append(form);
     
     $.ajax({
       url:'/imfind/getLiketo',
       type:'POST',
       contentType:'application/x-www-form-urlencoded;charset=utf-8',
       success:function(data){
         $.each(data, function(index, item){   
           console.log(item)
          var output='';
             output += '<tr>';            
             if(item.lost_PostNum==0){
                 output +='<td class="mypage-line">'+item.pet_PostNum+'</td>';
                 output +='<td class="mypage-line"><a href="./petinfo?Pet_PostNum='+item.pet_PostNum+'">'+item.pet_Title+'</a></td>';
                 
              }  
              else{
                 output +='<td class="mypage-line">'+item.lost_PostNum+'</td>';
                 output +='<td class="mypage-line"><a href="./iteminfo?lost_PostNum='+item.lost_PostNum+'">'+item.lost_Title+'</a></td>';   
                 }
              output += '</tr>';
         
             $('#output').append(output);
            
         });
       },
        error:function(){
           alert("ajax통신 실패1pet!!");         
        },   
    });  
}

function getAlarm(){
	    $('#output').empty(); 
	    $('#mypgform').empty();
	    
	    var title= '<h4 style="font-weight: 300; padding-left: 9px;">알람 > 내 글에 달린 댓글 </h4>'
	    $('#mypgform').append(title);
	
	     var form = '<tr style="text-align: center;"><td>글번호</td><td>알람</td>';
	     $('#output').append(form);
	     
	     $.ajax({
	       url:'/imfind/getAlarm',
	       type:'POST',
	       contentType:'application/x-www-form-urlencoded;charset=utf-8',
	       success:function(data){
	         $.each(data, function(index, item){   
	           console.log(item)
	          var output='';
	             output += '<tr>';            

                 output +='<td class="mypage-line">'+item.postNum+'</td>';
                 output +='<td class="mypage-line">' + item.alarm_content + '</td>';   

	             output += '</tr>';
	         
	             $('#output').append(output);
	            
	         });
	       },
	        error:function(){
	           alert("ajax통신 실패1pet!!");         
	        },   
	    });  
}
