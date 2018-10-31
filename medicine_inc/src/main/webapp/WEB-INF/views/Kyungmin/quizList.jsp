<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
 $(function(){
	 $("#slidingPuzzle").click(function(){
		 window.open("slidingPuzzle");
	 });
	 
	 $("#jigsawPuzzle").click(function(){
		 window.open("jigsawPuzzle");
	 });
	 
	 $("#eyeTest").click(function(){
		 window.location.href="eyeTest";
	 });
	 
	 $("#photoTest").click(function(){
		 window.location.href="photoTest";
	 });
 });
</script>
<link href="resources/css/weather.css" rel="stylesheet">
<style>
 #quizListBg{
  background-image: url("resources/images/leaf/Snow-Globe.jpg");
  background-size: 100% 100%;
 }
 
 #quizListTitle{
  font-size: 50px;
  text-align:center;
  padding: 10px 30px 10px 30px;  
  font-weight: bold;
  color:white;
  background:linear-gradient(to right bottom, red,pink, green);
  border-radius: 20px;
 }
 .quizListLink{
  color:black;
 }
 .quizListTd{
  padding: 10px 40px 10px 40px;
  background:white;
  text-align: center;
  font-size: 40px;
  font-weight: bold;
  margin-top: 10px;
  border-radius: 50px;
 }
 #quizListTable,#quizListTitleTable{
  margin: 0 auto;
 }
</style>
<article>
<div class="weather snow">
<div id="quizListBg">
<br>
<br>
<table id="quizListTitleTable">
 <tr>
  <td id="quizListTitle">
  심 심 풀 이 테 스 트
  </td>
 </tr>
</table>
<table id="quizListTable">
 <tr>
  <td>
   <br><br>
  </td>
 </tr>
 <tr>
  <td class="quizListTd">
   <a id="eyeTest" class="quizListLink">Real 시력 테스트</a>
  </td>
 </tr>
 <tr>
  <td>
   <br><br>
  </td>
 </tr>
 <tr>
  <td class="quizListTd">
   <a id="photoTest" class="quizListLink">사진 시력 테스트</a>
  </td>
 </tr>
 <tr>
  <td>
   <br><br>
  </td>
 </tr>
 <tr>
  <td class="quizListTd">
   <a id="slidingPuzzle" class="quizListLink">슬라이딩 퍼즐</a>
  </td>
 </tr>
 <tr>
  <td>
   <br><br>
  </td>
 </tr>
 <tr>
  <td class="quizListTd">
   <a id="jigsawPuzzle" class="quizListLink">직소 퍼즐</a>
  </td>
 </tr>
</table>
<br><br><br><br><br><br><br>
</div>
</div>
</article>