<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅방</title>
<script src="http://192.168.0.67:3010/socket.io/socket.io.js" ></script>
<script src="jquery-3.3.1.min.js"></script>
<style>
	.chat_top{
		height: 80%;
	}	
	.chat_bottom{
		height:10%;
	}
	.text_box{
		width: 90%;
		height : 3em;
	}
	.chat{
	border: 1px solid black;
	margin: 0 15px;
	}
	.inner_box{
	border: 1px solid black;
	padding: 10px;
	}
	
	.chat_right{
	/* 	width:100%; */
		
	}
	#chat_right_inner_box{
		border: 1px solid black;
		width:900px;
	}
	.chat_top{
	border: 1px solid black;}
</style>
<script>
	var host;
	var port;
	var socket;
	$(function(){
		host = '192.168.0.67';
		port = '3010';
		connectToServer();
		
		$("#sendButton").bind('click', function(event) {
			var chattype = $('#chattype option:selected').val();
			var sender = $('#senderInput').val();
			var recepient = $('#recepientInput').val();
			var data = $('#dataInput').val();

			var output = {
				sender : sender,
				recepient : recepient,
				command : chattype,
				type : 'text',
				data : data
			};

			if (socket == undefined) {
				connectToServer();
				return;
			};
			addToDiscussion('self', data);
			socket.emit('message', output);
		});
/* 
		$("#loginbutton").bind('click', function(event) {
			var id = $('#idinput').val();
			var password = $('#passwordinput').val();
			var alias = $('#aliasinput').val();
			var today = $('#todayinput').val();

			var output = {
				id : id,
				password : password,
				alias : alias,
				today : today
			};
			console.log('서버로 보낼 데이터 : ' + JSON.stringify(output));
			if (socket == undefined) {
				alert('서버에 연결되어 있지 않습니다. 서버연결해주세요ㅗ');
				return;

			}
			socket.emit('login', output);
		});

		$("#logoutbutton").bind('click', function(event) {
			var id = $('#idinput').val();

			var output = {
				id : id
			};
			console.log('서버로 보낼 데이터 : ' + JSON.stringify(output));
			if (socket == undefined) {
				alert('서버에 연결되어 있지 않습니다. 서버연결해주세요ㅗ');
				return;

			}
			socket.emit('loginout', output);
		});
 */
		$('#createroombutton').bind('click', function(event) {
			var roomid = $('#roomidinput').val();
			var roomname = $('#roomnameinput').val();
			var id = $('#idinput').val();

			var output = {
				command : 'create',
				roomid : roomid,
				roomname : roomname,
				roomowner : id
			};

			console.log('서버로 보낼 데이터 : ' + JSON.stringify(output));
			if (socket == undefined) {
				connectToServer();
				return;

			}
			socket.emit('room', output);
		});

		$('#updateroombutton').bind('click', function(event) {
			var roomid = $('#roomidinput').val();
			var roomname = $('#roomnameinput').val();
			var id = $('#idinput').val();

			var output = {
				command : 'update',
				roomid : roomid,
				roomname : roomname,
				roomowner : id
			};

			console.log('서버로 보낼 데이터 : ' + JSON.stringify(output));
			if (socket == undefined) {
				connectToServer();
				return;

			}
			socket.emit('room', output);
		});

		$('#deleteroombutton').bind('click', function(event) {
			var roomid = $('#roomidinput').val();
			var roomname = $('#roomnameinput').val();
			var id = $('#idinput').val();

			var output = {
				command : 'delete',
				roomid : roomid,
				roomname : roomname,
				roomowner : id
			};

			console.log('서버로 보낼 데이터 : ' + JSON.stringify(output));
			if (socket == undefined) {
				connectToServer();
				return;

			}
			socket.emit('room', output);
		});

		$('#joinRoomButton').bind('click', function(event){
			var roomId = $('#roomIdInput').val();
			
			var output={command : 'join', roomId : roomId};
			console.log('서버로 보낼 데이터 : '+JSON.stringify(output));
			
			if(socket == undefined){
				connectToServer();
				return;
			}
			
			socket.emit('room', output);
			
		});
		
		$('#leaveRoomButton').bind('click', function(event){
			var roomId = $('#roomIdInput').val();
			
			var output={command : 'leave', roomId : roomId};
			console.log('서버로 보낼 데이터 : '+JSON.stringify(output));
			
			if(socket ==undefined){
				connectToServer();
				return;
			}
			
			socket.emit('room', output);
			
		});

	});
	
	function connectToServer() {
		var options = {
			'forceNew' : true
		};
		var url = 'http://' + host + ':' + port;
		socket = io(url, options);

		socket.on('connect', function() {
			println('메인 채팅방에 접속되었습니다');

			socket.on('message', function(message) {
				console.log(JSON.stringify(message));
				
				/* println('<p>수신 메세지 : ' + message.sender + ', '
						+ message.recepient + ', ' + message.command + ', '
						+ message.type + ', ' + message.data + '</p>'); */
				addToDiscussion("other", message.data);

			});
		});

		socket.on('disconnect', function() {
			println('채팅방 접속이 종료되었습니다.');
		});

		socket.on('response', function(response) {
			console.log(JSON.stringify(response));
			println('응답메세지를 받았습니다. : ' + response.command + ',' + response.code
					+ ', ' + response.message);

		});
		
		socket.on('room', function(data) {
			console.log(JSON.stringify(data));

			println('<p>방 이벤트 : ' + data.command + '</p>');
			println('<p>방 이벤트 : ' + data.command + '</p>');

			if (data.command == 'list') {
				var roomcount = data.rooms.length;
				$('#roomlist').html('<p>방 리스트 ' + roomcount + '개</p>');
				for (var i = 0; i < roomcount; i++) {
					$('#roomlist').append(
							'<p>방 #' + i + ' : ' + data.rooms[i].id + ', '
									+ data.rooms[i].name + ', '
									+ data.rooms[i].owner + '</p>');

				}
			}

		});
		
		
	};

	function println(data) {
		console.log(data);
		$('#result').append('<p>' + data + '</p>');
	};
	
	function addToDiscussion(writer, msg){
	var img = 'resources/images/chating/man_two.jpg';
	if(writer =='other'){
		img = 'resources/images/chating/man_three.jpg';
		
	}
	
	var contents = "<li class='"+writer +"'>"
	+" <span class='avatar'>"
	+"  <img src='"+img+"'/>"
	+" </span>"
	+" <div class='messages'>"
	+"   <p>"+msg+"</p>"
	+"     <time datatime='2018-10-23 17:12'>17시 12분</time>"
	+" </div>"
	+"</li>";
	
	$(".discussion").prepend(contents);
	}
