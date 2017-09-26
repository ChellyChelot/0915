<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<h3>JQuery Simple AJAX</h3>
<div>
	<button id="a">AJAX1</button>
	<button id="b">AJAX2</button>
</div>
<script>
$("#a").click(function(){
	$.ajax({
		"type" : "get",	// default : "get"
		"async" : false,	// default : true
		"url" : "/jquery/dst02",
		"data": {
			"id" : "groza",
			
		}
	}).done(function(r){
		console.log(r+" / "+typeof r);
		var obj = JSON.parse(r);
		window.alert(obj.name+" / "+obj.gender);
	});
});

$("#b").click(function(){
	$.ajax({
		"url" : "/jquery/dst03",
		
	}).done(function(r){
		console.log(r+" / "+typeof r);
		var obj = JSON.parse(r);
		window.alert(r.name+" / "+r.gender);
	});
});


</script>