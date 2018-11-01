<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<article>
	<table class="listTable table table-bordered table-hover">
		<tr>
			<td class="boardTitle" colspan="5"></td>
		</tr>
	
		<tr>
			<td colspan="5" class="listWrite"><a href="jiwonWriteForm">글쓰기</a></td>
		</tr>
		<tr>
			<th class="listThNo">NO</th>
			<th class="listThTitle">제목</th>
			<th class="listThWriter">작성자</th>
			<th class="listThRegDate">작성일</th>
			<th class="listThReadCount">조회수</th>
		</tr>
		<c:if test="${not empty jiwonBoardList }">
			<c:forEach var="j" items="${jiwonBoardList }" varStatus="status">
				<tr>
					<td>${j.bno}</td>
					<td><a
						href="jiwonBoardDetail?bno=${j.bno}&pageNum=${currentPage}">${j.title}</a></td>
					<td>${j.writer}</td>
					<td><fmt:formatDate value="${j.regDate}"
							pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td>${j.viewcnt}</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="5" class="listPage"><c:if
						test="${startPage> pageGroup }">
						<a href="jiwonBoardList?pageNum=${startPage - pageGroup}">[이전]</a>
					</c:if> <c:forEach var="i" begin="${startPage }" end="${endPage }">
						<c:if test="${i== currentPage }">
								[${i}]]
								</c:if>
						<c:if test="${i != currentPage }">
							<a href="jiwonBoardList?pageNum=${i}">[${i}]</a>
						</c:if>
					</c:forEach> <c:if test="${endPage < pageCount} ">
						<a href="jiwonBoardList?pageNum=${startPage + pageGroup }">다음</a>
					</c:if></td>
			</tr>
		</c:if>
		<c:if test="${ empty jiwonBoardList }">
			<tr>
				<td colspan="5" class="listTdSpan">게시 글이 존재하지 않습니다.</td>
			</tr>
		</c:if>
			<tr>
			<td colspan="5">
				<form name="searchForm" id="searchForm" action="#">
					<select name="type">
						<option value="titlle">제목</option>
						<option value="writer">작성자</option>
						<option value="content">내용</option>
					</select> <input type="text" name="keyword" /> <input type="submit"
						value="검색" />
				</form>
			</td>
		</tr>
	</table>
</article>