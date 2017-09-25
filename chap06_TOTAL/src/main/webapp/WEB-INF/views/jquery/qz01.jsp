<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h3>JQuery QZ01</h3>

Jquery 연습문제#1
<hr />
<input type="checkbox" id="all" />
<hr />
<c:forEach var="i" begin="10" end="19">
	<input type="checkbox" class="item" value="${i}" /> ${i } .........<br />
</c:forEach>
</hr>

<button id="move">휴지통으로</button>


<script>
	
	$("#move").click(function(){
		// length property를 이용하는 방식.
		// JQuery로 객체(들) 선택시 length라는 변수를 갖게 됨.
		for(var i=0; i<$(".item").length; i++){
			// $(".item")[i]  <- 이런방식으로는 되지않는다.
			// get이나 eq를 쓰면 된다★(eq가 더 좋다고 말씀하셨다)
			console.log($(".item").eq(i));	// JQuery 객체
			console.log($(".item").get(i));	// HTML DOM
			console.log("=======================");
			
			if($(".item").eq(i).prop("checked")){
				window.alert($(".item").eq(i).val());
			}
			
			/*
			if($($(".item").get(i).prop("checked")){ //안먹힌다 구버전이라서 
				$(window.alert($(".item").get(i).val());
			})); // 이것도 안좋은방식!!
			*/
			/*
			if($(".item").get(i).checked){ // 
				window.alert($(".item").get(i).value);
			}
			*/
		}
	});
	
	
	$("#all").click(function() {
		// $(".item").prop("checked",true);  // <- ??
		$(".item").prop("checked", $(this).prop("checked"));
	});
	
	
	
	
	
	
	/*// 다른방식으로 해보자.
	$("#move").click(function(){
		($(".item").each(function(){
			if($(this).prop("checked")){
				window.alert($(this).val());
			}	//if 
		}));	// item function
			
	}); // move function
*/
		
		/*	if($(".item").prop("checked")){
			window.alert($(".item").val()); // 잘못된 방식
		}*/

</script>