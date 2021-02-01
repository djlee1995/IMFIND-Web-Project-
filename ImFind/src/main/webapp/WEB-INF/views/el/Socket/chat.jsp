<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page session  = "true" %>
<%@ page import="com.spring.imfind.el.EJ.BoardVO" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="uft-8">
<title>Insert title here</title>

<% 
	String id = (String)request.getSession().getAttribute("id"); 
%>

<script>
	let obj = ${}
	var log = function(s) { // s 는 메세지 문자열 
		document.getElementById('output').textContent += (s + "\n");
	}
	/* ws : 웹 소켓 변환.  <websocket:mapping handler="socketHandler" path="/boardcasting.do"/>  요 path로 요청이 들어오면 socketHandler가 실행된다. */
	w = new WebSocket("ws://localhost:8080/imfind/reply");
	
	/* on이 붙으면 해당 이벤트가 발생시 자동 호출되는 메서드다. */
	w.onopen = function(){
		alert('WebSocket connected !');
	}
	w.onmessage = function(e){ //여기서 메세지 전달 받는다. event 객체의 data 있따. 
		console.log(e); // messageEvent
		log(e.data.toString()); // log라는 이름으로 정의해준 익명함수 
	}
	w.onclose = function(e){ 
		log('webSocket closed');
	}
	w.onerror = function(e){
		log("webSocket error !! : " + e.data);
	}
	
	window.onload = function(){
		document.getElementById("send_button").onclick = function(){
			var input = document.getElementById("input").value;
			w.send( 'test ' + '> ' + input ); 
			// 아 메세지가 서버에 갔다가 오는구나.....
			document.getElementById("input").value = "";
		};
	}
</script>
</head>
<body>


	<input type="text" id="input" placeholder="input message....." size="55"/>
		<button id="send_button">Send</button>

		<p>대화명 : <%=id %> </p>
		
		<textarea id="output" readonly  cols="80" rows="30"></textarea>
</body>
</html>
