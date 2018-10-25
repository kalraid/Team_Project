<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="resources/css/header.css" />
<header>
	<div id="logo">		
		<a href="${ pageContext.servletContext.contextPath }/">
		<img src="resources/images/logo.png" alt="Books2U" /></a></div>			
	<div id="header_link">
		<ul>			
			<c:if test="${ sessionScope.isLogin }" >
			<li>			
				<span id="message">안녕하세요 ${ sessionScope.name }님</span>
			</li>
			</c:if>
			<c:if test="${ sessionScope.isNaverLogin }" >
			</c:if>
						
			<li>	
				<a href='${pageContext.servletContext.contextPath}/
					${ sessionScope.isLogin ? "logout" : "login" }'>
					${ sessionScope.isLogin ? "로그아웃" : "로그인" }</a>
			</li>			
			<li>
				<c:if test="${ not sessionScope.isLogin }" >	
					<a href="joinForm">회원가입</a>
				</c:if>
				<c:if test="${ sessionScope.isLogin }" >
					<a href="memberUpdateForm?id=${ sessionScope.member.id }">마이페이지</a>
				</c:if>
			</li>
			<li class="no_line"><a href="sitemap">사이트맵</a></li>		
		</ul>
	</div>
	<div id="header_nav">
		<ul>
			<li id="DrugInformation">약품 정보
				<ul class="submenu">
					<li><a href="search">의약품</a></li>
					<li class="no_line"><a href="healthSupport">건강 보조제</a></li>		
				</ul>
			</li>
			<li id="HealthInformation">건강 정보
				<ul class="submenu">
					<li><a href="firstAid">응급처치</a></li>
					<li><a href="stretching">스트레칭</a></li>
					<li><a href="jiap">손지압</a></li>
					<li><a href="food">음식</a></li>
					<li class="no_line"><a href="ill">질병</a></li>		
				</ul>
			</li>
			<li id="HealthScreenings">건강 검진
				<ul class="submenu">
					<li><a href="healthScreening">모의 건강 검진</a></li>
					<li><a href="news">의료 뉴스</a></li>
					<li class="no_line"><a href="depressed">우울증 통계</a></li>		
				</ul>
			</li>
			<li id="MapsInformation">지도 정보
				<ul class="submenu">
					<li><a href="hospitalmaps">약국 및 병원 지도</a></li>
					<li class="no_line"><a href="epidemicMaps">전염병 지도</a></li>
				</ul>
			</li>
			<li id="Community" class="no_line">커뮤니티
				<ul class="submenu">
					<li><a href="notice">공지사항</a></li>
					<li><a href="boardList">자유게시판</a></li>
					<li><a href="cheeting">채팅방</a></li>
					<li class="no_line"><a href="quiz">퀴즈방</a></li>
				</ul>
			</li>
		</ul>
	</div>
</header>