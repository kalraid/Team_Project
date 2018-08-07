<%@page import="com.playground.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
 String id = (String)session.getAttribute("id");
 MemberDao dao = MemberDao.getInstance();
 String adminType = dao.getAdmin(id);
 String genderType = dao.getGender(id);
 boolean admin = (adminType.equals("admin"))? true : false;
 boolean gender = (genderType.equals("man"))? true : false;
%>
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<link href="css/weather.css" rel="stylesheet">
<c:set var="admin" value="<%= admin %>"></c:set>
<c:set var="gender" value="<%= gender %>"></c:set>
<style>
 .memberInfoBackground{
  background: linear-gradient(to right, white, skyblue, skyblue, skyblue 90%, white);
  
 }
 #memberInfoTitle{
  text-align: center;
  font-weight: bold;
  color : white;
  text-shadow: 0px 0px 10px red;
  font-size: 50px;
 }
 #memberInfoSubTitle{
  text-align: center;
  font-weight: bold;
  text-shadow: 0 0 5px white;
 }
 .memberInfoTable{
  background: linear-gradient(to right bottom, skyblue, white 70%, skyblue);
  margin:10px auto;
  font-size: 25px
 }
 .memberInfoPadding{
  padding-top: 15px;
 }
 .memberInfoLink{
  font-size: 15px;
  color:gray;
 }
</style>
<article>
 <form method="post">
 <div class="memberInfoBackground">
 <div>
    <br>
    <h1 id="memberInfoTitle">plaYgrOUnd</h1>
	<h2 id="memberInfoSubTitle">My Page</h2>
	  <table class="memberInfoTable">
	   <tr>
	    <th class="memberInfoPadding">* 이&nbsp;&nbsp;름 : </th>
	    <td class="memberInfoPadding">${ m.name }</td>
	   </tr>
	   <tr>
	    <th class="memberInfoPadding">* 아이디 : </th>
	    <td class="memberInfoPadding">${ m.id }</td>
	   </tr>
	   <tr>
	    <th class="memberInfoPadding">* 생년월일 : </th>
	    <td class="memberInfoPadding">${ m.birthday }</td>
	   </tr>
	   <tr>
	    <th class="memberInfoPadding">* 주&nbsp;&nbsp;소 : </th>
	    <td class="memberInfoPadding">${ m.address }</td>
	   </tr>
	   <tr>
	    <th class="memberInfoPadding">* 이 메 일 : </th>
	    <td class="memberInfoPadding">${ m.email }</td>
	   </tr>
	   <tr>
	    <th class="memberInfoPadding">* 성&nbsp;&nbsp;별 : </th>
	    <td class="memberInfoPadding"><c:if test="${gender }">남성 </c:if>
			<c:if test="${!gender }">여성</c:if>
		</td>
	   </tr>
	   <tr>
	    <th class="memberInfoPadding">* 휴 대 폰 : </th>
	    <td class="memberInfoPadding">${ m.phone }</td>
	   </tr>
	   <tr>
	   <th colspan="2" class="memberInfoLink" >
	    <input type="hidden" value="${m.admin }">
	    <c:if test="${admin }">
		 <a href="memberList.mvc">회원관리</a>&nbsp;&nbsp;
		</c:if>
	     <a href="memberUpDateForm.mvc">수정하기</a>&nbsp;&nbsp;
		 <a href="index.mvc">메인페이지</a>&nbsp;&nbsp;
		 <a href="memberDelete.mvc">회원 탈퇴</a>
	   </th>
	   </tr>
	  </table>	
	  <br><br><br>	
</div>		
</div>
 </form>	
</article>