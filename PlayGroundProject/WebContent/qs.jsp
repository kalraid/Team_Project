<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	var map;

	function initialize() {
		var mapProp = {
			center : new google.maps.LatLng(38, -78),
			zoom : 6,
			mapTypeId : google.maps.MapTypeId.ROADMAP
		};
		map = new google.maps.Map(document.getElementById('map'), mapProp);
	}
	;

	$(document).ready(function() {
		var url = 'https://opendata.howardcountymd.gov/resource/96q9-qbh7.json';
		initialize();
		$.getJSON(url, function(data) {
			$.each(data, function(i, field) {
				$('#list').append("<li>" + data[i].location.longitude 
						+ " & " + data[i].location.latitude + "</li>");
				createMarker(data);

				function createMarker(data) {
					var marker = new google.maps.Marker({
						position : new google.maps.LatLng(data[i].location.latitude, data[i].location.longitude),
						map : map,
						title : field.crossroad
					});
				}
				;
			});
		});

	});
</script>
<script async defer
			src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhdedgmrTytwJsq_mhBknZ8RZ4spbmjqU&callback=initMap">
		
		</script>
		<div id="map"></div>