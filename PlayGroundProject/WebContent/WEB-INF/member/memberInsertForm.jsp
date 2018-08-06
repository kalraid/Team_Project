<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="/js/jquery-3.3.1.min.js"></script>
<script src="/js/jquery-ui.min.js"></script>
<script src="/js/datePicker.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link href="css/weather.css" rel="stylesheet">
<style type="text/css">
 #memberInsertTitle{
  text-align: center;
  font-weight: bold;
  color : white;
  text-shadow: 0px 0px 10px red;
  font-size: 50px;
 }
 #memberJoinTitle{
  text-align: center;
  font-weight: bold;
  text-shadow: 0 0 5px white;
 }
 .memberInsertBackground{
  background: linear-gradient(to right, white, skyblue, skyblue, skyblue 90%, white);
 }
 #memberInsertTable{
  border-collapse: collapse;
  margin:10px auto;
  font-size: 20px;
 }
 .memberInsertPadding{
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
.genderLabel{
 cursor:pointer;
} 
 .memberInsertInputButtons{
  margin-left:230px;
 }

	</style>
<article>
 <div class="memberInsertBackground">
	<div>	<br>
	<h1 id="memberInsertTitle">plaYgrOUnd</h1>
	<h2 id="memberJoinTitle">회원 가입</h2>
	<form action="memberInsertProcess.mvc" method="post" id="insertForm">
	<input type="hidden" name="hIdCheck" id="hIdCheck" value="false"/>
	<input type="hidden" name="admin" id="admin" value="nomal">
	 <table id="memberInsertTable">
	  <tr>
	   <th class="memberInsertPadding">이&nbsp;름 : </th>
	   <td class="memberInsertPadding"><input type="text" name="name" id="name" /></td>
	  </tr>
	  <tr>
	   <th class="memberInsertPadding">아&nbsp;이&nbsp;디 : </th>
	   <td class="memberInsertPadding"><input type="text" name="id" id="id" />
			<input type="button" value="중복확인" id="checkId"/></td>
	  </tr>
	  <tr>
	   <th class="memberInsertPadding">비밀번호 : </th>
	   <td class="memberInsertPadding"><input type="password" name="pass" id="pass"/></td>
	  </tr>
	  <tr>
	   <th class="memberInsertPadding">비밀번호 확인 : </th>
	   <td class="memberInsertPadding"><input type="password" name="passck" id="passck"/></td>
	  </tr>
	  <tr>
	   <th class="memberInsertPadding">성&nbsp;별 :</th>
	  <td class="memberInsertPadding"><div class="checks"><label class="genderLabel"><input type="radio" name="gender" id="gender" value="man"/>남성</label>
			<label class="genderLabel"><input type="radio" name="gender" id="gender" value="female"/>여성</label></div></td> 
	  </tr>
	  <tr>
	   <th class="memberInsertPadding">생년월일 : </th>
	   <td class="memberInsertPadding"><input type="date" name="datepicker" id="datepicker"></td>
	  </tr>
	  <tr>
	   <th class="memberInsertPadding">연&nbsp;락&nbsp;처 :</th>
	   <td class="memberInsertPadding"><select name="phone1" id="phone1">
				<option>010</option>
				<option>011</option>
				<option>016</option>
				<option>017</option>
				<option>018</option>
				<option>019</option>
			</select>-<input type="text" name="phone2" id="phone2" size="2" maxlength="4"/>
			-<input type="text" name="phone3" id="phone3" size="2" maxlength="4"/></td>
	  </tr>
	  <tr>
	   <th class="memberInsertPadding">우편 번호 : </th>
	   <td class="memberInsertPadding"><input type="text" name="zipcode" size="6" maxlength="5" readonly id="zipcode"/>&nbsp;
				<input type="button" value="우편번호 검색" id="btnZipcode"/></td>
	  </tr>
	  <tr>
	   <th class="memberInsertPadding">주&nbsp;소 : </th>
	   <td class="memberInsertPadding"><input type="text" name="addr" id="addr"></td>
	  </tr>
	  <tr>
	   <th class="memberInsertPadding">이&nbsp;메&nbsp;일 : </th>
	   <td class="memberInsertPadding"><input type="text" name="emailId" id="emailId"/>@
		  <input type="text" name="emailDomain" id="emailDomain">
		  <select name="seDomain" id="seDomain">
			<option>직접입력</option>
			<option>네이버</option>
			<option>다음</option>
			<option>한메일</option>
			<option>구글</option>										
		  </select></td>
	  </tr>
	  <tr>
	   <td colspan="2"  class="memberInsertPadding">
	   		<input type="reset" value="다시쓰기" class="memberInsertInputButtons"/>&nbsp;&nbsp;
			<input type="submit" value="등록하기" />&nbsp;&nbsp;
			<input type="button" value="취소하기" onclick="memberList();"/></td>
	  </tr>
	 </table>
	</form>
	</div>
	</div>
</article>