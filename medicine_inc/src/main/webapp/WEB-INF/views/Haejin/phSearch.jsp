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
                            <form method="POST" id="pSearch">
                            <input type="hidden" name="sidoname" id="sidoname" value="${area}" />
                                <div class="input-group">
                                    <label class="label">약국 명:</label>
                                    <input class="input--style-1" type="text" name="name" placeholder="ex)무지개약국" required="required">
                                </div>
                                
                                <button class="btn-submit" type="submit">search</button>
                            </form>
                        </div>
                        <div class="tab-pane" id="tab3">
                            <form method="POST" id="hSearch">
                            <input type="hidden" name="sidoname" id="sidoname" value="${area}" />
                                <div class="input-group">
                                    <label class="label">origin:</label>
                                    <input class="input--style-1" type="text" name="name" placeholder="City or airport" required="required">
                                </div>
                                
                                <div class="p-t-5">
                                    <label class="checkbox-container m-r-45">First Class
                                        <input type="checkbox" name="first-class">
                                        <span class="checkmark"></span>
                                    </label>
                                    <label class="checkbox-container m-r-45">Business
                                        <input type="checkbox" name="business">
                                        <span class="checkmark"></span>
                                    </label>
                                    <label class="checkbox-container">Economy
                                        <input type="checkbox" checked="checked" name="economy">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                                
                                <button class="btn-submit" type="submit">search</button>
                            </form>
                        </div>
                        <div class="tab-pane" id="tab2">
                            <form method="POST" id="aSearch">
                            <input type="hidden" name="sidoname" id="sidoname" value="${area}" />
                                <div class="input-group">
                                    <label class="label">origin:</label>
                                    <input class="input--style-1" type="text" name="origin" placeholder="City or airport" required="required">
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
