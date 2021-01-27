<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="UTF-8">
<meta name="description" content="Fashi Template">
<meta name="keywords" content="Fashi, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>I'm Find</title>

   <jsp:include page="${request.contextPath}/NewHeader_CSS"></jsp:include>

    
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/css/bootstrap.min.css" type="text/css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/css/themify-icons.css" type="text/css"> <!-- 지우면 안됨 -->

<!-- 조회페이지 css (mj) -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/MJ/item.css" type="text/css">
<!-- Bootstrap cdn 설정  for 페이징  -->   
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">   
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">   
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">   
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>   
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
  <link href="${pageContext.request.contextPath}/resources/el/YH/select2/css/select2.css"  rel="stylesheet" />

  
<style>
#paging-head{
position : fixed;
z-index : 100;
}
.dropbtn {
  background-color: #ea2129;
  color: white;
  padding: 16px;
  font-size: 16px;
  border: none;
}
.dropdown {
  position: relative;
  display: inline-block;
}
.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f1f1f1;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}
.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}
section{
   position: relative;
   top: 93px;
}
.dropdown-content a:hover {background-color: #ddd;}
.dropdown:hover .dropdown-content {display: block;}
.dropdown:hover .dropbtn {background-color: #3e8e41;}

	/* YH */
		.photo > img{
			width: 100% !important;
			height : 175px;
			object-fit:contain;
			border : none;
		}
		.card-con{
			border : 
		}
		.subinfo{
			display: flex;
			justify-content: space-between;
			align-items: center;
			padding-top: 3px;
		}
		div.date{
			margin-right:5px;
		}
		div.title{
			margin: 7px 0 0 10px;
			color : black;
			font-weight: 500;
			font-size:14px !important;
		}
		div.card-con > a{
			text-decoration:none;
		}
		div.loc{
			padding-top: 6px;
			margin-left: 10px;
		}
		.selectBox{
			position: relative;
			top: -34px;
			display: flex;
			justify-content: center;
		}
		/* section 가로 크기 */
		@media(min-width: 1900px){
			.searchbar,
			.selectBox,
			.cardList{
				width: 50w;
				margin: 0 auto;
			}
		}
		@media(min-width: 1200px){
			.searchbar,
			.selectBox,
			.cardLlst{
				width: 64vw;
				margin: 0 auto;
			}
			.card-wrapper{
				display:flex;
				flex-wrap:wrap;
			}
			.card-con{
				width: 180px;
				height: 265px;
				border : 1px solid rgb(238, 238, 238);;
				margin:7px;
			}
			
		}
		@media(max-width: 500px){
			.searchbar,
			.selectBox,
			.cardList{
				width: 100vw;
				margin: 0 auto;
			}
		}
		.container1.searchbar{
			position: relative;
			top: -53px;
		}
		
		/* 요소 크기 */
</style>
</head>
<body>
      
   <%
       if(session.getAttribute("loginUser") == null && session.getAttribute("kakaoLoginUser") == null){
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
   <!-- Page Preloder -->
   <div id="preloder">
      <div class="loader"></div>
   </div>
   
   <section>
	   <!-- <div class="container1"> -->
	   <div class="container1 searchbar">
	      <div class="row1">
	         <div id="custom-search-input">
	            <div class="input-group col-md-12">
	               <input type="text" class="input-lg" name="input-search" 
	                  onKeypress="enterkey();" placeholder="search.."/ > 
	                  <span class="input-group-btn" >
	                  <button class="btn" type="button" >
	                     <i class="ti-search"></i>
	                  </button>
	               </span>
	            </div>
	         </div>
	      </div>
	   </div>
	   
	  <div class="container1 selectBox">
		    <div class = "si">
   			    <select class="js-example-basic-single" id="sido">
			    	<option value="">시/도 선택하세요</option>
		    	</select>
		    	<select class="js-example-basic-single" id="sigugun">
		      		<option value="">시/군/구 선택하세요</option>
		    	</select>
		    	<select class="js-example-basic-single" id="dong">
		      		<option value="">읍/면/동 선택하세요</option>
		    	</select>
			  <!--   <select class="form-select form-select-lg mb-3" id="sido" aria-label="Default select example">
			    	<option value="">시/도 선택하세요</option>
		    	</select>
		    	<select class="form-select form-select-lg mb-3" id="sigugun">
		      		<option value="">시/군/구 선택하세요</option>
		    	</select>
		    	<select class="form-select form-select-lg mb-3" id="dong">
		      		<option value="">읍/면/동 선택하세요</option>
		    	</select> -->
		  </div>
	   </div> 





	   
	   <div class="container1 cardLlst">
	   
	   		<div class="card-wrapper">
	   			
	   		</div>
		   <div class="card-list-con">
			   <div>
			      <table id="output" border="1" align="center"></table>
			   </div>
			   <page aria-label="...">
			 		<ul class="pagination pagination-sm" id = "numbers_mypage_post1"></ul>
			   </page>
		   </div>
	   </div>
   </section>
   
   
   <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
   
   <!-- Js Plugins -->
   <script
      src="${pageContext.request.contextPath}/resources/el/js/jquery-3.3.1.min.js"></script>
   <script
      src="${pageContext.request.contextPath}/resources/el/js/bootstrap.min.js"></script>
   <script
      src="${pageContext.request.contextPath}/resources/el/js/jquery-ui.min.js"></script>
   <script
      src="${pageContext.request.contextPath}/resources/el/js/jquery.countdown.min.js"></script>
   <script
      src="${pageContext.request.contextPath}/resources/el/js/jquery.nice-select.min.js"></script>
   <script
      src="${pageContext.request.contextPath}/resources/el/js/jquery.zoom.min.js"></script>
   <script
      src="${pageContext.request.contextPath}/resources/el/js/jquery.dd.min.js"></script>
   <script
      src="${pageContext.request.contextPath}/resources/el/js/jquery.slicknav.js"></script>
   <script
      src="${pageContext.request.contextPath}/resources/el/js/owl.carousel.min.js"></script>

   <!--게시글 조회 js 시작-MJ -->
       <script src="${pageContext.request.contextPath}/resources/el/js/item.js"></script>
   <!--게시글 조회 js 끝-MJ -->
   <!--게시글 조회 행정동js 시작-MJ -->
        <script src="${pageContext.request.contextPath}/resources/el/js/hangjungdong.js"></script>
   <!--게시글 조회 행정동js 끝-MJ -->
         <!-- jQuery Easing -->
   <script src="${pageContext.request.contextPath}/resources/home/js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
   <!-- Waypoints -->
   <script src="${pageContext.request.contextPath}/resources/home/js/jquery.waypoints.min.js"></script>
   <!-- Flexslider -->
   <script src="${pageContext.request.contextPath}/resources/home/js/jquery.flexslider-min.js"></script>
   <!-- Magnific Popup -->
   <script src="${pageContext.request.contextPath}/resources/home/js/jquery.magnific-popup.min.js"></script>
   <script src="${pageContext.request.contextPath}/resources/home/js/magnific-popup-options.js"></script>
   <!-- Main -->
   <script src="${pageContext.request.contextPath}/resources/home/js/main.js"></script>
   <script src="${pageContext.request.contextPath}/resources/el/YH/select2/js/select2.min.js" /></script>
    
</body>
</html>