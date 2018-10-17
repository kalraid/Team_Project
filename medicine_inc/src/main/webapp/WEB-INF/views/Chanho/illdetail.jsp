<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<article>
	<h2> 질병 정보</h2>
	<table class="table table-bordered table-hover">
		<tr>
			<th>번호</th>
			<td>${IllList.code}</td>
		</tr>
		<tr>
			<th>병명(한글)</th>
			<td>${IllList.name}</td>
		</tr>
		<tr>
			<th>병명(한글)</th>
			<td>${IllList.nameEn}</td>
		</tr>
		<tr>
			<th>관련 질병</th>
			<td>${IllList.relatedDiseases}</td>
		</tr>
		<tr>
			<th>증상</th>
			<td>${IllList.symptom}</td>
		</tr>
		<tr>
			<th>원인</th>
			<td>${IllList.cause}</td>
		</tr>
		<tr>
			<th>진단</th>
			<td>${IllList.diagnosis}</td>
		</tr>
		<tr>
			<th>치료</th>
			<td>${IllList.cure}</td>
		</tr>
	</table>
	<button type="button" class="btn btn-default searchConsonant" onclick="location.href='ill?pageNum=${pageNum}&type=${type}&keyword=${keyword}&hid=${hid}'">돌아가기</button>

</article>