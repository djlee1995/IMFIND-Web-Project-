<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">
    
 <!-- Css Styles -->
     <!-- Header Section Begin -->
      <jsp:include page="${request.contextPath}/NewHeader_CSS"></jsp:include>
    <!-- Header End -->
      <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/home/css/css_YH.css" type="text/css">
      
    <style>
       section{
            position: relative;
		    top: 134px;
		    width: 60vw;
		    margin: 0 auto;
       }
          /* 인덱스 css 다시하기 */
          
      .container.commentBox{
/*          border: 1px solid black; */
      }
      
      .container.iteminfo,
      .container.detailInfo,
      .container.commentBox{
         font-family: 'Noto Sans KR', sans-serif !important;
         width: 54vw;
         margin: 0;
      }
      .infoText{
         padding-left: 10px;
         margin-left:18px;
      	 height: 100%;
      }
      .container.iteminfo{
         padding-left:0;
      }
      .head > p{
        font-size: 2.2rem;
	    text-align: start;
	    padding-top: 11px;
	    font-family: 'Noto Sans KR', sans-serif !important;
	    font-weight: 600 !important;
	    color: black;
	    margin-bottom: 9px;
      }
      .head > div > label{
         padding : 0;
         margin : 0 9px 0 0;
      }
      .infoBody{
         margin: 15px 0 0 0;
         height: 225px;
         border-bottom : 1px solid rgb(238, 238, 238);
         border-top : 1px solid rgb(238, 238, 238);
         display: flex;
		 flex-wrap: wrap;
		 padding : 12px 0 10px 0;
      }
      .infoBody > div { 
      	width:76%;
      }
      .container.detailInfo{
         padding-left : 0;
      }
      div#loc{
      	height: auto;
      }
      /* section 가로 크기 */
      @media(min-width: 1900px){
      .container.iteminfo,
      .container.detailInfo,
      .container.commentBox{
            width: 45vw;
            margin: 0 auto;
         }
      }
      @media(max-width: 500px){
      .container.iteminfo,
      .container.detailInfo,
      .container.commentBox{
            width: 100vw;
            margin: 0 auto;
         }
      }
      
      /* 요소 크기 */
      @media(min-width: 1200px){
         .container.iteminfo{
            display : flex;
            height: 300px;
         }
   
         #file{
            height: 100%;
    		width: 38%;
         }   
         #file img{
            width:100%;
            height: 100%;
            border-radius: 11px;
    		object-fit: cover;
         }
         .infoText{
            display: flex;
            flex-direction:column;
            width:59%;
         	height: 100%;
            margin:0;
            margin-left: 21px;
         }
         .menu{
            position: fixed;
            left: 235px;
         }
         #content{
            padding-top:23px;
            height : auto;
         }
         .content-head{
            width: 50%;
            height: 49px;
            border: .1px solid black;
            border-bottom: none;
         }
         
         /* comment */
         .container.commentBox{
            margin-top:19px;
            height : auto;
         }
         #comment-form{
            width:100%;
         }
         .like-con{
         	width:50%;
         	height:56px;
         }
         .like-btn{
         	border: none;
		    width: 99%;
		    height: 48px;
		    border-radius: 3px;
		    display: flex;
		    justify-content: center;
		    align-items: center;
         }
         .like-btn > p { 
         	margin : 0;
         }
         .like-group{
         	display:flex;
		    justify-content: center;
		    align-items: center;
		    margin-top: 12px;
         }
         ._12xcxtl{
         	border-top: 1px solid #DDDDDD !important;
         	margin: 8px 0;
         }
         p#title{
         	display: flex;
			justify-content: space-between;
			align-items: center;
			margin-bottom: 0;
         }
      }
      @media(max-width: 500px){
         .container.iteminfo{
            display : flex;
            flex-direction : column;
         }   
         #file{
            height:auto;
         }      
         .infoText{
            width:100%;
         }
      }
      .head{
         height: 100px;
         margin-top:-7px;
      }
      .head > div >p{
         margin-bottom : 0;
         width : 40px;
      }
	  #id{
		margin-right: 47px;
	  }
      #id, 
      #lost_Re_Date{
      	font-size:14px;
      	font-weight:100;
      }
      .fa-user,
      .fa-calendar-alt{
      	font-size:14px;
      }
      
      div.infoBody > label{
         margin-right : 30px;
         font-size : 17px;
      }
      div.infoBody > span{
         font-size : 2rem;
      }
      .infoBody > label:nth-child(1){
         margin-right : 58px;
      }
      div.infoBody > span{
         margin-right : 170px;
      }
      #content-body {
         border: .2px solid rgba;
         margin-top: 26px;
         padding-top: 19px;
         border-top: .2px solid rgba(0, 0, 0, .3);
         border-bottom: .2px solid rgba(0, 0, 0, .3);
         margin-bottom: 23px;
         padding-bottom: 19px;
         min-height: 201px;
      }
      .container-btn{
         width: 54vw;
         margin: 0 auto;
         padding-left: 689px;
      }
      .container-btn > input{
         border : none;
         background: none;
         font-family: 'Noto Sans KR', sans-serif !important;
      }
      .container-btn > input:hover{
         color:black;
      }
      div#file > img{
         width:100% !important;
      }
	  icon-con > div > label{
	  	margin-bottom:0;
	  }
      .menu{
      	display : flex;
      	flex-direction : column;
      }
	 #like_img{
	 	font-size: 17px;
		color: gray;
		margin-right:9px;
		margin-bottom:2px;
	 }
	 #like-con {
		display: flex;
		justify-content: center;
		align-items: center;
		border: 1px solid rgb(238, 238, 238);
		padding: 0 10px;
		border-radius: 7px;
		height: 31px;
	}
	 #like-con > span{
	 	font-size:2rem;
	 }
	.icon-con{
		display:flex;
	    align-items:center;
	}
     .storage-con{
         overflow: hidden;
         position: fixed;
      	 border : 1px solid black;
      	 width: 100px;
      	 left : 1114px;
      	 top : 257px;
      	 /* margin-left: 100px; */
      	 border: 1px solid #e5e5e5;
      	 border-radius: 4px;
    	 /* margin-top: 76px; */
    	 padding: 3px 3px;
      }
      #storage {
      	 display: flex;
      	 flex-direction: column-reverse;
      	 justify-content: center;
    	 align-items: center;
    	 margin-top:10px;
      } 
      #storage > a:nth-child(1) > div > img{
      	width:50%;
      }
      .menu-set{
      	display: flex;
	    justify-content: center;
	    align-items: center;
	    flex-direction: column;
      }
      .historybox > a img {
         width: 90px !important;
         height : 90px;
         object-fit:cover;
         border-radius: 4px;
      }
       .storage-board-title > p{
      	 font-size : 11px;
      	 margin-bottom:0;
      	 overflow:hidden;
      	 width : 92px;
      	 white-space:nowrap;
      	 text-overflow:ellipsis;
      	 max-height: 16px;
      }
	  .storage-title{
	  	border-bottom: 1px solid #e5e5e5;
	  }
	  .storage-title > p {
	  	margin-bottom:0;
	  	text-align:center;
	  }
	  .historybox{
	  	margin-top : 5px;
	  }
	  .gototop{
	    position:unset;
	    bottom: 20px;
	    right: 20px;
	    z-index: 999;
	    opacity: 0;
	    visibility: hidden;
	    -webkit-transition: 0.5s;
	    -o-transition: 0.5s;
	    transition: 0.5s;
	  }
	  .gototop a{
	  	width: 92px;
    	height: 22px !important;
	  }
  	  .gototop a i{
    	height: 23px !important;
  	  }
      div.container.detailInfo > div.container-map > h3{
          margin-left:5px !important;
       }
    </style> 
