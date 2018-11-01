<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="resources/css/main.css" />    
<style>
	article{
	border-collapse: collapse;
	}
	.tat{
		width: 100px;
		margin: 0 0 5px;
	}
	
	.tats{
		width: 200px;
		margin: 5px;
	}
	.news{
		height: 400px;
		overflow: scroll;
		border: none;
	}
	.title1{
	text-align: center;
	}
	.search, .searchIn, #innerLine{
		height: 480px !important;
		border: none;
	}
	#searchDetail{
		width: auto;
	}
	.submitbutton{
	text-align: center;
	}
	
	#topArticle{
		
	}
	.main{
		border-collapse: collapse;
	}
	#mersImg:hover{
		cursor: pointer;
	}
	
</style>
<script>
$(document).ready(function(){
	$('.news').load('medicalNews article');
	$('.searchIn').load('search #innerLine');
	
	$('#mersImg').click(function(){
		window.location.href = 'http://www.cdc.go.kr/CDC/mobile/info/CdcKrHealth0300.jsp?menuIds=HOME006-MNU2802-MNU3035-MNU2869';
	});
});
</script>
<article id="topArticle">
	<div class="row main search">
		<h2>약품 검색 </h2>
		<div class="col-md-12 searchIn"></div>
	</div>
	<div class="row main">
		<div class="col-md-6">
			<img src="resources/images/mers.jpg" style="width:488px;height:398px" id="mersImg">
		</div>
		<div class="col-md-6">
			<div id="illInfo">
				<div><h4>질병 정보</h4></div>
				<div class="center-block text-center illInfo_block">
					<form action="ill" method="get" id="">
						<input type="hidden" value="2" name="hid">
						<button type="submit" class="btn btn-default searchConsonant" name="keyword" value="ㄱ">ㄱ</button>
						<button type="submit" class="btn btn-default searchConsonant" name="keyword" value="ㄴ">ㄴ</button>
						<button type="submit" class="btn btn-default searchConsonant" name="keyword" value="ㄷ">ㄷ</button>
						<button type="submit" class="btn btn-default searchConsonant" name="keyword" value="ㄹ">ㄹ</button>
						<button type="submit" class="btn btn-default searchConsonant" name="keyword" value="ㅁ">ㅁ</button>
						<button type="submit" class="btn btn-default searchConsonant" name="keyword" value="ㅂ">ㅂ</button>
						<button type="submit" class="btn btn-default searchConsonant" name="keyword" value="ㅅ">ㅅ</button>
					</form>
				</div>
				<div class="center-block text-center illInfo_block">
					<form action="ill" method="get" id="">
						<input type="hidden" value="2" name="hid">
						<button type="submit" class="btn btn-default searchConsonant" name="keyword" value="ㅇ">ㅇ</button>
						<button type="submit" class="btn btn-default searchConsonant" name="keyword" value="ㅈ">ㅈ</button>
						<button type="submit" class="btn btn-default searchConsonant" name="keyword" value="ㅊ">ㅊ</button>
						<button type="submit" class="btn btn-default searchConsonant" name="keyword" value="ㅋ">ㅋ</button>
						<button type="submit" class="btn btn-default searchConsonant" name="keyword" value="ㅌ">ㅌ</button>
						<button type="submit" class="btn btn-default searchConsonant" name="keyword" value="ㅍ">ㅍ</button>
						<button type="submit" class="btn btn-default searchConsonant" name="keyword" value="ㅎ">ㅎ</button>
					</form>
				</div>
			</div>
			<div id="healthInfo">
				<div><h4>건강 정보</h4></div>
				<div>
				<button type="button" class="btn btn-default tat" onclick="javascript:location.href='firstAid'">응급처치</button>
				&nbsp;
				<button type="button" class="btn btn-default tat" onclick="javascript:location.href='stretching'">스트레칭</button>
				&nbsp;
				<button type="button" class="btn btn-default tat" onclick="javascript:location.href='jiap'">지압</button>
				</div>
				<div>
				<button type="button" class="btn btn-default tat" onclick="javascript:location.href='food'">음식 정보</button>
				&nbsp;
				<button type="button" class="btn btn-default tat" onclick="javascript:location.href='ill'">질병 정보</button>
				</div>
			</div>
			<div id="mapInfo">
				<div><h4>지도 정보</h4></div>
				<div>
				<button type="button" class="btn btn-default tats" onclick="javascript:location.href='hospitalmaps'">약국 및 병원지도</button>
				<button type="button" class="btn btn-default tats" onclick="javascript:location.href='epidemicMaps'">전염병 지도</button>
				</div>
			</div>
		</div>
	</div>
	<div class="row main news">
		<div class="col-md-12 newsIn">

		</div>
	</div>
</article>