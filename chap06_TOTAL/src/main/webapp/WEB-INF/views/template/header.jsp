<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div>
	<h1>SPRING WEB MVC</h1>
	<p id="alt">
	
	</p>
</div>
<script>
	var aws = new WebSocket("ws://192.168.10.65/ws/alert");
	aws.onmessage = function(e) {
		//console.log(e.data + " / " + typeof e.data);
		document.getElementById("alt").innerHTML  = e.data;
	}
	document.getElementById("alt").onclick = function(){
		this.innerHTML="";
	}
</script>
