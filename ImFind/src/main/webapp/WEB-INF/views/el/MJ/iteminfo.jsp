<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<script>
var lost_PostNum = <%= request.getParameter("lost_PostNum") %>;
console.log(lost_PostNum)
</script>
<script src="${pageContext.request.contextPath}/resources/el/js/iteminfo.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js" ></script> 
</body>
</html>