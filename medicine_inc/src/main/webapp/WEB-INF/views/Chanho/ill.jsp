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
				<input type="hidden" value="2" name="hid">
				<button type="submit" class="btn btn-default searchConsonant" name="keyword" value="ㄱ">ㄱ</button>
				<button type="submit" class="btn btn-default searchConsonant" name="keyword" value="ㄴ">ㄴ</button>
				<button type="submit" class="btn btn-default searchConsonant" name="keyword" value="ㄷ">ㄷ</button>
				<button type="submit" class="btn btn-default searchConsonant" name="keyword" value="ㄹ">ㄹ</button>
				<button type="submit" class="btn btn-default searchConsonant" name="keyword" value="ㅁ">ㅁ</button>
				<button type="submit" class="btn btn-default searchConsonant" name="keyword" value="ㅂ">ㅂ</button>
				<button type="submit" class="btn btn-default searchConsonant" name="keyword" value="ㅅ">ㅅ</button>
				&nbsp;&nbsp;&nbsp;
				<button type="submit" class="btn btn-default searchConsonant" name="keyword" value="1">1</button>
				<button type="submit" class="btn btn-default searchConsonant" name="keyword" value="2">2</button>
				<button type="submit" class="btn btn-default searchConsonant" name="keyword" value="3">3</button>
				<button type="submit" class="btn btn-default searchConsonant" name="keyword" value="4">4</button>
				<button type="submit" class="btn btn-default searchConsonant" name="keyword" value="5">5</button>
			</div>
			<div class="center-block text-center">
				<button type="submit" class="btn btn-default searchConsonant" name="keyword" value="ㅇ">ㅇ</button>
				<button type="submit" class="btn btn-default searchConsonant" name="keyword" value="ㅈ">ㅈ</button>
				<button type="submit" class="btn btn-default searchConsonant" name="keyword" value="ㅊ">ㅊ</button>
				<button type="submit" class="btn btn-default searchConsonant" name="keyword" value="ㅋ">ㅋ</button>
				<button type="submit" class="btn btn-default searchConsonant" name="keyword" value="ㅌ">ㅌ</button>
				<button type="submit" class="btn btn-default searchConsonant" name="keyword" value="ㅍ">ㅍ</button>
				<button type="submit" class="btn btn-default searchConsonant" name="keyword" value="ㅎ">ㅎ</button>
				&nbsp;&nbsp;&nbsp;
				<button type="submit" class="btn btn-default searchConsonant" name="keyword" value="6">6</button>
				<button type="submit" class="btn btn-default searchConsonant" name="keyword" value="7">7</button>
				<button type="submit" class="btn btn-default searchConsonant" name="keyword" value="8">8</button>
				<button type="submit" class="btn btn-default searchConsonant" name="keyword" value="9">9</button>
				<button type="submit" class="btn btn-default searchConsonant" name="keyword" value="0">0</button>
			</div><br>
			<div class="center-block text-center">
				<button type="submit" class="btn btn-default searchConsonant" name="keyword" value="A">A</button>
				<button type="submit" class="btn btn-default searchConsonant" name="keyword" value="B">B</button>
				<button type="submit" class="btn btn-default searchConsonant" name="keyword" value="C">C</button>
				<button type="submit" class="btn btn-default searchConsonant" name="keyword" value="D">D</button>
				<button type="submit" class="btn btn-default searchConsonant" name="keyword" value="E">E</button>
				<button type="submit" class="btn btn-default searchConsonant" name="keyword" value="F">F</button>
				<button type="submit" class="btn btn-default searchConsonant" name="keyword" value="G">G</button>
				<button type="submit" class="btn btn-default searchConsonant" name="keyword" value="H">H</button>
				<button type="submit" class="btn btn-default searchConsonant" name="keyword" value="I">I</button>
				<button type="submit" class="btn btn-default searchConsonant" name="keyword" value="J">J&nbsp;</button>
				<button type="submit" class="btn btn-default searchConsonant" name="keyword" value="K">K</button>
				<button type="submit" class="btn btn-default searchConsonant" name="keyword" value="L">L</button>
				<button type="submit" class="btn btn-default searchConsonant" name="keyword" value="M">M</button>
			</div>
			<div class="center-block text-center">
				<button type="submit" class="btn btn-default searchConsonant" name="keyword" value="N">N</button>
				<button type="submit" class="btn btn-default searchConsonant" name="keyword" value="O">O</button>
				<button type="submit" class="btn btn-default searchConsonant" name="keyword" value="P">P</button>
				<button type="submit" class="btn btn-default searchConsonant" name="keyword" value="Q">Q</button>
				<button type="submit" class="btn btn-default searchConsonant" name="keyword" value="R">R</button>
				<button type="submit" class="btn btn-default searchConsonant" name="keyword" value="S">S</button>
				<button type="submit" class="btn btn-default searchConsonant" name="keyword" value="T">T</button>
				<button type="submit" class="btn btn-default searchConsonant" name="keyword" value="U">U</button>
				<button type="submit" class="btn btn-default searchConsonant" name="keyword" value="V" >V</button>
				<button type="submit" class="btn btn-default searchConsonant" name="keyword" value="W">W</button>
				<button type="submit" class="btn btn-default searchConsonant" name="keyword" value="X">X</button>
				<button type="submit" class="btn btn-default searchConsonant" name="keyword" value="Y">Y</button>
				<button type="submit" class="btn btn-default searchConsonant" name="keyword" value="Z">Z</button>
			</div>
		</form>
		<br />
		<form action="ill" method="get" id="">
			<input type="hidden" value="1" name="hid">
			<div class="row text-center center-block">
				<div class="form-group col-xs-2 center-block text-center" style="margin:0 0 0 100px">
				<select name="type" class="btn btn-default form-control">
					<option value="name">질환명(한글)</option>
					<option value="nameEn">질환명(영어)</option>
					<option value="relatedDiseases">관련된 병</option>
					<option value="symptom">증상 중 한가지</option>
					<option value="cause">원인</option>
					<option value="diagnosis">진단방법</option>
					<option value="cure">치료방법</option>
				</select>
				</div>
				<div class="form-group col-xs-6 center-block text-center">
					<input type="text" class="form-control" name="keyword"
						placeholder="검색하려는 질병이름을 입력해주세요">
				</div>
				<div class="form-group col-xs-1 center-block text-center">
				<button type="submit" class="btn btn-default form-control">검색</button>
				</div>
			</div>
		</form>
	</div>

	<table class="listTable">
		<c:if test="${ not empty IllList }">
			<c:forEach var="i" items="${IllList}" varStatus="status">
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
		<c:if test="${ empty IllList }">
			<tr>
				<td colspan="5" class="listTdSpan">게시 글이 존재하지 않습니다.</td>
			</tr>
		</c:if>
	</table>
</article>
