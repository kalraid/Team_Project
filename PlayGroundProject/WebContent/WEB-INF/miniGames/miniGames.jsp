<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
 #minigamesLink{
  float: left;
  background-color: skyblue;
 }
 #minigamesLink >a> img{
  width: 600px;
  height: 600px;
  border:2px solid black;
  margin-left: 20px;
  margin-right: 20px;
 }
 .minigamesP{
  font-size: 20px;
  font-weight: bold;
  text-align: center;
 }
 #minigameLinkTitle{
  text-align: center;
  font-weight: bold;
  color : white;
  text-shadow: 0px 0px 10px red;
  font-size: 50px;
 }
 #minigameLinkSubTitle{
  text-align: center;
  font-weight: bold;
  text-shadow: 0 0 5px white;
 }
</style>
<article>
 
 <div id="minigamesLink">
 <h1 id="minigameLinkTitle">plaYgrOUnd</h1>
 <h2 id="minigameLinkSubTitle">Mini Games</h2><br>
  <a href="roulette.mvc">
   <img src="images/roulette.gif"/>
  </a>
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <a href="mole.mvc">
   <img src="images/mole.jpg">
  </a>
  <br><br>
  <p class="minigamesP">이미지를 클릭해 주세요</p><br>
 </div>
</article>