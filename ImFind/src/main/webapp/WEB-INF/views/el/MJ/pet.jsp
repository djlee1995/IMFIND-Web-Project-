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
<!-- Google Font --
    <link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">
    <!-- Css Styles -->
 <!-- Header Section Begin -->
   <jsp:include page="${request.contextPath}/NewHeader_CSS"></jsp:include>
 <!-- Header End -->
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/el/css/bootstrap.min.css"
   type="text/css">
<%-- <link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/el/css/font-awesome.min.css"
   type="text/css"> --%>
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/el/css/themify-icons.css"
   type="text/css"> <!-- 지우면 안됨 -->
<%-- <link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/el/css/elegant-icons.css"
   type="text/css">
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/el/css/owl.carousel.min.css"
   type="text/css">
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/el/css/nice-select.css"
   type="text/css">
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/el/css/jquery-ui.min.css"
   type="text/css">
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/el/css/slicknav.min.css"
   type="text/css">
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/el/css/style.css"
   type="text/css"> --%>
<!-- 조회페이지 css (mj) -->
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/el/MJ/item.css" type="text/css">
<!-- Bootstrap cdn 설정  for 페이징  -->   
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">   
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">   
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">   
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>   
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
   <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
 <div id="preloder">
      <div class="loader"></div>
   </div>
   <section>
   <!-- <div class="container1"> -->
   <div class="petcontainer1">
      <div class="petrow1">
         <div id="petcustom-search-input">
            <div class="petinput-group col-md-12">
               <input type="text" class="input-lg" name="input-search" 
                  onKeypress="enterkey();" placeholder="search.." > 
                  <span class="petinput-group-btn" >
                  <button class="btn" type="button" >
                     <i class="ti-search"></i>
                  </button>
               </span>
            </div>
         </div>
      </div>
   </div>
    <div class = "petsi">
    <select class="petselect" id="petsido">
      <option value="">시/도 선택하세요</option>
    </select>
    <select class="petselect" id="petsigugun">
      <option value="">시/군/구 선택하세요</option>
    </select>
    <select class="petselect" id="petdong">
      <option value="">읍/면/동 선택하세요</option>
    </select>
  </div>
   <div class="petcard-list-con">
      <div>
      <table id="petoutput" border="1" align="center"></table>
   </div>
   </div>
   </section>
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
</body>
</html>