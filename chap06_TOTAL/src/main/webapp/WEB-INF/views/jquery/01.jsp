<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h3><span id="jq">JQuery</span> <small id="ch"></small></h3>
jquery의 기본 사용 형태는
<b>$(selector).action();</b>
이런식으로 되어있음.
<br />
javascript랑은 다르게, 선택된 요소(들)에 어떤 특정한 액션이 발생함.
<p>
	<c:forTokens items="월,화,수,목,금" delims="," var="str">
		<button class="wk" >${str }</button>
	</c:forTokens>
	<button id="r">리셋</button>
</p>

<script>
// id 설정된건 # ,  class는 . ,  tag는 태그이름
$("button").click(function(){	//버튼이라는 태그네임을 찾아서 실행
	console.log("button에 click 액션 설정함");
});

$(".wk").click(function(){		// wk라는 클래스를 찾아서 실행
	//window.alert(this.innerHTML);
	document.getElementById("ch").innerHTML = this.innerHTML;
	//$("#ch").innerHTML = this.HTML;  // <- 실행이 되지 않는다. 명령어가 따로 있기에..
});

$("#r").click(function(){		// r이라는 'id'를 찾아서 실행
	document.getElementById("ch").innerHTML = "";
//	$("#ch").innerHTML = "";
});



$("#jq").click(function(){	// onclick으로 설정하게 되면 안먹히게 됨.
	$("button").fadeToggle();
});

console.log(document.getElementById("jq"));	// javascript로 얻은 상태
console.log("===============");
console.log($("#jq")); // jquery로 얻은상태 /->  이것과
console.log("===============");
console.log($(document.getElementById("jq"))); // 이것은 같은 문법이다  맨위의 명령어는 작동이 되지 않는다.

/*
var ar = document.getElementsByClassName("wk");
	for(var i=0; i<ar.length; i++){
		ar[i].onclick = function(){
			document.getElementById("ch").innerHTML = this.innerHTML;
		}
	}
	document.getElementById("r").onclick = function(){
		document.getElementById("ch").innerHTML = "";
	}
	*/
</script>