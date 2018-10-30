var tabat; //약국 0 , 병원 1, 동물병원 2
var sidoname;//지역명	
var name;
$(function(){
	sidoname = $("#sidoname").val();//지역명
	
	$(".tab-list__link").click(function(){
		tabat = $(".tab-list__link").index(this);
	});
	
	$("#pSearch").on("submit", function(){
		name = $(".input--style-1").val();
		console.log("name : "+name);
		console.log("sidoname : "+sidoname);
		var params = $(this).serialize();
		$.ajax({
			url: "pSearch.ajax",
			type: "post",
			data: params,
			dataType: "json",
			success: function(resultData, status, xhr) {
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
				
				console.log("endPage : "+resultData.endPage);
				console.log("pageCount : "+resultData.pageCount);
				var $tr = $("<tr id='trLine' class='trLine'></tr>");
				var $tdListPage = $("<td class='listPage'></td>");
				var beforeA = (resultData.startPage > resultData.pageGroup ? 
						"<a href='boardList?pageNum="+ resultData.startPage - resultData.pageGroup
						+ "&type="+ sidoname +"&keyword="+ name  +"'>[이전]</a>" : "");
				var pages = "";
				
				for(var i = resultData.startPage; i < resultData.endPage; i++) {
					pages += "<a href='boardList?pageNum="+ i +"&type="+ sidoname
									"&keyword="+ name + "'>[" +  i + "]</a>";
				}
				var afterA = (resultData.endPage < resultData.pageCount ?
						"<a href='boardList?pageNum="+ resultData.startPage + resultData.pageGroup
						+ "&type="+  sidoname  + "&keyword="+  name  +"'>[다음]</a>":"");
				
				//$tdListPage.append(beforeA);
				//$tdListPage.append(pages);
				$tdListPage.append(afterA);
				$tr.append($tdListPage);
				$("#grTable").append($tr);
				console.log($("#grTable"));
				
				/*$tdListPage.append(afterA);
				$tr.append($tdListPage).append(afterA).append(pages).append(beforeA);
				$("#grTable").append($tr.append($tdListPage).append(afterA).append(pages).append(beforeA));
				console.log($("#grTable"));*/
				
			},
			error: function(xhr, status, error) {
				alert("ajax 실패 : " + status + " - " + xhr.status);
				}
		})
		return false;
	});
	
});