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

 <!-- Header Section Begin -->
   <jsp:include page="${request.contextPath}/NewHeader_CSS"></jsp:include>
 <!-- Header End -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/css/bootstrap.min.css" type="text/css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/css/themify-icons.css" type="text/css"> <!-- 지우면 안됨 -->

<!-- 조회페이지 css (mj) -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/MJ/item.css?after" type="text/css">
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
   top: 180px;
}
.dropdown-content a:hover {background-color: #ddd;}
.dropdown:hover .dropdown-content {display: block;}
.dropdown:hover .dropbtn {background-color: #3e8e41;}
/* YH */
   .photo > img{
      width: 100% !important;
      height : 175px;
      object-fit:cover;
      border : none;
      border-radius: 11px;
   }
   .subinfo{
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding-top: 3px;
      font-size: 12px;
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
      font-size: 12px;
   }
   .selectBox{
      position: relative;
      top: -34px;
      display: flex;
      justify-content: center;
   }
   /* section 가로 크기 */
   @media(min-width: 1700px){
      .searchbar,
      .selectBox,
      .cardList{
         width: 50vw;
         margin: 0 auto;
      }
   }
   @media(min-width: 1200px){
         .searchbar,
         .selectBox,
         .cardList{
            width: 60vw;
            margin: 0 auto;
         }
         .card-wrapper{
            display:flex;
            flex-wrap:wrap;
           /*  padding: 0 67px; */
         }
         .card-con{
            width: 180px;
            height: 265px;
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
   .card-wrapper{
      margin : 0 auto;
   }
   .cardList{
      display : flex;
      justify-content: center;
      align-items : center;
   }
    .simpleinfo > .title{
    	 overflow:hidden;
      	 width : 160px;
      	 white-space:nowrap;
      	 text-overflow:ellipsis;
      }
   /* 요소 크기 */
   
    /* 은지 추가 */
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
	  }
	  .historybox{
	  	margin-top : 5px;
	  }
	  .loc{
	  	 overflow:hidden;
      	 width : 160px;
      	 white-space:nowrap;
      	 text-overflow:ellipsis;
	  }
</style>
</head>
<body>

   <jsp:include page="${request.contextPath}/el/afterLoginHeader"></jsp:include>      

    <!-- Header End -->
   <!-- Page Preloder -->
   <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
 <div id="preloder">
      <div class="loader"></div>
  </div>

<section>
   
   <!-- <div class="container1"> -->
   <div class="container1 searchbar">
      <div class="row1">

      </div>
   </div>
   
   <div class="container1 selectBox">
     </div>    
      <div class="container1 searchbar2">
      	<label for="input-search" class="input-label">
			<div class="input-con">
				<div class="input-key">키워드</div>
				<div style="display:flex;">
					<input type="text" id="input-search" placeholder="어떤 분실물을 찾으시나요?"/>
					<button class="selectBtn key" type="button"  onkeyup="enterkey();"><i class="fas fa-search" style="color:white;"></i></button>
				</div>
			</div>
      	</label>
      	<div class="input-loc-con">
      		<div class="con">
		      	<div class="input-con loc">
					<div class="input-loc-title">위치</div>
					<div class="input-loc">
						<div class = "petsi">
			                <select class="js-example-basic-single" id="petsido" style="width:130px;">
				                <option value="" style="font-weight:200; font-style:italic;">시/도 선택하세요</option>
				             </select>
				             <select class="js-example-basic-single" id="petsigugun" style="width:130px;">
				                  <option value="" style="font-weight:200; font-style:italic;">시/군/구 선택하세요</option>
				             </select>
				             <select class="js-example-basic-single" id="petdong" style="width:130px;">
				                  <option value="" style="font-weight:200; font-style:italic;">읍/면/동 선택하세요</option>
				             </select>
				        </div>
					</div>
				</div>
		      	<div class="input-con pay">
					<div class="input-loc-title">사례금</div>
					<div class="input-loc pay">
						<input type="checkbox" id="payChk" class="bb"/>
						<label for="payChk" class="bb" >사례금</label>
					</div>
				</div>
				<div class="bt">
	       			<button class="selectBtn" onclick="selectBtn();"><i class="fas fa-search" style="color:white;"></i></button>
				</div>
      		</div>
      	 </div>
      </div>
      
      <div class="middle-con">
	      <div class="storage-con">
			   <div class="storage-title"><p>최근 본 게시물</p></div>
		       <div id="storage"></div>
		  </div>
		  <div class="container1 cardList">
		        <div class="card-wrapper">
		        
		        </div>
		      <div class="petcard-list-con">
		         <div>
		            <table id="petoutput" border="1" align="center"></table>
		         </div>
		      </div>
		  </div>
      </div>

  
   </section>
   <script>var id='<%=(String)session.getAttribute("loginUser")%>'</script>
   <!-- Js Plugins -->
      <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
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
   <script
      src="${pageContext.request.contextPath}/resources/el/js/main.js"></script>
   <!--게시글 조회 js 시작-MJ -->
       <script src="${pageContext.request.contextPath}/resources/el/js/pet.js"></script>
   <!--게시글 조회 js 끝-MJ -->
   <!--게시글 조회 행정동js 시작-MJ -->
        <script src="${pageContext.request.contextPath}/resources/el/js/hangjungdong.js"></script>
   <!--게시글 조회 행정동js 끝-MJ -->
         <!-- jQuery Easing -->
   <script src="${pageContext.request.contextPath}/resources/home/js/jquery.easing.1.3.js"></script>
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