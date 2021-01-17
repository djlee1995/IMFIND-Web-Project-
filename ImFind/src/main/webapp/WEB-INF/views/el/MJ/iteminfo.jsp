<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>


<!-- var postnum;
	var title;
	var content;
	var redate;
	var recount;
	var file;
	var pay;
	var item;
	var loc;
	var lostdate;
	var id; -->
<table id="data_output" align="center">
  <tr id="update" align="right">
    
  </tr>
  <tr>
    <th rowspan="6" colspan="3" id="file">
     
    </th>
    <th colspan="2" id="title"></th>
  </tr>
  <tr>
    <th>사례금</th>
    <td id="pay"></td>
  </tr>
  <tr>
    <th>분실자</th>
    <td id="id"></td>
  </tr>
  <tr>
    <th>분실날짜</th>
    <td id="lostdate">2020.10.13</td>
  </tr>
  <tr>
    <th>분실위치</th>
    <td id="loc"></td>
  </tr>

  <tr>
    <th colspan="2"><button style="width:100%;" type="button" name="button">연락하기</button></th>
  </tr>
  <tr height="30px">
  </tr>
  <tr>
    <th colspan="5" align="left">분실정보</th>
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
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.js" ></script> 
<script>
var lost_PostNum = <%= request.getParameter("lost_PostNum") %>
console.log(lost_PostNum)
var loginUser=<%=(String)session.getAttribute("loginUser")%>
var kakaoLoginUser <%=(String)session.getAttribute("kakaoLoginUser")%>

</script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5e9646f261380e768a278eb16f4f6768&libraries=services"></script>
<script src="${pageContext.request.contextPath}/resources/el/js/iteminfo.js"></script>
<jsp:include page="../EJ/comment.jsp" flush="true" />

</body>
</html>