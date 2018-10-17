var sca = '01';
var lat;
var long;

/*geolocation을 사용하여 현재위치 가져오기*/
navigator.geolocation.getCurrentPosition(
		function(pos){
			lat = pos.coords.latitude;
			long = pos.coords.longitude;
		});

$(function () {
	
	var mapOptions1 = {			
		    center: new naver.maps.LatLng(lat, long),
		    zoom: 10
		};
	
	alert(lat+","+long);
	
	var map = new naver.maps.Map('map', mapOptions1);
	
	
	var mapOptions2 = {
		    center: new naver.maps.LatLng(37.535744, 127.082496),
		    zoom: 10
			
		};
	var map2 = new naver.maps.Map('map2', mapOptions2);
	
	
	var marker = new naver.maps.Marker({
	    position: new naver.maps.LatLng(37.535744, 127.082496),
	    map: map
	});
	
    $(".tab_content").hide();
    $(".tab_content:first").show();
    
    $("ul.tabs li").click(function () {
        $("ul.tabs li").removeClass("active").css("color", "#333");
        //$(this).addClass("active").css({"color": "darkred","font-weight": "bolder"});
        $(this).addClass("active").css("color", "darkred");
        $(".tab_content").hide()
        
        var activeTab = $(this).attr("rel");
        $("#" + activeTab).fadeIn()
     
    });
    
});