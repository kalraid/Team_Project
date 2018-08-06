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
h2{font-weight:bold; text-align:center;}
</style>
</head>
<body>
<h2>이번달 축제 BEST6</h2>

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

</body>
</html>