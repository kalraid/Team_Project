<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<style>
.contentTable{
margin : 0 auto;
}
#jiwontextarea{
margin-top : 20px;
}
</style>
<article>
	<form name="checkForm" id="checkForm">
		<input type="hidden" name="bno" id="bno" value="${ jiwonBoard.bno }" />
		<input type="hidden" name="pass" id="rPass" />
	</form>
	
	<table class="contentTable">
		<tr>
			<td colspan="4" class="boardTitle">

				<h2>
			
				</h2>
			</td>
		</tr>
		<tr>
			<td colspan="4">&nbsp;</td>
		</tr>
		<tr>
			<td class="contentTh">제&nbsp;&nbsp;&nbsp;&nbsp;목</td>
			<td class="contentTd" colspan="3">${ jiwonBoard.title }</td>
		</tr>
		<tr>
			<td class="contentTh">글쓴이</td>
			<td class="contentTd">${jiwonBoard.writer }</td>
			<td class="contentTh">작성일</td>
			<td class="contentTd"><fmt:formatDate
					value="${ jiwonBoard.regDate }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
		</tr>
		<tr>
			<td class="contentTh">비밀번호</td>
			<td class="contentTd"><input type="password" name="pass"
				id="pass"></td>
			<td class="contentTh">조회수</td>
			<td class="contentTd">${ jiwonBoard.viewcnt }</td>
		</tr>
		
		<tr>
			<td class="readContent" colspan="4"><textarea id ='jiwontextarea' rows="20" cols="60">${ jiwonBoard.content }</textarea>
			</td>
		</tr>
	

		<tr>
			<td colspan="4">&nbsp;</td>
		</tr>
		<tr>
			<td colspan="4" class="tdSpan"><input type="button"	id="detailUpdate" value="수정하기" /> 
				&nbsp;&nbsp;<input type="button" id="detailDelete" value="삭제하기" /> 
				&nbsp;&nbsp;<input type="button" value="목록보기"
				onclick="javascript:window.location.href='jiwonBoardList?pageNum=${pageNum}'" />
			</td>
		</tr>
	</table>
</article>