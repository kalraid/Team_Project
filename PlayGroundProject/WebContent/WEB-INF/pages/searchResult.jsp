<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <script src="https://code.jquery.com/jquery-3.3.1.min.js">	</script> --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
	<style>
ul li {
	list-style: none;
}

.left_box {
	width: 25%;
}

.right_box {
	width: 72%;
}

.left_box, .right_box {
	border: 1px solid rgb(3, 175, 185);
	margin: 10px 0;
	height: 150px;
	display: inline-block;
	overflow: auto;
}

.imgs {
	width: 90%;
	height: 90%;
	magin: 0 auto;
}
</style>
<section>
	<ul>
		<c:forEach var="pl" items="${List}" varStatus="status">
			<li><c:if test="${not empty pl.placeImg }">
					<div class="left_box">
						<c:if test="${fn:length(sessionScope.PList[0].img)}>=20">
						<img
							src="https://maps.googleapis.com/maps/api/place/photo?maxwidth=300&maxheight=130&photoreference=${pl.placeImg}&key=AIzaSyBhdedgmrTytwJsq_mhBknZ8RZ4spbmjqU"
							class="imgs">
						</c:if>
						<c:if test="${fn:length(sessionScope.PList[0].img)}<20">
						<img
							src="imges/${pl.placeImg}"
							class="imgs">
						</c:if>
					</div>
				</c:if> <c:if test="${ empty pl.placeImg }">
					<div class="left_box">
						<img src="images/red_button.jpg" class="imgs">
					</div>
				</c:if>
				<div class="right_box">
					<div>placeName : ${pl.placeName}</div>
					<div>placeIntro : ${pl.placeIntro}</div>
					<div>address : ${pl.address}</div>
					<div>grade : ${pl.grade}</div>
					<div>longitude : ${pl.longitude} & latitude : ${pl.latitude}</div>
				</div></li>
		</c:forEach>
		<li>
			<div class="left_box"></div>
			<div class="right_box"></div>
		</li>
	</ul>
</section>
