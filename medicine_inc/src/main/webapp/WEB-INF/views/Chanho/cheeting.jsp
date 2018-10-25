<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅방</title>
<script src="http://192.168.0.67:3010/socket.io/socket.io.js"></script>
<script src="resources/js/jquery-3.2.1.min.js"></script>
<script src="resources/js/cheting.js"></script>
<script src="jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/cheeting.css" />
</head>
<script>
var id= "${sessionScope.id}";
</script>
<body>
	<div class="row chat">
		<div class="col-md-2 inner_box chat_left">
			<div class="left_top">
				<span><input type="text" id="roomnameinput" value="방 이름" ></span>
				<input type="button" id="createroombutton" value="만들기">
			</div>
			<div class="left_middle">
				<table class="listTable table table-bordered table-hover text-center" id="roomList">
					<tr>
						<td class="roomListTd" id="1">방 1</td>
					</tr>
					<tr>
						<td class="roomListTd" id="2">방2</td>
					</tr>
					<tr>
						<td class="roomListTd" id="3">방3</td>
					</tr>
				</table>
			</div>
			<div class="left_bottom">
				<span><input type="button" id="joinRoomButton" value="입장"></span>
				<span><input type="button" id="leaveRoomButton" value="나가기"></span>
			</div>
		</div>
		<div class="col-md-8 inner_box chat_middle" >
			<div class="chat_top">
				<div id="result"></div>
			</div>
			<div class="chat_bottom">
				<span><input type="text" id="dataInput" value="안녕!" class="text_box"></span>
				&nbsp;&nbsp;
				<input type="button" id="sendButton" value="전송">
			</div>
		</div>
		<div class="col-md-2 inner_box chat_right">
			<div id="chat_right_inner_box">
				<div id="userDiv">
				<table class="listTable table table-bordered table-hover text-center" id="userList">
					<tr>
						<td>로그인 되지 않았습니다.</td>
					</tr>
				</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>