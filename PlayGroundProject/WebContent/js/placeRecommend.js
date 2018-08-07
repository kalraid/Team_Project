
var Arr = new Array();
$(document).on("click", ".themaName", function() {
	var num;
	$.ajax({
		url : "placeRecommend.ajax",

		// type을 지정하지 않으면 get 방식 요청이다.
		type : "post",

		// 파라미터로 보낼 데이터를 객체 리터럴로 지정하고 있다.
		data : {
			num : $(this).val()
		},

		/* RecommendAction 클래스에서 Gson 라이브러리를 이용해
		 * 응답 데이터를 json 형식으로 출력했기 때문에 dataType을 json
		 * 으로 지정해야 한다. 응답 데이터를 json 형식으로 받았기 때문에 
		 * Ajax 통신이 성공하면 실행될 함수의 첫 번째 인수로 지정한 
		 * data는 자바스크립트 객체이므로 닷(.) 연산자를 이용해 접근할 수 있다. 
		 **/
		dataType : "json",
		success : function(data) {
			$("#themaUl").empty();
			var result = "<ul> " +
				"		<li id='return'>0. 돌아가기</li>";
			$.each(data, function(index, e) {
				result += "<li class='s_themaName' value=" + e.s_themaNum + ">" +
					(index + 1) + ". " + e.s_themaName + "</li>";
			});

			result += "</ul>";
			$("#themaUl").append(result);
		},
		error : function(xhr, status, error) {
			alert("error : " + xhr.statusText + ", " + status + ", " + error);
		}
	});




});

$(document).on("click", "#return", function() {
	$.ajax({
		url : "returnPlaceRecommend.ajax",
		type : "post",
		dataType : "json",
		success : function(data) {
			$("#themaUl").empty();
			var result = "<ul>";
			$.each(data, function(index, e) {
				result += "<li class='themaName' value='" + e.themaNum + "'>" +
					e.themaName + "</li>";
			});
			result += "</ul>";
			$("#themaUl").append(result);

		},
		error : function(xhr, status, error) {
			alert("error : " + xhr.statusText + ", " + status + ", " + error);
		}
	});


});

$(document).on("click", ".s_themaName", function() {
	var lat = sessionStorage.getItem("lat");
	var lng = sessionStorage.getItem("lng");
	var intext = $(this).html();
	var marker;
	var pos = new google.maps.LatLng(lat, lng);
	var map = new google.maps.Map(document.getElementById('map'), {
		center : pos,
		zoom : 18
	});

	map.setCenter(pos);
	var contentString;
	$.ajax({
		url : "viewPlaceMarker.ajax",
		type : "post",
		dataType : "json",
		data : {
			no : $(this).val(),
			lat : lat,
			lng : lng
		},
		success : function(data) {
			initMap();
			function initMap() {
				google.maps.event.addListener(map, 'tilesloaded', function() {

					var mapOptions = {
						zoom : 12,
						center : pos
					}
					var map = new google.maps.Map(document.getElementById("map"), mapOptions);

					for (var i = 0; i < data.length; i++) {
						var name = data[i].placeName;
						var address = data[i].address;
						var img = data[i].placeImg;
						var lat2 = data[i].latitude;
						var lng2 = data[i].longitude;
						addMaker2(data[i].latitude, data[i].longitude);
						toggleBounce();
						marker.setMap(map);
						contentString = "<table>" +
							"	<tr>" +
							"		<th>이 름</th>" +
							"		<td class='placeName'>" + name + "</td>" +
							"	</tr>" +
							"	<tr>" +
							"		<th>주 소</th>" +
							"		<td class='placeAddress'>" + address + "</td>" +
							"	</tr>" +
							"	<tr>" +
							"		<th>테  마</th>" +
							"		<td>" + intext + "</td>" +
							"	</tr>";


						if (data[i].placeImg != null) {
							contentString += "	<tr rowspan='3'>" +
								"		<th>이미지</th>" +
								"		<td class='placeImg'>" +
								"			<img src='https://maps.googleapis.com/maps/api/place/photo?maxwidth=600&maxheight=130&photoreference=" + img +
								"			&key=AIzaSyBhdedgmrTytwJsq_mhBknZ8RZ4spbmjqU' class='markerImgs' name='" + img + "'>" +
								"		</td>" +
								"	</tr>";

						}
						contentString += "<tr>" +
							"		<td>" +
							"			<input type='button' value='저장하기' " +
							"			onclick='addSessionPlace(" +
							"		$(\".placeName\").html(), $(\".placeAddress\").html(),$(\".markerImgs\").attr(\"name\"),"
							+ lat2 + "," + lng2 + ")'>" +
							"		</td>" +
							"	</tr>" +
							"</table>";
						addEvent(contentString, map, marker);


					}
				});
				google.maps.event.addDomListener(window, 'load', initMap);

			}
		},
		error : function(xhr, status, error) {
			alert("error : " + xhr.statusText + ", " + status + ", " + error);
		}
	});

	function addMaker2(i, v) {
		var my = new google.maps.LatLng(i, v);
		marker = new google.maps.Marker({
			position : my,
			title : "Hello World!"
		});
	}

	function toggleBounce() {
		var marker = new google.maps.Marker
		if (marker.getAnimation() !== null) {
			marker.setAnimation(null);
		} else {
			marker.setAnimation(google.maps.Animation.BOUNCE);
		}
	}

	function addEvent(contentString, map, marker) {
		google.maps.event.addListener(marker, 'mouseover', function(e) {
			var infowindow = new google.maps.InfoWindow({
				content : contentString
			});
			infowindow.open(map, marker);
			google.maps.event.addListener(marker, 'mouseout', function(e) {
				setTimeout(function() {
					infowindow.close();
				}, 2000);

			});
		});

	}
	;
});


