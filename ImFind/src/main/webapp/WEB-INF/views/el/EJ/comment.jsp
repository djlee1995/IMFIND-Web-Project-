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
        .comtitle {
           margin : 7px 0 -10px 0px;
        }	
        .content > input {
        	width: 799px;
        	min-height: 50px;
        }
        .content > button { 
        	border : none;
        	background : none;
        	font-size: 13px;
    		color: gray;
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
        div.commentInfo > span:nth-child(2){
        	font-weight:100;
        	font-size:12px;
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
         color: gray;
      }
      input[name *= "re_content"],
      .replyupdate_form{
      	width:100%;
      	height:100px;
      	overflow: auto;
      	word-wrap: break-word;
      }
      .reply-con button{
      	background:none;
      	border:none;
      }
   	#replyList{
        display: flex;
	    justify-content: space-between;
	    width: 100%;
	}
	.replyList{
		border-bottom:  1px solid rgb(238, 238, 238); 
	}
	.commentContent{
		display: flex;
	    justify-content: space-between;
	    width: 100%;
	    padding-bottom: 13px;
	}
	.btn-con{
	    padding-bottom: 13px;
	}
	.com-txt{
		width: 80%;
	    height: auto;
	    word-break: keep-all;
        font-weight: 100;
	}
	.com-con{
		display:flex;
		justify-content: space-between;
	}
	.com-con > .recom-date{
		font-size:12px;
	}
	.recom-box{
		font-size: 14px;
	    color: black;
	    font-weight: 300;
	    width: 86%;
    	word-break: initial;
    	padding-bottom:13px;
	}
    div.commentInfo > span:nth-child(1){
    	margin-bottom: 7px;
    	font-weigth:200;
    }
    div.commentInfo > span:nth-child(2){
    	font-weight:100;
    	font-size:12px;
    }
    .recom-id{
    	margin-bottom: 7px;
    }
	.btn-con{
		display: flex;
    	justify-content: flex-end;
	}
	.btn-con > button{
		border:none;
		background:none;
		font-size : 13px;
	} 
	.re_content{
		margin-left: 40px;
	}
    ._12xcxtl{
    	border-top: 1px solid #DDDDDD !important;
    	margin: 8px 0;
    	margin-bottom: 25px;
    }
    .content.update > input{
    	width: 100%;
	    height: 100px;
	    overflow: auto;
    }
    </style>  

