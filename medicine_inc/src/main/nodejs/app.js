var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
var socket = require('socket.io');
var cors = require('cors');
var http = require('http');
var indexRouter = require('./routes/index');
var usersRouter = require('./routes/users');

var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');
app.set('port', process.env.PORT || 3010);

app.use(cors());
app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use('/', indexRouter);
app.use('/users', usersRouter);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;

var server= http.createServer(app).listen(app.get('port'), function(){
	console.log('서버가 시작되었습니다. 포트 : '+app.get('port'));
	
	/*database.init(app,config);*/
});

function sendResponse(socket, command, code, message){
	var statusObj = {command : command, code : code, message : message};
	socket.emit('response', statusObj);
}

var io = socket.listen(server);
console.log('socket.io 요청을 받을 준비 끝');

io.sockets.on('connection', function(socket){
	console.log('connection info : ', socket.request.connection._peername );
	socket.remoteAddress = socket.request.connection._peername.address;
	socket.remotePort = socket.request.connection._peername.port;
	var login_ids={};
	socket.on('message', function(message){
		console.log('message 이벤트를 받았습니다.');
		console.dir(message);
		
		if(message.recepient === 'All'){
			console.dir('나를 포함한 모든 클라이언트에게 messge 이벤트를 전송합니다.');
			io.sockets.emit('message', message);
			
		} else{
			if(message.command ==='chat'){
					
			
			if(login_ids[message.recepient]){
				io.sockets.connected[login_ids[message.recepient]].emit('message',message);
				sendResponse(socket, 'message', '200', '메세지를 전송했습니다.');
				
			}else{
				sendResponse(socket, 'login', '404', '상대방의 로그인 id를 찾을수 없습니다.');
			}
			
		}else if(message.command ==='groupchat'){
			io.sockets.in(message.recepient).emit('message',message);
			sendResponse(socket, 'message', '200', '방 ['+message.recepient+']의 모든 사용자에게 메세지 전송');
		}
		}
	});
	

	
	socket.on('login', function(login){
		console.log('로그인 이벤트를 받았습니다');
		console.dir(login);
		
		console.log('접속한 소켓의 id : '+ socket.id);
		login_ids =socket.id;
		socket.login_id = login.id;
		
		console.log('접속한 클라이언트 id 개수 : %d', Object.keys(login_ids).length);
		
		sendResponse(socket, 'login', '200', '로그인 되었습니다.');
	});

  socket.on('loginout', function(loginout){
		console.log('로그아웃 이벤트를 받았습니다');
		console.dir(loginout);
		
		console.log('접속한 소켓의 id : '+ socket.id);
		
		/*delete login_ids[socket.id];*/
		
		sendResponse(socket, 'login', '200', '로그아웃 되었습니다.');
	});

	
	socket.on('room', function(room){
		console.log('room 이벤트를 받았습니다');
		console.dir(room);
		var curroom;
		if(room.command ==='create'){
			if(io.sockets.adapter.rooms[room.roomid]){
				console.log('방이 이미 만들어져 있습니다.');
			}else{
			console.log('방을 새로 만듭니다');
			
			socket.join(room.roomid);
			
			curroom=io.sockets.adapter.rooms[room.roomid];
			curroom.id = room.roomid;
			curroom.name = room.roomname;
			curroom.owner= room.roomowner;
			
			}
		}else if(room.command ==='update'){
			curroom=io.sockets.adapter.rooms[room.roomid];
			curroom.id = room.roomid;
			curroom.name = room.roomname;
			curroom.owner= room.roomowner;
		
		}else if(room.command ==='delete'){
			socket.leave(room.roomid);
		if(io.sockets.adapter.room[room.roomid]){
			delete io.sockets.adapter.rooms[room.roomid];
		}
		}else if(room.command ==='join'){
			socket.join(room.roomid);
			sendResponse(socket, 'room', '200', '방에 입장하였습니다.');
			
		}else if(room.command==='leave'){
			socket.leave(room.roomid);
			sendResponse(socket, 'room', '200', '방에서 나가셧습니다.');
		}
		
		var roomList = getRoomList();
		console.dir(roomList);
		
		var output={command : 'list', rooms: roomList};
		console.log('클라이언트로 보낼 데이터 : '+JSON.stringify(output));
		io.sockets.emit('room', output);
		
	});
});

function getRoomList(){
	console.dir(io.sockets.adapter.rooms);
	var roomList = [];
	
	Object.keys(io.sockets.adapter.rooms).forEach(function(roomid){
		console.log('current roomd id : ' + roomid);
		var outRoom = io.sockets.adapter.rooms[roomid];
		
		var foundDefault = false;
		var index = 0;
		
		Object.keys(outRoom.sockets).forEach(function(key){
			console.log('#'+index+' : '+key +' , '+ outRoom.sockets[key]);
			
			if(roomid = key){
				foundDefault = true;
				console.log('this is default room.');
				
			}
			index ++;
			
		});
	
		
		if(!foundDefault){
			roomList.push(outRoom);
		}
	});
	
	console.log('[ROOM LIST]');
	console.dir(roomList);
	
	return roomList;
}


