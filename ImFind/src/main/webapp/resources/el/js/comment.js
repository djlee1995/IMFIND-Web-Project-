$(document).ready(function(){
	$('.commentbox').keyup(function (){
		var content = $(this).val();
		$('#counter').html("("+content.length+" / 최대 200자)");    //글자수 실시간 카운팅

		if (content.length > 200){
			alert("최대 200자까지 입력 가능합니다.");
			$(this).val(content.substring(0, 200));
			$('#counter').html("(200 / 최대 200자)");
		}
	});
	
	
	//commentList();
});

function insertBtnClick(){
	
	var comcontent = $(".commentbox").val();
	if (comcontent == ""){ 
		alert('댓글을 입력해주세요')
		
		return false;
	}
	commentInsert(comcontent);
}
/*
function commentInsert(insertData){
	$.ajax({
		url : '/mapper/comment_insert.bo',
		type : 'POST',
		data : insertData,
		success : function(data){
			if(data == 1){
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
*/

function commentInsert(comcontent){
	console.log('댓글 내용=' + comcontent)
	var Lost_PostNum = 1;
	$.ajax({
		url : "el/comInsert",
		contentType : 'application/x-www-form-urlencoded;charset=utf-8',
		data : { "Com_Content" : comcontent },
		type : 'POST',
		success : function(data){
			if (data == 1){
				commentList();
				$(".commentbox").val();
				
			}
			
		},
		error: function(){
			alert('통신실패');
		}
	});// ajax 끝
	
}

//댓글 목록
function commentList(){
	//var Lost_PostNum = 1;
	$.ajax({
		url : 'el/commentlist',
		//type : 'post',
		data : {'Com_Content' : comcontent},
		dataType : 'json',
		contentType : 'application/x-www-form-urlencoded;charset=utf-8',
		success : function(data){
			var a ='';
			$.each(data, function(key, value){
				a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
//				a += '<div class="commentInfo'+value.cno+'">'+'댓글번호 :'+value.cno+'/작성자:'+value.id+'&nbsp;&nbsp;';
//				a += '<a href="#" onclick="commentUpdateForm('+value.cno+',\''+value.content+'\');">수정</a> ';
//				a += '<a href="#" onclick="commentDelete('+value.cno+');">삭제</a></div>';
				a += '<div class="commentContent"> <p>내용: ' +value.comcontent +'</p>';
				a += '</div></div>';
			});
			$(".commentList").html(a); //html형식으로 .. 음..
		},
		error:function(){
			alert("ajax통신 실패(list)!!");
		}
		
	});	
}