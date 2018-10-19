<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<title>인터넷 시력 검사 사이트</title>
<meta name="description" content="실시간 근시 원시 측정 시력 검사표 및 테스트 제공, 집에서 시력검사하기">
<link rel="stylesheet" href="resources/css/styleEyeTest.css" type="text/css">
</head>
<script type="text/javascript">
// 자바스크립트에서 사용하는 전역변수 선언
var g4_path      = ".";
var g4_bbs       = "bbs";
var g4_bbs_img   = "img";
var g4_url       = "http://www.eyetest.co.kr";
var g4_is_member = "";
var g4_is_admin  = "";
var g4_bo_table  = "";
var g4_sca       = "";
var g4_charset   = "utf-8";
var g4_cookie_domain = "";
var g4_is_gecko  = navigator.userAgent.toLowerCase().indexOf("gecko") != -1;
var g4_is_ie     = navigator.userAgent.toLowerCase().indexOf("msie") != -1;
</script>
<script type="text/javascript" src="resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="resources/js/commonEyeTest.js"></script>
<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0" >
<a name="g4_head"></a>


<!-- 상단 배경 시작 -->



<table border=0 cellpadding=0 cellspacing=0 width=100%>
<tr>

<td align="center">


<table cellspacing="0" cellpadding="0">
<tr>
<td>



<link rel="stylesheet" href="resources/css/eyetest.css" type="text/css">

<div id="content3">
<table>
<tr>
<td align="center">
<ul>
</ul>
</td>
</tr>
</table>
</div>

<div id="content">
</div>

<div id="content2">
<table width="100%">
<tr>
<td align="center">
    <div id="title2">
	  인터넷 시력 검사
    </div>
<br>
<b>키보드 F11 버튼을 누른 후 3미터 떨어진 지점에서 측정하세요.</b>
</td>
</tr>
<tr>
<td align="center">
<ul>
	  <div id="menual">
1.사용방법은 아주 간단하고 쉽습니다. 따라해보세요.<br>
2.화면에 100원짜리 동전을 대고 확대/축소 버튼을 눌러 화면과 동전의 크기를 똑같게 맞추세요.<br>
3.키보드 F11버튼을 누르면, 시력표만 화면에 나타납니다.<br>
4.정확한 측정을 위해서 모니터 화면에서부터 3미터 떨어진 지점에서 시력을 측정하세요.<br>
5.측정 시 한쪽 눈을 가리고 측정 후 반대쪽 눈을 동일하게 측정하세요.(주의! 가려지는 눈에 압박이 가해지면 안됩니다.)<br>
6.화면 밑에 있는 화살표를 클릭하셔서 0.1~0.4 시력표와 0.5~2.0 시력표의 화면을 전환하여 측정하세요.<br>
7.마우스 포인터를 지시봉으로 사용하여 친구와 함께 시력을 측정해보세요.<br><br>
    </div>
</ul>
</td>
</tr>
<tr>
<td align="center">
<table>
<tr>
<td valign=middle>
<img id="myImage1" src="100.jpg" border="0" width="95" height="95">
</td>
<td valign=middle>
<INPUT TYPE="button" STYLE="width:50; height:50;" onfocus="this.blur();" VALUE="확대" onmouseup="zoomInAndOut('in')">
<INPUT TYPE="button" STYLE="width:50; height:50;" onfocus="this.blur();" VALUE="축소" onmouseup="zoomInAndOut('out')">
<INPUT TYPE="button" STYLE="width:50; height:50;" onfocus="this.blur();" VALUE="기본" onclick="document.location.reload();">
</td>
</tr>
</table>
</td>
</tr>
</table>
<br>
</div>



<script type="text/javascript"> 
	$(document).ready(function(){
		$(document).keydown(function(e){if (e.keyCode === 122){$("#content").toggle();}});
		$(document).keyup(function(e){if (e.keyCode === 122){$("#content2").toggle();}});

	});
</script>

<script type="text/javascript"> 
$(document).ready(function(){ 
$("#content3").toggle(); 
$(document).keyup(function(e){if (e.keyCode === 122){$("#content3").toggle();}});
 }); 
</script> 

<script type="text/javascript">/* CloudFlare analytics upgrade */
window._gat=window._gat||{_getTracker:function(){return {_trackPageview:function(){}}}};
</script>

<script>
function change(iName,imgA,imgB) 
{ 
 iObj = document.images[iName]; 
 n    = iObj.src.lastIndexOf("/") + 1; 
 iSrc = iObj.src.substring(n,iObj.src.length); 
 if (iSrc == imgA) iObj.src = imgB; else iObj.src = imgA; 
} 
function changeAll(){ 
  change('img1','resources/images/realEyeTest27-1.jpg','resources/images/realEyeTest27-2.jpg'); 
  change('img2','resources/images/realEyeTestmove1.jpg','resources/images/realEyeTestmove2.jpg'); 
} 
</script> 

<table>
<tr>
<td align="center" valign="top">
<img id="myImage2" src="resources/images/realEyeTest27-1.jpg" width="1195" height="873" border="0" onfocus="this.blur();" style="cursor:url(arrow.cur);" name="img1"><br>
<img src="resources/images/realEyeTestmove1.jpg" border="0" onfocus="this.blur();" style="cursor:pointer;cursor:hand;" onClick="changeAll()" name="img2"><br>
<SCRIPT> 
function zoomInAndOut(string) { 
for(i = 1; i <3; i++) { 
    var image = document.getElementById("myImage"+i) 
    var currentWidth = image.width; 
    var currentHeight = image.height; 
  if (string == "in") { 
    var width = parseInt(currentWidth * 1.025); //2.5%씩 넓이 증가 
    var height = parseInt(currentHeight * 1.025); //2.5%씩 높이 증가 
  } 
  else if (string == "out") { 
    var width = parseInt(currentWidth * 0.97); //2.5%씩 넓이 감소 
    var height = parseInt(currentHeight * 0.97); //2.5%씩 높이 감소 
  } 
  image.width = width; 
  image.height = height; 
 } 
} 
</SCRIPT>


</td>
</tr></table>
<script type="text/javascript" src="resources/js/wrest.js"></script>

<!-- 새창 대신 사용하는 iframe -->
<iframe width=0 height=0 name='hiddenframe' style='display:none;'></iframe>


</body>
</html>
