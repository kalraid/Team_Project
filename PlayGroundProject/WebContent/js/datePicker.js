$(function(){
	
	$("#datepicker").datepicker({
	    inline: true,
	    showOtherMonths: true,
	    dateFormat:"yy-mm-dd",
	    showMonthAfterYear: true,
	    yearRange: 'c-80:c+0',
	    changeYear: true,
	    monthNames: [ '01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12' ],
	    monthNamesShort: [ '01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12' ],
	    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	    changeMonth:true
	});

	$("#checkId").on("click", function(){
		var id = $("#id").val().trim();
		var url = "idCheck.mvc?id=" + id;
		if(id.length <= 0){
			alert("ID를 입력해 주세요");
			return false;
		}
		if(id.length < 5){
			alert("ID는 5글자 이상이어야 합니다");
			return false;
		}
		window.open(url, "idCheck", "toolbar=no, location=no, status=no, memubar=no, width=500, height=300");
	});
	$("#passCheckBtn").click(function(){
		var pass = $("#oldpass").val().trim();
		var id = $("#id").val().trim();
		var url = "passCheck.mvc?id="+id+"&pass="+pass;
		if(pass.length <= 0){
			alert("비밀번호를 입력해 주세요");
			return false;
		}
		window.open(url, "passCheck", "toolbar=no, location=no, status=no, memubar=no, width=500, height=300");
	})
	$("#adminDeleteBtn").click(function(){
		var id = $("#id").val();
		var url = "memberAdminDelete.mvc?id="+id;
		location.assign(url);
	})
	$("#btnClose").on("click", function(){
		var id = $(this).attr("data-id-value");
		$("#id", opener.document).val(id);
		$("#hIdCheck", opener.document).val(true);
		window.close();
	});
	$("#btnClosePass").click(function(){
		var pass = $(this).attr("data-oldpass-value");
		$("#oldpass", opener.document).val(pass);
		$("#hPassCheck", opener.document).val(true);
		window.close();
	});
	$("#btnZipcode").on("click", function(){
		new daum.Postcode({
			oncomplete: function(data){
				var fullAddr = "";
				var extraAddr = "";
				if(data.userSelectedType === "R"){
					fullAddr = data.roadAddress;
				}else{
					fullAddr = data.roadAddress;
				}
				
				if(data.userSelectedType ==="R"){
					if(data.bname !== ""){
						extraAddr += data.bname;
					}
					if(data.buildingName != ""){
						extraAddr += (extraAddr!==""?","+data.buildingName : data.buildingName);
						
					}
					fullAddr += (extraAddr !== ""?"("+extraAddr+")" : "");
				}
				
				$("#zipcode").val(data.zonecode);
				$("#addr").val(fullAddr);
			}
		}).open();
	});
	$("#seDomain").on("change",function(){
		var domain = $(this).val();
		if(domain == "직접입력"){
			$("#emailDomain").val("");
			$("#emailDomain").prop("readonly", false);
		}else if(domain == "네이버"){
			$("#emailDomain").val("naver.com");
			$("#emailDomain").prop("readonly", true);
		}else if(domain == "다음"){
			$("#emailDomain").val("daum.net");
			$("#emailDomain").prop("readonly", true);
		}else if(domain == "한메일"){
			$("#emailDomain").val("hanmail.net");
			$("#emailDomain").prop("readonly", true);
		}else if(domain == "구글"){
			$("#emailDomain").val("gmail.com");
			$("#emailDomain").prop("readonly", true);
		}
	});
	/*var passCheck = /^.*(?=.{8,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;*/
	/*var idCheck = /^[a-z0-9]{5,50}.*$/;*/
	$("#insertForm").on("submit", function(){
		
		var hIdCheck = $("#hIdCheck").val();
		var name = $("#name").val();
		var id = $("#id").val();
		var pass = $("#pass").val();
		var passck = $("#passck").val();
		var gender = $("#gender:checked").val();
		var datepicker = $("#datepicker").val();
		var phone2 = $("#phone2").val();
		var phone3 = $("#phone3").val();
		var zipcode = $("#zipcode").val();
		var addr = $("#addr").val();
		var emailId = $("#emailId").val();
		var emailDomain = $("#emailDomain").val();		
		if(name.length == 0){
			alert("이름이 입력되지 않았습니다");
			$("#name").focus();
			return false;
		}else if(id.length == 0){
			alert("ID가 입력되지 않았습니다");
			$("#id").focus();
			return false;
		}else if(hIdCheck == "false"){
			alert("ID중복 체크를 하지 않았습니다");
			return false;
		}else if(pass.length == 0){
			alert("비밀번호가 입력되지 않았습니다");
			$("#pass").focus();
			return false;
		}else if(passck.length == 0){
			alert("비밀번호 확인이 입력되지 않았습니다");
			$("#passck").focus();
			return false;
		}else if(pass != passck){
			alert("비밀번호와 비밀번호 확인이 일치하지 않습니다");
			$("#passck").focus();
			return false;
		}else if(gender == null){
			alert("성별이 선택되지 않았습니다");
			return false;
		}else if(datepicker.length == 0){
			alert("생년월일이 입력되지 않았습니다");
			$("#datepicker").focus();
			return false;
		}else if(phone2.length == 0 || phone3.length == 0){
			alert("핸드폰 번호가 입력되지 않았습니다");
			if(phone2.length == 0){
				$("#phone2").focus();
			}else if(phone3.length == 0){
				$("#phone3").focus();
			}
			return false;
		}else if(zipcode.length == 0){
			alert("우편번호가 입력되지 않았습니다");
			$("#btnZipcode").click();
			return false;
		}else if(addr.length == 0){
			alert("주소가 입력되지 않았습니다");
			$("#addr").focus();
			return false;
		}else if(emailId.length == 0){
			alert("이메일 아이디가 입력되지 않았습니다");
			$("#emailId").focus();
			return false;
		}else if(emailDomain.length == 0){
			alert("이메일 도메인이 입력되지 않았습니다");
			$("#emailDomain").focus();
			return false;
		}
	});
	
	$("#logInForm").on("submit", function(){
		
		var id = $("#id").val();
		var pass = $("#pass").val();
		if(id.length == 0){
			alert("아이디를 입력해 주세요");
			$("#id").focus();
			return false;
		}else if(pass.length == 0){
			alert("비밀번호를 입력해 주세요");
			$("#pass").focus();
			return false;
		}
		$("#loginURL").val("index.mvc");
	});
	$("#logOutLink").click(function(){
		var result = window.confirm("로그아웃 하시겠습니까?");
		if(! result) {
			return false;
		}
		$("#logoutURL").val("index.mvc");
	});
	
	$("#upDateForm").on("submit", function(){
		var name = $("#name").val();
		var hPassCheck = $("#hPassCheck").val();
		var oldpass = $("#oldpass").val();
		var newpass = $("#newpass").val();
		var newpassck = $("#passck").val();
		var gender = $("#gender:checked").val();
		var datepicker = $("#datepicker").val();
		var phone2 = $("#phone2").val();
		var phone3 = $("#phone3").val();
		var addr = $("#addr").val();
		var emailId = $("#emailId").val();
		var emailDomain = $("#emailDomain").val();		
		if(name.length == 0){
			alert("이름이 입력되지 않았습니다");
			$("#name").focus();
			return false;
		}else if(oldpass.length == 0){
			alert("기존비밀번호가 입력되지 않았습니다");
			$("#oldpass").focus();
			return false;
		}else if(hPassCheck == "false"){
			alert("기존비밀번호 확인을 하지 않으셨습니다");
			return false;
		}else if(newpass.length == 0){
			alert("새비밀번호가 입력되지 않았습니다");
			$("#newpass").focus();
			return false;
		}else if(newpassck.length==0){
			alert("새비밀번호 확인이 입력되지 않았습니다");
			$("#newpassck").focus();
			return false;
		}else if(newpass != newpassck){
			alert("새 비밀번호와 비밀번호 확인이 일치하지 않습니다");
			$("#newpassck").focus();
			return false;
		}else if(gender == null || gender == ""){
			alert("성별이 선택되지 않았습니다");
			return false;
		}else if(datepicker.length == 0){
			alert("생년월일이 입력되지 않았습니다");
			$("#datepicker").focus();
			return false;
		}else if(phone2.length == 0 || phone3.length == 0){
			alert("핸드폰 번호가 입력되지 않았습니다");
			if(phone2.length == 0){
				$("#phone2").focus();
			}else if(phone3.length == 0){
				$("#phone3").focus();
			}
			return false;
		}else if(addr.length == 0){
			alert("주소가 입력되지 않았습니다");
			$("#addr").focus();
			return false;
		}else if(emailId.length == 0){
			alert("이메일 아이디가 입력되지 않았습니다");
			$("#emailId").focus();
			return false;
		}else if(emailDomain.length == 0){
			alert("이메일 도메인이 입력되지 않았습니다");
			$("#emailDomain").focus();
			return false;
		}
	});
	$("#searchForm").on("submit", function() {
		var keyword = $("#keyword").val();
		if(keyword.length <= 0) {
			alert("검색어가 입력되지 않았습니다.\n검색어를 입력해주세요");
			return false;
		}		
		$(this).attr("method", "post");
		$(this).attr("action", "memberList.mvc");		
	});

});
function memberList(){
	history.back();
}
