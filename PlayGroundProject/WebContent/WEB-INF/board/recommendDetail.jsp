<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.playground.beans.*,com.playground.dao.*"%>
<%@ page import="java.net.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.contentTh, .contentTd, .contentTdSpan {
	border: 1px solid #787878;
}

.contentTh {
	width: 120px;
	height: 30px;
	text-align: center;
	background-color: #EAEAEA;
}

.contentTd {
	width: 250px;
	padding-left: 10px;
}

.contentTdSpan {
	width: 640px;
	padding-left: 10px;
}

.readContent {
	/* height: 300px; */
	padding: 20px;
	border: 1px solid #787878;
	vertical-align: top;
	word-break: break-all;
}

#replyTable {
	margin: 0px;
	padding: 0px;
	font-size: 12px;
	border-collapse: collapse;
	border: 1px solid #EAEAEA;
}

.replyHeader {
	height: 30px;
	line-height: 30px;
	border: 1px solid #EAEAEA;
	text-align: center;
}

#recommend {
	float: right;
	width: 260px;
	text-decoration: none;
}

.recommend {
	font-weight: bold;
	color: #777777;
}


.replyModify {
	float: right; 
	width: 369px;
	height: 30px;
	line-height: 30px;
	padding-right: 10px;
	text-align: right;
	background: #EFEFEF;
}

.replyContent {
	clear: both;
	line-height: 20px;
	padding: 5px 10px 5px 10px;
	/* line-height: 30px; */
}

#replyForm {
	width: 750px;
	margin: 0 auto;
	display: none;
}

#replyWriteTable {
	width: 100%;
	height: 26px;
	line-height: 26px;
	border: 0px;
	margin: 5px 0 5px 0;
	font-size: 12px;
}

#replyWriteTitle {
	background: #F7F7F7;
	padding: 3px;
	text-align: center;
}

#replyWriteContent {
	width: 100%;
	height: 100%;
}

#replyContent {
	width: 100%;
	padding: 0px;
	word-break: break-all;
}

#replyWriteButton {
	width: 85px;
	height: 54px;
	border: 0px;
}

#notReply {
	padding: 10px;
}

#rec {
	height: 50px;
	width: 70px;
}
.recommend{
text-align: left;
display: inline-block;
}
#replyWirte{
text-align: right;
display: inline-block;
}
</style>
<head>
<body>
	<script src="js/jquery-1.11.3.min.js"></script>
	<script src="js/formcheck.js"></script>
	<script src="js/reply.js"></script>
	<form name="checkForm" id="checkForm">
		<input type="hidden" name="no" id="rNo" value="${ no  }"/> <input type="hidden"
			name="pass" id="rPass" value="${ pass  }"/> <input type="hidden" name="pageNum"
			value="${ pageNum  }" />
		<!-- 
		검색 요청일 경우 다시 keyword에 해당하는 검색 리스트로
		돌려보내기 위해서 아래의 파라미터가 필요하다.
	 -->
		<c:if test="${ searchOption  }">
			<input type="hidden" name="type" value="${  type }" />
			<input type="hidden" name="keyword" value="${ keyword  }" />
		</c:if>
		
	</form>
	
	<table class="contentTable">
	
		<tr>
			<td colspan="4" class="boardTitle"><h2>글 내용 보기</h2></td>
		</tr>
		
		<tr>
			<td colspan="4">&nbsp;</td>
		</tr>
		
		<tr>
			<td class="contentTh">제&nbsp;&nbsp;&nbsp;목</td>
			<td class="contentTd" colspan="3">${ recommend.linklist  }</td>
		</tr>
		
		<tr>
			<td class="contentTh">글쓴이</td>
			<td class="contentTd">${ recommend.people }</td>
			<td class="contentTh">비밀번호</td>
			<td class="contentTd"><input type="text" name="pass" id="pass"></td>
		</tr>
		
		<tr>

			<td class="contentTh">작성일</td>
			<td class="contentTd"><fmt:formatDate
					value="${ recommend.dbdate  }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
			<td class="contentTh">조회수</td>
			<td class="contentTd">${  recommend.good}</td>

		</tr>

		<tr>
			<td class="readContent" colspan="4"><pre>${ recommend.gesimul}</pre>
			</td>
	</tr>
	
			<tr>
	 	<td class="contentTh">파&nbsp;&nbsp;&nbsp;&nbsp;일</td>
		<td class="contentTdSpan" colspan="3">
		<c:if test="${ empty recommend.file }">
			첨부파일 없음
		</c:if>
		<c:if test="${ not empty recommend.file }">
			<a href="upload/${ recommend.file }">파일 다운로드</a><br/>
			<a href="fileDownload.mvc?fileName=${ recommend.file }">파일 다운로드</a>
		</c:if>
		</td>		
	</tr> 
		
		<tr>
			<td colspan="4">&nbsp;</td>
		</tr>
		<tr>
			<td colspan="4" class="tdSpan"><input type="button"
				id="RecommendDetailUpdate" data-no="${  no }" value="수정하기" /> &nbsp;&nbsp;<input
				type="button" id="RecommendDetailDelete" value="삭제하기" /> <!-- 일반 게시 글 리스트에서 온 요청이면 일반 게시 글 리스트로 돌려 보낸다. -->
				<c:if test="${ ! searchOption }">		
				&nbsp;&nbsp;<input type="button" value="목록보기"
						onclick="javascript:window.location.href='RecommendList.mvc?pageNum=${ pageNum }'" />
				</c:if> <!-- 검색 리스트에서 온 요청이면 검색 리스트의 동일한 페이지로 돌려보낸다. --> <c:if
					test="${ searchOption  }">
				&nbsp;&nbsp;<input type="button" value="목록보기"
						onclick="javascript:window.location.href='RecommendList.mvc?pageNum=${ pageNum  }&type=${ type  }&keyword=${  keyword }'" />
					<!-- 
					위의 쿼리 스트링을 작성할 때 같은 줄에서 띄어쓰기 하는 것은 문제되지
					않지만 줄 바꿔서 작성하게 되면 스크립트 에러가 발생한다.
				-->
				</c:if></td>
		</tr>

		<tr>
			<td colspan="4" class="replyHeader" >
				<div id="recommendBox">
					<div class="recommend"> <img src="images/red_button.jpg"
						alt="추천하기" id="rec" />&nbsp;추천 
					</div>
				</div>
			</td>
		</tr>
	
	</table>
	
</body>
</html>