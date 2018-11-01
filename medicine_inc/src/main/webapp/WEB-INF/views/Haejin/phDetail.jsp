<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>  
<link rel="stylesheet" type="text/css" href="resources/css/phdetail.css" />
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=eCpZh1GoE4UX4hSfNtVs"></script>
<script type="text/javascript" src="resources/js/phDetail.js"></script>
<script type="text/javascript" src="resources/js/mapok.js"></script>
<div style="margin:30px;"><h1 style="text-align:center; font-size:30px; color:green;">상세정보 페이지</h1>
</div>
<div>

<c:if test="${not empty mapok}">
<div>  
	<div id="map" style="width:100%;height:800px;"></div>
</div>
</c:if>

<div id="detailDiv">
<c:if test="${tabactive eq '0'}">
	<h2 style="margin:0px auto; text-align:center;">약국 상세 정보</h2>
</c:if>
<c:if test="${tabactive eq '1'}">
	<h1 style="margin:0px auto; text-align:center;">병원 상세 정보</h1>
</c:if>
	<form name="searchPos" id="searchPos">
		<input type="hidden" name="y" id="ey" value="${sList[0].xpos }" />
		<input type="hidden" name="x" id="ex" value="${sList[0].ypos }" />
	</form>
	<ul class="w3-ul" style="padding:0px;margin:0px auto;">
    <li>병원명	:	${sList[0].name}</li>
    <li>주소		:	${sList[0].addr } (${sList[0].post })</li>
    <li>전화번호 :	${sList[0].tel }</li>
    <c:if test="${tabactive eq '1'}">
    <li>홈페이지주소 :	${sList[0].hosurl }</li>
    </c:if>
  </ul>
</div>
<div id="replyDiv">
<h1 id ="rTitle" style="margin:0px auto; text-align:center;">댓글 리스트</h1>
<br/>
<div id="grWrite" style="color:green; margin:10px; font-size:15px;">
				&nbsp;댓글쓰기
</div>
<table id="table1">
	<c:if test="${ empty greplyList }" >
	<tr id="replyList">
		<td colspan="4">
		<div id="grnotReply">
			이 게시 글에 대한 댓글이 존재하지 않습니다.  
		</div>			
		</td>
	</tr>
	</c:if>
	<c:if test="${ not empty greplyList }" >
	<tr id="replyList">
		<td colspan="4">		
		<table id="grTable">
			<c:forEach var="greply" items="${ greplyList }" >
			<tr id="reply_${ greply.no }">
				<td>									
				<div class="grModify">
					<span class="grdate">
						<fmt:formatDate value="${ greply.date}" 
							pattern="yyyy-MM-dd HH:mm:ss" /></span>
					<a href="#" class="modifygr" data-no="${ greply.no }">
						<img src="resources/images/reply_btn_modify.gif" alt="댓글 수정하기"/></a>
					<a href="#" class=deletgr data-no="${ greply.no }">
						<img src="resources/images/reply_btn_delete.gif" alt="댓글 삭제하기"/></a>
				</div>	
				<div class="grContent" id="div_${ greply.no }">
					<pre><span>${ greply.content }</span></pre>
				</div>
				</td>
			</tr>	
			</c:forEach>
		</table>				
		</td>
	</tr>	
	</c:if>
	</table>
		
	<div id="grForm">
		<form name="grWriteForm" id="grWriteForm">				
			<input type="hidden" name="bno" value="${sList[0].no}" id="bno"/>
			<input type="hidden" name="btype" value="${ tabactive }" id="btype"/>
			<table id="grWriteTable">
				<tr>
					<td id="grWriteTitle" colspan="2">
						<span>악의적인 댓글시 댓글이 삭제됩니다.</span>
					</td>
				</tr>
				<tr>
					<td id="grWriteContent">
						<textarea name="content" id="grContent" rows="4">댓글입력</textarea>
					</td>
					
					<td id="grWritePass">
						<textarea name="pass" id="grpass" rows="2" >비밀번호 입력</textarea>
					</td>
					<td id="grWriteImage">						
						<input type="button" 	id="grWriteButton" value="댓글입력" />
					</td>
					
				</tr>
			</table>
		</form>	
	</div>	

</div>
</div>
