<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>댓글에 댓글</title>
    
    <style>
    /*
    .container {
            margin-left: 300px;
            margin-right: 300px;
            width: 950px;
        }
     */   
        .comtitle {
            /*
            border-bottom: 4px solid black;
           */
           /*
            display: flex;
            justify-content: space-between;
           
            font-size: small;
            padding-top: 20px;
            padding-bottom: 20px;
            align-items: baseline;
            */
        }
		
		h3 {
			 margin-left: 5px;
		}
        .commentbox {
            width: 320x;
            height: 250px;
            resize: none;
            
        }
/*
        .com2 {
            display: flex;
            flex-direction: row-reverse;
            justify-content: space-between;
            border: 1px solid white;
            width: 500px;
            height: 40px;
        }
*/

        .com_btn {
            display: flex;
            justify-content: space-between;
            width: 50%;
        }
	
        .btn btn_submit, .btn btn_reset {
            background-color: white;
            color: black;
            border: 2px solid white;
            font-size: 12px;
            padding: 10px;
     
            text-align: center;
            align-items: center;

        }

        .btn btn_submit:hover, .btn btn_reset:hover {
            background-color: #e7e7e7;
        }
    </style>
    
    <script>
	var Writer = '${loginUser}';
	/* $(document).ready(function(){
		var a ='';
		
		a += 'div';
		a += '<input type="text" name="content_'+com_Num+'" value="'+com_Content+'"/>';
		a += '<span ><button type="button" onclick="commentUpdate('+com_Num+');">수정</button> </span>';
		a += '<span ><button type="button" onclick="commentList();">취소</button> </span>';
		a += '</div>'; 
		
		$('.commentContent'+com_Num).html(a);
	}); */
	
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
	
	function setChildText(){
		alert('ghgd')
	    openWin.document.querySelector('input[name="Lost_PostNum"]').value = document.querySelector('input[name="Lost_PostNum"]').value;
	}
	document.addEventListener('DOMContentLoaded', function(){
		var parentValue = opener.document.querySelector('input[name="Lost_PostNum"]').value;
		alert(parentVale)
		opener.location.href = "javascript:setChildText()"
	})
	</script>
</head>
<body>

	<!-- <div id="comment" style="width:100%;height:350px; "></div> -->
	<div id="comment"></div>
    <div class="container">
		<form name="commentInsertForm" action="/imfind/commentReply" method="post" >
	        <div class="comtitle"><h3>댓글에 댓글</h3>
		        <input type="text" name="Lost_PostNum"/>
		        
		        
		        <input type="text" name="Com_Num" >
			</div>
			
	        <div class="cominput">
	        	<input type="hidden" name="Id" value="Writer"/>
	            <textarea class="commentbox" name="Re_Com_Content" placeholder="인터넷은 우리가 함게 만들어가는 소중한 공간입니다. 댓글 작성 시 타인에 대한 배려와 책임을 담아주세요."></textarea>
	           
	          <div class="com2">
	           	<span style="color:#aaa;" id="counter">(0 / 최대 200자)</span>
	          </div>
	           	
              <div class="com_btn">
              	<input type="checkbox" id="Secret_Com" name="Secret_Com">비밀댓글
                  <!-- <button type="button" name="commentInsertBtn" class="button1" onclick="insertBtnClick()">등록</button> -->
                <button type="submit" class="btn btn_submit" name="commentInsertBtn" >등록</button>
                <button type="reset" class="btn btn_reset">취소</button>
                  <!-- <button type="button" class="button2">
                  <i class="fas fa-images fa-lg" ></i></button> -->
              </div>
	        </div>
		</form>
    </div> 
	
	
</body>
</html>