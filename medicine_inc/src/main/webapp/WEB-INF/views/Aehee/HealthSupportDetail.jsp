<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
	.none_mask {
		list-style: none;
	}
	div {
		height: 50px;
	}
</style>    
<article>
  <ul>
	<li class="none_mask"><font size="6" face="Arial" style="bold">${board.name }</font></li>
	<li class="none_mask"><font size="3" face="Arial" style="bold">${board.explanation }</font></li>
	<li class="none_mask"><img alt="${board.bigImage} 입니다." src="resources/images/Aehee/${board.bigImage }"></li>
	<li class="none_mask">
		<ul>
		 	<li><font size="4" face="Arial" style="bold">정가&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		 		<del>		 			
		 			<fmt:formatNumber value="${ board.consumerPrice }" type="number" />&nbsp;원
		 		</del></font></li>
		 	<li><font size="4" face="Arial" style="bold">판매가&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		 		<fmt:formatNumber value="${board.sellingPrice }" type="number" />&nbsp;원</font></li>
		 	<li><font size="4" face="Arial" style="bold">용량&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${board.capacity }</font></li>
		 	<li><font size="4" face="Arial" style="bold">형태&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${board.shape }</font></li>
		</ul>
	</li>
 </ul>
 <div>
 	&nbsp;
 </div> 
<%-- 
	<a href="HealthSupportWriteForm?no=${ board.no }">form으로 가기</a> 
--%>
</article>