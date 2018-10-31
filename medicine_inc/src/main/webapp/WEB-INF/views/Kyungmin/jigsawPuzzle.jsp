<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/js/jquery-3.2.1.min.js"></script>
<script src="resources/js/jigsawPuzzle.js"></script>
<style>
body {
  margin: 0 auto 10px;
  text-align: center;
  font-family: 'Arial', sans-serif;
  background-image:url("resources/images/leaf/halloween.jpg");
  background-size: 100%;
}
.wrap-jigsaw {
  position: relative;
  display: inline-block;
  -webkit-user-select: none;     
  -ms-user-select: none;     
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
  color: white;
  font-size: 30px;
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