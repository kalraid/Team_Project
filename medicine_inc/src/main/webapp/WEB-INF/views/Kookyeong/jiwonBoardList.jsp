<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<article>
	<table class="listTable table table-bordered table-hover">
		<tr>
			<td class="boardTitle" colspan="5">
				<!--
스프링 태그 라이브러리를 이용해 root-context.xml에서 설정한
titleMessages.properties 메시지 자원에 접근해 code 속성 지정한
키에 해당하는 메시지를 출력한다.
-->
				<h2>자유게시판</h2>
			</td>
		</tr>

		<tr>
			<th class="listThbNo">NO</th>
			<th class="listThTitle">제목</th>
			<th class="listThWriter">작성자</th>
			<th class="listThRegDate">작성일</th>

			<th class="listThviewcnt">조회수</th>
		</tr>

		<c:if test="${ not empty boardList }">
			<c:forEach var="b" items="${ boardList }" varStatus="status">
				<tr class="listTr">
					<td class="listTdNo">${ b.bno }</td>
					<td class="listTdTitle"><a
						href="JiwonBoardDetail?bno=${ b.bno }&pageNum=${currentPage}">
							${ b.title }</a></td>
					<td class="listTdWriter">${ b.writer }</td>
					<td class="listTdRegDate"><fmt:formatDate
							value="${ b.regDate }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td class="listTdReadCount">${ b.viewcnt }</td>
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
--%> <c:if test="${ startPage > pageGroup }">
						<a href="boardList?pageNum=${ startPage - pageGroup }"> [이전]</a>
					</c:if> <%--
/* 현재 페이지 그룹의 startPage 부터 endPage 만큼 반복하면서
* 현재 페이지와 같은 그룹에 속한 페이지를 화면에 출력하고 링크를 설정한다.
* 현재 페이지는 링크를 설정하지 않는다.
**/
--%> <c:forEach var="i" begin="${ startPage }" end="${ endPage }">
						<c:if test="${ i == currentPage }">
[ ${ i } ]
</c:if>
						<c:if test="${ i != currentPage }">
							<a href="boardList?pageNum=${ i }">[ ${ i } ]</a>
						</c:if>
					</c:forEach> <%--
/* 현재 페이지 그룹의 마지막 페이지가 전체 페이지 보다 작다는 것은
* 다음 페이지 그룹이 존재한다는 것으로 현재 페이지 그룹의 시작 페이지에
* pageGroup을 플러스 하여 링크를 설정하면 다음 페이지 그룹의
* startPage로 이동할 수 있다.
**/
--%> <c:if test="${ endPage < pageCount }">
						<a href="boardList?pageNum=${ startPage + pageGroup }"> [다음]</a>
					</c:if>
				</td>
			</tr>
		</c:if>

		<c:if test="${ empty boardList }">
			<tr>
				<td colspan="5" class="listTdSpan">게시 글이 존재하지 않습니다.</td>
			</tr>
		</c:if>

		<tr>
			<!--<td colspan="5" class="listWrite"><a href="jiwonWriteForm">글쓰기</a></td>  -->
			<td colspan="5" class="listWrite"><input type="button"
				value=" 글쓰기"
				onclick="javascript:window.location.href='jiwonWriteForm'"/ ></a></td>
		</tr>

	</table>
</article>