<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
span, input, button {
	padding: 3px;
}
</style>
<h3>JQuery 연습#3</h3>
<small>현재 생각나는 것 5개를 적어주세요. (필요없으면 X)</small>
<div>
	<c:forEach var="v" begin="1" end="5">
		<div class="div" style="margin: 3px;">
			<span>→${v} SLOT </span><input type="text" />
			<button class="ubt">▲</button>
			<button class="dbt">▼</button>
			<button class="xbt">X</button>
		</div>
	</c:forEach>
</div>
<script>
$(".ubt").click(function(){
	
	$(this).parent().prev().before($(this).parent());
});

$(".dbt").click(function(){
	$(this).parent().next().after($(this).parent());
});

$(".xbt").click(function(){
	if($(this).parent().find("input").val().length!=0){
		if(window.confirm("작성한 내용이 존재합니다. \n 정말로 슬롯을 삭제하시겠습니까?")==false)
			return;
	}
	$(this).parent().remove();
});

</script>