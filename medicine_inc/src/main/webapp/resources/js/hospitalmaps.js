var sca = '01';
var lat;
var long;
var tabactive;

/*geolocation을 사용하여 현재위치 가져오기*/
navigator.geolocation.getCurrentPosition( function(pos){
			lat = pos.coords.latitude;
			long = pos.coords.longitude;
		});

$(function () {


	
	
	
	
	
	//ajax로 경도 위도 보내기
	//약국 데이터 지도
	var fn = function(){
		var HOME_PATH = window.HOME_PATH || '.';
		//var ICON_SPRITE_IMAGE_URL = '/img/example/sp_pins_spot_v3.png';
		var markers = [];
		var infoWindows = [];
		var marker;
		
		$.ajax({
			url:"mapAajx.ajax",
			type:"post",
			data:{"lat":lat, "lng":long},
			dataType:"json",
			success:function(data){
				$("#mapTable").empty();
				$.each(data, function(index, value){
					//console.log(value.ypos+","+value.xpos+","+value.name);
						var marker = new naver.maps.Marker({
					    position: new naver.maps.LatLng(value.ypos, value.xpos),
					    map: map1
					});
					
					marker.set('seq', marker);
					markers.push(marker);
					
					var contentString = [
						'<div class="iw_inner">',
				        '   <h3>'+value.name+'</h3>',
				        '   <p>'+'('+value.post+')'+'&nbsp;'+ value.addr+'<br />',
				        '       '+value.sidoname+'&gt;'+value.sguname+'<br />',
				        '       '+value.tel+'',
				        '   </p>',
				        '</div>'
						].join(' ');
					var infowindow = new naver.maps.InfoWindow({
					    content: contentString
					});
				    //marker.addListener('mouseout', onMouseOut); 마우스 벗어났을때
					
					naver.maps.Event.addListener(marker, "click", function(e) {
					    if (infowindow.getMap()) {
					        infowindow.close();
					    } else {
					    	console.log(map1+","+marker);
					        infowindow.open(map1, marker);
					    }
					});
					infowindow.open(map1, marker);
				    //marker = null;
					
					//modal 창에 append 하기
					var result = 
						"<tr class='searchPh' data-no='"+value.no+"'>"
						+ "<td>"
						+ " <div class='divHeader'>"
						+ " <div style='font-weight:bold;'>"
						+ " <img src='resources/images/pharmacy_icon.png' style='float:left;margin:0 5px 0 0;'/>"+value.name
						+ " </div>"
						+ " <div>("+value.post +")		"+value.addr+"</div>"
						+ " <div>"+value.sidoname +" > "+ value.sguname+"</div>"
						+ " <div>&emsp;&emsp;&emsp;&emsp;&nbsp;"+value.tel+"</div>"
						+ " </div>"
						+ "</td>"
						+ "</tr>";
					$("#mapTable").append(result);
				});
				
			},
			error:function(xhr, status, error){
				alert("error :"+xhr.statusText + ", " + status + ", " + error);
			}
		});
	}
	
	//화면에 맵 출력하기
	var mapOptions1 = {			
		    center: new naver.maps.LatLng(lat, long), //37.535744, 127.082496
		    zoom: 11
		};
	
	/*alert(lat+","+long);*/
	var map1 = new naver.maps.Map('map1', mapOptions1);
	
	//fn();
	
	//병원 데이터 지도
	var fh = function(){
		var HOME_PATH = window.HOME_PATH || '.';
		//var ICON_SPRITE_IMAGE_URL = '/img/example/sp_pins_spot_v3.png';
		var markers = [];
		var infoWindows = [];
		var marker;
		
		$.ajax({
			url:"hospiMapAjax.ajax",
			type:"post",
			data:{"lat":lat, "lng":long},
			dataType:"json",
			success:function(data){
				$("#mapTable").empty();
				$.each(data, function(index, value){
					//console.log(value.ypos+","+value.xpos+","+value.name);
						var marker = new naver.maps.Marker({
					    position: new naver.maps.LatLng(value.ypos, value.xpos),
					    map: map2
					});
					
					marker.set('seq', marker);
					markers.push(marker);
					
					var contentString = [
						'<div class="iw_inner">',
				        '   <h3>'+value.name+'</h3>',
				        '   <p>'+'('+value.post+')'+'&nbsp;'+ value.addr+'<br />',
				        '       '+value.sidoname+'&gt;'+value.sguname+'<br />',
				        '       '+value.tel+'<br/>',
				        '       <a href="'+value.hosurl+'" target="_blank">'+value.hosurl+'</a>',
				        '   </p>',
				        '</div>'
						].join(' ');
					var infowindow = new naver.maps.InfoWindow({
					    content: contentString
					});
				    //marker.addListener('mouseout', onMouseOut); 마우스 벗어났을때
					
					naver.maps.Event.addListener(marker, "click", function(e) {
					    if (infowindow.getMap()) {
					        infowindow.close();
					    } else {
					    	//console.log(map2+","+marker);
					        infowindow.open(map2, marker);
					    }
					});
					infowindow.open(map2, marker);
				    //marker = null;
					
					//modal 창에 append 하기
					var result = 
						"<tr class='searchPh' data-no='"+value.no+"'>"
						+ "<td>"
						+ " <div class='divHeader'>"
						+ " <div style='font-weight:bold;'>"
						+ " <img src='resources/images/hospital_icon.png' style='float:left;margin:0 5px 0 0;'/>"+value.name
						+ " </div>"
						+ " <div>("+value.post +")		"+value.addr+"</div>"
						+ " <div>"+value.sidoname +" > "+ value.sguname+"</div>"
						+ " <div> &emsp;&emsp;&emsp;&emsp;&nbsp;"+value.hosurl+"</div>"
						+ " <div> &emsp;&emsp;&emsp;&emsp;&nbsp;"+value.tel+"</div>"
						+ " </div>"
						+ "</td>"
						+ "</tr>";
					$("#mapTable").append(result);
				});
			},
			error:function(xhr, status, error){
				alert("error :"+xhr.statusText + ", " + status + ", " + error);
			}
		});
	}
	
	
	var mapOptions2 = {
		    center: new naver.maps.LatLng(lat, long),
		    zoom: 11
		    
		};
	var map2 = new naver.maps.Map('map2', mapOptions2);
	
/*	마커 찍기
 * var marker = new naver.maps.Marker({
	    position: new naver.maps.LatLng(lat, long),
	    map: map
	});
	*/
	
	//tab 클릭시 이벤트
    $(".tab_content").hide();
    $(".tab_content:first").show();
    tabactive = 0;
    
    $("ul.tabs li").click(function () {
    	//활성화된 탭의 index 가져오기
    	 tabactive = $("ul.tabs li").index(this);
    	 
        $("ul.tabs li").removeClass("active").css("color", "#333");
        //$(this).addClass("active").css({"color": "darkred","font-weight": "bolder"});
        $(this).addClass("active").css("color", "darkred");
        $(".tab_content").hide();
        var activeTab = $(this).attr("rel");
        
        //fh();
        $("#" + activeTab).fadeIn();
        
        if(tabactive == 0){
        	fn();
        } else if(tabactive == 1){
        	fh();
        }
    });
    
    

// modal에서 상세정보 이동
	$(document).on("click", ".searchPh", function(){
		var no = $(this).attr("data-no");
		location.href='phDetail?no='+no+'&tabactive='+tabactive;
	});
    
	var modal = document.getElementById('myModal');
	 // Get the button that opens the modal
	 var btn = document.getElementById("myBtn");
	 // Get the <span> element that closes the modal
	 var span = document.getElementsByClassName("close")[0];
	 // When the user clicks on the button, open the modal 
	 btn.onclick = function() {
	     modal.style.display = "block";
	 }
	 // When the user clicks on <span> (x), close the modal
	 span.onclick = function() {
	     modal.style.display = "none";
	 }
	 // When the user clicks anywhere outside of the modal, close it
	 window.onclick = function(event) {
	     if (event.target == modal) {
	         modal.style.display = "none";
	     }
	 }
    
});
