<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form name="projectWrite" action="RecommendWriteProcess.mvc" id="projectWrite" 
	method="POST" 
	${ not empty Recommend.File ?  "" : "enctype='multipart/form-data'"}>
		<input type="hidden" name="id" value="${sessionScope.id }"/>
		<table class="readTable">
			
			<tr>
				<td colspan="4" class="boardTitle"><h2>게시 글쓰기</h2></td>
			</tr>
			<tr>
				<td colspan="4">&nbsp;</td>
			</tr>
			
			
			<tr>
			
			</tr>
			
			<tr>
				<td class="readTh">글&nbsp;&nbsp;&nbsp;쓴&nbsp;&nbsp;&nbsp;&nbsp;이 </td>
				<td class="readTd">
					<input type="text" max="3" name="people" size="20" id="people" maxlength="10"/>
				</td>
				
			</tr>		
			
			
			<tr>
				<td class="readTh">제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</td>
				<td class="readTd" colspan=3>
					<input type="text" name="linklist" size="20" id="linklist" maxlength="50"/>
				</td>
			</tr>			
			
			
			
			
			
			<tr>
				<td class="readTh">내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;용</td>
				<td class="readTd" colspan="3">
					<textarea name="gesimul" id="gesimul" rows="20" cols="80"></textarea>
				</td>
			</tr>
			<tr>
			<td class="readTh">파일첨부</td>
			<td class="readTd" colspan=3>
				<input type="file" name="file" size="70" id="file" maxlength="50" value="${ board.file}"/>
			</td>
			
			<tr>
				<td colspan="4">&nbsp;</td>
			</tr>
			
			
			<tr>
				<td colspan="4" class="tdSpan"><input type="reset" value="다시쓰기"/>
					&nbsp;&nbsp;<input type="submit" value="등록하기" />
					&nbsp;&nbsp;<input type="button" value="목록보기" 
						onclick="javascript:window.location.href='RecommendList.mvc'"/></td>
			</tr>
		</table>
	</form>
</body>
</html>