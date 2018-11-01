<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="http://192.168.0.67:3010/socket.io/socket.io.js"></script>
<script>
var socket;
var check;
var city;
var ill
$(function(){
	host = '192.168.0.67';
	port = '3010';
	
	// host='121.170.211.197';
	connectToServer();
	
	/*
	$('#pyStart').on('click',function(){
		city =$('#city').val()
		ill = $('#ill').val()
		var output = {
			city : city,
			select : 'city',
			ill : ill
		}
		check = 1;
		socket.emit('pyTest', output);
		
		
		
	});
	
	$('#pyTest').on('click',function(){
		city =$('#city').val()
		ill = $('#ill').val()
		check = 2;
		console.log(ill)
		var output = {
			city : city,
			select : 'ill',
			ill : ill
		}
		socket.emit('pyTest', output);
		
		
		
	});
	*/
	
	$('#pyTest').on('click',function(){
		city =$('#city').val()
		ill = $('#ill').val()
		$("#resultBox").empty();
		$("#resultBox").append("<div>")
		$("#resultBox").append("<img class='staticImages' src='resources/images/static/output_city"+city+".png'>")
		$("#resultBox").append("</div>")
		$("#resultBox").append("<div>")
		$("#resultBox").append("<img class='staticImages' src='resources/images/static/output_ill"+ill+".png'>")
		$("#resultBox").append("</div>")
	})
	
	$('#pyStart').on('click',function(){
		city =$('#city').val();
		ill = $('#ill').val();
		$("#resultBox").empty();
		$("#resultBox").append("<div>")
		$("#resultBox").append("<img class='staticImages' src='resources/images/static/output_city"+city+".png'>")
		$("#resultBox").append("</div>")
		$("#resultBox").append("<div>")
		$("#resultBox").append("<img class='staticImages' src='resources/images/static/output_ill"+ill+".png'>")
		$("#resultBox").append("</div>")
	
	})
		
		
});


function connectToServer() {
	var options = {
		'forceNew' : true
	};
	var url = 'http://' + host + ':' + port;
	socket = io(url, options);
	
	socket.on('pyEnd', function(results) {
		console.log('Python 통신 끝');
		$("#resultBox").empty();
		$("#resultBox").append("<div>")
		$("#resultBox").append("<img class='staticImages' src='resources/images/static/output_city"+city+".png'>")
		$("#resultBox").append("</div>")
		$("#resultBox").append("<div>")
		$("#resultBox").append("<img class='staticImages' src='resources/images/static/output_ill"+ill+".png'>")
		$("#resultBox").append("</div>")
		
		
	});
	
	
	};
</script>
<style>
	.staticImages{
		width: 950px;
		height: 600px;
		
	}
</style>
<article>
	<div style="text-align:center"><h2>암 관련 통계정보</h2>
	<br>
	출처 : 국민건강공단 
	<br>
	</div>
	<div class="form-group" style="text-align:center ">
	<select id="city" class="form-control">
		<option value="0" selected="selected">서울</option>
		<option value="1">부산</option>
		<option value="2">대구</option>
		<option value="3">인천</option>
		<option value="4">광주</option>
		<option value="5">대전</option>
		<option value="6">울산</option>
		<option value="7">세종</option>
		<option value="8">경기</option>
		<option value="9">강원</option>
		<option value="10">충북</option>
		<option value="11">충남</option>
		<option value="12">전북</option>
		<option value="13">전남</option>
		<option value="14">경북</option>
		<option value="15">경남</option>
		<option value="16">제주</option>
	</select>
	<br>
	<select id="ill" class="form-control">
		<option value="0" selected="selected">폐암</option>
		<option value="1">위암</option>
		<option value="2">간암</option>
		<option value="3">대장암</option>
		<option value="4">유방암</option>
		<option value="5">자궁경부암</option>
		<option value="6">입술구강암</option>
		<option value="7">식도암</option>
		<option value="8">담낭암</option>
		<option value="9">담도암</option>
		<option value="10">췌장암</option>
		<option value="11">후두암</option>
		<option value="12">소장암</option>
		<option value="13">뼈및관절연골암	</option>
		<option value="14">피부암</option>
		<option value="15">중피성연조직암</option>
		<option value="16">난소암</option>
	</select>
	<br>
	<input class="btn btn-default" type="button" id="pyStart" value="도시별"/>
	<input class="btn btn-default" type="button" id="pyTest" value="질병별"/>
	</div>
	<div id="reuslt">
		<div id="resultBox">
			<div>
				<img id = "reusltImage" class='staticImages' src="resources/images/static/output_city0.png">
			</div>
			<div>
				<img id = "reusltImage" class='staticImages' src="resources/images/static/output_ill0.png">
			</div>
		</div>
	</div>
</article>