<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/js/jquery-3.2.1.min.js"></script>
<script>
window.onload = function () {
	  jigsaw();
	};

	function jigsaw() {
	  var PUZZLE_DIFFICULTY = 2;
	  var PUZZLE_HOVER_TINT = '#f00';
	  var _stage;
	  var _canvas;

	  var _img;
	  var _pieces;
	  var _puzzleWidth;
	  var _puzzleHeight;
	  var _pieceWidth;
	  var _pieceHeight;
	  var _currentPiece;
	  var _currentDropPiece;

	  var _mouse;

	  var borderWitdh = 5;
	  var noStep = 50;
	  var step = 0, loopAnimate;
	  var tempPiece = {};
	  var frameInterval = 15; // in ms
	  //var wapperElement = document.getElementsByClassName('wrap-jigsaw');
	  var wrapJigsaw = document.getElementById('wrapJigsaw');
	  var wrapContent, tempImg = 'https://static.pexels.com/photos/59551/pexels-photo-59551-large.jpeg';

	  var _minWH = 200, _widthImgStandard = 800;
	  _heightImgStandard = 500;

	  init();

	  function init() {
	    _canvas = document.getElementById('canvas');
	    _stage = _canvas.getContext('2d');
	    _img = new Image();
	    _img.addEventListener('load', onImageFirst, false);
	    _img.src = tempImg;
	  }

	  function resetCanvas() {
	    var level = document.getElementsByName('level');
	    var level_value;
	    for (var i = 0; i < level.length; i++) {
	      if (level[i].checked) {
	        level_value = level[i].value;
	      }
	    }
	    PUZZLE_DIFFICULTY = level_value;
	    //remove canvas-temp if have
	    var elements = document.getElementsByClassName('canvas-temp');
	    while (elements.length > 0) {
	      elements[0].parentNode.removeChild(elements[0]);
	    }

	    _pieceWidth = Math.floor(_img.width / PUZZLE_DIFFICULTY);
	    _pieceHeight = Math.floor(_img.height / PUZZLE_DIFFICULTY);
	    _puzzleWidth = _pieceWidth * PUZZLE_DIFFICULTY;
	    _puzzleHeight = _pieceHeight * PUZZLE_DIFFICULTY;
	    //setCanvas
	    _canvas.width = _puzzleWidth;
	    _canvas.height = _puzzleHeight;
	    _canvas.style.border = borderWitdh + "px solid #ddd";

	    _pieces = [];
	    step = 0;
	    _mouse = {x: 0, y: 0};
	    _currentPiece = null;
	    tempPiece = {xPosCurrent: null, yPosCurrent: null};
	    _currentDropPiece = null;
	    _stage.drawImage(_img, 0, 0, _puzzleWidth, _puzzleHeight, 0, 0, _puzzleWidth, _puzzleHeight);
	  }

	  function onImageFirst(e) {
	    resetCanvas();
	    createBtnStart();
	    _img.removeEventListener('load', onImageFirst, false);
	  }

	  function onImageSecond(e) {
	    if (typeof wrapContent !== 'undefined') {
	      wrapContent.remove();
	    }
	    resetCanvas();
	    buildPieces();
	    _img.removeEventListener('load', onImageSecond, false);
	  }

	  function createBtnStart(linkImg) {
	    wrapContent = document.createElement('div');
	    wrapContent.classList.add('wrap-content');
	    //wrapContent.style.backgroundColor = "#D93600";
	    wrapContent.style.width = (_puzzleWidth + borderWitdh * 2) + "px";
	    wrapContent.style.height = (_puzzleHeight + borderWitdh * 2) + "px";
	    wrapContent.style.lineHeight = (_puzzleHeight + 100) + "px";
	    wrapContent.innerHTML = '<ul class="list-img">' +
	      '<li class="btn"><img src="https://static.pexels.com/photos/60163/pexels-photo-60163-small.jpeg" data-hhd-source="https://static.pexels.com/photos/60163/pexels-photo-60163-large.jpeg"/></li> ' +
	      '<li class="btn"><img src="https://static.pexels.com/photos/59551/pexels-photo-59551-small.jpeg" data-hhd-source="https://static.pexels.com/photos/59551/pexels-photo-59551-large.jpeg"/></li> ' +
	      '<li class="btn"><img src="https://static.pexels.com/photos/798/bench-people-smartphone-sun-small.jpg" data-hhd-source="https://static.pexels.com/photos/798/bench-people-smartphone-sun-large.jpg"/></li>' +
	      '<li class="btn"><img src="https://static.pexels.com/photos/36127/pexels-photo-small.jpg" data-hhd-source="https://static.pexels.com/photos/36127/pexels-photo-large.jpg"/></li>' +
	      '<li class="browseBtn"><input class="files-input" type="file" id="files" multiple /><span>browse ...</span></li> ' +
	      '</ul>';
	    wrapJigsaw.appendChild(wrapContent);
	    var listBtn = wrapContent.getElementsByClassName('btn');
	    for (var i = 0; i < listBtn.length; i++) {
	      listBtn[i].addEventListener('click', function () {
	        tempImg = this.getElementsByTagName('img')[0].getAttribute("data-hhd-source");
	        _img = new Image();
	        _img.addEventListener('load', onImageSecond, false);
	        _img.src = tempImg;
	      });
	    }
	    //    browse button  --- change or click
	    // click: gọi hàm ngay khi click vào, và sau đó ko làm gì nữa
	    // change: gọi hàm khi click và xử lý sự kiện sau đó.
	    var loadFiel = wrapContent.getElementsByClassName('browseBtn')[0].addEventListener('change', function (evt) {
	      //remove notice cũ
	      var oldNotice = document.getElementsByClassName('notice-img-wrong'), listOldNoticeLength = oldNotice.length;
	      if (listOldNoticeLength > 0) {
	        for (var i = 0; i < listOldNoticeLength; i++) {
	          oldNotice[i].remove();
	        }
	      }
	      var files = evt.target.files; // FileList object
	      for (var i = 0, f; f = files[i]; i++) {
	        // Only process image files.
	        if (!f.type.match('image.*')) {
	          var notice = document.createElement('span');
	          notice.classList.add('notice-img-wrong');
	          notice.innerHTML = 'Image incorrect';
	          wrapContent.appendChild(notice);
	          continue;
	        }
	        var reader = new FileReader();
	        // Closure to capture the file information.
	        reader.onload = (function (theFile) {
	          return function (e) {
	            tempImg = e.target.result;
	            drawImg(tempImg);
	          };
	        })(f);
	        // Read in the image file as a data URL.
	        reader.readAsDataURL(f);
	      }
	    }, false);
	  }

	  function buildPieces() {
	    var i;
	    var piece;
	    var xPos = 0;
	    var yPos = 0;
	    for (i = 0; i < PUZZLE_DIFFICULTY * PUZZLE_DIFFICULTY; i++) {
	      piece = {};
	      piece.sx = xPos;
	      piece.sy = yPos;
	      piece.xPosCurrent = xPos;
	      piece.yPosCurrent = yPos;
	      _pieces.push(piece);
	      xPos += _pieceWidth;
	      if (xPos >= _puzzleWidth) {
	        xPos = 0;
	        yPos += _pieceHeight;
	      }
	    }
	    shufflePuzzle();
	  }

	  function shufflePuzzle() {
	    //random pieces
	    randomPos();
	    pieceStepAnimate(_stage);
	    document.onmousedown = onPuzzleClick;
	  }

	  function pieceStepAnimate(context) {
	    step++;
	    loopAnimate = setTimeout(function () {

	      if (step <= noStep) {
	        context.clearRect(0, 0, _puzzleWidth, _puzzleHeight);
	        pieceStepAnimate(context);
	      } else {
	        for (var i = 0; i < _pieces.length; i++) {
	          var piece = _pieces[i];
	          piece.xPosCurrent -= piece.xStep;
	          piece.yPosCurrent -= piece.yStep;
	        }
	      }
	      for (var i = 0; i < _pieces.length; i++) {
	        createGrid(_pieces[i]);
	      }
	      for (var i = 0; i < _pieces.length; i++) {
	        var piece = _pieces[i];
	        piece.xPosCurrent += piece.xStep;
	        piece.yPosCurrent += piece.yStep;
	        piece.step += 1;
	        context.save();
	        context.drawImage(_img, piece.sx, piece.sy, _pieceWidth, _pieceHeight, piece.xPosCurrent, piece.yPosCurrent, _pieceWidth, _pieceHeight);
	        context.restore();
	      }
	    },
	                             frameInterval);
	  }

	  function createGrid(piece) {
	    _stage.strokeStyle = '#999';
	    _stage.lineWidth = .1;
	    _stage.strokeRect(piece.sx, piece.sy, _pieceWidth, _pieceHeight);
	  }

	  function randomPos() {
	    var piece, xDistance, yDistance;
	    for (var i = 0; i < _pieces.length; i++) {
	      piece = _pieces[i];
	      piece.xPosRandom = Math.floor(Math.random() * (_puzzleWidth - _pieceWidth));
	      piece.yPosRandom = Math.floor(Math.random() * (_puzzleHeight - _pieceHeight));
	      xDistance = piece.xPosRandom - piece.sx;
	      yDistance = piece.yPosRandom - piece.sy;
	      piece.xStep = (xDistance / noStep);
	      piece.yStep = (yDistance / noStep);
	    }
	  }

	  //STEP2
	  function onPuzzleClick(e) {
	    if (e.layerX || e.layerX == 0) {
	      _mouse.x = e.layerX - _canvas.offsetLeft;
	      _mouse.y = e.layerY - _canvas.offsetTop;
	    }
	    else if (e.offsetX || e.offsetX == 0) {
	      _mouse.x = e.offsetX - _canvas.offsetLeft;
	      _mouse.y = e.offsetY - _canvas.offsetTop;
	    }
	    _currentPiece = checkPieceClicked();
	    if (_currentPiece != null) {
	      _stage.clearRect(_currentPiece.xPosCurrent, _currentPiece.yPosCurrent, _pieceWidth, _pieceHeight);
	      _stage.save();
	      _stage.globalAlpha = .9;
	      _stage.drawImage(_img, _currentPiece.sx, _currentPiece.sy, _pieceWidth, _pieceHeight, _mouse.x - (_pieceWidth / 2), _mouse.y - (_pieceHeight / 2), _pieceWidth, _pieceHeight);
	      _stage.restore();
	      tempPiece.xPosCurrent = _currentPiece.xPosCurrent;
	      tempPiece.yPosCurrent = _currentPiece.yPosCurrent;
	      document.onmousemove = updatePuzzle;
	      document.onmouseup = pieceDropped;
	    }
	  }

	  function checkPieceClicked() {
	    var i;
	    var piece;
	    for (i = 0; i < _pieces.length; i++) {
	      piece = _pieces[i];
	      if (_mouse.x < piece.xPosCurrent || _mouse.x > (piece.xPosCurrent + _pieceWidth) || _mouse.y < piece.yPosCurrent || _mouse.y > (piece.yPosCurrent + _pieceHeight)) {
	        //PIECE NOT HIT
	      }
	      else {
	        return piece;
	      }
	    }
	    return null;
	  }

	  function updatePuzzle(e) {
	    _currentDropPiece = null;
	    if (e.layerX || e.layerX == 0) {
	      _mouse.x = e.layerX - _canvas.offsetLeft;
	      _mouse.y = e.layerY - _canvas.offsetTop;
	    }
	    else if (e.offsetX || e.offsetX == 0) {
	      _mouse.x = e.offsetX - _canvas.offsetLeft;
	      _mouse.y = e.offsetY - _canvas.offsetTop;
	    }
	    _stage.clearRect(0, 0, _puzzleWidth, _puzzleHeight);
	    var i;
	    var piece;
	    //vẽ những mảnh ko move
	    for (i = 0; i < _pieces.length; i++) {
	      piece = _pieces[i];
	      if (piece == _currentPiece) {
	        continue;
	      }
	      _stage.strokeRect(piece.sx, piece.sy, _pieceWidth, _pieceHeight);
	      _stage.drawImage(_img, piece.sx, piece.sy, _pieceWidth, _pieceHeight, piece.xPosCurrent, piece.yPosCurrent, _pieceWidth, _pieceHeight);
	      if (_currentDropPiece == null) {
	        if (_mouse.x < piece.sx || _mouse.x > (piece.sx + _pieceWidth) || _mouse.y < piece.sy || _mouse.y > (piece.sy + _pieceHeight)) {
	          //NOT OVER
	        }
	        else {
	          //grid cell khi over sẽ có màu
	          _currentDropPiece = piece;
	          _stage.save();
	          _stage.globalAlpha = .4;
	          _stage.fillStyle = PUZZLE_HOVER_TINT;
	          //_stage.fillRect( _mouse.x - (_pieceWidth / 2),  _mouse.y - (_pieceWidth / 2), _pieceWidth, _pieceHeight);
	          _stage.fillRect(_currentDropPiece.sx, _currentDropPiece.sy, _pieceWidth, _pieceHeight);
	          _stage.restore();
	          //vẽ mảnh move
	          _currentPiece.xPosCurrent = _currentDropPiece.sx;
	          _currentPiece.yPosCurrent = _currentDropPiece.sy;
	        }
	      }
	    }
	    // Đây là piece di chuyển
	    // vẽ piece di chuyển
	    _stage.save();
	    _stage.globalAlpha = .8;
	    //    _stage.drawImage(_img, _currentPiece.sx, _currentPiece.sy, _pieceWidth, _pieceHeight, _currentPiece.xPosCurrent, _currentPiece.yPosCurrent, _pieceWidth, _pieceHeight);
	    _stage.drawImage(_img, _currentPiece.sx, _currentPiece.sy, _pieceWidth, _pieceHeight, _mouse.x - (_pieceWidth / 2), _mouse.y - (_pieceHeight / 2), _pieceWidth, _pieceHeight);
	    // piece di chuyển được hover qua
	    if (_currentDropPiece == null) {
	      if (_mouse.x < _currentPiece.sx || _mouse.x > (_currentPiece.sx + _pieceWidth) || _mouse.y < _currentPiece.sy || _mouse.y > (_currentPiece.sy + _pieceHeight)) {
	        //NOT OVER
	      }
	      else {
	        //grid cell khi over sẽ có màu
	        _currentDropPiece = _currentPiece;
	        _stage.save();
	        _stage.globalAlpha = .4;
	        _stage.fillStyle = PUZZLE_HOVER_TINT;
	        //_stage.fillRect( _mouse.x - (_pieceWidth / 2),  _mouse.y - (_pieceWidth / 2), _pieceWidth, _pieceHeight);
	        _stage.fillRect(_currentDropPiece.sx, _currentDropPiece.sy, _pieceWidth, _pieceHeight);
	        _stage.restore();
	        //vẽ mảnh move
	        _currentPiece.xPosCurrent = _currentDropPiece.sx;
	        _currentPiece.yPosCurrent = _currentDropPiece.sy;
	      }
	    }
	    _stage.restore();
	  }

	  function pieceDropped(e) {
	    document.onmousemove = null;
	    document.onmouseup = null;
	    _stage.clearRect(0, 0, _puzzleWidth, _puzzleHeight);
	    // xét lại xPos cho piece bị trùng
	    for (var i = 0; i < _pieces.length; i++) {
	      var piece = _pieces[i];
	      if ((piece.xPosCurrent == _currentPiece.xPosCurrent) && (piece.yPosCurrent == _currentPiece.yPosCurrent) && (piece != _currentPiece)) {
	        piece.xPosCurrent = tempPiece.xPosCurrent;
	        piece.yPosCurrent = tempPiece.yPosCurrent;
	      }
	    }
	    for (var i = 0; i < _pieces.length; i++) {
	      var piece = _pieces[i];
	      _stage.save();
	      _stage.strokeRect(piece.sx, piece.sy, _pieceWidth, _pieceHeight);
	      _stage.drawImage(_img, piece.sx, piece.sy, _pieceWidth, _pieceHeight, piece.xPosCurrent, piece.yPosCurrent, _pieceWidth, _pieceHeight);
	      _stage.restore();
	    }
	    resetPuzzleAndCheckWin();
	  }

	  function resetPuzzleAndCheckWin() {
	    var i, j, piece;
	    var gameWin = true;
	    for (i = 0; i < _pieces.length; i++) {
	      piece = _pieces[i];
	      if (piece.xPosCurrent != piece.sx || piece.yPosCurrent != piece.sy) {
	        gameWin = false;
	      }
	    }
	    if (gameWin) {
	      setTimeout(gameOver, 500);
	    }
	  }

	  function gameOver() {
	    document.onmousedown = null;
	    document.onmousemove = null;
	    document.onmouseup = null;
	    var audioElement = document.createElement('audio');
	    audioElement.setAttribute('src', 'src/finish.mp3');
	    audioElement.play();
	    //animate : start
	    createBtnStart();
	    wrapContent.style.top = -(_puzzleHeight + 10) + "px";
	    setTimeout(function () {
	      wrapContent.style.top = 0 + "px";
	    }, 540);

	    // khi nào xong, thì mới bắt đầu lại
	    //    audioElement.addEventListener('ended', function() {
	    //    }, false);
	  }

	  function calculateDimensionImage(widthImgStandard, heightImgStandard, widthImgOriginal, heightImgOriginal, minWH) {
	    //chỉ resize, ko ratio
	    var widthImgResult, heightImgResult, status, comment;
	    // if width or height < 100
	    if ((widthImgOriginal <= minWH) || (heightImgResult <= minWH)) {
	      widthImgResult = widthImgOriginal;
	      heightImgResult = heightImgOriginal;
	      status = false;
	      comment = "Image too small";
	    } else {
	      //xử lý vòng 1 cho width
	      if (widthImgOriginal > widthImgStandard) {
	        widthImgResult = widthImgStandard;
	        heightImgResult = (widthImgResult * heightImgOriginal) / widthImgOriginal;
	      } else {
	        widthImgResult = widthImgOriginal;
	        heightImgResult = heightImgOriginal;
	      }
	      //xử lý vòng 2 cho height
	      if (heightImgResult <= minWH) {
	        status = false;
	        comment = "Image too small";
	      } else if (heightImgResult > heightImgStandard) {
	        var heightTemp = heightImgResult;
	        heightImgResult = heightImgStandard;
	        widthImgResult = (widthImgResult * heightImgStandard) / heightTemp;
	        if (widthImgResult <= minWH) {
	          status = false;
	          comment = "Image not match";
	        } else {
	          status = true;
	        }
	      } else {
	        status = true;
	      }
	    }
	    return {'widthImgResult': Math.round(widthImgResult), 'heightImgResult': Math.round(heightImgResult), 'status': status, 'comment': comment};
	  }

	  function drawImg(imgsrc) {
	    var canvasTemp = document.createElement("canvas");
	    canvasTemp.classList.add('canvas-temp');
	    document.getElementsByTagName('body')[0].appendChild(canvasTemp);
	    var context = canvasTemp.getContext('2d');
	    var imageObj = new Image();
	    imageObj.crossOrigin = 'Anonymous';
	    imageObj.addEventListener('load', function () {
	      var strDataURI;
	      var parametersImage = calculateDimensionImage(_widthImgStandard, _heightImgStandard, imageObj.width, imageObj.height, _minWH);
	      if (parametersImage['status'] === true) {
	        //context.clearRect(0, 0, canvasWidth, canvasWidth);
	        canvasTemp.width = parametersImage['widthImgResult'];
	        canvasTemp.height = parametersImage['heightImgResult'];
	        context.drawImage(imageObj, 0, 0, parametersImage['widthImgResult'], parametersImage['heightImgResult']);

	        strDataURI = canvasTemp.toDataURL("image/png;base64");
	        var wrapImg = document.getElementById('localStorageTemp');
	        wrapImg.innerHTML = '<img id="localImgCurrent" src="' + strDataURI + '"/>';
	        _img = new Image();
	        _img.addEventListener('load', onImageSecond, false);
	        _img.src = strDataURI;
	      } else {
	        var notice = document.createElement('span');
	        notice.classList.add('notice-img-wrong');
	        notice.innerHTML = parametersImage['comment'];
	        wrapContent.appendChild(notice);
	      }
	      this.removeEventListener('load', drawImg, false);
	    }, false);
	    imageObj.src = imgsrc;
	  }
	}
