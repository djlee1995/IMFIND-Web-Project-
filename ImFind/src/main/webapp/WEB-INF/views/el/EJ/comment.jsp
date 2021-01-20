<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script src="${pageContext.request.contextPath}/resources/el/js/jquery-ui.min.js"></script>
	
	<style>

        .container {
            margin-left: 300px;
            margin-right: 300px;
            width: 950px;
        }
        
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
            width: 500px;
            height: 100px;
            resize: none;
        }

        .com2 {
            display: flex;
            flex-direction: row-reverse;
            justify-content: space-between;
            border: 1px solid white;
            width: 500px;
            height: 40px;
        }

        .com_btn {
            display: flex;
            flex-direction: row-reverse;
            width: 50%;
        }
	
        .button1, .button2, .button3, .button4, .button5 {
            background-color: white;
            color: black;
            border: 2px solid white;
            font-size: 12px;
            padding: 10px;
     
            text-align: center;
            align-items: center;

        }

        .button1:hover, .button2:hover, .button3:hover, .button4:hover, .button5:hover {
            background-color: #e7e7e7;
        }
        
        .commentArea {
        	width: 500px;
            height: 100px;
            margin-left: 300px;
            margin-right: 300px;
            
        }
        .commentDate{
        	width: 500px;
            height: 100px;
            margin-left: 300px;
            margin-right: 300px;
        }
        
        .commentContent {
         	width: 500px;
            height: 100px;
            margin-top: 50px;
            
        }
        
        .commentInfo {
        	display: flex;
        	justify-content: space-between;
        }

    </style>  

</head> 
<body>
<article>
	    <div class="container">
			<form name="commentInsertForm" method="post" enctype="multipart/form-data">
		        <div class="comtitle"><h3>댓  글</h3>
		        <input type="hidden" name="Lost_PostNum" value="<%= request.getParameter("lost_PostNum") %>"/></div>
		        
				
		        <div class="cominput">
		        	<input type="hidden" name="Id" value="${loginUser}"/>
		           <textarea class="commentbox" name="Com_Content" placeholder="댓글을 입력해주세요."></textarea>
		           
		           <div class="com2">
		           
		               <div class="com_btn">
		              	  <button type="reset" class="button2">취소</button>
		                  <!-- <button type="button" name="commentInsertBtn" class="button1" onclick="insertBtnClick()">등록</button> -->
		                  <button type="button" class="button1" name="commentInsertBtn" >등록</button>
		                  
		                  <!-- <button type="button" class="button2">
		                  <i class="fas fa-images fa-lg" ></i></button> -->
		                  
		                  <input type="checkbox" id="Secret_Com" name="Secret_Com">비밀댓글 
		               </div>
		               <span style="color:#aaa;" id="counter">(0 / 최대 200자)</span>
		          		
		           </div>  
		        </div>
			</form>
			
	    </div> 
	   <div class="commentList"></div>
 </article> 
    <script src="${pageContext.request.contextPath}/resources/el/js/comment.js"></script>  
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
	<script>
	//댓글 목록
	function commentList(){
	var id = '${loginUser}';
	console.log("id=" + id);

	$.ajax({
		url : '/imfind/comment_list',
		//type : 'post',
		data : {'Lost_PostNum' : lost_PostNum},
		dataType : 'json',
		contentType : 'application/x-www-form-urlencoded;charset=utf-8',
		success : function(data){
			console.log(data)
			var a ='';
			
			$.each(data, function(key, value){
				
				//a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
				//a += '<div class="commentInfo'+value.com_Num+'">'+'작성자:'+value.id+'&nbsp;&nbsp;&nbsp;날짜:'+value.com_Date+'</div>&nbsp;&nbsp;';
				
				if (value.id == id){ 
					//a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
					a += '<div class="commentInfo'+value.com_Num+'">'+'<h3>'+value.id+'</h3>&nbsp;&nbsp;';
					a += '<div class="recommentbtn"><button type ="button" class="button4" onclick="commentUpdateForm('+value.com_Num+',\''+value.com_Content+'\');">수정</button>';
					a += '<button type ="button" class="button3" onclick="commentDelete('+value.com_Num+');">삭제</button></br></br></div></div>';
					a += '<div class="commentContent'+value.com_Num+'">'+value.com_Content; //댓글내용
					a += '</div></div>';
					
					return true;
					
				} else if (value.secret_Com == 'y') { 
					
					a += '<div class="commentContent'+value.com_Num+'"> <p>비밀댓글입니다. </p>';
					a += '</div></div>';
					
					return true;
					
				} else {
					a += '<div class="commentInfo'+value.com_Num+'">'+'<h3>'+value.id+'</h3>&nbsp;&nbsp;';
					a += '<div class="commentContent'+value.com_Num+'">' +value.com_Content;
					//a += '<button type ="button" class="button5" onclick="ReCommentInsert('+value.com_Num+');">답변</button> ';
					//a += '<button type="button" class="button5" onclick="window.open("/imfind/recomment.html", "startpop", status=no, height=500, width=430, left=400, top=400);">답변</button>';
					//a += '<button type="button" class="button5" onclick="window.open("/imfind/recomment.html")">답변</button>';
					//a += '<button type ="button" class="button5" onclick="winPopup('+value.com_Num+',\''+value.com_Content+'\');">답변</button> ';
					a += '<button type ="button" class="button5" onclick="doPopupopen();">답변</button> ';
					a += '</div></div>';
					console.log(a)	
				}
				
			}); // each
			$(".commentList").html(a); //html형식으로 .. 음..
		}, // success
		error:function(){
			alert("ajax통신 실패(list)!!");
		}//error
			
		});	//ajax
	}
	</script>
</body>
</html>