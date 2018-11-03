<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<link rel="stylesheet" type="text/css" href="resources/css/phdetail.css" />

<!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Colrolib Templates">
    <meta name="author" content="Colrolib">
    <meta name="keywords" content="Colrolib Templates">

    <!-- Title Page-->
    <title>Au Form Wizard</title>

    <!-- Icons font CSS-->
    <link href="resources/js/vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
    <link href="resources/js/vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <!-- Font special for pages-->
    <link href="https://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Vendor CSS-->
    <link href="resources/js/vendor/select2/select2.min.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="resources/css/main2.css" rel="stylesheet" media="all">
    <link href="resources/css/phSearch.css" rel="stylesheet">
        <!-- Jquery JS-->
    <script src="resources/js/vendor/jquery/jquery.min.js"></script>
    <!-- Vendor JS-->
    <script src="resources/js/vendor/select2/select2.min.js"></script>
    <script src="resources/js/vendor/jquery-validate/jquery.validate.min.js"></script>
   <script src="resources/js/vendor/bootstrap-wizard/bootstrap.min.js"></script>
    <script src="resources/js/vendor/bootstrap-wizard/jquery.bootstrap.wizard.min.js"></script>
    <script src="resources/js/vendor/datepicker/moment.min.js"></script>
    <script src="resources/js/phSearchControll.js"></script>

    <!-- Main JS-->
    <!-- <script src="js/global.js"></script>-->
 
  <body style=" margin: 0px auto;">
<div style="margin:30px;"><h1 style="text-align:center; font-size:30px; color:green;">${area} 상세 검색 페이지</h1>
</div>
<div>


<div id="detailDiv">
<h3 style="margin:0px auto; text-align:center;">상세정보 검색</h3>

    <div class="page-wrapper bg-color-1 p-t-165 p-b-100">
        <div class="wrapper wrapper--w680">
            <div class="card card-2">
                <div class="card-body">
                    <ul class="tab-list">
                        <li class="tab-list__item active">
                            <a class="tab-list__link" href="#tab1" data-toggle="tab">약국</a>
                        </li>
                        <li class="tab-list__item">
                            <a class="tab-list__link" href="#tab3" data-toggle="tab">병원</a>
                        </li>
                        <li class="tab-list__item">
                            <a class="tab-list__link" href="#tab2" data-toggle="tab">동물병원</a>
                        </li>
                        
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="tab1">
                            <form method="POST" id="pSearch" class="pSearch">
                            <input type="hidden" name="sidoname" id="sidoname" value="${area}" />
                                <div class="input-group">
                                    <label class="label">약국 명:</label>
                                    <input id="inputPh" class="input--style-1" type="text" name="name" placeholder="ex)메디" required="required">
                                </div>
                                
                                <button class="btn-submit" type="submit">search</button>
                            </form>
                        </div>
                        
                        <div class="tab-pane" id="tab3">
                            <form method="POST" id="hSearch" class="pSearch">
                            <input type="hidden" name="sidoname" id="sidoname" value="${area}" />
                                <div class="input-group">
                                    <label class="label">병원 명:</label>
                                    <input  id="inputHos" class="input--style-1" type="text" name="name" placeholder="병원" required="required">
                                </div>
                                
                                <div class="radioDiv">
                                        <div class="dcc"><input type="radio" name="radioType" checked class="inputRadio" value="종합병원">종합병원</div>
                                        <div class="dcc"><input type="radio" name="radioType" class="inputRadio" value="요양병원">요양병원</div>
                                        <div class="dcc"><input type="radio" name="radioType" class="inputRadio" value="치과">치과</div>
                                        <div class="dcc"><input type="radio" name="radioType" class="inputRadio" value="한방">한방</div>
                                        <div class="dcc"><input type="radio" name="radioType" class="inputRadio" value="보건기관">보건기관</div>
                                        <div class="dcc"><input type="radio" name="radioType" class="inputRadio" value="조산원">조산원</div>
                                        <div class="dcc"><input type="radio" name="radioType" class="inputRadio" value="의원">의원</div>
                                   </div>
                                   
                                   <div id="dropDiv">
                                   	<select name="hospi" id="selectHospi">
                                   		<option value="안과">안과</option>
                                   		<option value="피부과">피부과</option>
                                   		<option value="내과">내과</option>
                                   		<option value="성형외과">성형외과</option>
                                   		<option value="마취과">마취과</option>
                                   		<option value="비뇨기과">비뇨기과</option>
                                   		<option value="소아과">소아과</option>
		                                <option value="정형외과">정형외과</option>
		                                <option value="영상의학과">영상의학과</option>
		                                <option value="가정의학과">가정의학과</option>
		                                <option value="이비인후과">이비인후과</option>
		                                <option value="산부인과">산부인과</option>
		                                <option value="흉부외과">흉부외과</option>
		                                <option value="신경외과">신경외과</option>
		                                <option value="재활의학과">재활의학과</option>
		                                <option value="정신과">정신과</option>
		                                <option value="신경과">신경과</option>
		                                <option value="병리과">병리과</option>
		                                <option value="진단검사의학과">진단검사의학과</option>
		                                <option value="핵의학과">핵의학과</option>
		                                <option value="결핵과">결핵과</option>
                                   	</select>
                                   </div>
                				               
                                <button class="btn-submit" type="submit">search</button>
                            </form>
                        </div>
                        
                        <div class="tab-pane" id="tab2">
                            <form method="POST" id="aSearch" class="pSearch">
                            <input type="hidden" name="sidoname" id="sidoname" value="${area}" />
                                <div class="input-group">
                                    <label class="label">동물병원 명:</label>
                                    <input  id="inputAni"  class="input--style-1" type="text" name="origin" placeholder="ex)동물" required="required">
                                </div>
                                
                                <button class="btn-submit m-t-0" type="submit">search</button>
                            </form>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
<div id="replyDiv">
<h3 id ="rTitle" style="margin:0px auto; text-align:center;">검색 리스트</h3>
		<table id="grTable">
		
		</table>				
</div>
</div>
</body>
