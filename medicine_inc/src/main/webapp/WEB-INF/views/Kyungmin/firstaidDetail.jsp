<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<article>
<input type="hidden" name="pageNum" value="${ pageNum }" />
 <h1>${f.firstaidtitle}</h1><br>
 <table id="f_DetailTable">
	<c:forEach begin="1" end="8" var="i">
		<c:set var="tempName">firstaidcontent${i}</c:set>
		<c:if test="${not empty f[tempName]}">
		 <tr class="f_DetailTr">
    	  <td class="f_DetailTd">
    	   <img src="resources/images/firstaid/firstaid${f.firstaidnum}_${i}.jpg"/>
   	 	  </td>
    	 </tr>
    	 <tr class="f_DetailTr">
    	  <td class="f_DetailTd">
      	   ${f[tempName]}
     	  </td>
    	 </tr>
		</c:if>
	</c:forEach>
 </table>
 <br><br>
 <input type="button" value="목록보기" onclick="javascript:window.location.href='firstaidList?pageNum=${pageNum}'"/>
</article>