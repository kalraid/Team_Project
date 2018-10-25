$(function() {
	
	// 게시 글쓰기 폼 유효성 검사
	$("#searchDetail").on("submit", function() {
		if($("#code").val().length <= 0) {
			alert("품목코드가 입력되지 않았습니다.\n 코드번호를 입력해주세요");
			$("#code").focus();			
			return false;
		}
		if($("#name").val().length <= 0) {
			alert("제품명이 입력되지 않았습니다.\n 제품명을 입력해주세요");
			$("#name").focus();
			return false;
		}
		if($("#eff").val().length <= 0) {
			alert("효과가 입력되지 않았습니다.\n 효과를 입력해주세요");
			$("#eff").focus();
			return false;
		}
		if($("#maker").val().length <= 0) {
			alert("제조/판매사가 입력되지 않았습니다.\n 제조/판매사를 입력해주세요");
			$("#maker").focus();
			return false;
		}
	});
	
	
	
});