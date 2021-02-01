$(document).ready(function(){
    commentList();
    replyList();
       
    $('.commentbox').keyup(function (){
       var content = $(this).val();
       $('#counter').html("("+content.length+" / 최대 200자)");    //글자수 실시간 카운팅

          if (content.length > 200){
             alert("최대 200자까지 입력 가능합니다.");
             $(this).val(content.substring(0, 200));
             $('#counter').html("(200 / 최대 200자)");
          }
       });
    });

$('[name=commentInsertBtn]').click(function(){//댓글 등록 버튼 클릭시
   console.log('진입')
      
   if($('#Secret_Com').is(":checked") == true){
      $('#Secret_Com').val('y');
      var insertData = $('[name=commentInsertForm]').serialize();
      alert('y');
         
      commentInsert(insertData);
      return true;
   } 

    if($('#Secret_Com').is(":checked") == false){
      $('#Secret_Com').val('n');
   
      var insertData = $('[name=commentInsertForm]').serialize();
      alert('n');
         
      commentInsert(insertData);
      return true;
   }
       alert('insert 진입 before');
   console.log("insertData" + insertData);   

    if($('#Secret_Com').is(":checked") == false){
      $('#Secret_Com').val('n');
   
      var insertData = $('[name=commentInsertForm]').serialize();
      //alert('n');
         
      commentInsert(insertData);
      return true;
   }


});
//댓글 등록
function commentInsert(insertData){
	alert('insert 진입');
	console.log(insertData);
	//console.log(secret_com)
	$.ajax({
		url : '/imfind/comment_insert',
		type : 'POST',
		data : insertData,
		success : function(data){
			if(data == 1){
				alert("댓글이 등록되었습니다");
				commentList(); //댓글 작성 후 댓글 목록 reload
				$('[name=Com_Content]').val('');
			} else{
				console.log('Insert Error');
			}
		},
		error:function(){
			alert("ajax통신 실패!(insert)");
		}
	});

}

//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경
function commentUpdateForm(com_Num, com_Content){
   var a ='';
   a += '<div class="content">';
   a += '<input type="text" name="content_'+com_Num+'" value="'+com_Content+'"/>';
   a += '<button type="button" onclick="commentUpdate('+com_Num+');">수정</button> ';
   a += '<button type="button" onclick="commentList();">취소</button>';
   a += '<button type="button" onclick="reply();">댓글</button>';
   a += '</div>';
   $('#commentContent'+com_Num).html(a);
}


//댓글 수정
function commentUpdate(com_Num){

	var updateContent = $('[name=content_'+com_Num+']').val();
	
	$.ajax({
		url : '/imfind/comment_update',
		//type : 'post',
		dataType : 'json',
		data : {'Com_Content' : updateContent, 'Com_Num' : com_Num}, // cno comment에 대한 글 번호
		contentType : 'application/x-www-form-urlencoded;charset=utf-8',
		success : function(data){
			if(data == 1) 
				commentList(); //댓글 수정후 목록 출력
		},
		error:function(){
			alert("ajax통신 실패(update)!!");
		}
	});

}

//댓글 삭제
function commentDelete(com_Num){
	$.ajax({
		url : '/imfind/comment_delete',
		//type : 'post',
		data : {'Com_Num': com_Num},
		dataType : 'json',
		contentType : 'application/x-www-form-urlencoded;charset=utf-8',
		success : function(data){
			if(data == 1)
				commentList(); //댓글 삭제후 목록 출력
		},
		error:function(){
			alert("ajax통신 실패(delete)");
		}
	});
}

//동준 대댓글
function reply(com_Num) {
   var text='';
      text+='<input type="text" name="re_content'+com_Num+'" value=""/>';
      text+='<button type="button" onclick="replyinsert('+com_Num+');">등록</button>';
      text+='<button type="button" onclick="">취소</button>';
   $('#reply'+com_Num+'').html(text);

}

function replyinsert(com_Num) {
   var insertdata='re_content='+$('[name=re_content'+com_Num+']').val()+'&com_num='+com_Num+''+'&lost_postnum='+lost_PostNum+'';
   console.log(lost_PostNum)
   $.ajax({
      url : '/imfind/reply_insert',
      type : 'POST',
      data : insertdata,
      success : function(data){
         if(data == 1){
            alert("댓글이 등록되었습니다");
            replyList(); //댓글 작성 후 댓글 목록 reload
            $('[name=re_content'+com_Num+']').val('');
         } else{
            console.log('Insert Error');
         }
      },
      error:function(){
         alert("ajax통신 실패!(insert)");
      }
   });
}
function replyList() {
   $.ajax({
      url : '/imfind/replylist',
      type : 'POST',
      success : function(data){
         console.log(id)
         $('.re_content').empty();
       $.each(data, function(key, value){
    	   console.log(value.id)
    	   if(value.id==id){
          var a='';
             a+='<div class="replyList" id="replyList'+value.re_num+'"> ->'+value.re_content+'';
             a+='아이디:'+value.id+'';
             a+='날짜:'+moment(value.re_date).format('YY-MM-DD HH:mm')+'';
           
             a+='<button type="button" onclick="replyupdate_form('+value.re_num+',\''+value.re_content+'\');">수정</button>';
            a+='<button type="button" onclick="replydelete('+value.re_num+');">삭제</button></div>';
          $('#re_content'+value.com_num).append(a);
    	   }
    	   else{
    		   var a='';
    		   a+='<div class="replyList" id="replyList'+value.re_num+'"> ->'+value.re_content+'';
               a+='아이디:'+value.id+'';
               a+='날짜:'+moment(value.re_date).format('YY-MM-DD HH:mm')+'</div>';
            $('#re_content'+value.com_num).append(a);
    	   }
       });
      },
      error:function(){
         alert("ajax통신 실패!(insert)");
      }
   });
}
function replyupdate_form(re_num,re_content) {
	var b='';
		b+='<input class="replyupdate_form" id="replyupdate_form'+re_num+'" type="text" value="'+re_content+'">';
		b+='<button type="button" onclick="replyupdate('+re_num+');">수정</button>';
		b+='<button type="button" onclick="replyList();">취소</button>';
		$('#replyList'+re_num).html(b)
}
function replyupdate(re_num) {
   console.log(re_num)
   var re_content = $('#replyupdate_form'+re_num).val();
   $.ajax({
      url : '/imfind/reply_update',
      type : 'POST',
      data : {'re_num':re_num,'re_content':re_content},
      success : function(data){
    	  replyList();
         
      },
      error:function(){
         alert("ajax통신 실패!(insert)");
      }
   });
}
function replydelete(re_num) {
   console.log(re_num)
   $.ajax({
      url : '/imfind/reply_delete',
      type : 'POST',
      data : {'re_num':re_num},
      success : function(data){
         if(data == 1){
            replyList(); //댓글 작성 후 댓글 목록 reload
            
         } else{
            console.log('delete Error');
         }
      },
      error:function(){
         alert("ajax통신 실패!(insert)");
      }
   });
}

