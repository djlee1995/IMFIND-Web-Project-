$(document).ready(function(){
   getItemList();
});

//분실글 목록
function getItemList(){
  $('#output').empty(); 
     
   var form = '<tr><td>글번호</td><td>제목</td><td>사례금</td><td>등록날짜</td><td>수정</td><td>삭제</td><td>거래완료</td></tr>';
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
             output += '<td class="mypage-line"><a href="iteminfo?lost_PostNum='+item.lost_PostNum+'">'+item.lost_Title+'</a></td>';//제목            
             output += '<td class="mypage-line">'+item.lost_Pay+'</td>';//사례금
             output += '<input type="hidden" value="'+ item.paycode + '">' // 결제코드
             output += '<td class="mypage-line">'+item.lost_Re_Date+'</td>';//등록날짜                       
             output += '<td class="mypage-line"><button id="updateBtn" type="button" class="btn btn-default btn-block" onclick="update('+item.lost_PostNum+');">수정</button></td>';                
             output += '<td class="mypage-line"><button id="deleteBtn" type="button"class="btn btn-default btn-block" onclick="del('+item.lost_PostNum+');">삭제</button></td>';   
             
             if(item.deal_State=='completed'){
                output +='<td class="mypage-line">거래완료</td>';
             }       
             output += '<td class="mypage-line"><button type="button" class="btnWhoGetStar" Zclass="btn btn-default btn-block"  data-toggle="modal" data-target="#dialog">거래완료</button></td>'; 
             output += '</tr>';
     
             $('#output').append(output);
             
         });
      },
       error:function(){
          alert("ajax통신 실패1!!!");         
      },
    });  
}  

