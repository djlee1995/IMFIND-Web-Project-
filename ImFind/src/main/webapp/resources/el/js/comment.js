$(document).ready(function(){
 	commentList();
 		
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

/*

function winPopup(com_Num, com_Content) {
    var popUrl = "/imfind/recomment.html";
    var popOption = "top=10, left=10, width=100, height=100, status=no, menubar=no, toolbar=no, resizable=no";
    window.open(popUrl, popOption);
 
}
*/
//대댓창 팝업
var openWin;
function doPopupopen() { 
	  openWin = window.open("/imfind/recomment.html", "popup01", "width=450, height=500");
		console.log(openWin)
	  alert('ghgd')
	    openWin.document.querySelector('input[name="Lost_PostNum"]').value = document.querySelector('input[name="Lost_PostNum"]').value;
	  //setChildText();
}

function setChildText(){
	alert('ghgd')
    openWin.document.querySelector('input[name="Lost_PostNum"]').value = document.querySelector('input[name="Lost_PostNum"]').value;
}

function ReCommentInsert(com_Num){
	console.log('왔니?')
	var a ='';
	a += '<div>';
	a += '<input type="text" name="Re_Com_Content'+com_Num+'"/>';
	a += '<span ><button type="button" onclick="commentUpdate('+Re_Com_Num+');">등록</button> </span>';
	a += '<span ><button type="button" onclick="commentList();">취소</button> </span>';
	a += '</div>';
	
	$('.commentContent'+com_Num).html(a);
	
}


//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경
function commentUpdateForm(com_Num, com_Content){
	
	var a ='';
	
	a += 'div';
	a += '<input type="text" name="content_'+com_Num+'" value="'+com_Content+'"/>';
	a += '<span ><button type="button" onclick="commentUpdate('+com_Num+');">수정</button> </span>';
	a += '<span ><button type="button" onclick="commentList();">취소</button> </span>';
	a += '</div>';
	
	$('.commentContent'+com_Num).html(a);
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
/*
function commentReComment(com_Num){
	
}
*/

