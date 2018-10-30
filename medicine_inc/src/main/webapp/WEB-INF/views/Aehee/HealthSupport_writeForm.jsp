<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>  

<article>
<h2> 등록하기</h2>

<form name="writeForm" action="writeProcess" id="writeForm" method="post" enctype="multipart/form-data">  
  제품 명:
  <input type="text" name="name" value=""/>
  <br>
  정가:
  <input type="number" name="consumerPrice" value=""/>
  <br>
  판매가:
  <input type="number" name="sellingPrice" value=""/>
  <br>
  용량:
  <input type="text" name="capacity" value=""/>
  <br>
  형태:
  <input type="text" name="shape" value=""/>
  <br>
  main 이미지:
  <input type="file" name="image" />
  <br>
  상세 이미지:
  <input type="file" name="bigImage" />
  <br>
  성분별 함량:
  <select name="cateCode">
  	<option value="1001">멀티비타민</option>
  	<option value="1002">비타민B/엽산</option>
  	<option value="1003">비타민C/D/E</option>
  	<option value="1004">칼슘/마그네슘</option>
  	<option value="1005">철분/아연/셀렌</option>
  </select>  

  <br/>
  제품 설명:
  <input type="text" name="explanation" value=""/>
  <br>
  
  <input type="submit" value="등록하기">
  <input type="button" value="목록보기"
  	onclick="javascript:window.location.href='boardList'"	>
  
</form> 

</article>