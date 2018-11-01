<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<style>
 #stretchingtitle{
  text-align: center;
  font-weight: bold;
 }
 .s_DetailTd{
  font-size: 30px;
 }
 .s_DetailTdImg{
  text-align: center;
 }
 #listBtn{
  cursor: pointer;
  font-weight:bold;
  text-align: center;
  font-size:2em;
  color:#fef4e9;
  padding: 10px 30px 10px 30px;
  margin-top: 10px;
  background: #f78d1d;
  box-shadow: 0px 5px 1px gray;
 }
 #listBtn:hover{
  box-shadow: 4px 4px 4px gray inset;
 }
 #listBtnTd{
  text-align: center;
 }
 #listBtnTable{
  margin: 0 auto;
 }
</style>
<article>
 <input type="hidden" name="pageNum" value="${ pageNum }" />
 <h1 id="stretchingtitle">${s.stretchingtitle}</h1><br>
 <table id="s_DetailTable">
  <c:forEach begin="1" end="8" var="i">
   <c:set var="tempName">stretchingcontent${i}</c:set>
   <c:if test="${not empty s[tempName]}">
    <tr class="s_DetailTr">
     <td class="s_DetailTdImg">
      <img src="resources/images/stretching/stretching${s.stretchingnum}_${i}.jpg"/>
   	 </td>
    </tr>
    <tr>
     <td><br><br>
     </td>
    </tr>
    <tr class="s_DetailTr">
     <td class="s_DetailTd">
      ${s[tempName]}
     </td>
    </tr>
    <tr>
     <td><br><br>
     </td>
    </tr>
   </c:if>
  </c:forEach>
 </table>
 <br><br>
 <table id="listBtnTable">
  <tr>
   <td id="listBtnTd">
    <input type="button" id="listBtn" value="목록보기" onclick="javascript:window.location.href='stretchingList?pageNum=${pageNum}'"/>
   </td>
  </tr>
 </table>
</article>