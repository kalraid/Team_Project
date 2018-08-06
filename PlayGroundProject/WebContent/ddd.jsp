<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery-3.3.1.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<img src="" alt="안녕1" id="안녕2" class="안녕3" name="안녕4" data-value-in="안녕5">
	<img src='https://maps.googleapis.com/maps/api/place/photo?maxwidth=600&maxheight=130
		&key=AIzaSyBhdedgmrTytwJsq_mhBknZ8RZ4spbmjqU' class='imgs' name='Aaa'>
	<script>
	$(function(){
	var i = $("#안녕2").attr("data-value-in");
	alert(i);
	});
	var i2 = $(".imgs").attr("name");
	alert(i2);
	</script>
	
</body>
</html>

