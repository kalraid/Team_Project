<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" type="text/css" href="resources/css/search.css" />
<style>

.title2{
	margin : 0px 50px 0px 150px ;
	/* border : 1px dotted; */
	width : 700px;
}
.title1{
	text-align:center;
}
.title2 > img {
	width : 200px;
	height : 80px;
}
p{
padding-top : 2px;
width : 93%;
margin : 2px auto; 
}
h1:nth-of-type() {
	background-color: black;
}
.title2 dl:not(:last-child){border-bottom:1.5px solid blue;

}
dl{
	border-collapse: collapse;
	border: 1px solid black;
	margin:0px;
}
</style>
<article>
	<table class="table table-hover">
	<tr>
	<th><h2 class ="title1">보건 뉴스 리스트</h2></th></tr>
	<tr></tr>
	</table>
	<table class="table"><tr>
		<c:forEach var="e" items="${ elem4 }" >
				<td>
				${ e.getElementsByTag("dl") }
				</td>
		</c:forEach>
		</tr>
	</table>
</article>
