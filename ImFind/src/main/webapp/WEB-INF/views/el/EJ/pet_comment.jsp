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

/*         .container {
            margin-left: 300px;
            margin-right: 300px;
            width: 950px;
        } */
        
        .comtitle {
           margin : 7px 0 -10px 0px;
        }
        
        .comtitle > h3 {
           font-family:'Noto Sans KR', sans-serif !important;
           font-size : 20px;
        }
      
      h3 {
          margin-left: 5px;
      }
        .commentbox {
            width: 100%;
            height: 100px;
            resize: none;
            border:none;
        }

        .com2 {
            display: flex;
            flex-direction: row-reverse;
            justify-content: space-between;
            align-items : center;
            border-top: 1px solid rgb(238, 238, 238);
            width: 100%;
            height: 45px;
            padding:0 0 0 8px;
        }

        .com_btn {
            display: flex;
            flex-direction: row-reverse;
            width: 50%;
            align-items:center;
        }
      #Secret_Com{
         margin-left : 5px;
      }
        .button1, .button2, .button3, .button4, .button5 {
            background-color: white;
            color: aaa;
            border: 2px solid white;
            font-size: 16px;
            padding: 4px;
           
            text-align: center;
            align-items: center;

        }

        .button1:hover, .button2:hover, .button3:hover, .button4:hover, .button5:hover {
            background-color: #e7e7e7;
        }
        
        .commentArea {
           width: 100%;
            height: auto;
              margin: 15px 0 15px 0;
              border-bottom: 1px solid rgb(238, 238, 238);
        }
        .commentDate{
           width: 500px;
            height: 100px;
            margin-left: 300px;
            margin-right: 300px;
        }
        
        .commentContent {
            width: 500px;
            min-height: 64px;
            color:black;
        }
        
        .commentInfo {
           display: flex;
           justify-content: space-between;
           margin-bottom: -21px;
        }
        
        /* YH */
        .cominput{
           border : 1px solid rgb(238, 238, 238);
        }
      .commentList{
         padding-bottom: 50px;
         height: auto;
      }
      .fa-reply,
      .fa-cut,
       .fa-trash-alt{
         color: rgb(215, 210, 210);
      }
      .recommentbtn > button{
         font-size: 13px;
         color: rgb(215, 210, 210);
      }
    </style>  

</head> 
<body>

         <form name="commentInsertForm" id="comment-form" method="post" enctype="multipart/form-data">
              <div class="comtitle"><h3>댓  글</h3>
              <input type="hidden" name="Lost_PostNum" value="<%= request.getParameter("Pet_PostNum") %>"/></div>
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
            <div class="commentList"></div>

    <script src="${pageContext.request.contextPath}/resources/el/js/pet_comment.js"></script>  
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script>
var boardWriter ='<%=request.getParameter("getId") %>'
var id = '${loginUser}';
   //댓글 목록
   function commentList(){
  
   
   $.ajax({
      url : '/imfind/pet_comment_list',
      //type : 'post',
      data : {'Lost_PostNum' : Pet_PostNum},
      dataType : 'json',
      contentType : 'application/x-www-form-urlencoded;charset=utf-8',
      success : function(data){
         console.log(data)
         var a ='';

         $.each(data, function(key, value){
            
            var lost_PostNum = value.pet_PostNum;
            
            a += '<div class="commentArea" id="'+ value.com_Num +'">';
            a += '<div class="commentInfo">'+'<span>'+value.id+'</span>'+'<span>날짜:'+ moment(value.lost_Date).format('YYYY-MM-DD')+'</span>' +'</div>&nbsp;&nbsp;';
            
            if (value.secret_Com == 'y'){
           	 if (value.id == id){ 
                    a += '<div class="commentContent" id="commentContent'+ value.com_Num +'">'+value.com_Content; //댓글내용
                    a += '<div class="recommentbtn"><button type ="button" class="button4" onclick="commentUpdateForm('+value.com_Num+',\''+value.com_Content+'\');"><i class="fas fa-cut"></i>수정</button>';
                    a += '<button type ="button" class="button3" onclick="commentDelete('+value.com_Num+');"><i class="fas fa-trash-alt"></i>삭제</button><button type ="button" class="button5" onclick="reply('+value.com_Num+');">답변</button></div></div>';
                    a += '<div class="re_content" id="re_content'+ value.com_Num +'"></div><div class="reply" id="reply'+ value.com_Num +'"></div></div></div>';
                    
                 }
           	 else if (boardWriter == id) {
               	 a += '<div class="commentContent" id="commentContent'+ value.com_Num +'">'+value.com_Content; //댓글내용
                    a += '<div class="recommentbtn">';
                    a += '<button type ="button" class="button5" onclick="reply('+value.com_Num+');">답변</button></div></div>';
                    a += '<div class="re_content" id="re_content'+ value.com_Num +'"></div><div class="reply" id="reply'+ value.com_Num +'"></div></div></div>';
                  
               }
           	 else{
           		 a += '<div class="commentContent" id="commentContent'+ value.com_Num +'"> <p>비밀댓글입니다. </p>';
                    a += '</div></div>';
           	 }
           		 
           }
           else{
           	
           	if (value.id == id){ 
                   a += '<div class="commentContent" id="commentContent'+ value.com_Num +'">'+value.com_Content; //댓글내용
                   a += '<div class="recommentbtn"><button type ="button" class="button4" onclick="commentUpdateForm('+value.com_Num+',\''+value.com_Content+'\');"><i class="fas fa-cut"></i>수정</button>';
                   a += '<button type ="button" class="button3" onclick="commentDelete('+value.com_Num+');"><i class="fas fa-trash-alt"></i>삭제</button><button type ="button" class="button5" onclick="reply('+value.com_Num+');">답변</button></div></div>';
                   a += '<div class="re_content" id="re_content'+ value.com_Num +'"></div><div class="reply" id="reply'+ value.com_Num +'"></div></div></div>';
                   
                }
           	else if (boardWriter == id) {
              	 a += '<div class="commentContent" id="commentContent'+ value.com_Num +'">'+value.com_Content; //댓글내용
                   a += '<div class="recommentbtn">';
                   a += '<button type ="button" class="button5" onclick="reply('+value.com_Num+');">답변</button></div></div>';
                   a += '<div class="re_content" id="re_content'+ value.com_Num +'"></div><div class="reply" id="reply'+ value.com_Num +'"></div></div></div>';
                 
              }
           	else{
           		 a += '<div class="commentContent" id="commentContent'+ value.com_Num +'">'+value.com_Content; //댓글내용
                    a += '<div class="recommentbtn">';
                    a += '<button type ="button" class="button5" onclick="reply('+value.com_Num+');">답변</button></div></div>';
                    a += '<div class="re_content" id="re_content'+ value.com_Num +'"></div><div class="reply" id="reply'+ value.com_Num +'"></div></div></div>';
           	}
           }
           
       
        }); // each

         
         $(".commentList").html(a); //html형식으로 .. 음..
      }, // success
      error:function(){
         alert("ajax통신 실패(list)!!");
      }//error
         
      });   //ajax
   }
   </script>
</body>
</html>