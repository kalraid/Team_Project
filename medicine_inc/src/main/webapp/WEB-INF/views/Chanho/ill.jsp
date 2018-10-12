<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<article>
	<h2>
		<spring:message code="bbs.list.title" />
	</h2>

	<h2>질병 입니다</h2>


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