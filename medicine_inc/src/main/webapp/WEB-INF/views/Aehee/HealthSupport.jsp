<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<script src="resources/js/jquery-3.2.1.min.js"></script>
<style type="text/css">
* { font-size: 15px; }
table {
	a:link, a:visited {
    background-color: #f44336;
    color: white;
    padding: 14px 25px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
}

a:hover, a:active {
    background-color: red;
   


tr {
	background-color: #0ba53c;
	height: 50px;
	text-align: center;
	padding: 5px;
}



</style>
<article>

	<table>
		<tr>
			<td colspan="5" class="tdSpan">
				<a href="boardList?cateCode=1001">멀티비타민(${ codeMap.get('1001') })</a>&nbsp;&nbsp;&nbsp;
				<a href="boardList?cateCode=1002">비타민B/엽산(${ codeMap.get('1002') })</a>&nbsp;&nbsp;&nbsp;
				<a href="boardList?cateCode=1003">비타민C/D/E(${ codeMap.get('1003') })</a>&nbsp;&nbsp;&nbsp;
				<a href="boardList?cateCode=1004">칼슘/마그네슘(${ codeMap.get('1004') })</a>&nbsp;&nbsp;&nbsp;
				<a href="boardList?cateCode=1005">철분/아연/셀렌(${ codeMap.get('1005') })</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				
			</td>
			<td colspan="2" class="boardListLink"><a href="HealthSupport">리스트</a></td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<td colspan="3" class="listWrite"><a href="HealthSupport_writeProcess">글쓰기</a></td>
		</tr>
	</table>

	<table>
		<!-- -------------------------------------------------------------------------------- -->
			<c:if test="${ not empty boardList }">
				<c:forEach var="i" items="${ boardList }" varStatus="status">
					<tr >
						<td>${ i.no }.</td>
						<td class="tdHeader"><a href ="HealthSupport_detail?no=${i.no}"><img alt="${i.image }" src="resources/images/Aehee/${i.image }"></a></td>
						
						<td><a	href="HealthSupport_detail?no=${ i.no }&pageNum=${currentPage}"> ${ i.name }</a></td>						
						<td><del>${ i.consumerPrice  }&nbsp;원</del></td>
						<td><font size="7" face="Arial" style="bold">${ i.sellingPrice}&nbsp;원</font></td>
					</tr>
				</c:forEach>
				<tr>
					<td><c:if test="${ startPage > pageGroup }"><a href="HealthSupport?pageNum=${ startPage - pageGroup }"> [이전]</a></c:if>
					 <c:forEach var="i" begin="${ startPage }" end="${ endPage }">
							<c:if test="${ i == currentPage }">[ ${ i } ]</c:if>
							<c:if test="${ i != currentPage }"><a href="HealthSupport?pageNum=${ i }">[ ${ i } ]</a></c:if>
						</c:forEach> 
			<c:if test="${ endPage < pageCount }"><a href="HealthSupport?pageNum=${ startPage + pageGroup }"> [다음]</a></c:if>
					</td>
				</tr>
			</c:if>
			<c:if test="${ empty boardList }">
				<tr>
					<td colspan="5" class="listTdSpan">게시 글이 존재하지 않습니다.</td>
				</tr>
			</c:if>
			<!-- -------------------------------------------------------------- -->
		<%-- </c:forEach> --%>
	</table>
</article>
