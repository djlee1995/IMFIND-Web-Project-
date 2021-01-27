<<<<<<< HEAD

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
>>>>>>> main_dev
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
    	}
<<<<<<< HEAD
=======
    		/* 인덱스 css 다시하기 */
    		
		.container.commentBox{
/* 			border: 1px solid black; */
		}
		
		.container.iteminfo,
		.container.detailInfo,
		.container.commentBox{
			font-family: 'Noto Sans KR', sans-serif !important;
			width: 54vw;
			margin: 0 auto;
		}
		.infoText{
			padding-left: 10px;
			margin-left:18px;
		
		}
		.container.iteminfo{
			padding-left:0;
		}
		.head > h3{
			text-align: center;
			padding-top: 11px;
		 	font-family: 'Noto Sans KR', sans-serif !important;
		 	font-weight: 550 !important;
		}
		.head > div > label{
			padding : 0;
			margin : 0 9px 0 0;
		}
		.infoBody{
			margin: 15px 0 0 0;
			background: #f7f9fa;
			height: 225px;
		}
		.container.detailInfo{
			padding-left : 0;
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
				height: 340px;
			}
	
			#file{
				width: 50%;
			}	
			#file img{
				width:100%;
				height: 100%;
			}
			.infoText{
				display: flex;
				flex-direction:column;
				width:50%;
				margin:0;
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
			border-bottom : .2px solid rgba(0, 0, 0, .3);
			height: 100px;
		}
		.head > div >p{
			margin-bottom : 0;
			width : 40px;
		}
		#id{
			margin-right : 202px;
		}
		
		div.infoBody > label{
			margin-right : 30px;
			font-size : 2rem;
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
		/* background: #f7f9fa; */
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
>>>>>>> main_dev
    </style> 
</head>
<body>
     
<<<<<<< HEAD
   <%
       if(session.getAttribute("loginUser") == null && session.getAttribute("kakaoLoginUser") == null){
=======
	
   <%
      if(session.getAttribute("loginUser") == null && session.getAttribute("kakaoLoginUser") == null){
>>>>>>> main_dev
   %>
            <jsp:include page="${request.contextPath}/el/header"></jsp:include>      
   <%
       } else{
   %>
            <jsp:include page="${request.contextPath}/el/afterLoginHeader"></jsp:include>      
   <%
       }
   %>
    <!-- Header End -->
   <section>
   
<<<<<<< HEAD

<table id="data_output" align="center">
  <tr id="update" align="right">
    
  </tr>
  <tr>
    <th rowspan="6" colspan="3" id="file">
     
    </th>
    <th colspan="2" id="title"></th>
  </tr>
  <tr>
    <th>��ʱ�</th>
    <td id="pay"></td>
  </tr>
  <tr>
    <th>�н���</th>
    <td id="id"></td>
  </tr>
  <tr>
    <th>�нǳ�¥</th>
    <td id="lostdate">2020.10.13</td>
  </tr>
  <tr>
    <th>�н���ġ</th>
    <td id="loc"></td>
  </tr>

  <tr>
    <th colspan="2"><button style="width:100%;" type="button" name="button">�����ϱ�</button></th>
  </tr>
  <tr height="30px">
  </tr>
  <tr>
    <th colspan="5" align="left">�н�����</th>
  </tr>
  <tr>
    <td colspan="5" id="content">
    </td>
  </tr>
  <tr>
	<td colspan="5" align="center">
    <div id="map" style="width:500px; height:500px; margin-top:70px;"></div>
    </td>  
   </tr>
</table>
		<jsp:include page="../EJ/comment.jsp" flush="true" />
   </section>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.js" ></script> 
<script>
var lost_PostNum =<%=request.getParameter("lost_PostNum") %>
console.log(lost_PostNum)
var loginUser='<%=(String)session.getAttribute("loginUser")%>'

</script>
=======
   <div class="menu">
   		<i class="fas fa-home fa-1x"></i>
   		<span style="font-size : 1.5rem;">목록으로</span>
   </div>
   
   <div class="container iteminfo">
   		<div id="update"></div>
   		<div id="file">
   			
   		</div>
   		<div class="infoText">
   			<div class="head">
	   			<h3 id="title"></h3>
	   			<div>
	   				<label for="id">등록자</label>
		   			 <span id="id"></span>		
		   			<span id="lost_Re_Date"></span>
	   			</div>
   			</div>
   			<div class="infoBody">
   				<label for="pay">사례금</label>
	   			<span id="pay"></span>
	   			<label for="lostdate">분실 날짜</label>
	   			<span id="lostdate"></span>
	   			<label for="loc">분실 위치</label>
	   			<span id="loc"></span>   			
   			</div>
   		</div>
   </div>
   
   <div class="container detailInfo">
   		<div id="content">
   			<div class="content-head">
   				<div><h3 style="font-family:'Noto Sans KR', sans-serif !important;">분실 정보</h3></div>
   			</div>
   			<div id="content-body">
   				<p id="content-body-text"></p>
   			</div>
   		</div>
   		<div class="container-map">
   		 	<h3 style="margin-left:20px; font-size:24px; font-family:'Noto Sans KR', sans-serif !important;">분실위치</h3>
 			<div id="map" style="width:799px; height:340px; margin:16px 5px 0 15px;"></div>
   		</div>
   </div>
   
   <div class="container commentBox">
		<jsp:include page="../EJ/comment.jsp" flush="true" />   
   </div>
</section>



<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.js" ></script> 

<script>
	var lost_PostNum =<%=request.getParameter("lost_PostNum") %>
	console.log(lost_PostNum)
	var loginUser='<%=(String)session.getAttribute("loginUser")%>'
</script>

>>>>>>> main_dev
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5e9646f261380e768a278eb16f4f6768&libraries=services"></script>
<script src="${pageContext.request.contextPath}/resources/el/js/iteminfo.js"></script>

 <!-- Header Section Begin -->
 <jsp:include page="${request.contextPath}/NewFooter_JS"></jsp:include>
<<<<<<< HEAD
   <!-- Header End -->

</body>

=======
 <!-- Header End -->

</body>
>>>>>>> main_dev
</html>