<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="css/navtest.css">

<article>

<div class="nav01">
  <ul class="parent01">
    <li><a href="fastival.mvc">FestivalHome</a></li>
    <c:forEach var="area" items="${areaList }" varStatus="status">
    	
		    <c:if test="${area.code == 1}">
		    <li><a href="fesArea.mvc?acode=${area.code }">${area.name }<span class="plus">+</span></a>
		    	<ul class="child01">
			     <c:forEach var="a1" items="${array1}">				     	
				        	<li><input type="hidden" name="acode" value="${area.code }" />
				        		<input type="hidden" name="sumArea" value="${a1 }"/>
				        	<a href="fesArea.mvc?acode=${area.code }&sumArea=${a1}">${a1}</a></li>				      
			      </c:forEach>
			      </ul>
			      </li>
		      </c:if>
		      
		     <c:if test="${area.code == 31}">
		    <li><a href="fesArea.mvc?acode=${area.code }">${area.name }<span class="plus">+</span></a>
		     <ul class="child01">
		     	<c:forEach var="a2" items="${array2}">
			     
			        	<li><input type="hidden" name="acode" value="${area.code }" />
			        		<input type="hidden" name="sumArea" value="${a2 }"/>
			        	<a href="fesArea.mvc?acode=${area.code }&sumArea=${a2}">${a2}</a></li>
			       
		     	</c:forEach> 
		     </ul>
		     </li>
		     </c:if>
		     
		     <c:if test="${area.code == 32}">
		    <li><a href="fesArea.mvc?acode=${area.code }">${area.name }<span class="plus">+</span></a>
		    <ul class="child01">
		     	<c:forEach var="a3" items="${array3}">
			      
			        	<li><input type="hidden" name="acode" value="${area.code }" />
			        		<input type="hidden" name="sumArea" value="${a3 }"/>
			        	<a href="fesArea.mvc?acode=${area.code }&sumArea=${a3}">${a3}</a></li>
		     	 </c:forEach>
		      </ul>
		  	  </li>
		  	  </c:if>
		  	  
		  	  
		  	  <c:if test="${area.code != 1 && area.code != 31 && area.code != 32 }">
		  	  <li><a href="fesArea.mvc?acode=${area.code }" >${area.name }<span class="plus"></span>
		  	  
		  	  </a>
		  	  	
		    	</li>
		  	  </c:if>
		  	  
    </c:forEach>
  </ul>
</div>
</article>