<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2>아 배고프다</h2>
<div id="rst">



</div>
<input type="text" id="txt"/>

<script>
	document.getElementById("txt").onchange = function(){
		var val = this.value;
		this.value="";
		ws.send(val);
	}


	var ws = new WebSocket("ws://192.168.10.65/ws/basic");	
	// 4개 정도의 이벤트 처리가 가능하다 -> 설정이 가능한것들 
	ws.onopen=function(e){
		window.alert("서버측과 WS 연결 성공");
		console.log(e);
	}
	ws.onclose = function(e){
		window.alert("서버측과 WS 연결 해제");
		consloe.log(e);		
	}	
	ws.onerror = function(e){
		window.alert("서버측과 WS 연결 장애");
	}
	ws.onmessage = function(e){
		window.alert("서버측으로부터 메세지를 전달받음");
		console.log(e);
		window.alert(e.data + " / " + typeof e.data);
		
	}
	
	
</script>