</head> 
<body>
	    <!-- 알람 소켓  -->
    	<%@ include file="/WEB-INF/views/el/Socket/alarm.jsp" %>

         <form name="commentInsertForm" id="comment-form" method="post" enctype="multipart/form-data">
              <div class="comtitle"><h3>댓  글</h3>
              <div class="_12xcxtl" style="margin-top: 11px; width: 32px;"></div>   
              <input type="hidden" name="Lost_PostNum" value="<%= request.getParameter("lost_PostNum") %>"/></div>
              <div class="cominput">
                 <input type="hidden" name="Id" value="${loginUser}"/>
                 <textarea class="commentbox" name="Com_Content" placeholder="댓글을 입력해주세요."></textarea>
                 
                 <div class="com2">
                 
                     <div class="com_btn">
                         <button type="reset" class="button2">취소</button>
                        <button type="button" class="button1" name="commentInsertBtn" >등록</button>
                        
                        
                        <input type="checkbox" id="Secret_Com" name="Secret_Com"><i class="fas fa-unlock"></i></i> 
                     </div>
                     <span style="color:#aaa;" id="counter">(0 / 최대 200자)</span>
                      
                 </div>  
              </div>
         </form>
            <div class="commentList"></div>

    <script src="${pageContext.request.contextPath}/resources/el/js/comment.js"></script>  
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script>
var boardWriter ='<%=request.getParameter("getId") %>'
var id = '${loginUser}';
   //댓글 목록
   function commentList(){
  
   
   $.ajax({
      url : '/imfind/comment_list',
      //type : 'post',
      data : {'Lost_PostNum' : lost_PostNum},
      dataType : 'json',
      contentType : 'application/x-www-form-urlencoded;charset=utf-8',
      success : function(data){
         console.log(boardWriter)
         var a ='';
        
      
         $.each(data, function(key, value){
            
            var lost_PostNum = value.lost_PostNum;
            
            a += '<div class="commentArea" id="'+ value.com_Num +'">';
            a += '<div class="commentInfo">'+'<span>'+value.id+'</span>'+'<span>날짜:'+ moment(value.lost_Date).format('YYYY-MM-DD')+'</span>' +'</div>&nbsp;&nbsp;';
            if (value.secret_Com == 'y'){
            	 if (value.id == id){ 
                     a += '<div class="commentContent" id="commentContent'+ value.com_Num +'">'+'<div class="com-txt">' + value.com_Content+ '</div>'; //댓글내용
                     a += '<div class="recommentbtn"><button type ="button" class="button4" onclick="commentUpdateForm('+value.com_Num+',\''+value.com_Content+'\');"><i class="fas fa-cut"></i>수정</button>';
                     a += '<button type ="button" class="button3" onclick="commentDelete('+value.com_Num+');"><i class="fas fa-trash-alt"></i>삭제</button><button type ="button" class="button5" onclick="reply('+value.com_Num+');"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACIAAAAcCAYAAAAEN20fAAAAAXNSR0IArs4c6QAABIFJREFUSA2tl0lok0EUx5M0tVYpsVvqRhQFe6gH0VKkWrFKl1TrQaSggsvR/eAKoiJCbxZRwV0Ul4N6UbCLbU314EatC0b0oJY0Rg1aEcS0DWn9vfRLnH79EmPNwMt787b5z8z7ZiZmUwLN5XJZ+/r6ivr7+xfhPn9gYGAi3G42m7OQf8D99L9Aj5Cb8XtQVVXVSz/hZo7n2dTUZA+FQptJvpEBs+P5qjb8f9I/Q0wdgLyqLZZsCERWoLe3dx+JdkGjteB++EvonnAG+2qxWL4ij2YF8vCbhG4BfCG6DMhEPwg7YbPZ9hQXFwdEF6sNA9LS0jIjGAxeJeEcCSKZDzoJnaqoqJAtiNtkEj09PdU4ySTmijOxr1NSUlaXl5c/jxU8BEhjY2MBwS4ol2CZTa3D4agtKCjoi5Ugnp6tdbJaZ8k3kXyyXeVOp/OhUUwUiKwEBXkfpzzIQ2A1QbIV/9WYXBZgLpJkKTmlsBdVVlZ26JNaRAFiC9txCTEPx3epqaklyQAhuRm02263LyfvTcaxAep6e3v7GLGpLQwE1NtwKsLwi710lpWVeVSn/5ULCwuDbHENYJ6Qa5rf7z+gz2l2u92jPB6PDyDZfAVbmMFxvVNDQ0O7XpdIn1UtVP2kBlmRDgBZIAdjfYrYrV6vt0pAYPDyVZyIGFSOPfwFqbqRyAzsZlJyvmwifiVUF8ljBWGN1rkAmFDEoHK2a8jMVNu/yoA4R4wAWQX9AUJnBiStaZAN/2Wlng7XjkzDSfuMVekkeiagmLt5QDJZIYcIKDuFG7VEa0RfE0a5NN07xpva1tYmR8Vn0VlRjBUhPT1djmvDhk9SakRJ7hOZa0Tur0EgLE0XA+VzmE1A+UEc9C2ZNaLlFgCmtLQ0ubHDTVZEzox8inYa3BBIMmtkcFjTdHigtLQ0ugtSI61QGbRMk2FDW6I1MjTKZDKqGXLlyw6wE7dVfwFyBarFuIrDbafRBYctmTWyTgNwXeNhZpWHCyhvM1h1V1fXbrSHVAeRk1Ujra2tUyjQrayGj1P8hjpO+PYFyFSAuDFYGXQONfFKdUqGTH6zTJhcTkCs4ZSVSzbawpcee9mJZi80iqJtqK+vl2JKagPEURI6WY1bTPSyPnkYiCjZoiM41YF8MryNC2q23nmkfUAcJnYz9Dg3N3cl+cOnqZovCkSUrMx2nI4KGOgRYPbxdkhVA0YikytF4sh9kyfBL6Mc0ReaamRrVtA/DWVCH6FjGRkZp0tKSr4jx23Nzc22zMzMoDqg9m9AHtzZgFrC6t/RJzEEIk5U+CRO2/2IawlOg4dIJJffXegt5EffjW6sDEBf3hqLkYvQf6MgD+bk5JyTRxE2E5Obi60RWzrdDYA5L/pIiwkk4sCrfHwgENhIkqXoZpHorzGRWGK68b8GKBf0DKCy5TegLHxO8oTcHlm5hJNKckDlcA7MQ5wM2UkoS93DID/gPj79Fwz2Htt6+E643K4xG0DfQKv5lDv+CUjMjAYG7f/NYgDK6302fDp8HFy2WQpXVusj/AMT2PEbeA0W2gj2azwAAAAASUVORK5CYII=" width="17" height="14" alt="댓글달기 버튼 이미지">답변</button></div></div>';
                     a += '<div class="re_content" id="re_content'+ value.com_Num +'"></div><div class="reply" id="reply'+ value.com_Num +'"></div></div></div>';
                     
                  }
            	 else if (boardWriter == id) {
                	 a += '<div class="commentContent" id="commentContent'+ value.com_Num +'">'+'<div class="com-txt">' + value.com_Content+ '</div>'; //댓글내용
                     a += '<div class="recommentbtn">';
                     a += '<button type ="button" class="button5" onclick="reply('+value.com_Num+');"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACIAAAAcCAYAAAAEN20fAAAAAXNSR0IArs4c6QAABIFJREFUSA2tl0lok0EUx5M0tVYpsVvqRhQFe6gH0VKkWrFKl1TrQaSggsvR/eAKoiJCbxZRwV0Ul4N6UbCLbU314EatC0b0oJY0Rg1aEcS0DWn9vfRLnH79EmPNwMt787b5z8z7ZiZmUwLN5XJZ+/r6ivr7+xfhPn9gYGAi3G42m7OQf8D99L9Aj5Cb8XtQVVXVSz/hZo7n2dTUZA+FQptJvpEBs+P5qjb8f9I/Q0wdgLyqLZZsCERWoLe3dx+JdkGjteB++EvonnAG+2qxWL4ij2YF8vCbhG4BfCG6DMhEPwg7YbPZ9hQXFwdEF6sNA9LS0jIjGAxeJeEcCSKZDzoJnaqoqJAtiNtkEj09PdU4ySTmijOxr1NSUlaXl5c/jxU8BEhjY2MBwS4ol2CZTa3D4agtKCjoi5Ugnp6tdbJaZ8k3kXyyXeVOp/OhUUwUiKwEBXkfpzzIQ2A1QbIV/9WYXBZgLpJkKTmlsBdVVlZ26JNaRAFiC9txCTEPx3epqaklyQAhuRm02263LyfvTcaxAep6e3v7GLGpLQwE1NtwKsLwi710lpWVeVSn/5ULCwuDbHENYJ6Qa5rf7z+gz2l2u92jPB6PDyDZfAVbmMFxvVNDQ0O7XpdIn1UtVP2kBlmRDgBZIAdjfYrYrV6vt0pAYPDyVZyIGFSOPfwFqbqRyAzsZlJyvmwifiVUF8ljBWGN1rkAmFDEoHK2a8jMVNu/yoA4R4wAWQX9AUJnBiStaZAN/2Wlng7XjkzDSfuMVekkeiagmLt5QDJZIYcIKDuFG7VEa0RfE0a5NN07xpva1tYmR8Vn0VlRjBUhPT1djmvDhk9SakRJ7hOZa0Tur0EgLE0XA+VzmE1A+UEc9C2ZNaLlFgCmtLQ0ubHDTVZEzox8inYa3BBIMmtkcFjTdHigtLQ0ugtSI61QGbRMk2FDW6I1MjTKZDKqGXLlyw6wE7dVfwFyBarFuIrDbafRBYctmTWyTgNwXeNhZpWHCyhvM1h1V1fXbrSHVAeRk1Ujra2tUyjQrayGj1P8hjpO+PYFyFSAuDFYGXQONfFKdUqGTH6zTJhcTkCs4ZSVSzbawpcee9mJZi80iqJtqK+vl2JKagPEURI6WY1bTPSyPnkYiCjZoiM41YF8MryNC2q23nmkfUAcJnYz9Dg3N3cl+cOnqZovCkSUrMx2nI4KGOgRYPbxdkhVA0YikytF4sh9kyfBL6Mc0ReaamRrVtA/DWVCH6FjGRkZp0tKSr4jx23Nzc22zMzMoDqg9m9AHtzZgFrC6t/RJzEEIk5U+CRO2/2IawlOg4dIJJffXegt5EffjW6sDEBf3hqLkYvQf6MgD+bk5JyTRxE2E5Obi60RWzrdDYA5L/pIiwkk4sCrfHwgENhIkqXoZpHorzGRWGK68b8GKBf0DKCy5TegLHxO8oTcHlm5hJNKckDlcA7MQ5wM2UkoS93DID/gPj79Fwz2Htt6+E643K4xG0DfQKv5lDv+CUjMjAYG7f/NYgDK6302fDp8HFy2WQpXVusj/AMT2PEbeA0W2gj2azwAAAAASUVORK5CYII=" width="17" height="14" alt="댓글달기 버튼 이미지">답변</button></div></div>';
                     a += '<div class="re_content" id="re_content'+ value.com_Num +'"></div><div class="reply" id="reply'+ value.com_Num +'"></div></div></div>';
                   
                }
            	 else{
            		 a += '<div class="commentContent" id="commentContent'+ value.com_Num +'"> <p>비밀댓글입니다. </p>';
                     a += '</div></div>';
            	 }
            		 
            }
            else{
            	
            	if (value.id == id){ 
                    a += '<div class="commentContent" id="commentContent'+ value.com_Num +'">'+'<div class="com-txt">' + value.com_Content+ '</div>'; //댓글내용
                    a += '<div class="recommentbtn"><button type ="button" class="button4" onclick="commentUpdateForm('+value.com_Num+',\''+value.com_Content+'\');"><i class="fas fa-cut"></i>수정</button>';
                    a += '<button type ="button" class="button3" onclick="commentDelete('+value.com_Num+');"><i class="fas fa-trash-alt"></i>삭제</button><button type ="button" class="button5" onclick="reply('+value.com_Num+');"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACIAAAAcCAYAAAAEN20fAAAAAXNSR0IArs4c6QAABIFJREFUSA2tl0lok0EUx5M0tVYpsVvqRhQFe6gH0VKkWrFKl1TrQaSggsvR/eAKoiJCbxZRwV0Ul4N6UbCLbU314EatC0b0oJY0Rg1aEcS0DWn9vfRLnH79EmPNwMt787b5z8z7ZiZmUwLN5XJZ+/r6ivr7+xfhPn9gYGAi3G42m7OQf8D99L9Aj5Cb8XtQVVXVSz/hZo7n2dTUZA+FQptJvpEBs+P5qjb8f9I/Q0wdgLyqLZZsCERWoLe3dx+JdkGjteB++EvonnAG+2qxWL4ij2YF8vCbhG4BfCG6DMhEPwg7YbPZ9hQXFwdEF6sNA9LS0jIjGAxeJeEcCSKZDzoJnaqoqJAtiNtkEj09PdU4ySTmijOxr1NSUlaXl5c/jxU8BEhjY2MBwS4ol2CZTa3D4agtKCjoi5Ugnp6tdbJaZ8k3kXyyXeVOp/OhUUwUiKwEBXkfpzzIQ2A1QbIV/9WYXBZgLpJkKTmlsBdVVlZ26JNaRAFiC9txCTEPx3epqaklyQAhuRm02263LyfvTcaxAep6e3v7GLGpLQwE1NtwKsLwi710lpWVeVSn/5ULCwuDbHENYJ6Qa5rf7z+gz2l2u92jPB6PDyDZfAVbmMFxvVNDQ0O7XpdIn1UtVP2kBlmRDgBZIAdjfYrYrV6vt0pAYPDyVZyIGFSOPfwFqbqRyAzsZlJyvmwifiVUF8ljBWGN1rkAmFDEoHK2a8jMVNu/yoA4R4wAWQX9AUJnBiStaZAN/2Wlng7XjkzDSfuMVekkeiagmLt5QDJZIYcIKDuFG7VEa0RfE0a5NN07xpva1tYmR8Vn0VlRjBUhPT1djmvDhk9SakRJ7hOZa0Tur0EgLE0XA+VzmE1A+UEc9C2ZNaLlFgCmtLQ0ubHDTVZEzox8inYa3BBIMmtkcFjTdHigtLQ0ugtSI61QGbRMk2FDW6I1MjTKZDKqGXLlyw6wE7dVfwFyBarFuIrDbafRBYctmTWyTgNwXeNhZpWHCyhvM1h1V1fXbrSHVAeRk1Ujra2tUyjQrayGj1P8hjpO+PYFyFSAuDFYGXQONfFKdUqGTH6zTJhcTkCs4ZSVSzbawpcee9mJZi80iqJtqK+vl2JKagPEURI6WY1bTPSyPnkYiCjZoiM41YF8MryNC2q23nmkfUAcJnYz9Dg3N3cl+cOnqZovCkSUrMx2nI4KGOgRYPbxdkhVA0YikytF4sh9kyfBL6Mc0ReaamRrVtA/DWVCH6FjGRkZp0tKSr4jx23Nzc22zMzMoDqg9m9AHtzZgFrC6t/RJzEEIk5U+CRO2/2IawlOg4dIJJffXegt5EffjW6sDEBf3hqLkYvQf6MgD+bk5JyTRxE2E5Obi60RWzrdDYA5L/pIiwkk4sCrfHwgENhIkqXoZpHorzGRWGK68b8GKBf0DKCy5TegLHxO8oTcHlm5hJNKckDlcA7MQ5wM2UkoS93DID/gPj79Fwz2Htt6+E643K4xG0DfQKv5lDv+CUjMjAYG7f/NYgDK6302fDp8HFy2WQpXVusj/AMT2PEbeA0W2gj2azwAAAAASUVORK5CYII=" width="17" height="14" alt="댓글달기 버튼 이미지">답변</button></div></div>';
                    a += '<div class="re_content" id="re_content'+ value.com_Num +'"></div><div class="reply" id="reply'+ value.com_Num +'"></div></div></div>';
                    
                 }
            	else if (boardWriter == id) {
               	 a += '<div class="commentContent" id="commentContent'+ value.com_Num +'">'+'<div class="com-txt">' + value.com_Content+ '</div>'; //댓글내용
                    a += '<div class="recommentbtn">';
                    a += '<button type ="button" class="button5" onclick="reply('+value.com_Num+');"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACIAAAAcCAYAAAAEN20fAAAAAXNSR0IArs4c6QAABIFJREFUSA2tl0lok0EUx5M0tVYpsVvqRhQFe6gH0VKkWrFKl1TrQaSggsvR/eAKoiJCbxZRwV0Ul4N6UbCLbU314EatC0b0oJY0Rg1aEcS0DWn9vfRLnH79EmPNwMt787b5z8z7ZiZmUwLN5XJZ+/r6ivr7+xfhPn9gYGAi3G42m7OQf8D99L9Aj5Cb8XtQVVXVSz/hZo7n2dTUZA+FQptJvpEBs+P5qjb8f9I/Q0wdgLyqLZZsCERWoLe3dx+JdkGjteB++EvonnAG+2qxWL4ij2YF8vCbhG4BfCG6DMhEPwg7YbPZ9hQXFwdEF6sNA9LS0jIjGAxeJeEcCSKZDzoJnaqoqJAtiNtkEj09PdU4ySTmijOxr1NSUlaXl5c/jxU8BEhjY2MBwS4ol2CZTa3D4agtKCjoi5Ugnp6tdbJaZ8k3kXyyXeVOp/OhUUwUiKwEBXkfpzzIQ2A1QbIV/9WYXBZgLpJkKTmlsBdVVlZ26JNaRAFiC9txCTEPx3epqaklyQAhuRm02263LyfvTcaxAep6e3v7GLGpLQwE1NtwKsLwi710lpWVeVSn/5ULCwuDbHENYJ6Qa5rf7z+gz2l2u92jPB6PDyDZfAVbmMFxvVNDQ0O7XpdIn1UtVP2kBlmRDgBZIAdjfYrYrV6vt0pAYPDyVZyIGFSOPfwFqbqRyAzsZlJyvmwifiVUF8ljBWGN1rkAmFDEoHK2a8jMVNu/yoA4R4wAWQX9AUJnBiStaZAN/2Wlng7XjkzDSfuMVekkeiagmLt5QDJZIYcIKDuFG7VEa0RfE0a5NN07xpva1tYmR8Vn0VlRjBUhPT1djmvDhk9SakRJ7hOZa0Tur0EgLE0XA+VzmE1A+UEc9C2ZNaLlFgCmtLQ0ubHDTVZEzox8inYa3BBIMmtkcFjTdHigtLQ0ugtSI61QGbRMk2FDW6I1MjTKZDKqGXLlyw6wE7dVfwFyBarFuIrDbafRBYctmTWyTgNwXeNhZpWHCyhvM1h1V1fXbrSHVAeRk1Ujra2tUyjQrayGj1P8hjpO+PYFyFSAuDFYGXQONfFKdUqGTH6zTJhcTkCs4ZSVSzbawpcee9mJZi80iqJtqK+vl2JKagPEURI6WY1bTPSyPnkYiCjZoiM41YF8MryNC2q23nmkfUAcJnYz9Dg3N3cl+cOnqZovCkSUrMx2nI4KGOgRYPbxdkhVA0YikytF4sh9kyfBL6Mc0ReaamRrVtA/DWVCH6FjGRkZp0tKSr4jx23Nzc22zMzMoDqg9m9AHtzZgFrC6t/RJzEEIk5U+CRO2/2IawlOg4dIJJffXegt5EffjW6sDEBf3hqLkYvQf6MgD+bk5JyTRxE2E5Obi60RWzrdDYA5L/pIiwkk4sCrfHwgENhIkqXoZpHorzGRWGK68b8GKBf0DKCy5TegLHxO8oTcHlm5hJNKckDlcA7MQ5wM2UkoS93DID/gPj79Fwz2Htt6+E643K4xG0DfQKv5lDv+CUjMjAYG7f/NYgDK6302fDp8HFy2WQpXVusj/AMT2PEbeA0W2gj2azwAAAAASUVORK5CYII=" width="17" height="14" alt="댓글달기 버튼 이미지">답변</button></div></div>';
                    a += '<div class="re_content" id="re_content'+ value.com_Num +'"></div><div class="reply" id="reply'+ value.com_Num +'"></div></div></div>';
                  
               }
            	else{
            		 a += '<div class="commentContent" id="commentContent'+ value.com_Num +'">'+'<div class="com-txt">' + value.com_Content+ '</div>'; //댓글내용
                     a += '<div class="recommentbtn">';
                     a += '<button type ="button" class="button5" onclick="reply('+value.com_Num+');"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACIAAAAcCAYAAAAEN20fAAAAAXNSR0IArs4c6QAABIFJREFUSA2tl0lok0EUx5M0tVYpsVvqRhQFe6gH0VKkWrFKl1TrQaSggsvR/eAKoiJCbxZRwV0Ul4N6UbCLbU314EatC0b0oJY0Rg1aEcS0DWn9vfRLnH79EmPNwMt787b5z8z7ZiZmUwLN5XJZ+/r6ivr7+xfhPn9gYGAi3G42m7OQf8D99L9Aj5Cb8XtQVVXVSz/hZo7n2dTUZA+FQptJvpEBs+P5qjb8f9I/Q0wdgLyqLZZsCERWoLe3dx+JdkGjteB++EvonnAG+2qxWL4ij2YF8vCbhG4BfCG6DMhEPwg7YbPZ9hQXFwdEF6sNA9LS0jIjGAxeJeEcCSKZDzoJnaqoqJAtiNtkEj09PdU4ySTmijOxr1NSUlaXl5c/jxU8BEhjY2MBwS4ol2CZTa3D4agtKCjoi5Ugnp6tdbJaZ8k3kXyyXeVOp/OhUUwUiKwEBXkfpzzIQ2A1QbIV/9WYXBZgLpJkKTmlsBdVVlZ26JNaRAFiC9txCTEPx3epqaklyQAhuRm02263LyfvTcaxAep6e3v7GLGpLQwE1NtwKsLwi710lpWVeVSn/5ULCwuDbHENYJ6Qa5rf7z+gz2l2u92jPB6PDyDZfAVbmMFxvVNDQ0O7XpdIn1UtVP2kBlmRDgBZIAdjfYrYrV6vt0pAYPDyVZyIGFSOPfwFqbqRyAzsZlJyvmwifiVUF8ljBWGN1rkAmFDEoHK2a8jMVNu/yoA4R4wAWQX9AUJnBiStaZAN/2Wlng7XjkzDSfuMVekkeiagmLt5QDJZIYcIKDuFG7VEa0RfE0a5NN07xpva1tYmR8Vn0VlRjBUhPT1djmvDhk9SakRJ7hOZa0Tur0EgLE0XA+VzmE1A+UEc9C2ZNaLlFgCmtLQ0ubHDTVZEzox8inYa3BBIMmtkcFjTdHigtLQ0ugtSI61QGbRMk2FDW6I1MjTKZDKqGXLlyw6wE7dVfwFyBarFuIrDbafRBYctmTWyTgNwXeNhZpWHCyhvM1h1V1fXbrSHVAeRk1Ujra2tUyjQrayGj1P8hjpO+PYFyFSAuDFYGXQONfFKdUqGTH6zTJhcTkCs4ZSVSzbawpcee9mJZi80iqJtqK+vl2JKagPEURI6WY1bTPSyPnkYiCjZoiM41YF8MryNC2q23nmkfUAcJnYz9Dg3N3cl+cOnqZovCkSUrMx2nI4KGOgRYPbxdkhVA0YikytF4sh9kyfBL6Mc0ReaamRrVtA/DWVCH6FjGRkZp0tKSr4jx23Nzc22zMzMoDqg9m9AHtzZgFrC6t/RJzEEIk5U+CRO2/2IawlOg4dIJJffXegt5EffjW6sDEBf3hqLkYvQf6MgD+bk5JyTRxE2E5Obi60RWzrdDYA5L/pIiwkk4sCrfHwgENhIkqXoZpHorzGRWGK68b8GKBf0DKCy5TegLHxO8oTcHlm5hJNKckDlcA7MQ5wM2UkoS93DID/gPj79Fwz2Htt6+E643K4xG0DfQKv5lDv+CUjMjAYG7f/NYgDK6302fDp8HFy2WQpXVusj/AMT2PEbeA0W2gj2azwAAAAASUVORK5CYII=" width="17" height="14" alt="댓글달기 버튼 이미지">답변</button></div></div>';
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