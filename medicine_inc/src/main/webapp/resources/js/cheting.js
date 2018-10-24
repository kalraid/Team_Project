var host;
var port;
var socket;
var roomId;
$(function() {
	host = '192.168.0.67';
	port = '3010';

	connectToServer();

	$("#sendButton").bind('click', function(event) {
		var data = $('#dataInput').val();

		var output = {
			type : 'text',
			data : data,
			id : id
		};

		if (socket == undefined) {
			connectToServer();
			return;
		}
		;

		socket.emit('message', output);

	});

	$('#createroombutton').bind('click', function(event) {
		var roomname = $('#roomnameinput').val();
		var id2 = id;

		var output = {
			command : 'create',
			roomname : roomname,
			roomid : roomname,
			roomowner : id2
		};

		if (socket == undefined) {
			connectToServer();
			return;
		}

		socket.emit('room', output);
	});

	$('.roomListTd').bind('click', function(event) {

		roomId = this.id;
		alert(1);
		$(".roomListTd").css("color", "black");
		alert(2);
		$(this).css("color", "red");
		alert(3);
	});
	var leaveroom;

	$('#joinRoomButton').bind('click', function(event) {
		var output = {
			command : 'join',
			roomId : roomId
		};
		console.log('서버로 보낼 데이터 : ' + JSON.stringify(output));

		if (socket == undefined) {
			connectToServer();
			return;
		}
		socket.emit('room', output);
		leaveroom = roomId;
	});

	$('#leaveRoomButton').bind('click', function(event) {
		var output = {
			command : 'leave',
			roomId : leaveroom
		};
		console.log('서버로 보낼 데이터 : ' + JSON.stringify(output));

		if (socket == undefined) {
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
		var output = {
			loginid : id,
			roomname : '메인',
			roomid : '메인',
			roomowner : '관리자'
		};
		socket.emit('login', output);

	});

	socket.on('message', function(message) {
		if (message.id == id) {
			addToDiscussion("me", message);
		} else {
			addToDiscussion("other", message);
		}
	});

	socket.on('disconnect', function() {
		println('System : 채팅방 접속이 종료되었습니다.');
	});

	socket.on('response', function(response) {
		console.log(JSON.stringify(response));
		println('System : ' + response.message);
	});

	socket.on('loginList', function(data) {
		userList(data);
		roomList(data);
		println(data.message);
	});
	
	socket.on('room', function(data) {
		roomList(data);
	});

};

function userList(data) {
	$('#userDiv').empty();
	var login_ids = [];
	login_ids = data.login_ids;
	var contents = '<table class="listTable table table-bordered table-hover text-center" id="userList">';
	for (var i = 0; i < login_ids.length; i++) {
		contents += "<tr>" + "	<td>" + login_ids[i] + "</td>" + "</tr>";
	}
	contents += "</table>";
	$('#userDiv').append(contents);
}

function roomList(data) {
		var roomcount = data.rooms.length;
		$('.left_middle').empty();
		var contents = '<table class="listTable table table-bordered table-hover text-center" id="roomList">';
		for (var i = 0; i < roomcount; i++) {
			contents += "<tr>" + "	<td class='roomListTd'> [" + i + "] " + data.rooms[i].name
					+ "</td>" + "</tr>";
		}
		contents += "</table>";
		$('.left_middle').append(contents);
}

function println(data) {
	console.log(data);
	$('#result').append('<p>' + data + '</p>');

};

function addToDiscussion(writer, data) {
	var img;
	console.log(writer);
	if (writer == 'other') {
		img = 'resources/images/chating/man_two.jpg';
		var contents = "<li class='otherSend other'>"
				+ "<p class='otherId other'>" + data.id + "</p>"
				+ "<div class='otherMessages other'>"
				+ "   <p class='otherData other'>" + data.data + "</p>"
				+ " </div>" + "   <p class='otherTime other'>" + data.time
				+ "</p>" + "</li>" + "<br>";

	} else {

		img = 'resources/images/chating/man_three.jpg';
		var contents = "<li class='mySend my'>" + "<p class='myId my'>"
				+ data.id + "</p>" + "<div class='myMessages my'>"
				+ "   <p class='myData my'>" + data.data + "</p>" + " </div>"
				+ "   <p class='myTime my'>" + data.time + "</p>" + "</li>"
				+ "<br>";
	}
	;

	$("#result").append(contents);
}
