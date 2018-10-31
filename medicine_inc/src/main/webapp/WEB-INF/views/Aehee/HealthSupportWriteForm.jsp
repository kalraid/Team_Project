<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>  

<article>
<h2> 등록하기</h2>

<form name="HealthSupportWriteForm" action="HealthSupportWriteProcess" id="HealthSupport_writeForm" method="post" enctype="multipart/form-data">  
  <!-- 제품 명:
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
  	onclick="javascript:window.location.href='healthSupport'"	>
  
</form>  -->


<div class="form-group">
    <label for="name">제품 명</label>
    <input type="text" class="form-control" name="name" placeholder="제품 명을 입력하세요">
  </div>
  <div class="form-group">
    <label for="consumerPrice">정가</label>
    <input type="number" class="form-control" name="consumerPrice" placeholder="정가">
  </div>
   <div class="form-group">
    <label for="sellingPrice">판매가</label>
    <input type="number" class="form-control" name="sellingPrice" placeholder="판매가">
  </div>
   <div class="form-group">
    <label for="capacity">용량</label>
    <input type="text" class="form-control" name="capacity" placeholder="용량">
  </div>
   <div class="form-group">
    <label for="shape">형태</label>
    <input type="text" class="form-control" name="shape" placeholder="형태">
  </div>
   <div class="form-group">
    <label for="image">main 이미지</label>
    <input type="file" class="form-control" name="image" placeholder="main 이미지">
  </div>
   <div class="form-group">
    <label for="bigImage">detail 이미지</label>
    <input type="file" class="form-control" name="bigImage" placeholder="detail 이미지">
  </div>
   <div class="form-group">
    <label for="cateCode">성분별 함량</label>
    <select name="cateCode">
  	<option value="1001">멀티비타민</option>
  	<option value="1002">비타민B/엽산</option>
  	<option value="1003">비타민C/D/E</option>
  	<option value="1004">칼슘/마그네슘</option>
  	<option value="1005">철분/아연/셀렌</option>
  </select>  
  </div>
   <div class="form-group">
    <label for="explanation">제품 설명</label>
    <input type="text" class="form-control" name="explanation" placeholder="제품 설명">
  </div>
<input type="submit" value="등록하기">
  <input type="button" value="목록보기"
  	onclick="javascript:window.location.href='healthSupport'"	>
  


</article>