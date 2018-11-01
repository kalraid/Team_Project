var tabat; //약국 0 , 병원 1, 동물병원 2
var sidoname;//지역명	
var name;
var beforPageNum;
var afterPageNum;
var i;
$(function(){
	tabat =0;
	
	sidoname = $("#sidoname").val();//지역명
	
	$(".tab-list__link").click(function(){
		tabat = $(".tab-list__link").index(this);
	});
	
	$(".pSearch").on("submit", function(){
		if(tabat == 0){
			name = $("#inputPh").val();
		} else if(tabat == 2){
			name = $("#inputAni").val();
		}
		console.log(name);
		var params = "sidoname="+sidoname+"&name="+name+"&tabnum="+tabat;
		console.log("params : "+params);
		$.ajax({
			url: "pSearch.ajax",
			type: "post",
			data: params,
			dataType: "json",
			success: function(resultData, status, xhr) {
				
				$("#grTable").empty();
				$.each(resultData.pSearchList, function(index, value){
					var isTrue = value.phone? "		<div class='grdate'>" + value.phone+ "</div>" : '';
					var isPost = value.post? '('+value.post+')&nbsp;' : '';
					var isSidoname = value.sidoname? "		<div class='grdate'>" + value.sidoname + value.sguname+"</div>" : '';
					var isTel = value.tel? "		<div class='grdate'>" + value.tel + "</div>" : '';
					
					var result = 
						"<tr id='trLine' class='trLine trSearch' data-no='"+value.no+"'>"
						+ " <td class='tdLine'>"
						+ "	<div>"
						+ "		<div class='grdate'>" + value.name + "</div>"
						+ "		<div class='grdate'>" + isPost + value.addr + "</div>"
						+ isSidoname
						+ isTel
						+ isTrue
						+ "	</div>"
						+ " </td>"
						+ "</tr>"
						+ "<br/>";
					$("#grTable").append(result);	
					//console.log(value.phone? value.phone: null);
				});
				
				var $tr = $("<tr id='trLine' class='trLine'></tr>");
				var $tdListPage = $("<td class='listPage'></td>");
				
				beforPageNum = resultData.startPage - resultData.pageGroup;
				afterPageNum = resultData.startPage + resultData.pageGroup;
				
				var beforeA = (resultData.startPage > resultData.pageGroup ? 
						"<a class='clickBeforeA clickNext a2'>[이전]</a>" : "");
				var pages="";
				for(i = resultData.startPage; i <= resultData.endPage;) {
					if(i == resultData.currentPage){
						pages += "[" + i + "]";
					} else {
						pages += "<a class='clickPages ai' data-no='"+i+"'>[" + i + "]</a>";
					}
					i++;
				}
				//console.log(afterPageNum);
				
				var afterA = (resultData.endPage < resultData.pageCount ?
						"<a class='clickAfterA clickNext ai'>[다음]</a>":"");
				
				
				/*var beforeA = (resultData.startPage > resultData.pageGroup ? 
						"<a href='viewPage?pageNum="+ resultData.startPage - resultData.pageGroup
						+ "&sidoname="+ sidoname +"&name="+ name  +"'>[이전]</a>" : "");
				var pages="";
				for(var i = resultData.startPage; i < resultData.endPage;) {
					i++;
					pages += "<a href='viewPage?pageNum=" + i + "&sidoname=" + sidoname
									+"&name="+ name + "'>[" + i + "]</a>";
				}
				var afterA = (resultData.endPage < resultData.pageCount ?
						"<a href='viewPage?pageNum="+ resultData.startPage + resultData.pageGroup
						+ "&sidoname="+  sidoname  + "&name="+  name  +"'>[다음]</a>":"");*/
				
				$tdListPage.append(beforeA);
				$tdListPage.append(pages);
				$tdListPage.append(afterA);
				$tr.append($tdListPage);
				$("#grTable").append($tr);
				
			},
			error: function(xhr, status, error) {
				alert("일치하는 검색데이터가 없습니다.");
				}
		})
		return false;
	});

	
	//해당 페이지 리스트 가져오기
	$(document).on("click", ".clickPages", function(){
		var pageI = $(this).attr('data-no');
		var params = "sidoname="+sidoname+"&name="+name+"&pageNum="+pageI+"&tabnum="+tabat;
		console.log(params);
		
		$.ajax({
			url: "pSearch.ajax",
			type: "post",
			data: params,
			dataType: "json",
			success: function(resultData, status, xhr) {
				if (window.sessionStorage) {
	                sessionStorage.setItem('pList', resultData.pSearchList);
	            }
				$("#grTable").empty();
				$.each(resultData.pSearchList, function(index, value){ //여기서 수정
					
					var isTrue = value.phone? "		<div class='grdate'>" + value.phone+ "</div>" : '';
					var isPost = value.post? '('+value.post+')&nbsp;' : '';
					var isSidoname = value.sidoname? "		<div class='grdate'>" + value.sidoname + value.sguname+"</div>" : '';
					var isTel = value.tel? "		<div class='grdate'>" + value.tel + "</div>" : '';
					
					var result = 
						"<tr id='trLine' class='trLine trSearch' data-no='"+value.no+"'>"
						+ " <td class='tdLine'>"
						+ "	<div>"
						+ "		<div class='grdate'>" + value.name + "</div>"
						+ "		<div class='grdate'>" + isPost + value.addr + "</div>"
						+ isSidoname
						+ isTel
						+ isTrue
						+ "	</div>"
						+ " </td>"
						+ "</tr>"
						+ "<br/>";
					$("#grTable").append(result);	
				});
				
				var $tr = $("<tr id='trLine' class='trLine'></tr>");
				var $tdListPage = $("<td class='listPage'></td>");
				
				beforPageNum = resultData.startPage - resultData.pageGroup;
				afterPageNum = resultData.startPage + resultData.pageGroup;
				
				var beforeA = (resultData.startPage > resultData.pageGroup ? 
						"<a class='clickBeforeA a2'>[이전]</a>" : "");
				var pages="";
				for(i = resultData.startPage; i <= resultData.endPage;) {
					if(i == resultData.currentPage){
						pages += "[" + i + "]";
					} else {
						pages += "<a class='clickPages ai' data-no='"+i+"'>[" + i + "]</a>";
					}
					i++;
				}
				
				var afterA = (resultData.endPage < resultData.pageCount ?
						"<a class='clickAfterA ai'>[다음]</a>":"");
			
				$tdListPage.append(beforeA);
				$tdListPage.append(pages);
				$tdListPage.append(afterA);
				$tr.append($tdListPage);
				$("#grTable").append($tr);
				
			},
			error: function(xhr, status, error) {
				alert("ajax 실패 : " + status + " - " + xhr.status);
				}
		})
		return false;
	});
	
	
	//다음 페이지 클릭
	$(document).on("click", ".clickAfterA", function(){
		var params = "sidoname="+sidoname+"&name="+name+"&pageNum="+afterPageNum+"&tabnum="+tabat;
		$.ajax({
			url: "pSearch.ajax",
			type: "post",
			data: params,
			dataType: "json",
			success: function(resultData, status, xhr) {
				if (window.sessionStorage) {
	                sessionStorage.setItem('pList', resultData.pSearchList);
	            }
				$("#grTable").empty();
				$.each(resultData.pSearchList, function(index, value){
					
					var isTrue = value.phone? "		<div class='grdate'>" + value.phone+ "</div>" : '';
					var isPost = value.post? '('+value.post+')&nbsp;' : '';
					var isSidoname = value.sidoname? "		<div class='grdate'>" + value.sidoname + value.sguname+"</div>" : '';
					var isTel = value.tel? "		<div class='grdate'>" + value.tel + "</div>" : '';
					
					var result = 
						"<tr id='trLine' class='trLine trSearch' data-no='"+value.no+"'>"
						+ " <td class='tdLine'>"
						+ "	<div>"
						+ "		<div class='grdate'>" + value.name + "</div>"
						+ "		<div class='grdate'>" + isPost + value.addr + "</div>"
						+ isSidoname
						+ isTel
						+ isTrue
						+ "	</div>"
						+ " </td>"
						+ "</tr>"
						+ "<br/>";
					$("#grTable").append(result);	
				});
				
				var $tr = $("<tr id='trLine' class='trLine'></tr>");
				var $tdListPage = $("<td class='listPage'></td>");
				
				beforPageNum = resultData.startPage - resultData.pageGroup;
				afterPageNum = resultData.startPage + resultData.pageGroup;
				
				var beforeA = (resultData.startPage > resultData.pageGroup ? 
						"<a class='clickBeforeA a2'>[이전]</a>" : "");
				var pages="";
				for(i = resultData.startPage; i <= resultData.endPage;) {
					if(i == resultData.currentPage){
						pages += "[" + i + "]";
					} else {
						pages += "<a class='clickPages ai' data-no='"+i+"'>[" + i + "]</a>";
					}
					i++;
				}
				
				var afterA = (resultData.endPage < resultData.pageCount ?
						"<a class='clickAfterA ai'>[다음]</a>":"");
			
				$tdListPage.append(beforeA);
				$tdListPage.append(pages);
				$tdListPage.append(afterA);
				$tr.append($tdListPage);
				$("#grTable").append($tr);
				
			},
			error: function(xhr, status, error) {
				alert("ajax 실패 : " + status + " - " + xhr.status);
				}
		})
		return false;
	});
	

	//이전 페이지 클릭
	$(document).on("click", ".clickBeforeA", function(){
		var params = "sidoname="+sidoname+"&name="+name+"&pageNum="+beforPageNum+"&tabnum="+tabat;
		console.log(params);
		$.ajax({
			url: "pSearch.ajax",
			type: "post",
			data: params,
			dataType: "json",
			success: function(resultData, status, xhr) {
				if (window.sessionStorage) {
	                sessionStorage.setItem('pList', resultData.pSearchList);
	            }
				$("#grTable").empty();
				$.each(resultData.pSearchList, function(index, value){
					
					var isTrue = value.phone? "		<div class='grdate'>" + value.phone+ "</div>" : '';
					var isPost = value.post? '('+value.post+')&nbsp;' : '';
					var isSidoname = value.sidoname? "		<div class='grdate'>" + value.sidoname + value.sguname+"</div>" : '';
					var isTel = value.tel? "		<div class='grdate'>" + value.tel + "</div>" : '';
					
					var result = 
						"<tr id='trLine' class='trLine trSearch' data-no='"+value.no+"'>"
						+ " <td class='tdLine'>"
						+ "	<div>"
						+ "		<div class='grdate'>" + value.name + "</div>"
						+ "		<div class='grdate'>" + isPost + value.addr + "</div>"
						+ isSidoname
						+ isTel
						+ isTrue
						+ "	</div>"
						+ " </td>"
						+ "</tr>"
						+ "<br/>";
					$("#grTable").append(result);	
				});
				
				var $tr = $("<tr id='trLine' class='trLine'></tr>");
				var $tdListPage = $("<td class='listPage'></td>");
				
				beforPageNum = resultData.startPage - resultData.pageGroup;
				afterPageNum = resultData.startPage + resultData.pageGroup;
				
				var beforeA = (resultData.startPage > resultData.pageGroup ? 
						"<a class='clickBeforeA a2'>[이전]</a>" : "");
				var pages="";
				for(i = resultData.startPage; i <= resultData.endPage;) {
					if(i == resultData.currentPage){
						pages += "[" + i + "]";
					} else {
						pages += "<a class='clickPages ai' data-no='"+i+"'>[" + i + "]</a>";
					}
					i++;
				}
				
				var afterA = (resultData.endPage < resultData.pageCount ?
						"<a class='clickAfterA ai'>[다음]</a>":"");
			
				$tdListPage.append(beforeA);
				$tdListPage.append(pages);
				$tdListPage.append(afterA);
				$tr.append($tdListPage);
				$("#grTable").append($tr);
				
			},
			error: function(xhr, status, error) {
				alert("ajax 실패 : " + status + " - " + xhr.status);
				}
		})
		return false;
	});
	
	//상세정보 클릭시 이동 동물병원 제외

		
		$(document).on("click", ".trSearch", function(){
			console.log("tabat : "+tabat);
			if(tabat != 2){
				var no = $(this).attr("data-no");
				location.href='phDetail?no='+no+'&tabactive='+tabat+'&mapok=ok';
			} 
				return null;
		});
	
	
	
});