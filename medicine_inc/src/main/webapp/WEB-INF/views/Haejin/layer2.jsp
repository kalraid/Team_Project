<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<div>  
	<div id="map" style="width:100%;height:800px;"></div>
</div>
<!-- Naver Developers에서 발급받은 네이버지도 Application Key 입력  -->
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=eCpZh1GoE4UX4hSfNtVs"></script>

<script>
var sx = 126.93737555322481;
var sy = 37.55525165729346;
var ex = 126.88265238619182;
var ey = 37.481440035175375;

var data;

var mapOptions = {
		center: new naver.maps.LatLng(37.55525165729346, 126.93737555322481),
		zoom: 8
	};

var map = new naver.maps.Map('map', mapOptions);


(function searchT(){
	var xhr = new XMLHttpRequest();
	var url = "https://api.odsay.com/v1/api/searchPubTransPath?SX="+sx+"&SY="+sy+"&EX="+ex+"&EY="+ey+"&apiKey=ubPSn96E0YfuQSU%2BXL0fSss6zwqlnZ3sEk6%2BtR6QSm8";
	xhr.open("GET", url, true);
	xhr.send();
	console.log("searchT() called")
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			data = eval( "(" + xhr.responseText + ")");  // <- xhr.responseText 로 결과를 가져올 수 있음
			console.log("1 : "+xhr.responseText );
			
			
			console.log("11 : " + $(data.result).length);
			$.each(data.result, function(i, v) {
				//console.log(i   + " ====== " + v);
				if(i == "path") {
					console.log("path일때 : "+v);
				}
			})
			
		}
	}		
})();

function drawNaverMarker(x, y){
	var marker = new naver.maps.Marker({
	    position: new naver.maps.LatLng(y, x),
	    map: map
	});
}


// 노선그래픽 데이터를 이용하여 지도위 폴리라인 그려주는 함수
function drawNaverPolyLine(d){
	//console.log("3 :"+ d.result.path.length);
	console.log("3 :"+ d.result.path[0].subPath[0].trafficType);
	
	var lineArray;
	
	for(var i = 0 ; i < d.result.lane.length; i++){
		for(var j=0 ; j <d.result.lane[i].section.length; j++){
			lineArray = null;
			lineArray = new Array();
			for(var k=0 ; k < d.result.lane[i].section[j].graphPos.length; k++){
				lineArray.push(new naver.maps.LatLng(d.result.lane[i].section[j].graphPos[k].y, d.result.lane[i].section[j].graphPos[k].x));
			}
			
		//지하철결과의 경우 노선에 따른 라인색상 지정하는 부분 (1,2호선의 경우만 예로 들음)
		/* 	if(d.result.lane[i].type == 1){
				var polyline = new naver.maps.Polyline({
				    map: map,
				    path: lineArray,
				    strokeWeight: 3,
				    strokeColor: '#003499'
				});
			}else if(d.result.lane[i].type == 2){
				var polyline = new naver.maps.Polyline({
				    map: map,
				    path: lineArray,
				    strokeWeight: 3,
				    strokeColor: '#37b42d'
				});
			}else{
				var polyline = new naver.maps.Polyline({
				    map: map,
				    path: lineArray,
				    strokeWeight: 3
				});
			} */
		}
	}
}

function callMapObjApiAJAX(map){
	var xhr = new XMLHttpRequest();
	//ODsay apiKey 입력
	var url = "https://api.odsay.com/v1/api/loadLane?mapObject=0:0@"+map+"&apiKey=ubPSn96E0YfuQSU%2BXL0fSss6zwqlnZ3sEk6%2BtR6QSm8";
	xhr.open("GET", url, true);
	xhr.send();
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var resultJsonData = JSON.parse(xhr.responseText);
			drawNaverMarker(sx,sy);					// 출발지 마커 표시
			drawNaverMarker(ex,ey);					// 도착지 마커 표시
			
			console.log("2 ;  " + data);
			
			drawNaverPolyLine(data);		// 노선그래픽데이터 지도위 표시
			// boundary 데이터가 있을경우, 해당 boundary로 지도이동
			if(resultJsonData.result.boundary){
					var boundary = new naver.maps.LatLngBounds(
			                new naver.maps.LatLng(resultJsonData.result.boundary.top, resultJsonData.result.boundary.left),
			                new naver.maps.LatLng(resultJsonData.result.boundary.bottom, resultJsonData.result.boundary.right)
			                );
					map.panToBounds(boundary);
			}
		}
	}
}


setTimeout(function() {
	console.log("start");
	callMapObjApiAJAX(map);
}, 1000);


</script>



