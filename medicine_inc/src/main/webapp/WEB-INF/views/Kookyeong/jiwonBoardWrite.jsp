<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="frm_boardWrite" id="frm_boardWrite" method="post"
		action="/spring/write">
		<table>
			<colgroup>
				<col width="15%">
				<col width="*" />
			</colgroup>
			<caption>게시글 작성</caption>
			<tbody>
				<tr>
					<th scope="row">제목</th>
					<td><input type="text" id="TITLE" name="TITLE" class="wdp_90"
						style="width: 500px"></input></td>
				</tr>
				<tr>
					<td colspan="2" class="view_text"><textarea rows="20"
							cols="100" title="내용" id="CONTENT" name="CONTENT"></textarea></td>
				</tr>
			</tbody>
		</table>
		<input type="submit" name="업로드" value="작성하기" id="write"> <a
			href="/spring/boardMain" class="btn" id="list">목록으로</a>
	</form>
</body>
</html>

