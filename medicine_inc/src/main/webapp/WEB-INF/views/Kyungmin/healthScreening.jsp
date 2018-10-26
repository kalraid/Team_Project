<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
 $(function(){
	 $("#jindanBtn").click(function(){
		 alert($("#stroke").val());
	 });
 });
</script>
<style>
 #healthTable{
  border-collapse: collapse;
 }
 #healthTable td{
  border:1px solid black;
 }
</style>
<article>
 <h1>건강 검진</h1><br><br>
 <table id="healthTable">
  <tr>
   <td colspan="2">
    질환력(가족력, 과거력)관련 문항
   </td>
  </tr>
  <tr>
   <td colspan="2"> 
    다음과 같은 질병으로 진단을 받았거나 현재 약물치료 중이십니까?   
   </td>
  </tr>
  <tr>
   <td>
   진단여부
   </td>
   <td>
    <input type="checkbox" id="stroke" name="stroke" value="뇌졸중">뇌졸중(중풍)
    <input type="checkbox" id="heart" name="heart" value="심장병">심장병(심근경색,협심증)
    <input type="checkbox" id="hypertension" name="hypertension" value="고혈압">고혈압
    <input type="checkbox" id="diabetes_mellitus" name="diabetes_mellitus" value="당뇨병">당뇨병
    <input type="checkbox" id="dyslipidemia" name="dyslipidemia" value="이상지질혈증">이상지질혈증
    <input type="checkbox" id="tuberculosis" name="tuberculosis" value="폐결핵">폐결핵
    <input type="checkbox" id="gita" name="gita" value="기타">기타(암포함)
   </td>
  </tr>
  <tr>
   <td>
    약물치료여부
   </td>
   <td>
    <input type="checkbox" id="stroke1" name="stroke1" value="뇌졸중">뇌졸중(중풍)
    <input type="checkbox" id="heart1" name="heart1" value="심장병">심장병(심근경색,협심증)
    <input type="checkbox" id="hypertension1" name="hypertension1" value="고혈압">고혈압
    <input type="checkbox" id="diabetes_mellitus1" name="diabetes_mellitus1" value="당뇨병">당뇨병
    <input type="checkbox" id="dyslipidemia1" name="dyslipidemia1" value="이상지질혈증">이상지질혈증
    <input type="checkbox" id="tuberculosis1" name="tuberculosis1" value="폐결핵">폐결핵
    <input type="checkbox" id="gita1" name="gita1" value="기타">기타(암포함)
   </td>
  </tr>
  <tr>
   <td colspan="2">
    부모 형제 자매가 다음 질환으로 앓았거나 해당질환으로 사망한 경우가 있습니까?
   </td>
  </tr>
  <tr>
   <td colspan="2">
    <input type="checkbox" id="stroke2" name="stroke2" value="뇌졸중">뇌졸중(중풍)
    <input type="checkbox" id="heart2" name="heart2" value="심장병">심장병(심근경색,협심증)
    <input type="checkbox" id="hypertension2" name="hypertension2" value="고혈압">고혈압
    <input type="checkbox" id="diabetes_mellitus2" name="diabetes_mellitus2" value="당뇨병">당뇨병
    <input type="checkbox" id="gita2" name="gita2" value="기타">기타(암포함)
   </td>
  </tr>
  <tr>
   <td colspan="2">
    b형 간염 바이러스 보유자입니까?
   </td>
  </tr>
  <tr>
   <td colspan="2">
    <label><input type="radio" id="tyep_B" name="tyep_B" value="yes">예</label>
    <label><input type="radio" id="tyep_B" name="tyep_B" value="no">아니오</label>
    <label><input type="radio" id="tyep_B" name="tyep_B" value="idk">모름</label>
   </td>
  </tr>
  <tr>
   <td colspan="2">
    흡연 관련 문항
   </td>
  </tr>
  <tr>
   <td colspan="2">
    지금까지 평생 총5갑(100개피)이상의 담배를 피운적이 있습니까?
   </td>
  </tr>
  <tr>
   <td colspan="2">
    <label><input type="radio" id="smoke" name="smoke" value="notSmoke">아니오</label>
    <label><input type="radio" id="smoke" name="smoke" value="yNoSomke">예,지금은 끊었음</label>
    <label><input type="radio" id="smoke" name="smoke" value="yYSomke">예 현재도 흡연중</label>
   </td>
  </tr>
  <tr>
   <td colspan="2">
    과거에 흡연을 하였으나 현재는 끊으셨다면
   </td>
  </tr>
  <tr>
   <td>
    금연 전까지 담배를 몇년이나 피우셨습니까?
   </td>
   <td>
    *숫자로 입력해 주세요<input type="text" id="noSmokeTime">년
   </td>
  </tr>
  <tr>
   <td>
    금연하시기 전 평균 하루 흡연량은 몇 개비였습니까?
   </td>
   <td>
    *숫자로 입력해 주세요<input type="text" id="noSmokePiece.">개비
   </td>
  </tr>
  <tr>
   <td colspan="2">
    현재도 흡연을 하신다면
   </td>
  </tr>
  <tr>
   <td>
    몇 년째 담배를 피우고 계십니까?
   </td>
   <td>
    *숫자로 입력해 주세요<input type="text" id="SmokeTime">년
   </td>
  </tr>
  <tr>
   <td>
    평균 하루 흡연량은 몇개비입니까?
   </td>
   <td>
    *숫자로 입력해 주세요<input type="text" id="SmokePiece.">개비
   </td>
  </tr>
  <tr>
   <td colspan="2">
    음주관련 문항
   </td>
  </tr>
  <tr>
   <td colspan="2">
    <label><input type="radio" id="drinkCount" name="drinkCount" value="0">0</label>
    <label><input type="radio" id="drinkCount" name="drinkCount" value="1">1</label>
    <label><input type="radio" id="drinkCount" name="drinkCount" value="2">2</label>
    <label><input type="radio" id="drinkCount" name="drinkCount" value="3">3</label>
    <label><input type="radio" id="drinkCount" name="drinkCount" value="4">4</label>
    <label><input type="radio" id="drinkCount" name="drinkCount" value="5">5</label>
    <label><input type="radio" id="drinkCount" name="drinkCount" value="6">6</label>
    <label><input type="radio" id="drinkCount" name="drinkCount" value="7">7</label>
   </td>
  </tr>
  <tr>
   <td colspan="2">
    술을 드실 때 보통 하루에 얼마나 마십니까?
   </td>
  </tr>
  <tr>
   <td colspan="2">
    *숫자로 입력해 주세요<input type="text" id="drinkGlass">병
   </td>
  </tr>
  <tr>
   <td colspan="2">
    신체활동 관련 문항
   </td>
  </tr>
  <tr>
   <td colspan="2">
    평소 1주일간 숨이 많이 차게 만드는 고강도 신체활동을 며칠 하십니까?
   </td>
  </tr>
  <tr>
   <td colspan="2">
    <label><input type="radio" id="hardTraining" name="hardTraining" value="0">0</label>
    <label><input type="radio" id="hardTraining" name="hardTraining" value="1">1</label>
    <label><input type="radio" id="hardTraining" name="hardTraining" value="2">2</label>
    <label><input type="radio" id="hardTraining" name="hardTraining" value="3">3</label>
    <label><input type="radio" id="hardTraining" name="hardTraining" value="4">4</label>
    <label><input type="radio" id="hardTraining" name="hardTraining" value="5">5</label>
    <label><input type="radio" id="hardTraining" name="hardTraining" value="6">6</label>
    <label><input type="radio" id="hardTraining" name="hardTraining" value="7">7</label>
   </td>
  </tr>
  <tr>
   <td colspan="2">
   평소 하루에 숨이 많이 차게 마드는 고강도 훈련을 몇분 하십니까?
   </td>
  </tr>
  <tr>
   <td colspan="2">
    *숫자로 입력해 주세요<input type="text" id="hardTrainingTime">분
   </td>
  </tr>
  <tr>
   <td colspan="2">
    평소 1주일간 숨이 약간 차게 만드는 중강도 신체활동을 며칠 하십니까?
   </td>
  </tr>
  <tr>
   <td colspan="2">
    <label><input type="radio" id="nomalTraining" name="nomalTraining" value="0">0</label>
    <label><input type="radio" id="nomalTraining" name="nomalTraining" value="1">1</label>
    <label><input type="radio" id="nomalTraining" name="nomalTraining" value="2">2</label>
    <label><input type="radio" id="nomalTraining" name="nomalTraining" value="3">3</label>
    <label><input type="radio" id="nomalTraining" name="nomalTraining" value="4">4</label>
    <label><input type="radio" id="nomalTraining" name="nomalTraining" value="5">5</label>
    <label><input type="radio" id="nomalTraining" name="nomalTraining" value="6">6</label>
    <label><input type="radio" id="nomalTraining" name="nomalTraining" value="7">7</label>
   </td>
  </tr>
  <tr>
   <td colspan="2">
   평소 하루에 숨이 약간 차게 마드는 중강도 훈련을 몇분 하십니까?
   </td>
  </tr>
  <tr>
   <td colspan="2">
    *숫자로 입력해 주세요<input type="text" id="nomalTrainingTime">분
   </td>
  </tr>
  <tr>
   <td colspan="2">
    최근 1주일동안 팔굽혀혀기 ,윗몸일으키기, 아령, 역기, 철봉 등 근력 운동을 한 날은 며칠입니까?
   </td>
  </tr>
  <tr>
   <td colspan="2">
    <label><input type="radio" id="training" name="training" value="0">0</label>
    <label><input type="radio" id="training" name="training" value="1">1</label>
    <label><input type="radio" id="training" name="training" value="2">2</label>
    <label><input type="radio" id="training" name="training" value="3">3</label>
    <label><input type="radio" id="training" name="training" value="4">4</label>
    <label><input type="radio" id="training" name="training" value="5">5</label>
    <label><input type="radio" id="training" name="training" value="6">6</label>
    <label><input type="radio" id="training" name="training" value="7">7</label>
   </td>
  </tr>
 </table>
 <input type="button" value="진단" id="jindanBtn">
</article>