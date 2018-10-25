<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %> 

<article>
	<div class="container">
	<h2>약품검색 결과</h2>
	<h6>"&nbsp;&nbsp;품목기준코드 : '${code }',&nbsp;&nbsp; 제품명 : '${name}',&nbsp;&nbsp; 효과별 : '${eff }',&nbsp;&nbsp; 제조/판매사별 : '${maker }'&nbsp;&nbsp;" &nbsp; 에 해당하는 검색 결과</h6>
	<table class ="table table-bordered table-hover ">
		
		<c:if test="${searchOption }">
		
		</c:if>
		<c:if test="${not searchOption }">
		<tr>
		<td colspan="6"><h2>검색 내용을 정확히 기재하여 주세요</h2></td>
		</tr>
		<tr>
		<td colspan="6"><a href="search">검색하기</a></td>
		</tr>
		</c:if>
		<thead>
		
		<tr>
			<th>품목기준코드</th>
			<th>품목명</th>
			<th>효과</th>
			<th>허가년도</th>
			<th>업체명</th>
			<th>전문/일반구분</th>
		</tr>
		</thead>
		
		<tbody>
		<c:if test="${searchOption and not empty mediList}">
		<c:forEach var="m" items ="${ mediList }" varStatus ="status">
		
		<tr>
			<td>${ m.mediCode }</td>
			<td><a href="mediDetail?no=${ m.no }&pageNum=${ currentPage }&mediCode=${ m.mediCode }&mediName=${ m.mediName }&mediEff=${m.mediEff}&mediMaker=${m.mediMaker}">${ m.mediName }</a></td>
			<td>${ m.mediEff }</td>
			<td><fmt:formatDate value="${ m.mediPermitDate }" pattern="yyyy"/></td>
			<td>${ m.mediMaker }</td>
			<td>${ m.mediDiv }</td>
		</tr>
		</c:forEach>
		
		
		<tr>
			<td colspan ="6">
				<c:if test="${ startPage > pageGroup }"> 
				<a href="mediList?pageNum=${ startPage - pageGroup }&mediCode=${ code }&mediName=${ name }&mediEff=${ eff }&mediMaker=${ maker }"> 
				[이전]</a> 
				</c:if> 
				<c:forEach var="i" begin="${ startPage }" end="${ endPage }">
						<c:if test="${ i == currentPage }"> [ ${ i } ] </c:if>
						<c:if test="${ i != currentPage }">
							<a href="mediList?pageNum=${ i }&mediCode=${ code }&mediName=${ name }&mediEff=${ eff }&mediMaker=${ maker }">[ ${ i } ]</a>
							
						</c:if>
				</c:forEach>
						<c:if test="${ endPage < pageCount }">
							<a href="mediList?pageNum=${ startPage + pageGroup }&mediCode=${ code }&mediName=${ name }&mediEff=${ eff }&mediMaker=${ maker }"> [다음]</a>
						</c:if>
			</td>
		</tr>
		</c:if>
		</tbody>
		
		<c:if test ="${empty mediList}">
		<tr>
			<td colspan ="6" >게시 글이 존재 하지 않습니다.</td>
		</tr>
		</c:if>
	
	</table>
	</div>
</article>