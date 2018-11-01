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
<style>
 #photoTestTitle{
  font-size: 50px;
  font-weight: bold;
 }
 .photoTestQuestion{
  font-size: 40px;
 }
 #photoTestEX{
  font-size: 25px;
 }
 .photoTestEnjoy{
  font-size:30px;
 }
 .photoIntroBtnValue{
  font-size: 15px;
 }
 .introTd{
  font-size: 20px;
 }
 #listBtn{
  cursor: pointer;
  font-weight:bold;
  text-align: center;
  font-size:2em;
  color:#fef4e9;
  padding: 10px 30px 10px 30px;
  margin-top: 10px;
  background: #f78d1d;
  box-shadow: 0px 5px 1px gray;
 }
 #listBtn:hover{
  box-shadow: 4px 4px 4px gray inset;
 }
 #listBtnTd{
  text-align: center;
 }
 #listBtnTable{
  margin: 0 auto;
 }
 .introBtn{
  cursor: pointer;
  text-align: center;
  color:#fef4e9;
  padding: 5px 10px 5px 10px;
  margin-top: 10px;
  background: #f78d1d;
  box-shadow: 0px 3px 1px gray;
 }
 #listBtn:hover{
  box-shadow: 2px 2px 2px gray inset;
 }
</style>
<article>
 <table id="photoTestTable">
  <tr>
   <td id="photoTestTitle">
   사진 시력 테스트
   </td>
  </tr>
  <tr>
   <td>
    <br>
   </td>
  </tr>
  <tr>
  <tr>
   <td class="photoTestQuestion">
   다음 사진들을 보고 무엇이 보이나요?
   </td>
  </tr>
  <tr>
   <td>
    <br>
   </td>
  </tr>
  <tr>
   <td id="photoTestEX">
  이 테스트는 순수하게 재미만을 위한 것이므로 정확한 방법이 아닙니다. <br>
    이 점 양해해 주시기 바랍니다.
   </td>
  </tr>
  <tr>
   <td>
    <img src="resources/images/realEyeTest/testLine.jpg"/>
   </td>
  </tr>
  <tr>
   <td class="photoTestEnjoy">
    한 쪽 눈을 감고 그림을 봐주세요<br>
    <p class="photoIntroBtnValue"><input type="button" value="설명 보기" class="introBtn" onclick="introOnOff('lineIntro')"/></p>
   </td>
  </tr>
  <tr id="lineIntro" style="display:none;">
   <td class="introTd">
    <p><br><br><br>선의 굵기가 일정하게 보인다면 난시가 없는 것입니다.<br>
    반대로 어떤 건 굵고 어떤 건 가늘게 보인다 싶으면 난시가 있는 것입니다.<br><br><br><br><br><br></p>
   </td>
  </tr>
  <tr>
   <td>
    <img src="resources/images/realEyeTest/woman.png"/>
   </td>
  </tr>
  <tr>
   <td class="photoTestEnjoy">
    위 그림의 나오는 여자의 표정은?<br>
    <p class="photoIntroBtnValue"><input type="button" value="설명보기" class="introBtn" onclick="introOnOff('womanIntro')"/></p>
   </td>
  </tr>
  <tr id="womanIntro" style="display:none;">
   <td class="introTd">
   <p><br><br><br>시력이 나쁘면 여자의 표정이 보인다고 합니다<br>
    시력이 좋으면 컬러풀한 점의 윤곽 때문에 여자의 표정까지는 읽을수 없다고 합니다<br><br><br><br><br><br></p>
   </td>
  </tr>
  <tr>
   <td>
    <img src="resources/images/realEyeTest/pander.png"/>
   </td>
  </tr>
  <tr>
   <td class="photoTestEnjoy">
    위 그림에서 무엇이 보이나요?<br>
    <p class="photoIntroBtnValue"><input type="button" value="설명보기" class="introBtn" onclick="introOnOff('panderIntro')"/></p>
   </td>
  </tr>
  <tr id="panderIntro" style="display:none;">
   <td class="introTd">
    <p><br><br><br>팬더로 보이면 시력이 나쁜 것 <br>
    그냥 선만있다 하면 좋은 시력을 소유하신 분<br><br><br><br><br><br></p>
   </td>
  </tr>
  <tr>
   <td>
    <img src="resources/images/realEyeTest/testPika.jpg"/>
   </td>
  </tr>
  <tr>
   <td class="photoTestEnjoy">
    위 그림에서 무엇이 보이나요?<br>
    <p class="photoIntroBtnValue"><input type="button" value="설명보기" class="introBtn" onclick="introOnOff('pikaIntro')"/></p>
   </td>
  </tr>
  <tr id="pikaIntro" style="display:none;">
   <td class="introTd">
    <p><br><br><br>난시가 있으신 분들은 피카츄가 보인다고 합니다<br><br><br><br><br><br></p>
   </td>
  </tr>
  <tr>
   <td>
    <img src="resources/images/realEyeTest/number.jpg"/>
   </td>
  </tr>
  <tr>
   <td class="photoTestEnjoy">
    위 그림의 숫자가 몇으로 보이나요?
    <p class="photoIntroBtnValue"><input type="button" value="설명보기" class="introBtn" onclick="introOnOff('numberIntro')"/><br></p>
   </td>
  </tr>
  <tr id="numberIntro" style="display:none;">
   <td class="introTd">
    <p><br><br><br>정답은 '571' 입니다<br>
   이것을 맞추신 분들은 정말 좋은 시력을 가지고 계신다고 하네요<br><br><br><br><br><br></p>
   </td>
  </tr>
 </table>
 <table id="listBtnTable">
  <tr>
   <td id="listBtnTd">
    <input type="button" id="listBtn" value="목록보기" onclick="javascript:window.location.href='quizList'"/>
   </td>
  </tr>
 </table>
</article>