<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div align="center">
	<h3>칭구찾기</h3>
	<small>찾고싶은 친구의 ID를 입력해보세요!</small>
	<p>
		<input type="text" id="srch" style="padding: 2px; width: 60%; font-size: 12pt;"/>
	</p>
</div>

<script>
	//	keypress, keydown, keyup
	//	select * from member where is like${id}
	// hint : List<Map> [{},{},{}] < - ?? 
	$("#srch").keyup(function(){
		console.log($(this).val() );
	});
</script>