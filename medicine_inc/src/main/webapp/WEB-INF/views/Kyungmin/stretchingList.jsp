<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<article>
 <h1>스트레칭</h1>
 <h3>Stretching</h3><br><br>
 
 <table id="stretchingTable">
  <c:if test="${not empty stretchingList }">
   <c:forEach var="s" items="${stretchingList }" varStatus="status">
    <tr class="stretchingListTr">
     <td class="stretchingListNum">
      ${s.stretchingnum}
     </td>
     <td class="stretchingListImg">
     <a href="stretchingDetail?stretchingnum=${s.stretchingnum}&pageNum=${currentPage}">
      <img src="resources/images/stretching/stretching${s.stretchingnum}_1.jpg" />
     </a>
     </td>
     <td class="stretchingListTitle">
     <a href="stretchingDetail?stretchingnum=${s.stretchingnum}&pageNum=${currentPage}">
      ${s.stretchingtitle }
     </a>
     </td>
    </tr>
   </c:forEach>
    <tr>
    <td colspan="2" class="stretchingListPage">
     <c:if test="${startPage >PAGE_GROUP }">
      <a href="stretchingList?pageNum=${startPage - PAGE_GROUP }">[이전]</a>
     </c:if>
     <c:forEach var="i" begin="${ startPage }" end="${ endPage }">
      <c:if test="${ i == currentPage }">
       [ ${ i } ]
      </c:if>
      <c:if test="${ i != currentPage }">
       <a href="stretchingList?pageNum=${ i }">[ ${ i } ]</a>
      </c:if>
     </c:forEach>
     <c:if test="${ endPage < pageCount }">
      <a href="stretchingList?pageNum=${ startPage + PAGE_GROUP }">[다음]</a>
     </c:if>
    </td>
   </tr>
  </c:if>
  <c:if test="${empty stretchingList }">
   <tr>
    <td colspan="2" id="stretchingListEmptyTd">
     게시물이 존재하지 않습니다.
    </td>
   </tr>
  </c:if>
 </table>
</article>