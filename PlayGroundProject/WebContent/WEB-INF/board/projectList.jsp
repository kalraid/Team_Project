<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반 게시판</title>
<style>
body {
	margin-top: 50px;
	font-size: 12px;
	color: black;
	line-height: 160%;
}

.table {
	width: 300%;
	margin: 0 auto;
	padding: 10px 10px;
	border-collapse: collapse;
	line-height: 200%;
}

.projectForm {
	text-align: center;
}

.write {
	text-align: right;
	border-bottom: 1px dotted #787878;
}

.kick3 {
	border: 1px solid green;
	/* border-width: 1px 0;  */
	border-collapse: collapse;
	text-align:center;
	padding: 8px;
	width : 200px;
}

th, td {
	 width : 200px;
	 
}

.projectTr {
	text-align: center;
	border: 1px solid pink;
	/* border-width: 1px 0; */
}

a {
	text-decoration: none;
}
.no, .linklist, .id, .people ,.date ,.good{
	text-align:center;
}

</style>
</head>
<body>
	<br />
	<br />
	<br />
	<br />
	<h2 style="text-align: center;">일반 게시판</h2>
	<br />
	<br />

	<table class="table">
		
		<tr>
			<td colspan="3" class="ListLink"><a href="projectList.mvc">리스트</a></td>
			<td colspan="3" class="write"><a href="projectWrite.mvc">글쓰기</a></td>
		</tr>


		<tr class="kick3">
			<th class="no">번호</th>
			<th class="linklist">제목</th>
			<th class="id">아이디</th>
			<th class="people">작성자</th>
			<th class="date">날짜</th>
			<th class="good">조회수</th>
		</tr>
		<c:if test="${ not empty Projectlist }">
			<c:forEach var="p" items="${ Projectlist }" varStatus="status">
				<tr class="projectTr">
					<td class="projectNo">${ p.no  }</td>
					<td class="projectlinklist">
					<a  href="projectDetail.mvc?no=${ p.no }&pageNum=${pageNum}">${p.linklist}</a></td>
					<td class="projectid">${p.id }</td>
					<td class="projectpeople">${p.people }</td>
					<td class="projcetdbdate">${p.dbdate }</td>
					<td class="projcetgood">${p.good }</td>
				</tr>
			</c:forEach>
				<tr>
				<td colspan="6">
			<c:forEach var="num" begin="1" end="${page }">
					<input type="button" value="${num }"
						onclick="location.href='projectList.mvc?pageNum=${num}'">				
			</c:forEach>
			</td>
			</tr>
		</c:if>
		<c:if test="${ empty Projectlist }">
			<tr>
				<td colspan="6" class="listTdSpan">게시 글이 존재하지 않습니다.</td>
			</tr>
		</c:if>
	</table>
</body>
</html>