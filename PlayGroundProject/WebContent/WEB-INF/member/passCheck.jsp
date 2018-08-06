<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/datePicker.js"></script>

</head>
<body>
<div id="idCheckForm">	
	    <c:if test="${not check}">	
	     <script> alert("입력하신 비밀번호와 기존 비밀번호가 일치하지 않습니다");
	        window.close();
	     </script>
			<!-- <div class="memberInputText"> 
			입력하신 비밀번호와 기존 비밀번호가 일치하지 않습니다</div>-->		
			<%-- <form action="passCheck.mvc" name="idCheckForm" 
				method="post" id="idCheckForm">
				<input type="hidden" value="${id }">
				<div class="memberInputText">
					<span class="checkFormSpan">비밀번호 : </span>
					<input type="password" name="pass" id="pass"/>
					<input type="submit" value="중복확인" />
				</div>
			</form>	 --%>
	 </c:if>
	 <c:if test="${check}">	
	  <form>	
		<div class="memberInputText">
		 확인되었습니다
		<input type="button" value="확인" id="btnClosePass" data-id-value="${id }" data-oldpass-value="${oldpass }"/>
	</div>
	</form>	
	</c:if>
	</div>
</body>
</html>