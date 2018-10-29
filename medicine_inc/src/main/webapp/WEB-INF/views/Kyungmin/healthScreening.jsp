<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
 $(function(){
	 var healthScore = 100;
	 $("#jindanBtn").click(function(){
		 if($("#stroke").is(":checked")){
			 healthScore = healthScore - 20;
		 }
		 if($("#heart").is(":checked")){
			 healthScore = healthScore - 20;
		 }
		 if($("#hypertension").is(":checked")){
			 healthScore = healthScore - 20;
		 }
		 if($("#diabetes_mellitus").is(":checked")){
			 healthScore = healthScore - 20;
		 }
		 if($("#dyslipidemia").is(":checked")){
			 healthScore = healthScore - 20;
		 }
		 if($("#tuberculosis").is(":checked")){
			 healthScore = healthScore - 20;
		 }
		 if($("#gita").is(":checked")){
			 healthScore = healthScore - 20;
		 }
		 if($("#stroke1").is(":checked")){
			 healthScore = healthScore - 15;
		 }
		 if($("#heart1").is(":checked")){
			 healthScore = healthScore - 15;
		 }
		 if($("#hypertension1").is(":checked")){
			 healthScore = healthScore - 15;
		 }
		 if($("#diabetes_mellitus1").is(":checked")){
			 healthScore = healthScore - 15;
		 }
		 if($("#dyslipidemia1").is(":checked")){
			 healthScore = healthScore - 15;
		 }
		 if($("#tuberculosis1").is(":checked")){
			 healthScore = healthScore - 15;
		 }
		 if($("#gita1").is(":checked")){
			 healthScore = healthScore - 15;
		 }
		 if($("#stroke2").is(":checked")){
			 healthScore = healthScore - 10;
		 }
		 if($("#heart2").is(":checked")){
			 healthScore = healthScore - 10;
		 }
		 if($("#hypertension2").is(":checked")){
			 healthScore = healthScore - 10;
		 }
		 if($("#diabetes_mellitus2").is(":checked")){
			 healthScore = healthScore - 10;
		 }
		 if($("#gita2").is(":checked")){
			 healthScore = healthScore - 10;
		 }
		 if($("input[type=radio][name=type_B]:checked").val() == "yes"){
			 healthScore = healthScore - 15;
		 }
		 if($("input[type=radio][name=smoke]:checked").val() == "yNoSomke"){
			 healthScore = healthScore - 10; 
		 }
		 if($("input[type=radio][name=smoke]:checked").val() == "yYSomke"){
			 healthScore = healthScore - 15; 
		 }
		 if($("#noSmokeTime").val() != ""){
			 var nst = $("#noSmokeTime").val();
			 var nsp = $("#noSmokePiece").val() * 0.00015 * 365;
			 var noY = nst * nsp
			 healthScore = healthScore - noY;
		 }
		 if($("#SmokeTime").val() != ""){
			 var nst = $("#SmokeTime").val();
			 var nsp = $("#SmokePiece").val() * 0.00025 * 365;
			 var noY = nst * nsp
			 healthScore = healthScore - noY;
		 }
		 if($("input[type=radio][name=drinkCount]:checked").length != 0){
			 var dc = $("input[type=radio][name=drinkCount]:checked").val();
			 var dg = $("#drinkGlass").val() * 0.1;
			 var dcg = dc * dg;
			 healthScore = healthScore - dcg;
		 }
		 if($("input[type=radio][name=hardTraining]:checked").length != 0){
			 var ht = $("input[type=radio][name=hardTraining]:checked").val();
			 var httime = $("#hardTrainingTime").val() * 0.1;
			 var hdt = ht * httime;
			 healthScore = healthScore + hdt;
		 }
		 if($("input[type=radio][name=nomalTraining]:checked").length != 0){
			 var ht = $("input[type=radio][name=nomalTraining]:checked").val();
			 var httime = $("#nomalTrainingTime").val() * 0.05;
			 var hdt = ht * httime;
			 healthScore = healthScore + hdt;
		 }
		 if($("input[type=radio][name=training]:checked").length != 0){
			 var training = $("input[type=radio][name=training]:checked").val() * 1;
			 healthScore = healthScore + training;
		 }
		 if(Math.round(healthScore) < 20){
			 alert(Math.round(healthScore)+"점\n당신은 목숨은 바람 앞의 등불 혹은 파리채 앞의 파리정도 입니다\n지금 당장 유서를 준비하시고 보험에 가입하세요");
		 }else if(Math.round(healthScore) >= 20 && Math.round(healthScore) < 30  ){
			 alert(Math.round(healthScore)+"점\n당신은 걸어다니는 시체입니다.\n지금 당장 병원에 가시거나 교회 및 성당에 가서 정화되세요");
		 }else if(Math.round(healthScore) >= 30 && Math.round(healthScore) < 50){
			 alert(Math.round(healthScore)+"점\n당신의 건강은 좋은 쪽, 나쁜 쪽 둘 중 하나를 고르라면 나쁜편에 속합니다\n생활 습관을 고치면 충분히 좋아질 전망입니다");
		 }else if(Math.round(healthScore) >=50 && Math.round(healthScore)< 70){
			 alert(Math.round(healthScore)+"점\n당신의 건강은 뭐~ 그럭저럭입니다\n지금처럼만 살더라도 크게 영향이 가지는 않을 듯? 합니다");
		 }else if(Math.round(healthScore) >= 70 && Math.round(healthScore) < 90){
			 alert(Math.round(healthScore)+"점\n당신은 아주 건강합니다\n생활습관을 조금 고치면은 앞으로도 건강하게 살 수 있을 겁니다");
		 }else if(Math.round(healthScore) >= 90){
			 alert(Math.round(healthScore)+"점\n당신은 건강 그 자체입니다\n당신의 건강만큼의 지능과 어느 정도의 운이 있다면 아마 살아가는데 큰 어려움 없이 지낼 수 있을겁니다");
		 }
		 location.reload();
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
    <label><input type="radio" id="type_B" name="type_B" value="yes">예</label>
    <label><input type="radio" id="type_B" name="type_B" value="no">아니오</label>
    <label><input type="radio" id="type_B" name="type_B" value="idk">모름</label>
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
    *숫자로 입력해 주세요<input type="number" id="noSmokeTime">년
   </td>
  </tr>
  <tr>
   <td>
    금연하시기 전 평균 하루 흡연량은 몇 개비였습니까?
   </td>
   <td>
    *숫자로 입력해 주세요<input type="number" id="noSmokePiece">개비
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
    *숫자로 입력해 주세요<input type="number" id="SmokeTime">년
   </td>
  </tr>
  <tr>
   <td>
    평균 하루 흡연량은 몇개비입니까?
   </td>
   <td>
    *숫자로 입력해 주세요<input type="number" id="SmokePiece">개비
   </td>
  </tr>
  <tr>
   <td colspan="2">
    음주관련 문항
   </td>
  </tr>
  <tr>
   <td colspan="2">
    1주에 평균 며칠이나 술을 마십니까?
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
    *숫자로 입력해 주세요<input type="number" id="drinkGlass">병
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
    *숫자로 입력해 주세요<input type="number" id="hardTrainingTime">분
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
    *숫자로 입력해 주세요<input type="number" id="nomalTrainingTime">분
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