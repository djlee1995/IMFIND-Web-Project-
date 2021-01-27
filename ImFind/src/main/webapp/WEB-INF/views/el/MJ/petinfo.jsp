<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
   <section>
<table id="petdata_output" align="center">
  <tr id="petupdate" align="right">
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
    <th>�ֿϵ��� �̸�</th>
    <td id="pet"></td>
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
    <td colspan="5" id="content">rms
    </td>
  </tr>
  <tr>
	<td colspan="5" align="center">
    <div id="map" style="width:500px; height:500px; margin-top:70px;"></div>
    </td>  
   </tr>
</table>
		<jsp:include page="../EJ/pet_comment.jsp" flush="true" />
   </section>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.js" ></script> 
<script>
var Pet_PostNum =<%=request.getParameter("Pet_PostNum") %>
console.log(Pet_PostNum)
var loginUser='<%=(String)session.getAttribute("loginUser")%>'
</script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5e9646f261380e768a278eb16f4f6768&libraries=services"></script>
<script src="${pageContext.request.contextPath}/resources/el/js/petinfo.js"></script>
 <!-- Header Section Begin -->
 <jsp:include page="${request.contextPath}/NewFooter_JS"></jsp:include>
   <!-- Header End -->
</body>
</html>