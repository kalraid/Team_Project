<%@page import="com.playground.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
 String id = (String)session.getAttribute("id");
 MemberDao dao = MemberDao.getInstance();
 String adminType = dao.getAdmin(id);
 boolean admin = (adminType.equals("admin"))? true : false;
%>
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/datePicker.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<style type="text/css">
 .memberUpDateBackground{
  background: linear-gradient(to right, white, skyblue, skyblue, skyblue 90%, white);
 }
#memberUpDateTitle{
  text-align: center;
  font-weight: bold;
  color : white;
  text-shadow: 0px 0px 10px red;
  font-size: 50px;
 }
 #memberUpDateSubTitle{
  text-align: center;
  font-weight: bold;
  text-shadow: 0 0 5px white;
 }
 #memberUpDateTable{
  border-collapse: collapse;
  margin:10px auto;
  font-size: 20px;
 }
 .memberUpDatePadding{
  padding-top: 15px;
 }
 .ui-datepicker {
background: white;
font-size:11px;
padding:10px;
border:1px solid #ccc;
}
 
.ui-datepicker table {
width:278px;
}
 
.ui-datepicker table td {
text-align:center;
}
 
.ui-datepicker a {
cursor:pointer;
text-decoration:none;
}
 
.ui-datepicker-prev {
}
 
.ui-datepicker-next {
float:right;
}
 
.ui-datepicker-title {
text-align: center;
font-weight:bold;
}
  .ui-datepicker-week-end:first-child, .ui-datepicker-week-end:first-child a {color:red}
  .memberUpDateInputButtons{
  margin-left:230px;
 }
	</style>
<c:set var="admin" value="<%= admin %>"></c:set>
<article>
	<div class="memberUpDateBackground"><br>	
	<h1 id="memberUpDateTitle">plaYgrOUnd</h1>
	<h2 id="memberUpDateSubTitle">회원 가입</h2>
	<form action="memberUpDateProcess.mvc" method="post" id="upDateForm">
	 <input type="hidden" name="hIdCheck" id="hIdCheck" value="true"/>
	 <input type="hidden" name="hPassCheck" id="hPassCheck" value="false">
	 <c:if test="${admin }">
	  <input type="hidden" name="admin" id="admin" value="admin">
	 </c:if>
	 <c:if test="${!admin }">
	  <input type="hidden" name="admin" id="admin" value="nomal">
	 </c:if>
	  <table id="memberUpDateTable">
	   <tr>
	    <th class="memberUpDatePadding">이&nbsp;름 : </th>
	    <td class="memberUpDatePadding"><input type="text" name="name" id="name" value="${m.name }" /></td>
	   </tr>
	   <tr>
	    <th class="memberUpDatePadding">아&nbsp;디 : </th>
	    <td class="memberUpDatePadding"><input type="text" name="id" id="id" value="${m.id }" readonly /></td>
	   </tr>
	   <tr>
	    <th class="memberUpDatePadding">기존 비밀번호 : </th>
	    <td class="memberUpDatePadding"><input type="password" name="oldpass" id="oldpass"/>
		  <input type="button" id="passCheckBtn" value="비밀번호 확인"></td>
	   </tr>
	   <tr>
	    <th class="memberUpDatePadding">새 비밀번호 : </th>
	    <td class="memberUpDatePadding"><input type="password" name="newpass" id="newpass"/></td>
	   </tr>
	   <tr>
	    <th class="memberUpDatePadding">비밀번호 확인 : </th>
	    <td class="memberUpDatePadding"><input type="password" name="newpassck" id="newpassck"/></td>
	   </tr>
	   <tr>
	    <th class="memberUpDatePadding">성&nbsp;별 : </th>
	    <td class="memberUpDatePadding"><label><input type="radio" name="gender" id="gender" value="man" <c:if test="${m.gender.equals('man') }">checked</c:if>/>남성</label>
			<label><input type="radio" name="gender" id="gender" value="female" <c:if test="${m.gender.equals('female') }">checked</c:if>/>여성</label></td>
	   </tr>
	   <tr>
	    <th class="memberUpDatePadding">생년월일 : </th>
	    <td class="memberUpDatePadding"><input type="text" name="datepicker" id="datepicker" value="${m.birthday }"> </td>
	   </tr>
	   <tr>
	    <th class="memberUpDatePadding">연&nbsp;락&nbsp;처 : </th>
	    <td class="memberUpDatePadding"><select name="phone1" id="phone1">
				<option ${m.phone.split('-')[0] == 010 ? "selected" : ""}>010</option>
				<option ${m.phone.split('-')[0] == 011 ? "selected" : ""}>011</option>
				<option ${m.phone.split('-')[0] == 016 ? "selected" : ""}>016</option>
				<option ${m.phone.split('-')[0] == 017 ? "selected" : ""}>017</option>
				<option ${m.phone.split('-')[0] == 018 ? "selected" : ""}>018</option>
				<option ${m.phone.split('-')[0] == 019 ? "selected" : ""}>019</option>
			</select>-<input type="text" name="phone2" id="phone2" size="2" maxlength="4" value="${m.phone.split('-')[1]}" />
			-<input type="text" name="phone3" id="phone3" size="2" maxlength="4" value="${m.phone.split('-')[2]}"/></td>
	   </tr>
	   <tr>
	    <th>주&nbsp;소 : </th>
	    <td class="memberUpDatePadding"><input type="text" name="addr" id="addr" value="${m.address }"></td>
	   </tr>
	   <tr>
	    <th class="memberUpDatePadding">이&nbsp;메&nbsp;일 : </th>
	    <td class="memberUpDatePadding"> 
	      <input type="text" name="emailId" id="emailId" value="${m.email.split('@')[0] }"> @
		  <input type="text" name="emailDomain" id="emailDomain" value="${m.email.split('@')[1] }">
		  <select name="seDomain" id="seDomain">
			<option>직접입력</option>
			<option>네이버</option>
			<option>다음</option>
			<option>한메일</option>
			<option>구글</option>										
		  </select></td>
	   </tr>
	   <tr>
	    <td colspan="3"  class="memberUpDatePadding">
	        <input type="reset" value="다시쓰기" class="memberUpDateInputButtons" />&nbsp;&nbsp;
			<input type="submit" value="등록하기" />&nbsp;&nbsp;
			<input type="button" value="취소하기" onclick="memberList();"/></td>
	   </tr>
	  </table>	
	  <br><br>
	</form>
	</div>	
	 
</article>