<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="resources/css/hospitalmaps.css" />
<script type="text/javascript" src="resources/js/haeajax.js"></script>
<script type="text/javascript" src="resources/js/raphael_min.js"></script>
<script type="text/javascript" src="resources/js/raphael_path_s.korea.js"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=eCpZh1GoE4UX4hSfNtVs"></script>
<script type="text/javascript" src="resources/js/hospitalmaps.js"></script>
</head>
<body>

<!-- raphael_path_s.korea.js파일의 91줄 부터 해당 지도의 각 부분을 클릭시에 이벤트에 대해서 설정 하는 부분 -->
<div style="width:40%;height:700px;float:left;">
<img id="hosimg" src="resources/images/bell.PNG" />
<h3>&nbsp;지역을 클릭하신 후</h3>
<h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;병원, 약국, 동물병원의 정보를 검색해주세요</h3>
	<div id="canvas">
		<div id="south"></div>
		<div id="seoul"><h2>서울특별시</h2></div>
		<div id="gygg"><h2>경기도</h2></div>
		<div id="incheon"><h2>인천광역시</h2></div>
		<div id="gangwon"><h2>강원도</h2></div>
		<div id="chungbuk"><h2>충청북도</h2></div>
		<div id="chungnam"><h2>충청남도</h2></div>
		<div id="daejeon"><h2>대전광역시</h2></div>
		<div id="sejong"><h2>세종특별자치시</h2></div>
		<div id="gwangju"><h2>광주광역시</h2></div>
		<div id="jeonbuk"><h2>전라북도</h2></div>
		<div id="jeonnam"><h2>전라남도</h2></div>
		<div id="gyeongbuk"><h2>경상북도</h2></div>
		<div id="gyeongnam"><h2>경상남도</h2></div>
		<div id="daegu"><h2>대구광역시</h2></div>
		<div id="busan"><h2>부산광역시</h2></div>
		<div id="ulsan"><h2>울산광역시</h2></div>
		<div id="jeju"><h2>제주특별자치도</h2></div>
	</div>
</div>
<img id="hosimg" src="resources/images/bell.PNG" />
<h3>내 주변 병원지도</h3>
<div id="container" style="float:left;">
    <ul class="tabs">
        <li class="active liajax" rel="tab1">병원</li>
        <li rel="tab2" class="liajax">동물병원</li>
    </ul>
    <div class="tab_container">
        <div id="tab1" class="tab_content">
        	 <div id="map" style="width:585px;height:700px;"></div>   
        </div>
        <!-- #tab1 -->
        <div id="tab2" class="tab_content">
        	 <div id="map2" style="width:585px;height:700px;"></div>
        </div>
        <!-- #tab2 -->
    </div>
    <!-- .tab_container -->
</div>
<!-- #container -->

</body>
</html>