</head>
<body>

	  <%
	      String id = (String)session.getAttribute("loginUser");
	      
	  %>
    
    <jsp:include page="${request.contextPath}/el/afterLoginHeader"></jsp:include>

    <!-- Header End -->
	   
   <section>

	   <div class="storage-con">
		   <div class="storage-title"><p>메뉴</p></div>
	       <div id="storage">
	       		<a href="./item">
	       			<div class="menu-set">
	    	   			<img src="./resources/home/images/list.png" alt="" />
		       			<p>목록으로</p>
		       		</div>
	       		</a>
	       		<a href="./">
		       		<div class="menu-set">
		       			<img src="./resources/home/images/home.png" alt="" />
		       			<p>홈으로</p>
		       		</div>
	       		</a>
	       </div>
	       <div class="storage-title">
	   			<div class="gototop js-top">
					<a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
				</div>
	       </div>
	   </div>
	
   
   <div id="output"></div>   
   <div class="container iteminfo">
<!--          <div id="update"></div> -->
         <div id="file">
         </div>
         <div class="infoText">
            <div class="head">
               <p id="title">
               </p>
			   <div class="_12xcxtl" style="margin-top: 11px; width: 32px;"></div>        
               <div class="icon-con">
	               	<div>
	                  <label for="id"><i class="fas fa-user"></i></label>
	                   <span id="id" class="getId"></span>      
	               	</div>
	                <span id="lost_Re_Date"></span>
               </div>
            </div>       
            <div class="infoBody">
               <label for="pay" style="margin-right: 53px;">사례금</label>
               <div id="pay"></div>
               <label for="lostdate">분실 날짜</label>
               <div id="lostdate"></div>
               <label for="loc">분실 위치</label>
               <div id="loc"></div>
            </div>
             <div class="like-group">
	           	<div class="like-con">
	           		<a class="like-btn" href="#comm"><i class="far fa-comment-dots"></i> <p>연락하기</p></a>
	           	</div>
             </div>      
         </div>
   </div>
   
   <div class="container detailInfo">
         <div id="content">
            <div id="content-body">
               <h3 style="font-size: 24px; font-family: 'Noto Sans KR', sans-serif">분실정보</h3>
               <div class="_12xcxtl" style="margin-top: 11px; width: 32px;"></div>        
               <p id="content-body-text"></p>
            </div>
         </div>
         <div class="container-map">
             <h3 style="margin-left:20px; font-size:24px; font-family:'Noto Sans KR', sans-serif !important;">분실위치</h3>
             <div class="_12xcxtl" style="margin-top: 11px; width: 32px;"></div>        
          <div id="map" style="width:799px; height:340px; margin:16px 5px 0 15px;"></div>
         </div>
   </div>
   
   <div class="container commentBox" id="comm">
      <jsp:include page="../EJ/comment.jsp" flush="true" />   
   </div>
