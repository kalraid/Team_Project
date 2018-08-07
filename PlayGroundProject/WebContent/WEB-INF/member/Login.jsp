<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/datePicker.js"></script>
<link href="css/weather.css" rel="stylesheet">
<style type="text/css">
 .logInBackground{
  background: linear-gradient(to right, white, skyblue, skyblue, skyblue 90%, white);
 }
 #memberLoginTitle{
  text-align: center;
  font-weight: bold;
  color : white;
  text-shadow: 0px 0px 10px red;
  font-size: 50px;
 }
 #memberLoginSubTitle{
  text-align: center;
  font-weight: bold;
  text-shadow: 0 0 5px white;
 }
 #logInTalbe{
  margin:0 auto;
  font-size: 25px;
 }
 #logInBtn{
  margin-top:10px;
  width: 580px;
  height: 80px;
  text-align: center;
  font-size:40px;
  background: linear-gradient(to right bottom, pink, white 70%, pink);
 }
 #logInBtn:hover{
   box-shadow:inset 0px 0px 10px gray;
 }
 .logInPadding{
  padding-top:15px;
 }
 #memberInsertFormLink{
  font-size:20px;
  font-weight: bold;
  margin-top:20px;
  text-align: center;
 }
 
</style>
 <article>
 <form action="memberLogIn.mvc" id="logInForm">
  <div class="logInBackground"><br>
   <h1 id="memberLoginTitle">plaYgrOUnd</h1>
   <h2 id="memberLoginSubTitle">로 그 인</h2><br>
  <table id="logInTalbe">
   <tr>
    <th class="logInPadding">ID : </th>
    <td class="logInPadding">
     <input type="hidden" name="currentURL" id="loginURL">
     <input type="text" id="id" name="id" size="30"></td>
   </tr>
   <tr>
    <th class="logInPadding">P.W : </th>
    <td class="logInPadding"><input type="password" id="pass" name="pass" size="30"></td>
   </tr>
   <tr>
    <th colspan="2">
     <input type="submit" value="Log-In" id="logInBtn">
    </th>
   </tr>
  </table>
   <p id="memberInsertFormLink"><a href="memberInsertForm.mvc">회원 가입</a><br><br></p>
 </div>
 </form>
</article>