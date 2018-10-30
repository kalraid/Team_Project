<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<meta charset="UTF-8" />
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="resources/css/hospitalmaps.css" />
<script type="text/javascript" src="resources/js/raphael_min.js"></script>
<script type="text/javascript" src="resources/js/raphael_path_s.korea.js"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=eCpZh1GoE4UX4hSfNtVs"></script>
<script type="text/javascript" src="resources/js/hospitalmaps.js"></script>

<div>


<!-- raphael_path_s.korea.js파일의 91줄 부터 해당 지도의 각 부분을 클릭시에 이벤트에 대해서 설정 하는 부분 -->
<div style="width:40%;height:700px;float:left;">
<img id="hosimg" src="resources/images/bell.PNG" />
<h3>&nbsp;지역을 클릭하신 후</h3>
<h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;병원, 약국, 동물병원의 정보를 검색해주세요</h3>
	<div id="canvas">
		<div id="south" ></div>
		<div id="seoul" class="area" ><h2>서울특별시</h2></div>
		<div id="gygg" class="area"><h2>경기도</h2></div>
		<div id="incheon" class="area"><h2>인천광역시</h2></div>
		<div id="gangwon" class="area"><h2>강원도</h2></div>
		<div id="chungbuk" class="area"><h2>충청북도</h2></div>
		<div id="chungnam" class="area"><h2>충청남도</h2></div>
		<div id="daejeon" class="area"><h2>대전광역시</h2></div>
		<div id="sejong" class="area"><h2>세종특별자치시</h2></div>
		<div id="gwangju" class="area"><h2>광주광역시</h2></div>
		<div id="jeonbuk" class="area"><h2>전라북도</h2></div>
		<div id="jeonnam" class="area"><h2>전라남도</h2></div>
		<div id="gyeongbuk" class="area"><h2>경상북도</h2></div>
		<div id="gyeongnam" class="area"><h2>경상남도</h2></div>
		<div id="daegu" class="area"><h2>대구광역시</h2></div>
		<div id="busan" class="area"><h2>부산광역시</h2></div>
		<div id="ulsan" class="area"><h2>울산광역시</h2></div>
		<div id="jeju" class="area"><h2>제주특별자치도</h2></div>
	</div>
</div>
<img id="hosimg" src="resources/images/bell.PNG" />
<h3>내 주변 약국 or 병원지도 | tab을 클릭후 리스트 버튼을 클릭해 주세요</h3>
<button id="myBtn">내 주변 지도 리스트</button>

<!-- The Modal -->
<div id="myModal" class="modal">
  <!-- Modal content -->
  <div class="modal-content">
    <span class="close">&times;</span>
    <div id="divh1">
    <h1>내 주변 지도 리스트</h1>
    </div>
   <table id="mapTable" style="width:100%;">
    </table>
	</div>
</div>

<div id="container" style="float:left;">
    <ul class="tabs">
        <li class="active liajax aID" rel="tab1" id="lip">약국</li>
        <li rel="tab2" class="liajax aID" id="lih">병원</li>
    </ul>
    <div class="tab_container">
        <div id="tab1" class="tab_content">
        	 <div id="map1" style="width:585px;height:700px;"></div>   
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

</div>
