<%@ page contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>채팅</title>
<script type="text/javascript" src="/rentacar/resources/js/chat/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="/rentacar/resources/js/chat/sockjs-0.3.min.js"></script>
<script type="text/javascript">
	var wsocket;
	if('${session_nick}'!=""){
		var nickname = '${session_nick}';
	} else{
		var nickname = '${session_name}';
	}
	function connect() {
		wsocket = new SockJS("/rentacar/echo.do");
		/* wsocket = new WebSocket("ws://localhost:8080/rentacar/echo.do", "protocolOne"); */
		wsocket.onopen = onOpen;
		wsocket.onmessage = onMessage;
		wsocket.onclose = onClose;
	}
	function disconnect() {
		wsocket.close();
	}
	function onOpen(evt) {
		appendMessage("연결되었습니다.");
	}
	function onMessage(evt) {
		var data = evt.data;
		if (data.substring(0, 4) == "msg:") {
			appendMessage(data.substring(4));
		}
	}
	function onClose(evt) {
		wsocket.send("msg:"+nickname+" Out");
		appendMessage("연결을 끊었습니다.");
		history.back();
	}
	
	function send() {
		/* var nickname = $("#nickname").val(); */
		var msg = $("#message").val();
		wsocket.send("msg:"+nickname+":" + msg);
		$("#message").val("");
	}
	
	function send2() {
		/* var nickname = $("#nickname").val(); */
		wsocket.send("msg:"+nickname+"입장");
	}

	function appendMessage(msg) {
		$("#chatMessageArea").append(msg+"<br>");
		var chatAreaHeight = $("#chatArea").height();
		var maxScroll = $("#chatMessageArea").height() - chatAreaHeight;
		$("#chatArea").scrollTop(maxScroll);
	}

	$(document).ready(function() {
		wsocket = new SockJS("/rentacar/echo.do");
		/* wsocket = new WebSocket("ws://localhost:8080/rentacar/echo.do", "protocolOne"); */
		wsocket.onopen = onOpen;
		wsocket.onmessage = onMessage;
		wsocket.onclose = onClose;
		
		$('#message').keypress(function(event){
			var keycode = (event.keyCode ? event.keyCode : event.which);
			if(keycode == '13'){
				send();	
			}
			event.stopPropagation();
		});
		$('#sendBtn').click(function() { send(); });
		$('#enterBtn').click(function() { connect(); });
		$('#exitBtn').click(function() { disconnect(); });
	});
</script>
<style>
#chatArea {
	width: 450px; height: 300px; overflow-y: auto; border: 1px solid black;
}
</style>
</head>
<body>
	<!-- 이름:<input type="text" id="nickname"> -->
	<!-- <input type="button" id="enterBtn" value="입장"> -->
	<input type="button" id="exitBtn" value="나가기">
    
    <h1>대화 영역</h1>
    <div id="chatArea"><div id="chatMessageArea"></div></div>
    <br/>
    <input type="text" id="message">
    <input type="button" id="sendBtn" value="전송">
</body>
</html>

