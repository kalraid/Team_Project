<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<c:set var="xmap" value="${xmap }"/>
<c:set var="ymap" value="${ymap }"/>
<script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDxU-a1GzEDKkuASMTAQKKYvGr3Kfoi39s"></script>
<script type="text/javascript" src="js/jquery-1.11.3.min.js" ></script>
<script>
$(function(){
	$("#listButton").on("click", function(){
		history.back();
	});
	
});

function initialize() {
		
var xmap = <%=request.getParameter("xmap")%>
var ymap = <%=request.getParameter("ymap")%>

var flag;
var myConter;
if(xmap ==null&&ymap==null){
	var xmap = 126.977969;
	var ymap = 37.566535;
	myCenter=new google.maps.LatLng(ymap,xmap);
	flag = myCenter;
	
} else{
	myCenter=new google.maps.LatLng(ymap,xmap);
}
  var mapProp = {
	  center:myCenter,
	  zoom:8,
	  mapTypeId: google.maps.MapTypeId.ROADMAP,
	  
  };
  var map=new google.maps.Map(document.getElementById("googleMap"),mapProp);
  
  var marker=new google.maps.Marker({
	  position:myCenter,
	  title:'Click to zoom',
	  animation:google.maps.Animation.BOUNCE

  });
 
  marker.setMap(map);
  
 //마커에 대한 정보
 if(myCenter == flag){
  var infowindow = new google.maps.InfoWindow({
		 content:'위도 경도데이터가 없습니다.'
	  });
 }else{  
	 var infowindow = new google.maps.InfoWindow({
		 content:'${f.eventplace}<br/>${ymap} , ${xmap}'
	  });
 }
 
  
  
  //Zoom to 16 when clicking on marker
  google.maps.event.addListener(marker,'click',function(){
	map.setZoom(16);
	map.setCenter(marker.getPosition());
	infowindow.open(map,marker);
  });
  
  google.maps.event.addListener(map,'center_changed',function(){
	 window.setTimeout(function(){
		map.panTo(marker.getPosition()); 
	 },5000);
  });
  
  

  
}
google.maps.event.addDomListener(window, 'load', initialize);

</script>
<style>

div {
	padding: 10px 0;
	color: #2d2c2d;
	font-family: Tahoma;
	font-size: 14px;
	font-weight: bold;
	
}

#header {
	width: auto;
	margin-top: 20px;
	padding: 10px;
	
}

#header, #container {
	border: 2px solid #bfbfbf;
	background: white;
	overflow:auto;
}

#container {
	
	padding-left: 10px;
	overflow:auto;
}

#content {
	position: relative;
	height: 300px;
	margin-top: 10px;
	border: 1px solid #bdbdbd;
	background: white;
	text-align: center;
	overflow:auto;
}

#footer {
	clear: both;
	width: auto;
	padding: 10px;
	border: 2px solid #bfbfbf;
	background: white;
	overflow:auto;
}
#title{
	text-align:center;
	font-size:20px;
	font-weight:bold;
	}
#wrap{
	background:#FEE893;
}
#listButton{
	margin:10px;
	border:none;
	padding:10px;
	background:#A8E6CF;
	color:white;
	border-radius:10px;
	text-align:middle;
	}
#listButton:hover{
	background:#CDCDCD;
}
</style>
</head>



<div id="wrap">
	
	
	<p id="title">${title }</p>
	
	<div id="googleMap" style="width:70%;height:380px;margin:0 auto;"></div>

	<c:if test="${empty f.eventplace }">
		<div id="header" style="display:none">
			<p>${f.eventplace }</p>
		</div>
	</c:if>
	
	<c:if test="${not empty f.eventplace }">
		<div id="header">
			<p>${f.eventplace }</p>
		</div>
	</c:if>
	
	<c:if test="${empty f.placeinfo }">
		<div id="container" style="display:none">
			${f.placeinfo }
			<!--content -->
		</div>
	</c:if>	
	
	<c:if test="${not empty f.placeinfo }">
		<div id="container">
			${f.placeinfo }
			<!--content -->
		</div>
	</c:if>	
	
	<c:if test="${empty f.program }">
		<div id="content" style="display:none">
				${f.program }
		</div>
	</c:if>
	
	<c:if test="${not empty f.program }">
		<div id="content">
				${f.program }
		</div>
	</c:if>
	
	<c:if test="${empty f.usetimefestival }">
		<div id="footer" style="display:none">
			<p>${f.usetimefestival }</p>
		</div>
	</c:if>
	
	<c:if test="${not empty f.usetimefestival }">
		<div id="footer">
			<p>${f.usetimefestival }</p>
		</div>
	</c:if>
</div>
<center><input type="button" value="목록보기" id="listButton"/></center>

</body>
</html>