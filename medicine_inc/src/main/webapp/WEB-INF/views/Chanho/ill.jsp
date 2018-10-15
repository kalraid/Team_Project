<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="resources/js/ill.js"></script>
<article>
	<h2>
		<spring:message code="bbs.list.title" />
	</h2>



	<div>
		<form action="ill" method="get" id="">
		<div class="center-block text-center">
			<button type="submit" class="btn btn-default searchConsonant" name="keyword" value="ㄱ">ㄱ</button>
			<button type="submit" class="btn btn-default searchConsonant" name="keyword" value="ㄴ">ㄴ</button>
			<button type="submit" class="btn btn-default searchConsonant" name="keyword" value="ㄷ">ㄷ</button>
			<button type="submit" class="btn btn-default searchConsonant" name="keyword" value="ㄹ">ㄹ</button>
			<button type="submit" class="btn btn-default searchConsonant" name="keyword" value="ㅁ">ㅁ</button>
			<button type="submit" class="btn btn-default searchConsonant" name="keyword" value="ㅂ">ㅂ</button>
			<button type="submit" class="btn btn-default searchConsonant" name="keyword" value="ㅅ">ㅅ</button>
		</div>
		<div class="center-block text-center">
			<button type="submit" class="btn btn-default searchConsonant" name="keyword" value="ㅇ">ㅇ</button>
			<button type="submit" class="btn btn-default searchConsonant" name="keyword" value="ㅈ">ㅈ</button>
			<button type="submit" class="btn btn-default searchConsonant" name="keyword" value="ㅊ">ㅊ</button>
			<button type="submit" class="btn btn-default searchConsonant" name="keyword" value="ㅋ">ㅋ</button>
			<button type="submit" class="btn btn-default searchConsonant" name="keyword" value="ㅌ">ㅌ</button>
			<button type="submit" class="btn btn-default searchConsonant" name="keyword" value="ㅍ">ㅍ</button>
			<button type="submit" class="btn btn-default searchConsonant" name="keyword" value="ㅎ">ㅎ</button>
		</div>
		</form>
		<br />
		<form action="" method="get" id="">
			<div class="row text-center center-block">
				<div class="form-group col-xs-8 center-block text-center">
					<input type="text" class="form-control" style="margin: 0 0 0 150px"
						placeholder="검색하려는 질병이름을 입력해주세요">
				</div>
				<button type="submit" class="btn btn-default">검색</button>
			</div>
		</form>
	</div>

	<table class="listTable">
		<c:if test="${ not empty iList }">
			<c:forEach var="i" items="${iList}" varStatus="status">
				<tr class="listTr">
					<td class="listTdNo">${i.code}</td>
					<td class="listTdNo">${i.name}</td>
					<td class="listTdNo">${i.nameEn}</td>
					<td class="listTdNo">${i.relatedDiseases}</td>
					<td class="listTdNo">${i.symptom}</td>
					<td class="listTdNo">${i.cause}</td>
					<td class="listTdNo">${i.diagnosis}</td>
					<td class="listTdNo">${i.cure}</td>
				</tr>
			</c:forEach>
		</c:if>
		<c:if test="${ empty iList }">
			<tr>
				<td colspan="5" class="listTdSpan">게시 글이 존재하지 않습니다.</td>
			</tr>
		</c:if>
	</table>
</article>