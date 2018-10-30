<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<article>
<form name="updateForm" id="updateForm" action="update"
method="post">
<input type="hidden" name="no" value="${ board.no }" />
<table class="readTable">
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
<th class="readTh">글쓴이</th>
<td class="readTd">
<input type="text" name="writer" id="writer" size="30"
maxlength="10" value="${ board.writer }" readonly/>
</td>
<th class="readTh">비밀번호</th>
<td class="readTd">
<input type="password" name="pass" id="pass" size="30"
maxlength="10" />
</td>
</tr>
<tr>
<th class="readTh">제&nbsp;&nbsp;목</th>
<td class="readTd" colspan="3">
<input type="text" name="title" id="title" size="50"
maxlength="50" value="${ board.title }"/>
</td>
</tr>
<tr>
<th class="readTh">내&nbsp;&nbsp;용</th>
<td class="readTd" colspan="3">
<textarea name="content" id="content" rows="20"
cols="72">${ board.content } </textarea>
</td>
</tr>
<tr>
<td colspan="4">&nbsp;</td></tr>
<tr>
<tr>
<td class="tdSpan" colspan="4">
<input type="reset" value="다시쓰기" />
&nbsp;&nbsp;<input type="submit" value="수정하기" />
&nbsp;&nbsp;<input type="button" value="목록보기"
onclick="javascript:window.location.href='boardList'"/>
</td>
</tr>
</table>
</form>
</article>