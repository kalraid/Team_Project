<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
* {
	margin: 0px;
	padding: 0px;
}

section {
	margin: 10px auto;
}
/* //기본 바탕 박스 (크기조절용)  */
#middle_box {
	min-width: 1000px;
}

/* //맨위 텍스트처리 */
#main_txt {
	padding: 30px auto;
	text-align: center;
	font: normal normal bold 40px/1.4em brandon-grot-w01-light, sans-serif;
	word-wrap: break-word;
	font-family: Arial, Helvetica, sans-serif;
}

#sub_txt {
	text-align: center;
	font: normal normal normal 20px/1.4em didot-w01-italic, serif;
}

/* //그림 들어가는 공간 처리 */
#imgs {
	margin: 0px auto;
	width: 100%;
	height: 500px;
	overflow: hidden;
}

ul {
	list-style: none;
}

#imgs ul {
	width: 100%;
	height: 500px;
	position: relative;
}

#imgs ul li {
	position: absolute;
}

#imgs .visual_01 {
	left: 0%;
	width: 100%;
	height: 100%;
	background-repeat: no-repeat;
}

#imgs .visual_02 {
	left: 100%;
	width: 100%;
	height: 100%;
	background-repeat: no-repeat;
}

#imgs .visual_03 {
	left: 200%;
	width: 100%;
	height: 100%;
	background-repeat: no-repeat;
}

#imgs .visual_04 {
	left: 300%;
	width: 100%;
	height: 100%;
	background-repeat: no-repeat;
}

#imgs .visual_05 {
	left: 400%;
	width: 100%;
	height: 100%;
	background-repeat: no-repeat;
}

#btnList li {
	background: lightblue 0px -16px no-repeat;
	width: 14px;
	height: 15px;
	float: left;
	left: 45%;
	top: -470px;
	position: relative;
	margin: 0px 5px;
	cursor: pointer;
}

#btnList li.on {
	background-position: 0 0;
}

#btnList li>a {
	display: block;
	text-indent: -9999px;
}

/* 후기글 */
#review_txt {
	text-align: center;
	font: normal normal normal 25px brandon-grot-w01-light, sans-serif;
	float: none;
}

.reviews {
	width: 100%;
	height: 140px;
	text-align: center;
	font: bold normal;
}

#review_sec {
	float: none;
	clear: both;
	padding: 10px;
}

.imgs {
	width: 100%;
	height: 160px;
	text-align: center;
	color: white;
}
</style>

<style>
/* 축제 게시판들이 올라오는곳  - w3school에 데모로 나오는 css를 적용함*/
</style>
<script>
	$(function() { // $(document).ready(function(){ });
		var buttons = $('#btnList > li');
		var imgs = $('#imgs > ul > li');
		var current = 0;
		buttons.click(function() {
			var btnLi = $(this);
			var i = btnLi.index();
			buttons.removeClass('on');
			btnLi.addClass('on');
			move(i);
			return false;
		});
		function move(i) {
			imgs.eq(current).css('left', 0).stop().animate({
				left : '-200%'
			});
			imgs.eq(i).css('left', '100%').stop().animate({
				left : 0
			});
			current = i;
		}
		setInterval(function() {
			var n = current + 1;
			if (n == buttons.length)
				n = 0;
			buttons.eq(n).trigger('click');
		}, 7000);
	});
</script>
<section>

	<div id="middle_box">
		<nav>
			<!--  메뉴바를 외부에서 import하는 부분 -->

		</nav>
		<article id="top_txt_box">

			<!--  제목부분 들어가는 곳 -->
			<div id="main_txt">plaYgrOUnd</div>
			<div id="sub_txt">데이트코스 시뮬레이터</div>
		</article>
		<article id="ban_img">
			<div class="weather snow">
				<div id="wrap">
					<div id="imgs">
						<ul>
							<li><img
								src="images/mainpageslideimgs/1_sunnyshores_cyprus.jpg"
								class="visual_01"></li>
							<li><img
								src="images/mainpageslideimgs/2_sunnyshores_france.jpg"
								class="visual_02"></li>
							<li><img
								src="images/mainpageslideimgs/3_sunnyshores_italy.jpg"
								class="visual_03"></li>
							<li><img
								src="images/mainpageslideimgs/4_sunnyshores_australia.jpg"
								class="visual_04"></li>
							<li><img
								src="images/mainpageslideimgs/5_sunnyshores_stvincent.jpg"
								class="visual_05"></li>
						</ul>
					</div>
					<ul id="btnList">
						<li class="on"><a href="#">이미지1</a></li>
						<li><a href="#">이미지2</a></li>
						<li><a href="#">이미지3</a></li>
						<li><a href="#">이미지4</a></li>
						<li><a href="#">이미지5</a></li>
					</ul>
				</div>
			</div>
		</article>


		<c:set var="F" value="${FList}"></c:set>
		<div id="tour">
			<div class="w3-container w3-content w3-padding-64"
				style="max-width: 800px">
				<h2 class="w3-wide w3-center">인기 있는 지역별 축제들</h2>
				<div class="w3-row-padding w3-padding-32" style="margin: 0 -16px">
					<div class="w3-third w3-margin-bottom">
						<h3 style="text-align: center">${ F[0][3] }</h3>
						<img src="${ F[0][0] }" alt="ca" style="width: 100%"
							class="w3-hover-opacity">
						<div class="w3-container w3-white">
							<p>
								<b>${ F[0][1] }</b>
							</p>
							<p class="w3-opacity">${ F[0][6] }~${ F[0][7] }</p>
							<p>연락처 : ${ F[0][2] }</p>
							<p>추천수 : ${ F[0][4] }</p>
						</div>
					</div>
					<div class="w3-third w3-margin-bottom">
						<img src="${ F[1][0] }" alt="Paris" style="width: 100%"
							class="w3-hover-opacity">
						<div class="w3-container w3-white">
							<p>
								<b>${ F[1][1] }</b>
							</p>
							<p class="w3-opacity">${ F[1][6] }~${ F[1][7] }<</p>
							<p>연락처 : ${ F[1][3] }</p>
							<p>추천수 : ${ F[1][4] }</p>
						</div>
					</div>
					<div class="w3-third w3-margin-bottom">
						<img src="${ F[2][0] }" alt="San Francisco" style="width: 100%"
							class="w3-hover-opacity">
						<div class="w3-container w3-white">
							<p>
								<b>${ F[2][1] }</b>
							</p>
							<p>연락처 : ${ F[1][3] }</p>
							<p>추천수 : ${ F[1][4] }</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<section id="review_sec">
			<div id="review_txt">조회수가 가장 높은 후기 Best5</div>
<c:forEach var="p" items="${ RList }">
			<article class="reviews">
				
					<div class="imgs"
						style="background:url(images/${p.file}) no-repeat 50% 50% / 100% 100%;">
						<br><br>
						<h2 class="bottom_text">${ p.linklist }</h2>
					</div>
				
			</article>
</c:forEach>
		</section>
	</div>
</section>
