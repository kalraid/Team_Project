<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<article>
 <form action="memberDeleteProcess.mvc" id="memberDeleteForm">
  <input type="hidden" name="id" id="id" value="${sessionScope.m.id}">
  <input type="password" name="pass" id="pass">
  <input type="submit" value="회원 탈퇴 하기">
  <input type="button" value="취소하기" id="memberDeleteCancel">
 </form>
</article>