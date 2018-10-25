<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<link rel="stylesheet" type="text/css" href="resources/css/search.css" />



<article>
<div id="box1"><div class="subtitle"><img class ="img1" src = "resources/images/medi.png"/> 약품 상세 정보</div> </div>
<hr id ="line"></hr>

<form name="checkForm" id="checkForm"> 
	<input type="hidden" name="no" id="no" value="${ medi.no }"/> 
	<input type="hidden" name="pageNum" value="${ pageNum }" />
	<input type="hidden" name="mediCode" value="${ mediCode }" />
	<input type="hidden" name="mediName" value="${ mediName }" />
	<input type="hidden" name="mediEff" value="${ mdiEff }" />
	<input type="hidden" name="mediMaker" value="${ mediMaker }" />
</form>

<table class ="detailtable ">
	<!--  class ="table table-bordered " id ="detailtable" -->
	<tr>
		<td rowspan ="5"><img src="${ medi.mediImage }" id ="detailImage"/></td>
		<th>품목기준코드</th>
		<td id ="largemediCode">${medi.mediCode }</td>
	</tr>
	<tr>
		<th>품목명</th>
		<td>${medi.mediName }</td>
	</tr>
	<tr>
		<th>약효분류코드</th>
		<td>${medi.mediEffCode }</td>
	</tr>
	<tr>
		<th>약품 효능</th>
		<td>${medi.mediEff }</td>
	</tr>
	<tr>
		<th>전문/일반 분류</th>
		<td>${medi.mediDiv }</td>
	</tr>

</table>

<div id="box4"><button class="btn btn-info subbutton"  onclick= "javascript:window.location.href='mediList?pageNum=${pageNum}&mediCode=${ mediCode }&mediName=${ name }&mediEff=${ eff }&mediMaker=${ maker }'">검색리스트&nbsp;<img class="btn-img" src="resources/images/back.png"></button></div>
 
</article>