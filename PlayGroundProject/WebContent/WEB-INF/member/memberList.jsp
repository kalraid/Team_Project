<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
 .memberListBackground{
  background-color: skyblue;
  
 }
 #memberListTitle{
  text-align: center;
  font-weight: bold;
  color : white;
  text-shadow: 0px 0px 10px red;
  font-size: 50px;
 }
 #memberListSubTitle{
  text-align: center;
  font-weight: bold;
  text-shadow: 0 0 5px white;
 }
 #memberListTable{
  border-collapse: collapse;
  margin:10px auto;
  font-size: 18px;
  font-weight: bold;
  background: linear-gradient(to right bottom, skyblue, white, white, skyblue);
 }
 .memberSearch{
  text-align: center;
 }
 .memberListBlock{
  padding: 5px;
 }
 .memberListColumn{
  text-align: center;
  padding: 5px;
 }
 #searchComment{
  text-align:center;
  font-weight: bold;
  font-size:20px;
 }
 #memberListLink{
  text-align:right;
  font-weight: bold;
  font-size:20px;
 }
</style>
<article>
 <div class="memberListBackground">
  <br>
 <h1 id="memberListTitle">plaYgrOUnd</h1>
 <h2 id="memberListSubTitle">회원 리스트</h2><br>
 <div class="memberSearch">
 <form name="searchForm" id="searchForm">
				<select name="type" id="type">						
					<option value="name">회원이름</option>
					<option value="id">아이디</option>
					<option value="admin">등급</option>
				</select>
				<input type="text" name="keyword" id="keyword" />
				<input type="submit" value="검색" />
			</form></div>
 <c:if test="${ searchOption }">
  <p id="searchComment">"${ word  }" 검색 결과</p>
  <p id="memberListLink"><a href="memberList.mvc">리스트 보기</a></p>
 </c:if>
<table id="memberListTable">
    <tr>			
		<td colspan="9" id="memberListLink"></td>
	</tr>
	<tr>
		<th class="memberListColumn">이름</th>
		<th class="memberListColumn">ID</th>
		<th class="memberListColumn">PW</th>
		<th class="memberListColumn">생년월일</th>
		<th class="memberListColumn">주소</th>
		<th class="memberListColumn">이메일</th>
		<th class="memberListColumn">성별</th>
		<th class="memberListColumn">핸드폰</th>
		<th class="memberListColumn">등급</th>
	</tr>
<c:if test="${ searchOption and not empty memberList }">
	<c:forEach var="m" items="${ memberList }" varStatus="status">		
	<tr>
		<td class="memberListBlock">
			<a href="memberDetail.mvc?id=${ m.id }&pageNum=${ currentPage }
				&type=${ type }&keyword=${ keyword }">${ m.name }</a>
		</td>
		<td class="memberListBlock">
			<a href="memberDetail.mvc?id=${ m.id }&pageNum=${ currentPage }
				&type=${ type }&keyword=${ keyword }">${ m.id }</a>
		</td>
		<td class="memberListBlock">
			<a href="memberDetail.mvc?id=${ m.id }&pageNum=${ currentPage }
				&type=${ type }&keyword=${ keyword }">${ m.password }</a>
		</td>
		<td class="memberListBlock">
			<a href="memberDetail.mvc?id=${ m.id }&pageNum=${ currentPage }
				&type=${ type }&keyword=${ keyword }">${ m.birthday }</a>
		</td>
		<td class="memberListBlock">
			<a href="memberDetail.mvc?id=${ m.id }&pageNum=${ currentPage }
				&type=${ type }&keyword=${ keyword }">${ m.address }</a>
		</td>
		<td class="memberListBlock">
			<a href="memberDetail.mvc?id=${ m.id }&pageNum=${ currentPage }
				&type=${ type }&keyword=${ keyword }">${ m.email }</a>
		</td>
		<td class="memberListBlock">
			<a href="memberDetail.mvc?id=${ m.id }&pageNum=${ currentPage }
				&type=${ type }&keyword=${ keyword }">${ m.gender }</a>
		</td>
		<td class="memberListBlock">
			<a href="memberDetail.mvc?id=${ m.id }&pageNum=${ currentPage }
				&type=${ type }&keyword=${ keyword }">${ m.phone }</a>
		</td>
		<td class="memberListBlock">
			<a href="memberDetail.mvc?id=${ m.id }&pageNum=${ currentPage }
				&type=${ type }&keyword=${ keyword }">${ m.admin }</a>
		</td>
	</tr>
	</c:forEach>
	<tr>
		<td colspan="9" class="listPage">
		 	<c:if test="${ startPage > pageGroup }">
				<a href="memberList.mvc?pageNum=${ startPage - pageGroup }
					&type=${ type }&keyword=${ keyword }">[이전]</a>
			</c:if>	

			<c:forEach var="i" begin="${ startPage }" end="${ endPage }">
				<c:if test="${ i == currentPage }">
					[ ${ i } ]
				</c:if>			
				<c:if test="${ i != currentPage }">
					<a href="memberList.mvc?pageNum=${ i }&type=${ type }
						&keyword=${ keyword }">[ ${ i } ]</a>
				</c:if>			
			</c:forEach>
			<c:if test="${ endPage < pageCount }">
				<a href="memberList.mvc?pageNum=${ startPage + pageGroup }
					&type=${ type }&keyword=${ keyword }">[다음]</a>
			</c:if>		
		</td>
	</tr>
