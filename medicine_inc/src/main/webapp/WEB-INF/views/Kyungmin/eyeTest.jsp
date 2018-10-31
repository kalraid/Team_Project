<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="resources/css/styleEyeTest.css" type="text/css">
<script type="text/javascript" src="resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="resources/js/commonEyeTest.js"></script>
<script>
function openEyeTest(){
	window.open("realEyeTest","menubar=no");
}
</script>
<article>
인터넷 시력 검사<br>
키보드 F11 버튼을 누른 후 3미터 떨어진 지점에서 측정하세요<br><br>
1.사용방법은 아주 간단하고 쉽습니다. 따라해보세요.<br>
2.화면에 100원짜리 동전을 대고 확대/축소 버튼을 눌러 화면과 동전의 크기를 똑같게 맞추세요.<br>
3.키보드 F11버튼을 누르면, 시력표만 화면에 나타납니다.<br>
4.정확한 측정을 위해서 모니터 화면에서부터 3미터 떨어진 지점에서 시력을 측정하세요.<br>
5.측정 시 한쪽 눈을 가리고 측정 후 반대쪽 눈을 동일하게 측정하세요.(주의! 가려지는 눈에 압박이 가해지면 안됩니다.)<br>
6.화면 밑에 있는 화살표를 클릭하셔서 0.1~0.4 시력표와 0.5~2.0 시력표의 화면을 전환하여 측정하세요.<br>
7.마우스 포인터를 지시봉으로 사용하여 친구와 함께 시력을 측정해보세요.<br><br>
<input type="button" id="realEyetestBtn" value="시작하기" onclick="openEyeTest();"/>
 <input type="button" value="목록보기" onclick="javascript:window.location.href='quizList'"/>
</article>