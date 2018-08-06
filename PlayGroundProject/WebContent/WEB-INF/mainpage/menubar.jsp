<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/datePicker.js"></script>
<style type="text/css">
body {
	padding: 50px;
}

#login-dp {
	min-width: 250px;
	padding: 14px 14px 0;
	overflow: hidden;
	background-color: rgba(255, 255, 255, .8);
}

#login-dp .help-block {
	font-size: 12px
}

#login-dp .bottom {
	background-color: rgba(255, 255, 255, .8);
	border-top: 1px solid #ddd;
	clear: both;
	padding: 14px;
}

#login-dp .social-buttons {
	margin: 12px 0
}

#login-dp .social-buttons a {
	width: 49%;
}

#login-dp .form-group {
	margin-bottom: 10px;
}

.btn-fb {
	color: #fff;
	background-color: #3b5998;
}

.btn-fb:hover {
	color: #fff;
	background-color: #496ebc
}

.btn-tw {
	color: #fff;
	background-color: #55acee;
}

.btn-tw:hover {
	color: #fff;
	background-color: #59b5fa;
}

@media ( max-width :768px) {
	#login-dp {
		background-color: inherit;
		color: #fff;
	}
	#login-dp .bottom {
		background-color: inherit;
		border-top: 0 none;
	}
}

#searchbox {
	width: 150px;
}

.navbar-inverse {
	background-color: #fff
}

.navbar-inverse .navbar-nav>li>a:hover, .navbar-inverse .navbar-nav>li>a:focus
	{
	color: #3C00FF
}

.navbar-inverse .navbar-brand:hover, .navbar-inverse .navbar-brand:focus
	{
	color: #3C00FF
}

</style>

<nav class="navbar navbar-fixed-top navbar-inverse navbar-custom"
	role="navigation">
	<div>
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<a class="navbar-brand" href="index.mvc">Play Ground!</a>
		</div>

		<div class="navbar-collapse">
			<ul class="nav navbar-nav">
				<li><a href="recommendPage.mvc">데이트 코스 시뮬레이터 </a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">놀거리 테마 <span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<!-- 클릭시 아래 히든바가 나오고 거기 클릭시 메뉴로 -->
						<li><a href="themaPlace.mvc?thema=1">동물이랑</a></li>
						<li><a href="themaPlace.mvc?thema=2">친구랑</a></li>
						<li><a href="themaPlace.mvc?thema=3">커피랑</a></li>
						<li><a href="themaPlace.mvc?thema=4">밥이랑</a></li>
						<li><a href="themaPlace.mvc?thema=5">쇼핑이랑</a></li>
						<li><a href="themaPlace.mvc?thema=6">교양이랑</a></li>
						<li><a href="themaPlace.mvc?thema=7">자연이랑</a></li>
						<li><a href="themaPlace.mvc?thema=8">실내에서</a></li>
						<li><a href="themaPlace.mvc?thema=9">관광이랑</a></li>
						<li><a href="themaPlace.mvc?thema=10">여름이랑</a></li>
						<li><a href="themaPlace.mvc?thema=11">겨울이랑</a></li>
						<li><a href="themaPlace.mvc?thema=12">실외에서</a></li>
					</ul></li>
			</ul>
			<ul class="nav navbar-nav">
				<li class="dropdown"><a href="fastival.mvc">지역별 축제 보러가기</a></li>
			</ul>
			<ul class="nav navbar-nav">

				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">커뮤니티 <span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="RecommendList.mvc">추천 게시판</a></li>
						<li><a href="board.mvc">일반 게시판</a></li>
					</ul></li>
				<li class="dropdown"><a href="miniGames.mvc">미니 게임들 </a></li>
			</ul>
			<form class="navbar-form navbar-left" role="search"
				action="search.mvc">
				<div class="form-group">
					<input type="text" class="form-control" id="searchbox"
						name="search" placeholder="Search">
				</div>
				<button type="submit" class="btn btn-default">Submit</button>
			</form>
			<c:if test="${not sessionScope.isLogIn }">
				<form>
					<input type="hidden" name="currentURL" id="loginURL" />
					<ul class="nav navbar-nav navbar-right">
						<li><a href="login.mvc"><b>Login</b> </a></li>
					</ul>
				</form>
			</c:if>
			<c:if test="${sessionScope.isLogIn}">
				<form>
					<input type="hidden" name="currentURL" id="logoutURL" />
					<ul class="nav navbar-nav navbar-right">
						<li><a href="myPageReady.mvc" id="myPageLink"><b>My
									Page</b></a></li>
						<li><a href="logOut.mvc" id="logOutLink"><b>Logout</b> </a></li>
					</ul>
				</form>
			</c:if>
		</div>
	</div>
</nav>



