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

        .button1 {
            background-color: white;
            color: black;
            border: 2px solid white;
            font-size: 12px;
            padding: 10px;
     
            text-align: center;
            align-items: center;

        }

        .button1:hover {
            background-color: #e7e7e7;
        }

        .button2 {
            background-color: white;
            /*color: black;*/
            border: 2px solid white;
            font-size: 12px;
            padding: 10px;
        }

        .button2:hover {
            background-color: #e7e7e7;
        }
        
        .button3 {
            background-color: white;
            color: black;
            border: 2px solid white;
            font-size: 12px;
            padding: 10px;
     
            text-align: center;
            align-items: center;

        }

        .button3:hover {
            background-color: #e7e7e7;
        }
    </style>  
</head> 
<body>

    <div class="container">
		<form name="commentInsertForm" method="post" enctype="multipart/form-data">
	        <div class="comtitle"><h3>댓  글</h3></div>
	
	        <div class="cominput">
	           <textarea class="commentbox" name="Com_Content" placeholder="댓글을 입력해주세요."></textarea>
	           
	           <div class="com2">
	           
	               <div class="com_btn">
	              	  <button type="button" class="button3">취소</button>
	                  <button type="button" name="commentInsertBtn" class="button1" onclick="insertBtnClick()">등록</button>
	                  
	                  
	                  <button type="button" class="button2">
	                  <i class="fas fa-images fa-lg" ></i></button>
	                  <input type="checkbox" name="s_com">비밀댓글
	               </div>
	               <span style="color:#aaa;" id="counter">(0 / 최대 200자)</span>
	          		
	           </div>  
	        </div>
		</form>
    </div> 
    
    <div class="commentList"></div>
    <script src="${pageContext.request.contextPath}/resources/el/js/comment.js"></script>  
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
 
</body>
</html>