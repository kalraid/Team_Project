<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="resources/css/styleEyeTest.css" type="text/css">
</head>
<script type="text/javascript" src="resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
var imgPath="resources/images/realEyeTest/";
$(function(){
	$(document).keydown(function(e){if (e.keyCode === 122){$("#content").toggle();}});
	$(document).keyup(function(e){if (e.keyCode === 122){$("#content2").toggle();}});
});
$(function(){
	$("#content3").toggle(); 
	$(document).keyup(function(e){if (e.keyCode === 122){$("#content3").toggle();}});
});
window._gat=window._gat||{_getTracker:function(){return {_trackPageview:function(){}}}};
function change(iName,imgA,imgB) 
{ 
	iObj = document.images[iName]; 
	n    = iObj.src.lastIndexOf("/") + 1; 
	iSrc = iObj.src.substring(n,iObj.src.length); 
	 if (iSrc == imgA) iObj.src = imgPath + imgB; 
	 else iObj.src = imgPath + imgA;
} 
function changeAll(){ 
	
  change('img1','27-1.jpg','27-2.jpg'); 
  change('img2','move1.jpg','move2.jpg'); 
} 
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
</script>
<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0" >
<a name="g4_head"></a>
<table border=0 cellpadding=0 cellspacing=0 width=100%>
 <tr>
  <td align="center">
  <table cellspacing="0" cellpadding="0">
   <tr>
    <td>
<link rel="stylesheet" href="resources/css/eyetest.css" type="text/css">
     <div id="content2">
      <table width="100%">
       <tr>
        <td align="center">
         <div id="title2">
	      인터넷 시력 검사
         </div>
         <br>
         <b>키보드 F11 버튼을 누른 후 3미터 떨어진 지점에서 측정하세요.</b>
         <br><br>
"안녕하세요. 본 웹서비스는 장소에 구애받지 않고, 손쉽게 인터넷으로 시력을 검사할 수 있습니다."<br><br>
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
           <img id="myImage1" src="resources/images/realEyeTest/100.jpg" border="0" width="95" height="95">
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
    <table>
     <tr>
      <td align="center" valign="top">
       <img id="myImage2" src="resources/images/realEyeTest/27-1.jpg" width="1195" height="873" border="0" onfocus="this.blur();" style="cursor:url(arrow.cur);" name="img1"><br>
       <img src="resources/images/realEyeTest/move1.jpg" border="0" onfocus="this.blur();" style="cursor:pointer;cursor:hand;" onClick="changeAll()" name="img2"><br>  
      </td>
     </tr>
    </table>
    <iframe width=0 height=0 name='hiddenframe' style='display:none;'></iframe>
   </td>
  </tr>
 </table>
</td></tr></table>
</body>
</html>