function addSessionPlace(name, address, img, lat, lng) {
	var data = "name=" + name + "&address=" + address + "&img=" + img + "&lat=" + lat + "&lng=" + lng;
	$.ajax({
		url : "addPlaceList.ajax",
		type : "Post",
		data : data,
		success : function() {
			location.reload();
		},
		error : function(xhr, status, error) {
			alert("error : " + xhr.statusText + ", " + status + ", " + error);
		}
	});


}



$(document).on("click", ".back_buttons", function() {

	$(this).parent().parent().parent().parent().find(".end").css("z-index", "2");
	$(this).parent().parent().parent().parent().find(".front").css("z-index", "2");
	$(this).parent().parent().parent().css("z-index", "1");
});


$(document).on("click", ".del_buttons", function() {
	var no = $(this).attr("data-del-value");
	var data = "no=" + no;
	$.ajax({
		url : "delPlaceList.ajax",
		type : "Post",
		data : data,
		success : function() {
			location.reload();
		},
		error : function(xhr, status, error) {
			alert("error : " + xhr.statusText + ", " + status + ", " + error);
		}
	});
});

var SelectList = [];
$(document).on("click", ".selectbox_top", function() {

	//select 내가 누른것의 번호
	// cSize 클릭된 개수
	var th = $(this);
	var Select = $(this).attr("data-value");
	var PList = new Array();

	$.ajax({
		url : "searchPlaceList.ajax",
		type : "Post",
		dataType : "json",
		success : function(data) {
			PList = data
			for (var i = 0; i < data.length; i++) {
				PList[i] = data[i];
			}
			var pSize = PList.length;


			// 선택 2개이상
			if (pSize >= 2) {
				console.log("pSize = " + pSize + ", Select = " + Select);
				SelectList.push(Select);
				var SLLength = SelectList.length;
				if (SLLength > 2) {
					$("div[data-value='" + SelectList[0] + "']").parent().removeClass("selected_place");
					SelectList.shift();
				}
				th.parent().addClass("selected_place");

				if (SLLength >= 1) {
					var first_lat = PList[SelectList[1]]["latitude"];
					var first_lng = PList[SelectList[1]]["longitude"];
					var second_lat = PList[SelectList[0]]["latitude"];
					var second_lng = PList[SelectList[0]]["longitude"];
					var key = "AIzaSyBhdedgmrTytwJsq_mhBknZ8RZ4spbmjqU";
					var url = "https://maps.googleapis.com/maps/api/directions/json" +
						"?origin=" + first_lat + "," + first_lng +
						"&destination=" + second_lat + "," + second_lng +
						"&mode=transit" +
						"&key=" + key +
						"&language=ko" +
						"&transit_mode=tram" +
						"&driving=transit";
					/*https://maps.googleapis.com/maps/api/directions/json
					 * ?origin=37.5127094,126.9449436
					 * &destination=37.4797689,126.9813782
					 * &mode=transit
					 * &key=AIzaSyBhdedgmrTytwJsq_mhBknZ8RZ4spbmjqU */
					// https://maps.googleapis.com/maps/api/directions/json?origin=37.5127094,126.9449436&destination=37.4797689,126.9813782&mode=transit&key=AIzaSyBhdedgmrTytwJsq_mhBknZ8RZ4spbmjqU
					$.ajax({
						url : "pasingDirect.ajax",
						type : "post",
						data : {
							url : url
						},
						dataType : "text",
						success : function(data) {

							var dir = JSON.parse(data);
							var results = dir.routes;
							var summary = results[0];
							var legs = summary.legs
							var duration = legs[0];
							var start_location = duration.start_location;
							var overview_polyline = summary.overview_polyline;
							var overview_point = overview_polyline.points;
							// 시작 지점 경도  위도 주소
							var st_lat = start_location.lat;
							var st_lng = start_location.lng;
							var start_address = duration.start_address

							// 도착지점 경도 위도 주소
							var end_location = duration.end_location;
							var end_lat = end_location.lat;
							var end_lng = end_location.lng;
							var end_address = duration.end_address;

							// 총 시간
							var dura = duration.duration;
							var full_time = dura.text;

							// 도착예상시간
							var arr_time = duration.arrival_time;
							var arrival_time = arr_time.text;

							// distance = 총 거리
							var dis = duration.distance;
							var distance = dis.distance;

							var steps = duration.steps;


							var DIDList = new Array();

							for (var i = 0; i < steps.length; i++) {
								var duration2 = steps[i];
								var dura2 = duration.duration;
								var st_location = duration.start_location;
								var St_lats = st_location.lat;
								var St_lngs = st_location.lng;
								var distanc = duration2.distance;
								var Distances = distanc.text;
								var Travel_mode = duration2.travel_mode;
								var end_locations = duration2.end_location;
								var End_lats = end_locations.lat;
								var End_lngs = end_locations.lng;
								var points = duration2.polyline;
								var Polylines = points.points;
								DIDList.push(st_location, St_lats, St_lngs, Distances, Travel_mode, end_locations, End_lats, End_lngs, Polylines);

							}


							addPoline(DIDList, st_lat, st_lng, end_lat, end_lng);




						},
						error : function(xhr, status, error) {
							alert("error : " + xhr.statusText + ", " + status + ", " + error);
						}
					})
				}
			}
		},
		error : function(xhr, status, error) {
			alert("error : " + xhr.statusText + ", " + status + ", " + error);
		}
	})



});

function addPoline(DIDList, st_lat, st_lng, end_lat, end_lng) {
	var lat = sessionStorage.getItem("lat");
	var lng = sessionStorage.getItem("lng");
	var pos = new google.maps.LatLng(lat, lng);
	var map = new google.maps.Map(document.getElementById('map'), {
		center : pos,
		zoom : 18
	});
	map.setCenter(pos);
	var len = DIDList.length / 9;

	var latlngList = new Array();
	var flightPlanCoordinates = [
        {lat: DIDList[1], lng: DIDList[2]}
      ];
	for (var i = 0; i < len; i++) {
		var j = {lat: DIDList[6+(i*9)], lng: DIDList[7+(i*9)]};
		flightPlanCoordinates.push(j);
	}
	console.log(flightPlanCoordinates);
	var flightPath = new google.maps.Polyline({
		path : flightPlanCoordinates,
		geodesic : true,
		strokeColor : '#FF0000',
		strokeOpacity : 1.0,
		strokeWeight : 2
	});

	flightPath.setMap(map);

}