<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<link rel="stylesheet" type="text/css" href="resources/css/search.css" />



<article>
<div id="box1"><img class ="img1" src = "resources/images/medi.png"/> <div id ="search_title">약품 상세 정보</div> </div>
<hr id ="line"></hr>

<form name="checkForm" id="checkForm"> 
	<input type="hidden" name="no" id="no" value="${ medi.no }"/> 
	<input type="hidden" name="pageNum" value="${ pageNum }" />
	
	<input type="hidden" name="mediCode" value="${ mediCode }" />
	<input type="hidden" name="mediName" value="${ mediName }" />
	<input type="hidden" name="mediEff" value="${ mdiEff }" />
	<input type="hidden" name="mediMaker" value="${ mediMaker }" />
		
	
</form>

<table class ="table">
	
	<tr>
		<td rowspan ="5"><img src="${ medi.mediImage }" id ="detailImage"/></td>
		<td>품목기준코드</td>
		<td>${medi.mediCode }</td>
	</tr>
	<tr>
		<td>품목명</td>
		<td>${medi.mediName }</td>
	</tr>
	<tr>
		<td>약표분류코드</td>
		<td>${medi.mediEffCode }</td>
	</tr>
	<tr>
		<td>약품 효능</td>
		<td>${medi.mediEff }</td>
	</tr>
	<tr>
		<td>전문/일반 분류</td>
		<td>${medi.mediDiv }</td>
	</tr>

	<tr>
		<td><input type="button" value="목록보기" onclick= "javascript:window.location.href='mediList?pageNum=${pageNum}&mediCode=${ mediCode }&mediName=${ name }&mediEff=${ eff }&mediMaker=${ maker }'"/>
		</td>
	</tr>

</table>
 
</article>