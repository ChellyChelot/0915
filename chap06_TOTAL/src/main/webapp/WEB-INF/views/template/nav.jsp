<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div align="right">
	<c:choose>
		<c:when test="${empty auth }">
			<a href="/login">로그인</a> | <a href="/join">회원가입</a> 	| <a
				href="/chat">오픈채팅</a>
		</c:when>
		<c:otherwise>
			<p>
				<b>${auth.ID } <i>(${auth.NAME })</i>, LOG ON
				</b>
			</p>
			<p>
				<a href="/my/info">내정보</a> | <a href="/my/profile">프로필</a> | <a
					href="/logout">로그아웃</a> | <a href="/chat">오픈채팅</a>
			</p>
		</c:otherwise>
	</c:choose>
</div>
<c:if test="${!empty auth }">
	<script>
		var lsw = new WebSocket("ws://192.168.10.61/ws/login");
		
		lsw.onmessage = function(e) {
			console.log(e.data);
			var obj = JSON.parse(e.data);
			switch(obj.mode) {
			case "memo":
				var m = obj.sender+"로부터 메시지가 도착하였습니다.\n확인하시겠습니까?";
				if(window.confirm(m)) {
					location.href="/memo/list";
				}
			}
		}
		
	</script>
</c:if>







