<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<style>
.fa-exclamation-circle{
    position: relative;
    top: -37px;
    left: 11px;
    z-index: 10000;
    color: red;
    font-size: 2rem;
}
	.my-alert{
		position: relative;
	    top: 74px;
	    color: #004085;
	    background-color: #cce5ff;
	    border-color: #b8daff;
        border: 1px solid transparent;
    	border-radius: .25rem;
    	height: 43px;
    	padding-top: 11px;
    	text-align:center;
    	display:none;
	}
</style>
<script>
 	var log = function(s) { // s 는 메세지 문자열 
		//document.getElementById('output').textContent += ("소켓연결");
	} 
	/* ws : 웹 소켓 변환.  <websocket:mapping handler="socketHandler" path="/boardcasting.do"/>  요 path로 요청이 들어오면 socketHandler가 실행된다. */

	w = new WebSocket("ws://localhost:8080/imfind/reply");
	
	/* on이 붙으면 해당 이벤트가 발생시 자동 호출되는 메서드다. */
	w.onopen = function(){
		console.log('WebSocket connected !');
	}
	w.onmessage = function(e){ //여기서 메세지 전달 받는다. event 객체의 data 있따. 
		console.log(e); // messageEvent
		
 		let $com_alert = $('div.my-alert');
		$com_alert.html(e.data)
		$com_alert.css('display', 'block');
		
		let $alert_icon = $('.fa-exclamation-circle');
		$alert_icon.css('display', 'block');
		
		setTimeout(function(){
			$com_alert.css('display', 'none')
		}, 2000)} 
	
	w.onclose = function(e){ 
		log('webSocket closed');
	}
	w.onerror = function(e){
		log("webSocket error !! : " + e.data);
	}
	
</script>

</head>
<body>
<div class="my-alert">메세지 도착</div>
</body>
</html>