</script>
<style>
body {
  margin: 0 auto 10px;
  text-align: center;
  font-family: 'Arial', sans-serif;
  background: #f5f5f5;
}
.wrap-jigsaw {
  position: relative;
  /* overflow: hidden; */
  display: inline-block;
  -webkit-user-select: none; 
  -moz-user-select: none;     
  -ms-user-select: none;     

  -o-user-select: none;
  user-select: none;  
  background: #fff;
  canvas {
    display: block;
  }
}
.wrap-content { 
  position: absolute;
  top: 0;
  z-index: 100;
  text-align: center;
  background: rgba(0,0,0,.8);
  display: table-cell;
  line-height: 740px !important;
  vertical-align: middle;
  -webkit-animation: bounce 1500ms ease-out;
  -moz-animation: bounce 1500ms ease-out;
  -o-animation: bounce 1500ms ease-out;
  animation: bounce 1500ms ease-out;
}
.list-img {
  margin-left: 10px;
  display: inline-block;
}
.list-img:after {
  content: ' ';
  clear: both;
  display: table;
}
.list-img li {
  position: relative;
  background: #000;
  line-height: 112px;
  text-align: center;
  color: #fff;
  float: left;
  list-style: none;
  margin-right: 10px;
  margin-bottom: 10px;
}
.list-img li img {
  opacity: .8;
  display: block;
  width: 150px;
}
.list-img li:hover img {
  opacity: 1;
}
.list-img .browseBtn {
  display: block;
  padding: 0 20px;
  height: 100px;
  cursor: pointer;
}
.list-img .browseBtn:hover {
  color: #ff0;
}
.list-img .files-input {
  opacity: 0;
  width: 102px;
  position: absolute;
  top: 47px;
  left: 0;
  z-index: 100;
}
.notice-img-wrong {
  color: #fff;
  display: block;
  font-size: 22px;
  position: absolute;
  top: 100px;
  width: 100%;
  letter-spacing: 2px;
}
.canvas-temp {
  display: none;
}
#localStorageTemp {
  display: none;
}
.choose-level {
  padding: 20px 10px;
}
.level-item {
  display: inline-block;
  margin: 0 10px;
}
@-webkit-keyframes bounce {
  0% {
    -webkit-transform:translateY(-100%);
    opacity: 0;
  }
  5% {
    -webkit-transform:translateY(-100%);
    opacity: 0;
  }
  15% {
    -webkit-transform:translateY(0);
    padding-bottom: 5px;
  }
  30% {
    -webkit-transform:translateY(-50%);
  }
  40% {
    -webkit-transform:translateY(0%);
    padding-bottom: 6px;
  }
  50% {
    -webkit-transform:translateY(-30%);
  }
  70% {
    -webkit-transform:translateY(0%);
    padding-bottom: 7px;
  }
  /*  80% {
  -webkit-transform:translateY(-15%);
}
  90% {
  -webkit-transform:translateY(0%);
  padding-bottom: 8px;
}*/
  80% {
    -webkit-transform:translateY(-10%);
  }
  90% {
    -webkit-transform:translateY(0%);
    padding-bottom: 9px;
  }
  99% {
    -webkit-transform:translateY(-5%);
  }
  100% {
    -webkit-transform:translateY(0);
    padding-bottom: 9px;
    opacity: 1;
  }
}
</style>
</head>
<body>
<div class="choose-level">
  <div class="level-item"><input type="radio" name="level" value="2">2x2</div>
  <div class="level-item"><input type="radio" name="level" value="3" checked>3x3</div>
  <div class="level-item"><input type="radio" name="level" value="4">4x4</div>
  <div class="level-item"><input type="radio" name="level" value="5">5x5</div>
  <div class="level-item"><input type="radio" name="level" value="6">6x6</div>
  <div class="level-item"><input type="radio" name="level" value="8">8x8</div>
</div>
<div class="wrap-jigsaw" id="wrapJigsaw">
  <canvas id="canvas"></canvas>
</div>
<div id="localStorageTemp"></div>
</body>
</html>