</section>

<!-- 웹소켓 -->
<form action="./socket" method="post" name="socketForm">
	<input type="hidden" name="sender"/>
	<input type="hidden" name="reciever"/>
	<input type="hidden" name="lost_postnum"/>
</form>


<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.js" ></script> 

<script>
   var lost_PostNum =<%=request.getParameter("lost_PostNum") %>
   var loginUser='<%=(String)session.getAttribute("loginUser")%>'
   
   function openChat(e){
	   
	   if(loginUser != boardWriter){
		   var boardWriter = document.querySelector('span#id').innerText;
		   
		   alert(boardWriter)
		   document.querySelector('input[name="sender"]').value = loginUser;
		   document.querySelector('input[name="reciever"]').value = boardWriter;
		   document.querySelector('input[name="lost_postnum"]').value = lost_PostNum;
		   
		   document.socketForm.submit();
	   }
   
   }
   document.querySelector('DOMContentLoaded', function(){
	   
	   var boardWriter = document.querySelector('span#id').innerText;
	   var finder;
	   
   })
</script>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5e9646f261380e768a278eb16f4f6768&libraries=services"></script>
<script src="${pageContext.request.contextPath}/resources/el/js/iteminfo.js"></script>

 <!-- Header Section Begin -->
 <jsp:include page="${request.contextPath}/NewFooter_JS"></jsp:include>
 <!-- Header End -->

</body>
</html>