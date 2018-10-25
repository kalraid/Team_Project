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



function sendResponse(message, roomname){
	var statusObj = {message : message};
	io.sockets.in(roomname).emit('response', statusObj);
}

var io = socket.listen(server);
console.log('socket.io 요청을 받을 준비 끝');





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
				time : getTimeStamp(),
				leaveroom : message.leaveroom
		};
		io.sockets.in(message.leaveroom).emit('message',message);
	});
	
	
	
	socket.on('login', function(login){
		createRoom(login, socket);
		var login_ids = getRoomUserList(login.roomname, "set", login.id);
		var message = login.id+"님이 로그인 되었습니다";	
		var output = {
				login_ids : login_ids,
				message : message,
				time : getTimeStamp(),
				rooms : getRoomList()
		};
		io.sockets.in(login.roomname).emit('loginList', output);
	});
	

	socket.on('room', function(room){
		var login_ids = [];
		if(room.command =='create'){
			createRoom(room, socket);
		}else if(room.command=='join'){
			socket.join(room.roomname);
		}
		
		
		console.log('room 이름 ' + room.roomname+" , "+room.leaveroom);
			
			afterRoomUser = getRoomUserList(room.roomname, "set", room.id);
			beforeRoomUser = getRoomUserList(room.leaveroom, "del", room.id);
			console.log("afterRoomUser : " + afterRoomUser + "   beforeRoomUser : "+beforeRoomUser);
			
			sendResponse(room.roomname+'방에 '+room.id+'님이 입장하셨습니다.', room.roomname);
			sendResponse(room.id+'님이 나가셨습니다.', room.leaveroom);
			socket.leave(room.leaveroom);
			
			
			
			var outputBefore = {
					login_ids : beforeRoomUser,
					rooms : getRoomList()
			};
			
			var outputAfter = {
					login_ids : afterRoomUser,
					rooms : getRoomList()
			};
			
		io.sockets.in(room.leaveroom).emit('room',outputBefore);
		io.sockets.in(room.roomname).emit('room',outputAfter);
		
	});
});

function createRoom(room, socket){
	if(!io.sockets.adapter.rooms[room.roomname]){
		socket.join(room.roomname);
		var curroom=io.sockets.adapter.rooms[room.roomname];
		var roomUserList=[];
		curroom.id = room.roomname;
		curroom.name = room.roomname;
		curroom.owner= room.roomowner;
		curroom.userList = roomUserList;
	}
	socket.join(room.roomname);
}


function getRoomUserList(roomname, command, id){
	var roomUserList=[];
	var curroom=io.sockets.adapter.rooms[roomname];
	console.log(io.sockets.adapter.rooms[roomname]);
	roomUserList = curroom.userList;
	if(command == "get"){
		console.log("roomUserList() : "+roomUserList);
		return roomUserList;
	}else if(command == "set"){
		if(roomUserList.indexOf(id)!=-1){
			return roomUserList;
		}
		roomUserList.push(id);
		console.log("roomUserList() : "+roomUserList);
		curroom.userList = roomUserList;
		return roomUserList;	
	}else if(command =="del"){
		var curroom=io.sockets.adapter.rooms[roomname];
		roomUserList = curroom.userList;
		console.log("옮기는 사람 : "+id);
		var index = roomUserList.indexOf(id);
		console.log("index : "+index);
		console.log("1 roomUserList() : "+roomUserList);
		roomUserList.splice(index ,1);
		console.log("2 옮기기전 장소의 유저이름들() : "+roomUserList);
		curroom.userList = roomUserList;
		return roomUserList;	
	}
	
	
}


function getRoomList() {
    var roomList = [];
    Object.keys(io.sockets.adapter.rooms).forEach(function(roomId) { // 각각의
																		// 방에 대해
																		// 처리
        
    	var outRoom = io.sockets.adapter.rooms[roomId];
        var foundDefault = false;
        var index = 0;
        
        Object.keys(outRoom).forEach(function(key) {
        	if(roomId == key) {
                  foundDefault = true;
             }
			index ++;
			
		});
	
		if(!foundDefault && outRoom.id != undefined){
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
