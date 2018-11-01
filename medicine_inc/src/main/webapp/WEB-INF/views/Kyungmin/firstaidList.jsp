<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<style>
 #firstaidTitle{
  text-align: center;
  font-weight: bold;
 }
 #firstaidSubTitle{
  text-align: center;
 }
 #firstaidTable{
  margin:0 auto;
 }
 .firstaidListNum, .firstaidListTitle{
  font-size: 50px;
 }
 .firstaidImg{
  width: 200px;
  height: 200px;
 }
</style>
<article>
 <h1 id="firstaidTitle">응급 처치</h1>
 <h3 id="firstaidSubTitle">Firstaid</h3><br><br>
 <table id="firstaidTable">
  <c:if test="${not empty firstaidList }">
   <c:forEach var="f" items="${firstaidList }" varStatus="status">
    <tr class="firstaidListTr">
     <td class="firstaidListNum">
      ${f.firstaidnum} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     </td>
     <td class="firstaidListImg">
     <a href="firstaidDetail?firstaidnum=${f.firstaidnum}&pageNum=${currentPage}">
      <img src="resources/images/firstaid/firstaid${f.firstaidnum}_1.jpg" class="firstaidImg"/>
     </a>
     </td>
     <td class="firstaidListTitle">
     <a href="firstaidDetail?firstaidnum=${f.firstaidnum}&pageNum=${currentPage}">
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${f.firstaidtitle }
     </a>
     </td>
    </tr>
    <tr>
     <td colspan="2">
      <br>
     </td>
    </tr>
   </c:forEach>
   <tr>
    <td colspan="2" class="firstaidListPage">
     <c:if test="${startPage >PAGE_GROUP }">
      <a href="firstaidList?pageNum=${startPage - PAGE_GROUP }">[이전]</a>
     </c:if>
     <c:forEach var="i" begin="${ startPage }" end="${ endPage }">
      <c:if test="${ i == currentPage }">
       [ ${ i } ]
      </c:if>
      <c:if test="${ i != currentPage }">
       <a href="firstaidList?pageNum=${ i }">[ ${ i } ]</a>
      </c:if>
     </c:forEach>
     <c:if test="${ endPage < pageCount }">
      <a href="firstaidList?pageNum=${ startPage + PAGE_GROUP }">[다음]</a>
     </c:if>
    </td>
   </tr>
  </c:if>
  <c:if test="${empty firstaidList }">
   <tr>
    <td colspan="2" id="firstaidListEmptyTd">
     게시물이 존재하지 않습니다.
    </td>
   </tr>
  </c:if>
 </table>
 
</article>