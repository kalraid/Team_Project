<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
<style>
#home1{
	margin:0 0 0 150px;
	border:1px solid red;
}
#home2{
	margin:0;
	padding:10px;
	overflow:hidden;
	height:auto;
	border:1px solid blue;
}

#page01{
float:left;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<nav id="page01">
	<jsp:include page="test.jsp" ></jsp:include>
</nav>
<div id="home1">
<div id="home2">
	<c:if test="${ not empty param.home }">
			<jsp:include page="${param.home}"/>
	</c:if>
</div>

</div>
			
</body>
</html>