</script>
</head>
<body>
	<div class="row chat">
		<div class="col-md-2 inner_box chat_left">
			<div>
				<div class="content">
				<img id="iconImage" class="ui avatar image" src="resources/images/chating/man_one.jpg">
				<div id="titleText" class="header">채팅 방</div>
				</div>
			</div>
			<div>
				<input type="text" id="idinput" value="test01"> 
				<input type="password" id="passwordinput" value="123456">
				<input type="text" id="aliasinput" value="소녀시대"> 
				<input type="text" id="todayinput" value="좋은날!"> 
				<input type="button" id="loginbutton" value="로그인"> 
				<input type="button" id="logoutbutton" value="로그아웃">
			</div>
			<div>
				<input type="text" id="roomidinput" value="meeting01">
				<input type="text" id="roomnameinput" value="청춘들의 대화">
				<input type="button" id="createroombutton" value="방 만들기">
				<input type="button" id="updateroombutton" value="방 이름 바꾸기">
				<input type="button" id="deleteroombutton" value="방 없애기">
			</div>
			<div>
				<input type="button" id="joinRoomButton" value="방 입장하기">
				<input type="button" id="leaveRoomButton" value="방 나가기">
			</div>
			<br>
			<div>
				<div>
					<span>보내는 사람 아이디 : </span> 
					<input type="text" id="senderInput" value="test01">
				</div>
				<div>
					<span>받는 사람 아이디 : </span> 
					<input type="text" id="recepientInput"value="All">
				</div>
			</div>
			<div>
				<div>
					<select name ="chattype" id="chattype">
						<option value="chat">채팅</option>
						<option value="groupchat" selected>그룹 채팅</option>
					</select>
				</div>
			
		</div>
		</div>
		<div class="col-md-8 inner_box chat_middle" >
			<div class="chat_top">
				<h4 class="ui horizontal divider header">메세지</h4>
				<div class="ui segment" id="result"></div>
			</div>
			<div class="chat_bottom">
				<span><input type="text" id="dataInput" value="안녕!" class="text_box"></span>
				<input type="button" id="sendButton" value="전송">
			</div>
		</div>
		<div class="col-md-2 inner_box chat_right">
			<div id="chat_right_inner_box">
			</div>
		</div>
	</div>
</body>
</html>