<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h3>JQuery 연습#2</h3>
아래 선택된 항목에 따라 총 상품금액을 계산해서 출력하는script를 작성.
<hr />
<div>
	<h3>삼성 노트북 코어 i5</h3>
	판매가 : <input id="cost" value="650250" readonly="true"/>
	<hr />
	수량 :
	<button id="m">-</button>
	<input type="number" style="width: 40px;" value="1" min="1" />
	<button id="p">+</button>
	<hr />
	옵션 : 
	<ul style="list-style: none;">
	<input type="checkbox" class="option" data="4000"  />RAM 추가 (+4,000)
	<input type="checkbox" class="option" data="34000" />HDD추가(+34,000) 
	<input type="checkbox" class="option" data="22000" />외장그래픽카드추가(+22,000) 
	<input type="checkbox" class="option" data="42000" />OS포함(+42,000)
	</ul>
<hr/>

</div>


<script>
	$(".opt").change(function(){ //선생님 샘플
		console.log(typeof $(this).arrt("data"));
		console.log($(this).attr("data")+100);
		console.log(typeof parseInt($(this).attr("data")) );
		console.log(parseInt($(this).attr("data")) + 100);
	});
	
	


</script>