//수정버튼 클릭
function update(lost_PostNum) {
	 $(location).attr("href", "updatepage?lost_PostNum="+lost_PostNum+"");
}
//삭제버튼 클릭
function del(lost_PostNum) {
	 $(location).attr("href", "deletepage?lost_PostNum="+lost_PostNum+"");
}
//분실동물 목록
function getPetList(){
    $('#output').empty(); 
    
    var form = '<tr><td>글번호</td><td>제목</td><td>사례금</td><td>등록날짜</td><td>수정</td><td>삭제</td><td>거래완료</td></tr>';
     $('#output').append(form);
    
    $.ajax({
      url:'/imfind/getPetElsedata.do',
      type:'POST',
      contentType:'application/x-www-form-urlencoded;charset=utf-8',
      success:function(data){
        $.each(data, function(index, item){   
          
         var output=' ' ;
            output += '<tr>';            
            output += '<td class="mypage-line">'+item.pet_PostNum +'</td>';//번호//id 부여하고 경고발생
            output += '<td class="mypage-line"><a href="iteminfo?lost_PostNum='+item.pet_PostNum+'">'+item.pet_Title+'</a></td>';//제목            
            output += '<td class="mypage-line">'+item.pet_Pay+'</td>';//사례금
            output += '<td class="mypage-line">'+item.pet_Re_Date+'</td>';//등록날짜          
            output += '<td class="mypage-line"><button type="button" class="btn btn-default btn-block" onclick="update_pet('+item.pet_PostNum+')">수정</button></td>';                
            output += '<td class="mypage-line"><button type="button" class="btn btn-default btn-block" onclick="del_pet('+item.pet_PostNum+')">삭제</button></td>';                
            output += '<td class="mypage-line"><button type="button" class="btnWhoGetStar" Zclass="btn btn-default btn-block"  data-toggle="modal" data-target="#dialog">거래완료</button></td>'; 
            output += '</tr>';
        
            $('#output').append(output);
        });
      },
       error:function(){
          alert("ajax통신 실패1pet!!");         
       },   
   });  
}
//수정버튼 클릭(pet)
function update_pet(pet_PostNum) {
	 $(location).attr("href", "petupdatepage?Pet_PostNum="+pet_PostNum+"");
}
//삭제버튼 클릭(pet)
function del_pet(pet_PostNum) {
	 $(location).attr("href", "petdeletepage?Pet_PostNum="+pet_PostNum+"");
}
//결제내역 목록
function getPayList(){
   $('#output').empty(); 
   
   var form = '<tr><td>결제일자</td><td>결제금액</td><td>결제방법</td><td>결제상태</td><td>환불요청</td></tr>';
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
              output += '<td class="mypage-line">'+item.pay_Amount+'</td>';//결제금액(사례금액)    
             '<td class="mypage-line"><input type="hidden" class="payCode" value="'+ item.payCode +'"></td>';//결제코드 
             output += '<td class="mypage-line">카카오페이</td>';//결제방법
             output += '<td class="mypage-line"><input type="hidden" class="payState" value="'+item.pay_State+'</td>';//결제상태        
             
             if (item.pay_State == 'paid') {
                output += '<td class="mypage-line">결제완료</td>';
                output += '<td class="mypage-line"><button type="button" class="btn btn-default btn-block" id="refundBtn" >환불요청</button></td>';    
             } 
             if (item.pay_State == 'refund') {
                output += '<td class="mypage-line">환불접수</td>';
                output += '<td class="mypage-line"><button type="button" class="btn btn-default btn-block" id="refundBtn2" >환불접수중</button></td>'; 
             } 
             if (item.pay_State == 'cancel') {
                output += '<td class="mypage-line">환불완료</td>';
                output += '<td class="mypage-line"><button type="button" class="btn btn-default btn-block" id="refundBtn3" >환불완료</button></td>'; 
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

//환불 신청
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
               output += '<td class="mypage-line">'+item.pay_Amount+'</td>';//결제금액(사례금액)    
               output += '<td class="mypage-line"><input type="hidden" id="payCode" value="'+item.payCode+'"></td>';//결제금액(사례금액) 
              output += '<td class="mypage-line">카카오페이</td>';//결제방법
              output += '<td class="mypage-line"><input type="hidden" class="payState" value="'+item.pay_State+'</td>';//결제상태              
              if (item.pay_State == 'paid') {
                 output += '<td class="mypage-line">결제완료</td>';
                 output += '<td class="mypage-line"><button type="button" class="btn btn-default btn-block" id="refundBtn" >환불요청</button></td>';    
              } 
              if (item.pay_State == 'refund') {
                 output += '<td class="mypage-line">환불접수</td>';
                 output += '<td class="mypage-line"><button type="button" class="btn btn-default btn-block" id="refundBtn2" >환불접수중</button></td>'; 
              } 
              if (item.pay_State == 'cancel') {
                 output += '<td class="mypage-line">환불완료</td>';
                 output += '<td class="mypage-line"><button type="button" class="btn btn-default btn-block" id="refundBtn3" >환불완료</button></td>'; 
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
               output_WhoReplied += '<input type="radio" name="finder" value="'+ item.id +'">'+item.id+'</br>';//댓글을 단 파인더   
            });
            $('#output_WhoReplied').append(output_WhoReplied);
         },
         error:function(){
            alert("ajax통신 실패4!!!");         
         },
         // grade_insert_btn();//시점을 이걸로 해주면 될까 싶어서. (202101211526)_응 안되.되나/???
      });                     
   };
       
// 파인더 평가, 거래완료
document.addEventListener('click', function(e){

   if(e.target.className == 'btnWhoGetStar'){
       lostPostNum = e.target.parentElement.parentElement.childNodes[0].innerText;
       myfunction3(lostPostNum);
   }
   if(e.target.id == 'input_grade'){
      alert(1111)
      grade_insert_btn();
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
     
     alert('params ' + params);   
     alert('targetNum ' + targetNum)
     alert('user ' + user);
   
     data = {"F_ID" : params, "grade" : targetNum, "Id" : user, "Lost_PostNum" : lostPostNum};                         
     // 서버로 전송
     $.ajax({
         url:'/imfind/insertGrade.do',
         type:'POST',
         data: JSON.stringify(data),
         contentType : 'application/json',
         datatype:'json',
         success:function(retVal){
            if(retVal.res=="OK"){
    
              $('.modal fade in show').modal("hide");
             $('#output_WhoReplied').val('');
             $('#finder_name').val('');  
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