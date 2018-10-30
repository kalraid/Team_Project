<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<article>


  <ul>
<li><font size="6" face="Arial" style="bold">${board.name }</font></li>
<li><font size="3" face="Arial" style="bold">${board.explanation }</font></li>
 </ul>
 
 <a href ="HealthSupport_detail?no=${i.no}"><img alt="${board.bigImage}" src="resources/images/Aehee/${board.bigImage }">
 
 <table>
 	<ul>
 	<li><font size="4" face="Arial" style="bold">정가&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<del>${board.consumerPrice }&nbsp;원</del></font></li><br/>
 	<li><font size="4" face="Arial" style="bold">판매가&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${board.sellingPrice }&nbsp;원</font></li><br/>
 	<li><font size="4" face="Arial" style="bold">용량&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${board.capacity }</font></li><br/>
 	<li><font size="4" face="Arial" style="bold">형태&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${board.shape }</font></li>
 
 	
 	</ul>
 </table>
 
 
</article>