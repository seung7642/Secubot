<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>

<body>
	<form action="">
			<!--  송신 메시지 작성하는 창  -->
			<input id="textMessage" type="text">

			<!--  송신 버튼  -->
			<input onclick="sendMessage()" value="Send" type="button">

			<!--  종료 버튼  -->
			<input onclick="disconnect()" value="Disconnect" type="button">
		</form>
		<textarea id="messageTextArea" cols="50" rows="10"></textarea>

		<script type="text/javascript">
			var webSocket = new WebSocket("ws://localhost:8080/SIEM/websocket");
			var messageTextArea = document.getElementById("messageTextArea");

			webSocket.onopen = function(message) {
				messageTextArea.value += "Server connect...\n";
			};

			webSocket.onclose = function(message) {
				messageTextArea.value += "Server Disconnect...\n";
			};

			webSocket.onerror = function(message) {
				messageTextArea.value += "error...\n";
			};

			webSocket.onmessage = function(message) {
				messageTextArea.value += "Recieve From Server => "
						+ message.data + "\n";
			};

			// Send 버튼을 누르면 실행되는 함수
			function sendMessage() {
				var message = document.getElementById("textMessage");
				messageTextArea.value += "Send to Server => " + message.value
						+ "\n";

				// 웹 소켓으로 textMessage 객체의 값을 보낸다
				webSocket.send(message.value);

				// textMessage 객체의 값 초기화
				message.value = "";
			}

			function disconnect() {
				webSocket.close();
			}
		</script>
	</body></body>

</html>