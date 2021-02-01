<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<title>조회</title>
<meta charset="utf-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- <link type="text/css" href="style/jquery.jscrollpane.css" rel="stylesheet" media="all" />
 --><link
   href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900"
   rel="stylesheet">

<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/if/css/style.css?after">

<style>
   /* MJ */
.logoset{
   display: flex;
    justify-content: space-between;
}
.logonav{
    background: white;
}
nav {
    position: fixed;
    top: 0;
    width: 100vw;
    left: 0;
    z-index: 100;
}
.top-logoset{
    box-shadow: 0 2px 4px 0 hsl(0deg 0% 81% / 50%);
    height: 73px !important;
    display: flex;
}
.container-logoset{
    width: 75vw;
    margin: 0 auto;
    padding: 0;
}
#logoimfindid{
   padding: 5px 10px;
    color: #000;
}
#logoimfindid{
   text-transform: uppercase;
    font-weight: 700;
    font-family: "Space Mono", Arial, serif;
    color:#fff;
    font-size: 31px;
}
#imfindspan{
    color:blue;
    position: relative;
    font-size: 31px;
    position: relative;
    bottom: 74px;
    left: 143px;
      font-weight: 700;
    font-size: 42px;
}
#logoimfindid > a{
   font-family: "Space Mono", Arial, serif !important;
   font-size: 42px;
}
.logoif,
.logoesle,
.logopolice,
.logoetc,
.logoselect,
.logophone{
   padding: 5px 10px;
    color: #000;
    font-family: "Noto sans KR", sans-serif;
    font-size: 15px;
    padding: 29px 15px 15px 29px;
}
.logomenuifelse{
   display: flex;
   float: right;
    position: relative;
    left: -47px;
}
}
.manual > li {
   text-transform: uppercase;
    font-weight: 700;
    font-size: 40px;
    padding-left:1.5em;text-indent:-1.5em;

}
.h2o2 {
   font-family: Roboto,Noto Sans KR, Arial, sans-serif;
   margin: 30px;
}
.iseoulu{
   padding: 20px 0px 20px 0px;
}
</style>
</head>
<body>

   <nav class="logonav" role="logonavrole">
      <div class="top-logoset">
         <div class="container-logoset">
            <div class="logoset">
               <div class="logorow">
                  <div class="logoimfind">
                     <div id="logoimfindid" style="width: 90px;">
                        <a href="./index.if">
                        IMFIND
                        <span id="imfindspan">.</span>
                     </div>
                  </div>
               </div>
                <div class="logomenuifelse">
                   <div class="logoif">
                      <a href="index.if">
                         IF
                      </a>
                   </div>
                   <div class="logoesle">
                      <a href="./home.do">ELSE</a>
                   </div>
                   <div class="logopolice">
                      <a href="index.if">경찰청</a>
                   </div>
                   <div class="logoetc">
                      <a href="etc_index.if">etc</a>
                   </div>
                   <div class="logoselect">
                      <a href="select.if">조회</a>
                   </div>
                  <div class="logophone">
                     <a href="#" onclick="window.open('https://www.handphone.or.kr/','','height=800px, width=800px')">핸드폰</a>
                  </div>
                </div>          
            </div>             
         </div>
      </div>
   </nav>
   <div class="wrapper d-flex align-items-stretch">
      <!-- style="background-image: url(${pageContext.request.contextPath}/resources/if/images/bg_1.jpg); -->
      <nav id="sidebar" class="order-last" class="img">
         <div class="custom-menu">
            <button type="button" id="sidebarCollapse" class="btn btn-primary">
            </button>
         </div>
         <div class="" >
            <!-- 조회 리스트 뿌려줄 공간 -->
            <!-- 구역 표시때문에 border색 지정해줌 바꾸삼 -->
       
            <div class="nav-content" style="height:835px;">
             <div class="movie"><iframe width="450" height="315" src="https://www.youtube.com/embed/3XYyHq2JBn4" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe> 
            </div>
               <div class="iseoulu">
                  <img style="cursor:pointer;" onclick="window.open('https://www.lost112.go.kr/','','height=800px, width=800px')" width="45%" height="80px" src="./resources/if/images/p_mark.PNG">
                  <img style="cursor:pointer;" onclick="window.open('https://www.seoul.go.kr/main/index.jsp','','height=800px, width=800px')" width="45%" height="80px" src="./resources/if/images/s_mark.PNG">
               </div>
               <div class="datadiv">
                  <select name="data" id="sido1"></select>
                  <select name="data" id="gugun1"></select>
                  <select name="data" id="kind"></select>
                     <button id="dataBtn">검색</button>      
              </div>
               <table id="output">
               </table>
            </div>
         </div>
         <div class="footer">
            <div class="police">
               <div class="manual">
                  <h4 class="h2o2">이용방법</h4>
                    <li>주소 옆 이미지를 누르면 쉽게 길을 찾을 수 있어요.<br></li>
                     <li>이미지를 클릭하면 공공기관 이름이 나와요.<br></li>
                     <li>공공 기관명을 클릭하면 분실물 정보와 해당 기관을 확인할 수 있어요.<br></li>
                     <li>분실물을 선택하면 해당 분실물의 상세정보를 알 수 있어요.<br></li>
             </div>
            </div>
        </div> 
      </nav>
      
      

      <!-- Page Content  -->
      <div id="content" >
         <!-- 지도 -->
         <div id="map" style="width:100%; height:93%;">
         </div>
      </div>
   </div>
      
   <script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.js" ></script> 
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5e9646f261380e768a278eb16f4f6768&libraries=clusterer,services"></script>
   <script src="${pageContext.request.contextPath}/resources/if/js/select.js"></script>
   <script src="${pageContext.request.contextPath}/resources/if/js/area.js"></script>
   <script
      src="${pageContext.request.contextPath}/resources/if/js/bootstrap.min.js"></script>
   <script src="${pageContext.request.contextPath}/resources/if/js/main.js"></script>
    
</body>

</html>