<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<style>
 #jiapTitle{
  text-align: center;
  font-weight: bold;
 }
 #jiapListTable{
  margin:0 auto;
 }
 .jiapImg{
  width: 400px;
  height: 400px;
 }
 .jiapListNum, .jiapListTitle{
  font-size: 35px;
 }
</style>
<article>
 <h1 id="jiapTitle">지 압</h1>
 <table id="jiapListTable">
 <c:if test="${not empty jiapList }">
  <c:forEach var="j" items="${jiapList}" varStatus="jn">
   <tr class="jiapListTr">
     <td class="jiapListNum">
      ${j.jiapnum} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     </td>
     <td class="jiapListImg">
      <img src="resources/images/jiap/jiap_${j.jiapnum}.jpg" class="jiapImg" />
     </td>
     <td class="jiapListTitle">
      ${j.jiaptc }<br>
     </td>
    </tr>
    <tr>
     <td colspan="2">
      <br>
     </td>
    </tr>
  </c:forEach>
 </c:if>
 </table>
</article>