</c:if>	
<c:if test="${ not searchOption and not empty memberList }">
	<c:forEach var="m" items="${ memberList }" varStatus="status">		
	<tr>
		<td class="memberListBlock">
		 <a href="memberDetail.mvc?id=${ m.id }&pageNum=${ currentPage }">${ m.name }</a>
		</td>
		<td class="memberListBlock">
			<a href="memberDetail.mvc?id=${ m.id }&pageNum=${ currentPage }">${ m.id }</a>
		</td>
		<td class="memberListBlock">
		 <a href="memberDetail.mvc?id=${ m.id }&pageNum=${ currentPage }">${ m.password }</a>
		</td>
		<td class="memberListBlock">
		 <a href="memberDetail.mvc?id=${ m.id }&pageNum=${ currentPage }">${ m.birthday }</a>
		</td>
		<td class="memberListBlock">
		 <a href="memberDetail.mvc?id=${ m.id }&pageNum=${ currentPage }">${ m.address }</a>
		</td>
		<td class="memberListBlock">
		 <a href="memberDetail.mvc?id=${ m.id }&pageNum=${ currentPage }">${ m.email }</a>
		</td>
		<td class="memberListBlock">
		 <a href="memberDetail.mvc?id=${ m.id }&pageNum=${ currentPage }">${ m.gender }</a>
		</td>
		<td class="memberListBlock">
		 <a href="memberDetail.mvc?id=${ m.id }&pageNum=${ currentPage }">${ m.phone }</a>
		</td>
		<td class="memberListBlock">
		 <a href="memberDetail.mvc?id=${ m.id }&pageNum=${ currentPage }">${ m.admin }</a>
		</td>
	</tr>
	</c:forEach>
	<tr>
		<td colspan="9" class="listPage">
		 	<c:if test="${ startPage > pageGroup }">
				<a href="memberList.mvc?pageNum=${ startPage - pageGroup }">[이전]</a>
			</c:if>	

			<c:forEach var="i" begin="${ startPage }" end="${ endPage }">
				<c:if test="${ i == currentPage }">
					[ ${ i } ]
				</c:if>			
				<c:if test="${ i != currentPage }">
					<a href="memberList.mvc?pageNum=${ i }">[ ${ i } ]</a>
				</c:if>			
			</c:forEach>
			<c:if test="${ endPage < pageCount }">
				<a href="memberList.mvc?pageNum=${ startPage + pageGroup }">[다음]</a>
			</c:if>		
		</td>
	</tr>
</c:if>
<c:if test="${ searchOption and empty memberList }">
	<tr>
		<td colspan="9" class="memberListColumn">
			"${ keyword }"가 포함된 게시 글이 존재하지 않습니다.</td>
	</tr>
</c:if>
<c:if test="${ not searchOption and empty memberList }">
	<tr>
		<td colspan="9" class="memberListColumn">게시 글이 존재하지 않습니다.</td>
	</tr>
</c:if>
</table>
<br><br>
</div>
</article>