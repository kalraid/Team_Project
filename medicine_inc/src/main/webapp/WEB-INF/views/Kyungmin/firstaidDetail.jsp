<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<style>
#firstaidtitle{
  text-align: center;
  font-weight: bold;
 }
 .f_DetailTd{
  font-size: 30px;
 }
 .f_DetailTdImg{
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
 <h1 id="firstaidtitle">${f.firstaidtitle}</h1><br>
 <table id="f_DetailTable">
	<c:forEach begin="1" end="8" var="i">
		<c:set var="tempName">firstaidcontent${i}</c:set>
		<c:if test="${not empty f[tempName]}">
		 <tr class="f_DetailTr">
    	  <td class="f_DetailTdImg">
    	   <img src="resources/images/firstaid/firstaid${f.firstaidnum}_${i}.jpg"/>
   	 	  </td>
    	 </tr>
    	 <tr class="f_DetailTr">
    	  <td class="f_DetailTd">
      	   ${f[tempName]}
     	  </td>
    	 </tr>
		</c:if>
	</c:forEach>
 </table>
 <br><br>
 <table id="listBtnTable">
  <tr>
   <td id="listBtnTd">
    <input type="button" id="listBtn" value="목록보기" onclick="javascript:window.location.href='firstaidList?pageNum=${pageNum}'"/>
   </td>
  </tr>
 </table>
</article>