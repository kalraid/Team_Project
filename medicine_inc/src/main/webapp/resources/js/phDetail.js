$(function(){
	
	//$("#grpass").on("keypress", passNumberChk);
	$("#grpass").on("keyup", passNumberChk);
	
	function passNumberChk(){
		if(!( event.keyCode >=48 && event.keyCode <= 57 )){
			alert("비밀번호는 숫자만 가능합니다.");
			return false;
		}
	}
	
	$("#grWriteButton, #grWrite").hover(function(){
		$(this).css("cursor", "pointer");
	});
	
	$(document).on("click", "#grContent", function(){
		console.log($(this).val(""));
	});
	
	$(document).on("click", "#grpass", function(){
		console.log($(this).val(""));
	});
	
	
	
	// 댓글등록 이벤트 처리
	$(document).on("click", "#grWrite", function() {
		if($("#grForm").css("display") == "block") {
			
			var $next = $(this).parent().next();
			console.log($next);
			if(! $($next).is("#grForm")) {
				$("#grForm").slideUp(300);
			}
			setTimeout(function(){
				$("#grForm").insertAfter("#rTitle").slideDown(300);
			}, 300);			
		} else {
			$("#grForm").insertAfter("#rTitle").slideDown(300);
		}
		
		$("#grForm").find("form")
			.attr("id", "grWriteForm").removeAttr("data-no");
		$("#grWriteContent").val("");
	});
	
	
	//댓글 수정 이벤트 처리
	$(document).on("click", ".modifygr", function() {
			
			var $next = $(this).parent().next();
			
			if($($next.children()[1]).attr("id") == undefined) {
				var reply = $next.first().text();
				
				if($("#grForm").css("display") == "block"){
					$("#grForm").slideUp(300);
				}
				setTimeout(function(){
					$("#grContent").val($.trim(reply));
					$("#grForm").appendTo($next)
					.slideDown(300);
					}, 300);
				}
				
		$("#grForm").find("#grWriteButton")
			.attr({"id": "reUpdateForm", "data-no": $(this).attr("data-no") });
	});
	
	
	//댓글 수정하기
	$(document).on("click", "#reUpdateForm", function(){
		var pass = $("#grpass").val()
		
		if($("#grContent").val().length <= 5) {
			alert("댓글은 5자 이상 입력해야 합니다.");
			// Ajax 요청을 취소한다.
			return false;
		}
		
		var no = $(this).attr("data-no");
		var bno = $("#bno").val();
		var btype = $("#btype").val();
		var content = $("#grContent").val();
		var params = "no="+no+"&bno="+bno+"&btype="+btype+"&content="+content+"&pass="+pass;
		console.log(params);
		
		$.ajax({
			url: "reUpdate.ajax",
			type: "post",
			data: params,
			dataType: "json",
			success: function(resultData, status, xhr) {
				$updateForm = $("#grForm");
				$("#grTable").empty();
				$.each(resultData, function(index, value) {
					// 날짜 데이터를 출력 포맷에 맞게 수정
					var date = new Date(value.date);
					var strDate = date.getFullYear() + "-" + ((date.getMonth() + 1 < 10) 
							? "0" + (date.getMonth() + 1) : (date.getMonth() + 1)) + "-"  
							+ date.getDate() + "-" + ((date.getHours() < 10) 
							? "0" + date.getHours() : date.getHours()) + ":" 
							+ (date.getMinutes() < 10 ? "0" + date.getMinutes() 
							: date.getMinutes()) + ":" + (date.getSeconds() < 10 
							? "0" + date.getSeconds() : date.getSeconds());				
										
					var result = 
						"<tr class='reply_" + value.no + "'>" 
						+ "<td>"
						+ "	<div class='grModify'>"
						+ "		<span class='grdate'>" + strDate + "</span>"
						+ "		<a href='#' class='modifygr' data-no='" + value.no + "'>"
						+ "			<img src='resources/images/reply_btn_modify.gif' alt='댓글 수정하기'/>"
						+ "		</a>"
						+ "		<a href='#' class='deletgr' data-no='" + value.no + "'>"
						+ "			<img src='resources/images/reply_btn_delete.gif' alt='댓글 삭제하기'/>"
						+ "		</a>"
						+ "	</div>"
						+ "	<div class='grContent' id='div_" + value.no + "'>"
						+ "		<pre><span>" + value.content + "</span></pre>"
						+ "	</div>"
						+ "</td>"
					+ "</tr>";
					
					$("#grTable").append(result);								
				});				
				$updateForm.find("form")
				.attr("id", "grWriteForm").removeAttr("data-no")
				.end().css("display", "none").appendTo("div")
				.find("#grContent").val("");
			},
			error: function(xhr, status, error) {
				alert("ajax 실패 : " + status + " - " + xhr.status);
			}
		});
		return false;
	});
	
	
	//댓글쓰기
	$(document).on("click", "#grWriteButton", function() {
		if($("#grContent").val().length <= 5) {
			alert("댓글은 5자 이상 입력해야 합니다.");
			// Ajax 요청을 취소한다.
			return false;
		}
		
		var params = $("#grWriteForm").serialize();
		console.log(params);
		
		$.ajax({
			url: "setgprly.ajax",
			type: "post",
			data: params,
			dataType: "json",
			success: function(resultData, status, xhr) {			
				$("#grTable").empty();
				$.each(resultData, function(index, value) {
					console.log("index : "+index);
					if(resultData){
					// 날짜 데이터를 출력 포맷에 맞게 수정
					var date = new Date(value.date);
					var strDate = date.getFullYear() + "-" + ((date.getMonth() + 1 < 10) 
							? "0" + (date.getMonth() + 1) : (date.getMonth() + 1)) + "-"  
							+ date.getDate() + "-" + ((date.getHours() < 10) 
							? "0" + date.getHours() : date.getHours()) + ":" 
							+ (date.getMinutes() < 10 ? "0" + date.getMinutes() 
							: date.getMinutes()) + ":" + (date.getSeconds() < 10 
							? "0" + date.getSeconds() : date.getSeconds());				
										
					var result = 
						"<tr class='reply_" + value.no + "'>" 
						+ "<td>"
						+ "	<div class='grModify'>"
						+ "		<span class='grdate'>" + strDate + "</span>"
						+ "		<a href='#' class='modifygr' data-no='" + value.no + "'>"
						+ "			<img src='resources/images/reply_btn_modify.gif' alt='댓글 수정하기'/>"
						+ "		</a>"
						+ "		<a href='#' class='deletgr' data-no='" + value.no + "'>"
						+ "			<img src='resources/images/reply_btn_delete.gif' alt='댓글 삭제하기'/>"
						+ "		</a>"
						+ "	</div>"
						+ "	<div class='grContent' id='div_" + value.no + "'>"
						+ "		<pre><span>" + value.content + "</span></pre>"
						+ "	</div>"
						+ "</td>"
					+ "</tr>";
					
					$("#grTable").append(result);			
					}
				});				
				// 댓글 쓰기가 완료되면 댓글 쓰기 폼을 숨긴다.
				$("#grForm").slideUp(300).add("#grContent").val("");
				console.log("write : " + $("#grForm").length);
				if($("#grContent").length >= 0){
					document.location.reload();
				}
				
			},
			error: function(xhr, status, error) {
				alert("ajax 실패 : " + status + " - " + xhr.status);
			}
		});
		// 폼이 submit 되는 것을 취소한다.
		return false;
	});
	
	//댓글 삭제
	$(document).on("click", ".deletgr", function(){
		var no = $(this).attr("data-no");
		var bno = $("#bno").val();
		var btype = $("#btype").val();
		var text = prompt("패스워드를 입력하세요");
		if(text == null || text == ""){
			return null;
		}
		var params = "no="+no+"&pass="+text+"&bno="+bno+"&btype="+btype;
		console.log(no);
			$.ajax({
				url: "repassCheck.ajax",
				type: "post",
				data: params,
				dataType: "json",
				success: function(resultData, status, xhr) {
					$("#grTable").empty();
					$.each(resultData, function(index, value) {
						// 날짜 데이터를 출력 포맷에 맞게 수정
						var date = new Date(value.date);
						var strDate = date.getFullYear() + "-" + ((date.getMonth() + 1 < 10) 
								? "0" + (date.getMonth() + 1) : (date.getMonth() + 1)) + "-"  
								+ date.getDate() + "-" + ((date.getHours() < 10) 
								? "0" + date.getHours() : date.getHours()) + ":" 
								+ (date.getMinutes() < 10 ? "0" + date.getMinutes() 
								: date.getMinutes()) + ":" + (date.getSeconds() < 10 
								? "0" + date.getSeconds() : date.getSeconds());				
											
						var result = 
							"<tr class='reply_" + value.no + "'>" 
							+ "<td>"
							+ "	<div class='grModify'>"
							+ "		<span class='grdate'>" + strDate + "</span>"
							+ "		<a href='#' class='modifygr' data-no='" + value.no + "'>"
							+ "			<img src='resources/images/reply_btn_modify.gif' alt='댓글 수정하기'/>"
							+ "		</a>"
							+ "		<a href='#' class='deletgr' data-no='" + value.no + "'>"
							+ "			<img src='resources/images/reply_btn_delete.gif' alt='댓글 삭제하기'/>"
							+ "		</a>"
							+ "	</div>"
							+ "	<div class='grContent' id='div_" + value.no + "'>"
							+ "		<pre><span>" + value.content + "</span></pre>"
							+ "	</div>"
							+ "</td>"
						+ "</tr>";
						
						$("#grTable").append(result);								
					});				
					// 댓글 쓰기가 완료되면 댓글 쓰기 폼을 숨긴다.
					$("#grForm").slideUp(300).add("#grContent").val("");
					console.log("write : " + $("#grForm").length);
				},
				error: function(xhr, status, error) {
					alert("ajax 실패 : " + status + " - " + xhr.status);
				}
			});
	});
	
	
	
	
	
	
	
	
	
	
	
	
	
});