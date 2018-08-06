<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<style>
* {
    box-sizing: border-box;
}

.column {
    float: left;
    width: 32%;
    height:350px;
    padding: 10px;
}

.row{position:relative}
/* Clear floats after the columns */
.row:after {
    content: "";
    display: table;
    clear: both;
}

.cimg:hover {
    background-color: black;
}
.cimg{
	width:100%;
	height:200px;
}
#title{text-decoration: none;}
#title:hover{cursor: pointer; color:green;}

#goodp{text-align:right;}
#choiceLi{
	background:#03A8D8;
	border-radius:20px;
	padding:7px 15px;;
}
</style>
</head>
<body>


<div class="row">
 	<c:forEach var="f" items="${searchList }" varStatus="status">
	  <div class="column">
	  <input type="hidden" name="contentId" value="${f.contentId }"/>
	  <p id="goodp"><input type="button" id="good" name="good" value="${f.good}"></p>
	    
		    <c:if test="${f.feImg1 != null}">
		    	<img src="${f.feImg1}" class="cimg"/>
		   	</c:if>
		   	
		   	<c:if test="${f.feImg1 == null }">
		    	<img src="images/no.jpg" class="cimg"/>
		   	</c:if>
		   	 
	    <h3><a id="title" href="fesDetail.mvc?pageNum=${currentPage}&contentId=${f.contentId}&title=${f.title}
	    		&xmap=${f.xmap}&ymap=${f.ymap}">${f.title}</a></h3>
	    <p>이벤트 시작일 : ${f.eventStartdate}<br/>이벤트 종료일 : ${f.eventEndDate}</p>
	  </div>
	</c:forEach>
	
</div>
<div id="pageDiv">

	<ul class="pager">
			<%--
			/* 현재 페이지 그룹의 시작 페이지가 pageGroup보다 크다는 것은
			 * 이전 페이지 그룹이 존재한다는 것으로 현재 페이지 그룹의 시작 페이지에
			 * pageGroup을 마이너스 하여 링크를 설정하면 이전 페이지 그룹의
			 * startPage로 이동할 수 있다.
		 	 **/
		 	 --%>
		 	<c:if test="${ startPage > pageGroup }">
			<li><a href="fesArea.mvc?pageNum=${ startPage - pageGroup }&acode=${acode}&sumArea=${sumArea}">이전</a></li>
			</c:if>	
			<%--
			/* 
				현재 페이지 그룹의 startPage 부터 endPage 만큼 반복하면서
		 	 * 현재 페이지와 같은 그룹에 속한 페이지를 화면에 출력하고 링크를 설정한다.
		 	 * 현재 페이지는 링크를 설정하지 않는다.
		 	 **/
		 	--%>
			<c:forEach var="i" begin="${ startPage }" end="${ endPage }">
				<c:if test="${ i == currentPage }">
					<li id="choiceLi">${ i }</li>
				</c:if>			
				<c:if test="${ i != currentPage }">
					<li><a href="fesArea.mvc?pageNum=${ i }&acode=${acode}&sumArea=${sumArea}">${ i }</a></li>
				</c:if>			
			</c:forEach>
			<%-- 
				현재 페이지 그룹의 마지막 페이지가 전체 페이지 보다 작다는 것은 다음 페이지 그룹이 존재한다는 것
		 	 --%>
			<c:if test="${ endPage < pageCount }">
				<li><a href="fesArea.mvc?pageNum=${ startPage + pageGroup }&acode=${acode}&sumArea=${sumArea}">다음</a></li>
			</c:if>		
			</ul>
		</div> 

</body>
</html>