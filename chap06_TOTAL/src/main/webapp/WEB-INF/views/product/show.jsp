<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- ---------------------------------------------------- --%>
<style>
input, textarea, button {
	padding: 4px;
	font-family: 맑은고딕;
	font-size: 9pt;
} 
</style> 
<div align="center" style="line-height: 35px">
	<h2>
		<a href="/product/all" style="text-decoration: none; color: black;">경매 물품</a>
	</h2>  
	<hr />
	<div 
		style="width: 80%; border-radius: 10px; background-color: #e6dfdf; padding-left: 20px;"
		align="left">
		<input type="hidden" id="num" value="${one.NUM }" />
		<h3 style="margin-bottom: 0px;">${one.NAME }</h3>
		<p style="margin-top: 0px;">
			현재가 ${one.SPRICE }  (시작가 : ${one.SPRICE }) 
		</p>
		<p style="padding-left: 10px;">
			<small>즉구가 : ${one.EPRICE } | 종료일 :
				${one.ENDDATE } </small>
		</p>
	</div> 
	<div>  
	</div>  
	<c:if test="${!empty auth}">
		<button type="button">입찰신청</button>
	</c:if>
</div> 

