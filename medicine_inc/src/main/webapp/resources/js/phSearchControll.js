var tabat; //약국 0 , 병원 1, 동물병원 2
var sidoname;//지역명	
var name;
var beforPageNum;
var afterPageNum;
var i;
$(function(){
	sidoname = $("#sidoname").val();//지역명
	
	$(".tab-list__link").click(function(){
		tabat = $(".tab-list__link").index(this);
	});
	
	$("#pSearch").on("submit", function(){
		name = $(".input--style-1").val();
		var params = $(this).serialize();
		$.ajax({
			url: "pSearch.ajax",
			type: "post",
			data: params,
			dataType: "json",
			success: function(resultData, status, xhr) {
				if (window.sessionStorage) {
	                sessionStorage.setItem('pList', resultData.pSearchList);
	                //var position = sessionStorage.getItem('저장된 이름');
	            }
				//console.log(resultData.pSearchList[0].name);
				$("#grTable").empty();
				$.each(resultData.pSearchList, function(index, value){
					var result = 
						"<tr id='trLine' class='trLine'>"
						+ " <td>"
						+ "	<div>"
						+ "		<div class='grdate'>" + value.name + "</div>"
						+ "		<div class='grdate'>" + '('+value.post+')&nbsp;' + value.addr + "</div>"
						+ "		<div class='grdate'>" + value.sidoname + value.sguname+"</div>"
						+ "		<div class='grdate'>" + value.tel + "</div>"
						+ "	</div>"
						+ " </td>"
						+ "</tr>"
						+ "<br/>";
					$("#grTable").append(result);	
				});
				
				/*console.log("endPage: " +resultData.endPage);
				console.log("pageGroup:"  +resultData.pageGroup);*/
				var $tr = $("<tr id='trLine' class='trLine'></tr>");
				var $tdListPage = $("<td class='listPage'></td>");
				
				beforPageNum = resultData.startPage - resultData.pageGroup;
				afterPageNum = resultData.startPage + resultData.pageGroup;
				
				var beforeA = (resultData.startPage > resultData.pageGroup ? 
						"<a class='clickBeforeA clickNext'>[이전]</a>" : "");
				var pages="";
				for(i = resultData.startPage; i < resultData.endPage;) {
					if(i == resultData.currentPage){
						pages += "[" + i + "]";
					} else {
						pages += "<a class='clickPages' data-no='"+i+"'>[" + i + "]</a>";
					}
					i++;
				}
				//console.log(afterPageNum);
				
				var afterA = (resultData.endPage < resultData.pageCount ?
						"<a class='clickAfterA clickNext'>[다음]</a>":"");
				
				
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
				alert("ajax 실패 : " + status + " - " + xhr.status);
				}
		})
		return false;
	});

	
	//해당 페이지 리스트 가져오기
	$(document).on("click", ".clickPages", function(){
		var pageI = $(this).attr('data-no');
		var params = "sidoname="+sidoname+"&name="+name+"&pageNum="+pageI;
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
					var result = 
						"<tr id='trLine' class='trLine'>"
						+ " <td>"
						+ "	<div>"
						+ "		<div class='grdate'>" + value.name + "</div>"
						+ "		<div class='grdate'>" + '('+value.post+')&nbsp;' + value.addr + "</div>"
						+ "		<div class='grdate'>" + value.sidoname + value.sguname+"</div>"
						+ "		<div class='grdate'>" + value.tel + "</div>"
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
						"<a class='clickBeforeA'>[이전]</a>" : "");
				var pages="";
				for(i = resultData.startPage; i < resultData.endPage;) {
					if(i == resultData.currentPage){
						pages += "[" + i + "]";
					} else {
						pages += "<a class='clickPages' data-no='"+i+"'>[" + i + "]</a>";
					}
					i++;
				}
				
				var afterA = (resultData.endPage < resultData.pageCount ?
						"<a class='clickAfterA'>[다음]</a>":"");
			
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
	
	
	
});