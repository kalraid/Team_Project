$(function() {
	
	// 게시 글쓰기 폼 유효성 검사
	$("#searchDetail").on("submit", function() {
		if($("#code").val().length <= 0) {
			alert("품목코드가 입력되지 않았습니다.\n코드번호를 입력해주세요");
			$("#code").focus();			
			return false;
		}
		if($("#name").val().length <= 0) {
			alert("제품명이 입력되지 않았습니다.\n제품명을 입력해주세요");
			$("#name").focus();
			return false;
		}
		if($("#eff").val().length <= 0) {
			alert("효과가 입력되지 않았습니다.\n효과를 입력해주세요");
			$("#eff").focus();
			return false;
		}
		if($("#maker").val().length <= 0) {
			alert("제조/판매사가 입력되지 않았습니다.\n제조/판매사를 입력해주세요");
			$("#maker").focus();
			return false;
		}
	});

	
	
	// 품목코드 입력 했을 때, post 방식으로 medicineSearch.jsp 로 넘겨준다.
	$("#searchDetail").on("submit", function() {
		var mediCode = $("#mediCode").val();
		if(mediCode.length <= 0) {
			alert("품목 코드가 입력되지 않았습니다.\n 품목 코드를 입력해주세요");
			return false;
		}		
		$(this).attr("method", "post");
		$(this).attr("action", "medicineSearch");		
	});	
	
	
});