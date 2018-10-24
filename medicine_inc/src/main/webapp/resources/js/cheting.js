	var host;
	var port;
	var socket;
	var roomId;
	$(function(){
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
			};
			
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

		$('.roomList').bind('click', function(event){
			
			roomId = this.id;
			$( ".roomList" ).css("color","black");
			$( this ).css( "color", "red" );
		});
		var leaveroom;
		
		$('#joinRoomButton').bind('click', function(event){
			var output={command : 'join', roomId : roomId};
			console.log('서버로 보낼 데이터 : '+JSON.stringify(output));
			
			if(socket == undefined){
				connectToServer();
				return;
			}
			socket.emit('room', output);
			leaveroom = roomId;
		});
		
		
		$('#leaveRoomButton').bind('click', function(event){
			var output={command : 'leave', roomId : leaveroom};
			console.log('서버로 보낼 데이터 : '+JSON.stringify(output));
			
			if(socket == undefined){
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
					loginid : id
				};
			socket.emit('login', output);
			
			
		});

		socket.on('message', function(message) {
			if(message.id = id){
				addToDiscussion("me", message);
			}else{
			addToDiscussion("other", message);
			}
		});
		
		socket.on('disconnect', function() {
			println('System : 채팅방 접속이 종료되었습니다.');
		});

		socket.on('response', function(response) {
			console.log(JSON.stringify(response));
			println('System : '+response.message);
		});
		
		socket.on('loginList',function(data){
			$('#userList').empty();
			var login_ids = [];
			login_ids = data.login_ids;
			var contents;
			for (var i = 0; i < login_ids.length; i++) {
				contents +=
					"<tr>"+
					"	<td>"+login_ids[i]+"</td>"+
					"</tr>";
			}
				$('#userList').append(contents);
				println(data.message);
		});
		
		
		socket.on('room', function(data) {
			console.log(JSON.stringify(data));

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
	
	function addToDiscussion(writer, data){
	var img;
	if(writer =='other'){
		img = 'resources/images/chating/man_three.jpg';
		var contents = "<li class='mySend'>"
			+" <span class='myAvatar'>"
			+"  <img src='"+img+"'/>"
			+" </span>"
			+" <div class='myMessages'>"
			+"   <p class='myId'>"+data.id+"</p>"
			+"   <p class='myData'>"+data.data+"</p>"
			+"   <p class='myTime'>"+data.time+"</p>"
			+" </div>"
			+"</li>";
	}else{
		img  = 'resources/images/chating/man_two.jpg';
		var contents = "<li class='otherSend'>"
		+" <span class='otherAvatar'>"
		+"  <img src='"+img+"'/>"
		+" </span>"
		+" <div class='otherMessages'>"
		+"   <p class='otherId'>"+data.id+"</p>"
		+"   <p class='otherData'>"+data.data+"</p>"
		+"   <p class='otherTime'>"+data.time+"</p>"
		+" </div>"
		+"</li>";
	};
	
	$("#result").append(contents);
	}
