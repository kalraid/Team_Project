<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PlayGround</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js">	</script>
<script src="js/jquery-ui.min.js"></script>
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css02/bootstrap.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="css/weather.css" rel="stylesheet">
<style>
* {
	margin: 0;
	padding: 0;
}

body {
	width: 80%;
	border: 1px solid black;
	margin: 0 auto;
	min-width: 1200px;
}

</style>
</head>
<body>
	<nav>
		<jsp:include page="mainpage/menubar.jsp"></jsp:include>
	</nav>
	<div class="clear"></div>
	<c:if test="${ not empty param.body }">
		<jsp:include page="${ param.body }" />
	</c:if>
	
</body>
</html>