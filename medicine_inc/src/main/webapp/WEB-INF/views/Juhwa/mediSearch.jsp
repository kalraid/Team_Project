<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="resources/css/search.css" />
<script src="resources/js/searchform.js"></script>

<div id="box1"><div class="subtitle"><img class ="img1" src = "resources/images/medi.png"/> 약품 상세 검색</div></div> 
<div id="box2"><img class ="smallimg" src = "resources/images/home.png"/> &nbsp;&gt;&nbsp;약품 검색 &nbsp;&gt;&nbsp;약품 상세 검색 </div>
<hr id ="line"></hr>
<div id ="box3"><p><img class ="img2" src="resources/images/search.png"/>항목 별로 원하시는 검색어를 입력하신 후 검색하기 를 누르시면 모두 만족하는 제품이 검색됩니다. 
<ins id="red1">각 항목의 검색어는 꼭 한 글자 이상</ins>이어야 합니다.</p> </div>


<form class ="container" id= "searchDetail" action ="mediList" >


	<div class="form-group">
		<label class="control-label" for="code">품목기준코드</label> <input type="text" class="form-control" id="code" name="mediCode" placeholder="ex)11">
		
	</div>
	<div class="form-group">
		<label class="control-label" for="name">제품명</label> <input type="text" class="form-control" id="name" name="mediName" placeholder="ex)정">
		
	</div>
	<div class="form-group">
		<label class="control-label" for="eff">효과별</label> <input type="text" class="form-control" id="eff" name="mediEff" placeholder="ex)소화">
		
	</div>
	<div class="form-group">
		<p><label class="control-label" for="maker">제조/판매사별</label> <input type="text" class="form-control" id="maker" name="mediMaker" placeholder="ex)제약"></p>
		
	</div>

	<div class="submitbutton">
		
		<button class ="btn btn-info subbutton" type="submit"  >검색하기<img class="btn-img" src="resources/images/search.png"></button>
	</div>
	
</form>