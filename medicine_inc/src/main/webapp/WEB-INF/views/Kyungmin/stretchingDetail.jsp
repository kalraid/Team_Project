<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<article>
 <input type="hidden" name="pageNum" value="${ pageNum }" />
 <h1>${s.stretchingtitle}</h1><br>
 <table id="s_DetailTable">
  <c:forEach begin="1" end="8" var="i">
   <c:set var="tempName">stretchingcontent${i}</c:set>
   <c:if test="${not empty s[tempName]}">
    <tr class="s_DetailTr">
     <td class="s_DetailTd">
      <img src="resources/images/stretching/stretching${s.stretchingnum}_${i}.jpg"/>
   	 </td>
    </tr>
    <tr class="s_DetailTr">
     <td class="s_DetailTd">
      ${s[tempName]}
     </td>
    </tr>
   </c:if>
  </c:forEach>
 </table>
 <br><br>
 <input type="button" value="목록보기" onclick="javascript:window.location.href='stretchingList?pageNum=${pageNum}'"/>
</article>