$(function() {
	// 게시 글쓰기 폼 유효성 검사
	$("#writeForm").on("submit", function() {
		if($("#writer").val().length <= 0) {
			alert("작성자가 입력되지 않았습니다.\n작성자를 입력해주세요");
			$("#writer").focus();			
			return false;
		}
		if($("#title").val().length <= 0) {
			alert("제목이 입력되지 않았습니다.\n제목을 입력해주세요");
			$("#title").focus();
			return false;
		}
		if($("#pass").val().length <= 0) {
			alert("비밀번호가 입력되지 않았습니다.\n비밀번호를 입력해주세요");
			$("#pass").focus();
			return false;
		}
		if($("#content").val().length <= 0) {
			alert("내용이 입력되지 않았습니다.\n내용을 입력해주세요");
			$("#content").focus();
			return false;
		}
		if($("#file").val().length <= 0) {
			var result = confirm("파일이 추가되지 않았습니다." +
					"\n첨부파일 없이 게시 글을 등록 하시겠습니까?");
			if(!result) {
				$("#file").focus();
				return false;
			}
		}		
	});

	/* 게시 글 내용 보기에서 게시 글 수정 폼 요청 처리
	 * 아래와 같이 hidden 폼을 통해 post 방식으로 처리 할 수 있다.
	 **/
	$("#detailUpdate").on("click", function() {
			
		var pass = $("#pass").val();
		if(pass.length <= 0) {
			alert("게시 글을 수정하려면 비밀번호를 입력해주세요");
			return false;
		}		
		var no = $(this).attr("data-no");		
				
		$("#rNo").val(no);
		$("#rPass").val(pass);
		$("#checkForm").attr("action", "projectUpdateForm.mvc");
		$("#checkForm").attr("method", "post");
		$("#checkForm").submit();
	});
		
	/* 게시 글 내용 보기에서 게시 글 수정 폼 요청 처리
	 * 아래는 location 객체를 이용해 get 방식 요청으로 처리하기
	 * 때문에 post 방식인 위의 방식보다 보안성이 떨어진다.
	 **/
	/*
	$("#detailUpdate").on("click", function() {
		
		var pass = $("#pass").val();
		if(pass.length <= 0) {
			alert("게시 글을 수정하려면 비밀번호를 입력해주세요");
			return false;
		}
		var no = $(this).attr("data-no");
		window.location.href="updateForm.jsp?no=" + no + "&pass=" + pass;
	});
	*/
	
	// 게시 글 수정 폼 유효성 검사
	$("#updateForm").on("submit", function() {
		if($("#writer").val().length <= 0) {
			alert("작성자가 입력되지 않았습니다.\n작성자를 입력해주세요");
			$("#writer").focus();			
			return false;
		}
		if($("#title").val().length <= 0) {
			alert("제목이 입력되지 않았습니다.\n제목을 입력해주세요");
			$("#title").focus();
			return false;
		}
		if($("#pass").val().length <= 0) {
			alert("비밀번호가 입력되지 않았습니다.\n비밀번호를 입력해주세요");
			$("#pass").focus();
			return false;
		}
		if($("#content").val().length <= 0) {
			alert("내용이 입력되지 않았습니다.\n내용을 입력해주세요");
			$("#content").focus();
			return false;
		}		
		if(! $("#file").prop("disabled") && $("#file").val().length <= 0) {
			var result = confirm("첨부파일이 선택되지 않았습니다." +
					"\n첨부파일 없이 게시 글을 수정 하시겠습니까?");
			if(!result) {
				$("#file").focus();
				return false;
			}
		}
	});
	
	/* 게시 글 내용 보기에서 게시 글 삭제 요청 처리
	 * 아래와 같이 hidden 폼을 통해 post 방식으로 처리 할 수 있다.
	 **/
	$("#detailDelete").on("click", function() {
			
		var pass = $("#pass").val();
		if(pass.length <= 0) {
			alert("게시 글을 수정하려면 비밀번호를 입력해주세요");
			return false;
		}		
		var no = $("#detailUpdate").attr("data-no");		
				
		$("#rNo").val(no);
		$("#rPass").val(pass);
		$("#checkForm").attr("action", "projectDelete.mvc");
		$("#checkForm").attr("method", "post");
		$("#checkForm").submit();
	});
	
	$("#searchForm").on("submit",function(){
		var keyword = $("#keyword").val();
		if(keyword.length <= 0){
			alert("검색어를 입력해 주세요\n 겁색어가 입력되지 않았습니다")
			return false;
		}
		$(this).attr("method","post");
		$(this).attr("action","projectList.mvc")
		
	});
	
	
});
