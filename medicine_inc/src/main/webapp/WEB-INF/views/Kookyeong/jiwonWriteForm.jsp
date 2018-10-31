<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<article>
<h2>글쓰기</h2>
<form name="jiwonWriteForm" action="jiwonWriteProcess" id="jiwonWriteForm"
method="post">
<table class="readTable">
<tr>
<td colspan="4" class="boardTitle">
<!--
스프링 태그 라이브러리를 이용해 root-context.xml에서 설정한
titleMessages.properties 메시지 자원에 접근해 code 속성 지정한
키에 해당하는 메시지를 출력한다.
-->
<h2><spring:message code="bbs.write.title" /></h2>
</td>
</tr>
<tr>
<td colspan="4">&nbsp;</td>
</tr>
<tr>
<td class="readTh">글쓴이</td>
<td class="readTd">
<input type="text" name="writer" size="30" id="writer" maxlength="10"/>
</td>
<td class="readTh">비밀번호</td>
<td class="readTd">
<input type="password" name="pass" size="30" id="pass"
maxlength="10"/>
</td>
</tr>
<tr>
<td class="readTh">제&nbsp;&nbsp;&nbsp;&nbsp;목</td>
<td class="readTd" colspan=3>
<input type="text" name="title" size="80" id="title" maxlength="50"/>
</td>
</tr>
<tr>
<td class="readTh">내&nbsp;&nbsp;&nbsp;&nbsp;용</td>
<td class="readTd" colspan="3">
<textarea name="content" id="content" rows="20" cols="80"></textarea>
</td>
</tr>
<tr>
<td colspan="4">&nbsp;</td>
</tr>
<tr>
<td colspan="4" class="tdSpan"><input type="reset" value="다시쓰기"/>
&nbsp;&nbsp;<input type="submit" value="등록하기" />
&nbsp;&nbsp;<input type="button" value="목록보기"
onclick="javascript:window.location.href='jiwonBoardList'"/></td>
</tr>
</table>
</form>
</article>