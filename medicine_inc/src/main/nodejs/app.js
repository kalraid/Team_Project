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
	
});



function sendResponse(socket, command, code, message){
	var statusObj = {socket : socket, command : command, code : code, message : message};
	socket.emit('response', statusObj);
}

var io = socket.listen(server);
console.log('socket.io 요청을 받을 준비 끝');


var login_ids = [];
login_ids.push("홍만이");
login_ids.push("김꺽정");
login_ids.push("박홍실");

io.sockets.on('connection', function(socket){
	console.log('connection info : ', socket.request.connection._peername );
	socket.remoteAddress = socket.request.connection._peername.address;
	socket.remotePort = socket.request.connection._peername.port;

	socket.on('message', function(message){
		console.log('message 이벤트를 받았습니다.');
		console.dir(message);
		message = {
				type : 'text',
				data : message.data,
				id : message.id,
				time : getTimeStamp()
		};
		/*io.sockets.in(message).emit('message',message);*/
		io.sockets.emit('message',message);
	});
	
	
	
	socket.on('login', function(login){
		if(login_ids.indexOf(login.loginid)== -1){
			login_ids.push(login.loginid);
		}
		createRoom(login, socket);
		
		var message = login.loginid+"님이 로그인 되었습니다";	
		var output = {
				login_ids : login_ids,
				message : message,
				time : getTimeStamp(),
				rooms : getRoomList()
		};
		io.sockets.emit('loginList', output);
	});
	

	socket.on('room', function(room){
		if(room.command ==='create'){
			createRoom(room);
		}else if(room.command ==='join'){
			socket.join(room.roomid);
			sendResponse(socket, 'room', '200', '방에 입장하였습니다.');
			
		}else if(room.command==='leave'){
			socket.leave(room.roomid);
			sendResponse(socket, 'room', '200', '방에서 나가셧습니다.');
		}
		
		var roomList = getRoomList();
		
		var output={command : 'list', rooms: roomList};
		console.log('클라이언트로 보낼 데이터 : '+JSON.stringify(output));
		io.sockets.emit('room', output);
		
		
	});
});

function createRoom(room, socket){
	if(io.sockets.adapter.rooms[room.roomname]){
		console.log('방이 이미 만들어져 있습니다.');
		socket.join(room.roomname);
	}else{
	console.log('방을 새로 만듭니다');
	
	socket.join(room.roomname);
	
	var curroom=io.sockets.adapter.rooms[room.roomname];
	curroom.id = room.roomname;
	curroom.name = room.roomname;
	curroom.owner= room.roomowner;
	
	}
}


function getRoomList() {
    console.dir(io.sockets.adapter.rooms);
    var roomList = [];
    Object.keys(io.sockets.adapter.rooms).forEach(function(roomId) { // 각각의 방에 대해 처리
        var outRoom = io.sockets.adapter.rooms[roomId];
        var foundDefault = false;
        var index = 0;
        Object.keys(outRoom).forEach(function(key) {
             if(roomId == key) { 
                  foundDefault = true;
             }

			index ++;
			
		});
	
		
		if(!foundDefault){
			roomList.push(outRoom);
		}
	});
	
	return roomList;
}


function getTimeStamp() {
	var today = new Date();
	var date = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate();
	var time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
	var CurrentDateTime = date+' '+time;
	return CurrentDateTime;
}
