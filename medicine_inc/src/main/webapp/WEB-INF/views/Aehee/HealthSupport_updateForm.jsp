<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<article>
<form name="updateForm" id="updateForm" action="update" method="post">
	<%-- <input type="hidden" name="no" value="${ board.no }" />
	<input type="hidden" name="pageNum" value="${ pageNum }" />
	 --%>
	<%-- <c:if test="${ searchOption }">
		<input type="hidden" name="type" value=${ type }" />
		<input type="hidden" name="keyword" value=${ keyword }" />
	</c:if> --%>
	
	
<%-- <table class="readTable">
	<tr>
		<td colspan="4" class="boardTitle">
			<!-- 
			 스프링 태그 라이브러리를 이용해 root-context.xml에서 설정한
			 titleMessages.properties 메시지 자원에 접근해 code 속성 지정한
			 키에 해당하는 메시지를 출력한다.
			-->
			<h2><spring:message code="bbs.update.title" /></h2>
		</td>
	</tr>
	<tr><td colspan="4">&nbsp;</td></tr>
	
	<tr>
		<th>제품 명</th>
		<td><input type="text" name="name" id="name" size="50" maxlength="50" value="${ board.name }"/></td>				
	</tr>
	<tr>
		<th class="readTh">정가</th><td class="readTd" colspan="3">
			<textarea name="consumerPrice" id="consumerPrice" rows="20" 
				cols="72">${ board.consumerPrice } </textarea>
		</td>				
	</tr> --%>
	<!--  ---------------------------------------------------------------------------->
	 <ul>
<li><font size="6" face="Arial" style="bold">${board.name }</font></li>
<li><font size="3" face="Arial" style="bold">${board.explanation }</font></li>
 </ul>
 
 <a href ="HealthSupport_detail?no=${i.no}"><img alt="${board.bigImage}" src="resources/images/Aehee/${board.bigImage }">
 
 <table>
 	<ul>
 	<li><font size="4" face="Arial" style="bold">정가&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<del>${board.consumerPrice }&nbsp;원</del></font></li><br/>
 	<li><font size="4" face="Arial" style="bold">판매가&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${board.sellingPrice }&nbsp;원</font></li><br/>
 	<li><font size="4" face="Arial" style="bold">용량&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${board.capacity }</font></li><br/>
 	<li><font size="4" face="Arial" style="bold">형태&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${board.shape }</font></li>
 
 	
 	</ul>
 </table>
	<tr>
			<td colspan="4">&nbsp;</td></tr>
	
	<tr>		
		<td class="tdSpan" colspan="4">
			<input type="reset" value="다시쓰기" />
			&nbsp;&nbsp;<input type="submit" value="수정하기" />
			<c:if test="${ not searchOption }">
			&nbsp;&nbsp;<input type="button" value="목록보기" 
					onclick="javascript:window.location.href=
					'boardList?pageNum=${pageNum}'"/>		
			</c:if>
			<c:if test="${ searchOption }">
			&nbsp;&nbsp;<input type="button" value="목록보기" 
					onclick="javascript:window.location.href=
					'boardList?pageNum=${pageNum}&type=${ type }&keyword=${keyword }'"/>		
			</c:if>		
		</td>
	</tr>
</table>
</form>			
</article>