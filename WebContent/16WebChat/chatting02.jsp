<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>chatting02</title>
</head>
<body>

<input type="text" id="chat_id"
	value="<%=session.getId().substring(0, 10)%>"	 
	style="border:1px dotted red; width:200px;" />
<fieldset style="width:350px; text-align:center;">
	<legend>채팅창</legend>	
	<!-- 대화입력창 -->	
	<input type="text" id="inputMessage" style="width:300px; margin-bottom:5px;"/>
	<br />
	<input type="button" onclick="sendMessage();" value="보내기"/>
	<input type="button" onclick="disconnect();" value="채팅종료"/>	
	<br />
	<!-- 대화출력창 -->
	<textarea id="messageWindow" style="width:300px; height:400px; margin-top:10px;" readonly></textarea>
</fieldset>
<script>

	var messageWindow = document.getElementById("messageWindow");
	var inputMessage = document.getElementById('inputMessage');
	var chat_id = document.getElementById('chat_id').value;
	var webSocket = new	WebSocket("ws://localhost:8080/K07JSPServlet/ChatServer02");
	
	//연결되었을때 발생하는 이벤트
	webSocket.onopen = function(event){
		wsOpen(event);
	};
	webSocket.onmessage = function(event){
		wsMessage(event);
	};
	webSocket.onclose = function(event){
		wsClose(event);
	};
	webSocket.onerror = function(event){
		wsError(event);
	};
	function wsOpen(event){
		messageWindow.value +="연결성공\n"
	}
	function wsClose(event){
		messageWindow.value +="연결끊기 성공\n"		
	}
	function wsError(event){
		alert(event.data)
	}
	function wsMessage(event){
		//메세지를 구분자로 split
		var message = event.data.split("|");
		//전송한 사람의 아이디
		var sender = message[0];
		//채팅내용
		var content = message[1];
		if(content ==""){
			//채팅내용이 없다면 아무일도 하지 않는다
		}
		else{
			//내용이 있는경우에만 메세지 창에 내용을 추가한다.
			messageWindow.value += sender+":"+content +"\n";
		}
	}
	function sendMessage(){
		//대화창에 입력한 내용에 me추가
		messageWindow.value += "나(Me):"+inputMessage.value + "\n";
		//대화내용에 접속자아이드를 파이프기호로 연결한후 send를 이용해 서버로 전송
		webSocket.send(chat_id +'|'+inputMessage.value);
		//입력한 내용지우기.
		inputMessage.value="";
	}


</script>


</body>
</html>