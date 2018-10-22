<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="resources/css/main.css" />    
<article>
	<div class="row main">
		<div class="col-md-12"></div>
	</div>
	<div class="row main">
		<div class="col-md-12"></div>
	</div>
	<div class="row main">
		<div class="col-md-12"></div>
	</div>
	<div class="row main">
		<div class="col-md-6"></div>
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
				<div></div>
			</div>
			<div id="mapInfo">
				<div><h4>지도 정보</h4></div>
				<div></div>
			</div>
		</div>
	</div>
</article>