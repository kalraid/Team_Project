<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="resources/js/ill.js"></script>
<style>
	.foodImg{
		width:150px;
		height:150px;
	}
</style>
<article>
	<h2>
		<spring:message code="food.list.title" />
	</h2>

	<table class="listTable table table-bordered table-hover">
		<tr>
			<th>번호</th>
			<th>질환군</th>
			<th>해당 병에 좋은 음식이름</th>
			<th>음식사진</th>
			<th>효과</th>
			
		</tr>
		<c:if test="${ not empty food }">
			<c:forEach var="f" items="${food}" varStatus="status">
				<tr class="listTr">
					<td class="listTdNo">${f.foodId}</td>
					<td class="listTdNo">
					${f.diseaseGroup}
					</td>
					<td class="listTdNo">
					<img src="resources/images/food/${f.name}.jpg" class="foodImg"/>
					</td>
					<td class="listTdNo">${f.name}</td>
					<td class="listTdNo">${f.effect}</td>
				</tr>
			</c:forEach>
			<tr>
		<td colspan="5" class="listPage">
			<%--
			/* 현재 페이지 그룹의 시작 페이지가 pageGroup보다 크다는 것은
			 * 이전 페이지 그룹이 존재한다는 것으로 현재 페이지 그룹의 시작 페이지에
			 * pageGroup을 마이너스 하여 링크를 설정하면 이전 페이지 그룹의
			 * startPage로 이동할 수 있다.
		 	 **/
		 	 --%>
		 	<c:if test="${ startPage > pageGroup }">
				<a href="ill?pageNum=${ startPage - pageGroup }
					&type=${ type }&keyword=${ keyword }">[이전]</a>
			</c:if>	
			<%--
			/* 현재 페이지 그룹의 startPage 부터 endPage 만큼 반복하면서
		 	 * 현재 페이지와 같은 그룹에 속한 페이지를 화면에 출력하고 링크를 설정한다.
		 	 * 현재 페이지는 링크를 설정하지 않는다.
		 	 **/
		 	--%>
			<c:forEach var="i" begin="${ startPage }" end="${ endPage }">
				<c:if test="${ i == currentPage }">
					[ ${ i } ]
				</c:if>			
				<c:if test="${ i != currentPage }">
					<a href="ill?pageNum=${ i }&type=${ type }
						&keyword=${ keyword }&hid=${hid}">[ ${ i } ]</a>
				</c:if>			
			</c:forEach>
			<%-- 
			/* 현재 페이지 그룹의 마지막 페이지가 전체 페이지 보다 작다는 것은
			 * 다음 페이지 그룹이 존재한다는 것으로 현재 페이지 그룹의 시작 페이지에
			 * pageGroup을 플러스 하여 링크를 설정하면 다음 페이지 그룹의
			 * startPage로 이동할 수 있다.
		 	 **/
		 	 --%>
			<c:if test="${ endPage < pageCount }">
				<a href="ill?pageNum=${ startPage + pageGroup }
					&type=${ type }&keyword=${ keyword }&hid=${hid}">[다음]</a>
			</c:if>		
		</td>
	</tr>
		</c:if>
		<c:if test="${ empty food }">
			<tr>
				<td colspan="5" class="listTdSpan">게시 글이 존재하지 않습니다.</td>
			</tr>
		</c:if>
	</table>
</article>
