<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
	input, textarea, button {
		padding:5px;
		font-family: 맑은고딕;
	}
</style>
<div align="center">
<h3>쪽지전송</h3>
<div align="left" style="width: 70%; line-height: 30px;">
	<form action="/memo/send" method="post" autocomplete="off">
		<p>
			<b>받을사람</b><br /><input type="text" name="receiver" placeholder="받을사람"
				 style="width: 100%;" />
		</p>
		<p>
			<b>보낼내용</b><br />
			<textarea rows="10" name="content" placeholder="글내용"
				style="width: 100%;"></textarea>
		</p>
		<p>
			<button type="submit">글등록</button>
			<button type="reset">재작성</button>
		</p>
	</form>
</div>
</div>