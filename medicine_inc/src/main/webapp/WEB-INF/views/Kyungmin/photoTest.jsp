<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
function introOnOff(btnId){
	var btnId= document.getElementById(btnId);
	console.log("btnId : " + btnId);
	if(btnId.style.display == "none"){
		btnId.style.display = "block";
	}
	else{
		btnId.style.display = "none"; 
	}
}
</script>
<article>
 <h1>사진 시력 테스트</h1><br><br><br>
 <h2>다음 사진들을 보고 무엇이 보이나요?</h2><br><br><br>
 <h3>이 테스트는 순수하게 재미만을 위한 것이므로 정확한 방법이 아닙니다. <br>
    이 점 양해해 주시기 바랍니다.</h3>
 <table>
  <tr>
   <td>
    <img src="resources/images/realEyeTest/testLine.jpg"/>
   </td>
  </tr>
  <tr>
   <td>
    한 쪽 눈을 감고 그림을 봐주세요<br>
    <input type="button" value="설명 보기" onclick="introOnOff('lineIntro')"/>
   </td>
  </tr>
  <tr id="lineIntro" style="display:none;">
   <td>
    선의 굵기가 일정하게 보인다면 난시가 없는 것입니다.<br>
    반대로 어떤 건 굵고 어떤 건 가늘게 보인다 싶으면 난시가 있는 것입니다.
   </td>
  </tr>
  <tr>
   <td>
    <img src="resources/images/realEyeTest/woman.png"/>
   </td>
  </tr>
  <tr>
   <td>
    위 그림의 나오는 여자의 표정은?<br>
    <input type="button" value="설명보기" onclick="introOnOff('womanIntro')"/>
   </td>
  </tr>
  <tr id="womanIntro" style="display:none;">
   <td>
    시력이 나쁘면 여자의 표정이 보인다고 합니다<br>
    시력이 좋으면 컬러풀한 점의 윤곽 때문에 여자의 표정까지는 읽을수 없다고 합니다
   </td>
  </tr>
  <tr>
   <td>
    <img src="resources/images/realEyeTest/pander.png"/>
   </td>
  </tr>
  <tr>
   <td>
    위 그림에서 무엇이 보이나요?<br>
    <input type="button" value="설명보기" onclick="introOnOff('panderIntro')"/>
   </td>
  </tr>
  <tr id="panderIntro" style="display:none;">
   <td>
    팬더로 보이면 시력이 나쁜 것 <br>
  그냥 선만있다 하면 좋은 시력을 소유하신 분
   </td>
  </tr>
  <tr>
   <td>
    <img src="resources/images/realEyeTest/testPika.jpg"/>
   </td>
  </tr>
  <tr>
   <td>
    위 그림에서 무엇이 보이나요?<br>
    <input type="button" value="설명보기" onclick="introOnOff('pikaIntro')"/>
   </td>
  </tr>
  <tr id="pikaIntro" style="display:none;">
   <td>
    난시가 있으신 분들은 피카츄가 보인다고 합니다
   </td>
  </tr>
  <tr>
   <td>
    <img src="resources/images/realEyeTest/number.jpg"/>
   </td>
  </tr>
  <tr>
   <td>
    위 그림의 숫자가 몇으로 보이나요?
    <input type="button" value="설명보기" onclick="introOnOff('numberIntro')"/><br>
   </td>
  </tr>
  <tr id="numberIntro" style="display:none;">
   <td>
    정답은 '571' 입니다
   이것을 맞추신 분들은 정말 좋은 시력을 가지고 계신다고 하네요
   </td>
  </tr>
 </table>
</article>