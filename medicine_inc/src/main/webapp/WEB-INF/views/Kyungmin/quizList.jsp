<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
 $(function(){
	 $("#slidingPuzzle").click(function(){
		 window.open("slidingPuzzle");
	 });
 });
</script>
<link href="resources/css/weather.css" rel="stylesheet">
<style>
 #quizListBg{
  background-image: url("resources/images/leaf/Snow-Globe.jpg");
  background-size: 100% 100%;
 }
</style>
<article>
<div class="weather snow">
<div id="quizListBg">
<h1>심심풀이 테스트</h1>
<table id = "quizListTable">
 <tr>
  <td>
   <a href="eyeTest">Real 시력 테스트</a>
  </td>
 </tr>
 <tr>
  <td>
   <a href="photoTest">사진 시력 테스트</a>
  </td>
 </tr>
 <tr>
  <td>
   <a id="slidingPuzzle">슬라이딩 퍼즐</a>
  </td>
 </tr>
</table>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</div>
</div>
</article>