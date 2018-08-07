<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="/js/jquery-3.3.1.min.js"></script>
<script src="/js/datePicker.js"></script>    
<style>
 .memberDetailBackground{
  background: linear-gradient(to right, white, skyblue, skyblue, skyblue 90%, white);
 }
 #memberDetailTitle{
  text-align: center;
  font-weight: bold;
  color : white;
  text-shadow: 0px 0px 10px red;
  font-size: 50px;
 }
 #memberDetailSubTitle{
  text-align: center;
  font-weight: bold;
  text-shadow: 0 0 5px white;
 }
 #memberDetailTable{
  border-collapse: collapse;
  margin:10px auto;
  font-size: 18px;
  font-weight: bold;
  background:transparent;
 }
 #memberDetailTable tr th{
  padding-left: 20px;
  padding-top:10px;
 }
 #memberDetailTable tr td{
  padding-right: 20px;
  padding-top:10px;
 }
 .adminBtns{
  text-align:center;
 }
</style>
<article>
	<div class="memberDetailBackground"><br>
	 <h1 id="memberDetailTitle">plaYgrOUnd</h1>
     <h2 id="memberDetailSubTitle">회원 정보</h2><br>
	<c:set var="m" value="${ member }"/>
	<form action="memberAdminUpDate.mvc" id="memberAdminUpDate" method="post">
	 <input type="hidden" id="id" name="id" value="${ m.id }">
	 <input type="hidden" id="admin" name="admin" value="${ m.admin }">
	 <table id="memberDetailTable">
	  <tr>
	   <th>* 이름 : </th>
	   <td>${ m.name }</td>
	  </tr>
	  <tr>
	   <th>* 아이디 : </th>
	   <td>${ m.id }</td>
	  </tr>
	  <tr>
	   <th>* 비밀번호 : </th>
	   <td>${ m.password }</td>
	  </tr>
	  <tr>
	   <th>* 생년월일 : </th>
	   <td>${ m.birthday }</td>
	  </tr>
	  <tr>
	   <th>* 주소 : </th>
	   <td>${ m.address }</td>
	  </tr>
	  <tr>
	   <th>* 이 메 일 : </th>
	   <td>${ member.email }</td>
	  </tr>
	  <tr>
	   <th>* 성별 : </th>
	   <td>${ m.gender }</td>
	  </tr>
	  <tr>
	   <th>* 휴 대 폰 : </th>
	   <td>${ member.phone }</td>
	  </tr>
	  <tr>
	   <th>* 등급 : </th>
	   <td>${ m.admin }</td>
	  </tr>
	  <tr>
	   <td colspan="2"><div class="adminBtns">
	    <input type="button" id="adminUpDateBtn" value="등급변경">&nbsp;&nbsp;
	    <input type="button" id="adminBackBtn" value="돌아가기" onclick="memberList()">&nbsp;&nbsp;
		<input type="button" id="adminDeleteBtn" value="회원삭제"></div>
	   </td>
	  </tr>
	 </table>
	 <br><br>
	</form>
 </div>
</article>