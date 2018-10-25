<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
	#siteUl, .siteMiniUl{
		list-style: none;
		text-align: center;
		
	}
	
	.siteMiniUl > li{
		font-size: 1.3em;
		margin: 10px auto;
		text-align: center;
	};
	
	#li_zero{
		border-top: 3px solid #800080;
		border-botton: 1px solid #800080;
	}
	#li_first{
		border-top: 3px solid #4b0082;
		border-botton: 1px solid #4b0082;
	}
	#li_second{
		border-top: 3px solid #0000ff;
		border-botton: 1px solid #0000ff;
	}
	#li_third{
		border-top: 3px solid #008000;
		border-botton: 1px solid #008000;
	}
	#li_four{
		border-top: 3px solid #ff8c00;
		border-botton: 1px solid #ff8c00;
	}
	
</style>	
<article>
	<ul id="siteUl">
		<li class="siteLi" id="li_zero">
		<h2>약품 정보</h2>
			<ul class="siteMiniUl">
				<li><a href="search2">의약품 검색</a></li>
				<li><a href="healthSupport">건강 보조제</a></li>
			</ul>
		</li>
		<li>
			<br>
			<br>
		</li>
		<li class="siteLi"  id="li_first">
		<h2>건강 정보</h2>
			<ul class="siteMiniUl">
				<li><a href="firstAid">응급처치</a></li>
				<li><a href="stretching">스트레칭</a></li>
				<li><a href="jiap">손지압</a></li>
				<li><a href="food">음식</a></li>
				<li ><a href="ill">질병</a></li>
			</ul>
		</li>
		<li>
			<br>
			<br>
		</li>
		<li class="siteLi"  id="li_second">
		<h2>건강 검진</h2>
			<ul class="siteMiniUl">
				<li><a href="healthScreening">모의 건강 검진</a></li>
				<li><a href="news">의료 뉴스</a></li>
				<li ><a href="depressed">우울증 통계</a></li>
			</ul>
		</li>
		<li>
			<br>
			<br>
		</li>
		<li class="siteLi"  id="li_third">
		<h2>지도 정보</h2>
			<ul class="siteMiniUl">
				<li><a href="hospitalmaps">약국 및 병원 지도</a></li>
				<li ><a href="epidemicMaps">전염병 지도</a></li>
			</ul>
		</li>
		<li>
			<br>
			<br>
		</li>
		<li class="siteLi"  id="li_four">
		<h2>커뮤니티</h2>
			<ul class="siteMiniUl">
				<li><a href="notice">공지사항</a></li>
				<li><a href="boardList">자유게시판</a></li>
				<li><a href="cheeting">채팅방</a></li>
				<li><a href="quiz">퀴즈방</a></li>
			</ul>
		</li>
	</ul>
</article>