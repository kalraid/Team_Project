<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="http://121.170.211.197:3010/socket.io/socket.io.js"></script>
<script>
var socket;
$(function(){
	// host = '192.168.0.67';
	port = '3010';
	
	host='121.170.211.197';
	connectToServer();
	
	$('#pyStart').on('click',function(){
		city =$('#city').val()
		ill = '대장암'
		var output = {
			city : city,
			select : 'city',
			ill : ill
		}
		socket.emit('pyStart', output);
		
		
		
	});
});


function connectToServer() {
	var options = {
		'forceNew' : true
	};
	var url = 'http://' + host + ':' + port;
	socket = io(url, options);
	socket.on('pyEnd', function(results) {
		console.log('Python 통신 끝');
		$('#resultBox').append("");
		$('#resultBox').append("<h2>Python 통신 끝</h2>"+
		"<p>"+results+"</p>")
		
	});
	};
</script>
<article>
	<select id="city">
		<option value="Seoul" selected="selected">서울</option>
		<option value="Busan">부산</option>
		<option value="Daegu">대구</option>
		<option value="Incheon">인천</option>
		<option value="Gwangju">광주</option>
		<option value="Daejeon">대전</option>
		<option value="Ulsan">울산</option>
		<option value="Sejoung">세종</option>
		<option value="Gyungki">경기</option>
		<option value="Gangwon">강원</option>
		<option value="Chungbuk">충북</option>
		<option value="Chungnam">충남</option>
		<option value="Jeonbuk">전북</option>
		<option value="Jeonnam">전남</option>
		<option value="Gyungbuk">경북</option>
		<option value="Gyungnam">경남</option>
		<option value="Jeju">제주</option>
	</select>
	<input type="button" id="pyStart" value="클릭"/>

	<div id="resultBox">
	</div>
</article>