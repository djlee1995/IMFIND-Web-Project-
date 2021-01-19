<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<table id="data_output" align="center">
</table>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script> 
<script>
var lost_PostNum = <%= request.getParameter("lost_PostNum") %>;
console.log(lost_PostNum)
</script>
<script src="${pageContext.request.contextPath}/resources/el/js/iteminfo.js"></script>
<jsp:include page="../EJ/comment.jsp" flush="true" />

</body>
</html>