<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
					<c:if test="${not fn:contains(pl.placeImg, '.jpg')}">
						<div class="left_box">
							<img
								src="https://maps.googleapis.com/maps/api/place/photo?maxwidth=300&maxheight=130&photoreference=${pl.placeImg}&key=AIzaSyBhdedgmrTytwJsq_mhBknZ8RZ4spbmjqU"
								class="imgs">
						</div>
					</c:if>
					<c:if test="${fn:contains(pl.placeImg, '.jpg')}">
						<div class="left_box">
							<img src="images/${pl.placeImg}" class="imgs">
						</div>
					</c:if>
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
