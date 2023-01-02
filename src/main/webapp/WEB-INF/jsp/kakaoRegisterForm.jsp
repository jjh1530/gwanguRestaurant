<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="author" content="Untree.co">
	<link rel="shortcut icon" href="favicon.png">

	<meta name="description" content="" />
	<meta name="keywords" content="bootstrap, bootstrap4" />

	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;700&family=Source+Serif+Pro:wght@400;700&display=swap" rel="stylesheet">

	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/owl.carousel.min.css">
	<link rel="stylesheet" href="css/owl.theme.default.min.css">
	<link rel="stylesheet" href="css/jquery.fancybox.min.css">
	<link rel="stylesheet" href="fonts/icomoon/style.css">
	<link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">
	<link rel="stylesheet" href="css/daterangepicker.css">
	<link rel="stylesheet" href="css/aos.css">
	<link rel="stylesheet" href="css/style.css">

	<title>Tour Free Bootstrap Template for Travel Agency by Untree.co</title>
</head>
<body>

	<div class="site-mobile-menu site-navbar-target">
		<div class="site-mobile-menu-header">
			<div class="site-mobile-menu-close">
				<span class="icofont-close js-menu-toggle"></span>
			</div>
		</div>
		<div class="site-mobile-menu-body"></div>
	</div>
<jsp:include page="/WEB-INF/jsp/nav.jsp"></jsp:include>
				
			



	<div class="hero">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-7">
					<div class="intro-wrap">
						<h1 class="mb-5"><span class="d-block">KaKaoLogin</span> Test </h1> 
						<div id="passMessage" style="color:white; text-align:left;"></div>
					</div>
					<form id="sign-form">
		                <ul>
		                 <li>
			                    <input type="text" class="form-control" name="userid" id="userid" style="width:65%"
			                    placeholder="아이디를 입력하세요." onkeyup="javascript:onEnterLogin();" value="${kakaoEmail }" required/>
		                    </li><p>
		                     <li>
			                    <input type="text" class="form-control" name="username" id="username" style="width:65%"
			                    placeholder="이름을 입력하세요." onkeyup="javascript:onEnterLogin();" value="${kakaoName }" required/>
		                    </li><p>
			                    <input type="hidden" class="form-control" name="useryn" id="useryn" style="width:65%"
			                    placeholder="성별을 입력하세요." onkeyup="javascript:onEnterLogin();" value="카카오" required/>
		                    <li>
		                        <input type="password" class="form-control" name="userpass1" id="userpass1" onkeyup="passwordCheck();" style="width:65%" onkeyup="javascript:onEnterLogin();" required placeholder="비밀번호를 입력하세요."/>
		                    </li><p>
		                    <li>
		                        <input type="password" class="form-control" name="userpass2" id="userpass2" onkeyup="passwordCheck();" style="width:65%" onkeyup="javascript:onEnterLogin();" required placeholder="비밀번호를 입력하세요."/>
		                    </li><p>
		                  
		                       
		                  
		                    <li>
		                        <button type="button" id="btn_submit" name="btn_submit"  style="width:65%;" class="btn btn-success">로그인</button>
		                    </li>
		                   
		                </ul>
           			</form>
				</div>
				
				
				
				<div class="col-lg-5">
					<div class="slides">
						<img src="images/rest.jpg" alt="Image" class="img-fluid active">
					</div>
				</div>
			</div>
		</div>
	</div>
	


	
	<!-- footer 
-->
	<div class="site-footer">
		<div class="inner first">
			<div class="container">
				<div class="row">
					<div class="col-md-6 col-lg-4">
						<div class="widget">
							<h3 class="heading">Gwangju Donggu</h3>
							<p>광주 동구 식당 리스트</p>
						</div>
					</div>
			
					<div class="col-md-6 col-lg-4">
						<div class="widget">
							<h3 class="heading">Contact</h3>
							<ul class="list-unstyled quick-info links">
								<li class="email">jjh@beftech.co.kr</li>
								<li class="phone">010-9323-1530</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>



		<div class="inner dark">
			<div class="container">
				<div class="row text-center">
					<div class="col-md-8 mb-3 mb-md-0 mx-auto">
						<p>Copyright &copy;<script>document.write(new Date().getFullYear());</script>. All Rights Reserved. &mdash; Designed with love by <a href="https://untree.co" class="link-highlight">Untree.co</a> <!-- License information: https://untree.co/license/ -->Distributed By <a href="https://themewagon.com" target="_blank" >ThemeWagon</a>
						</p>
					</div>
					
				</div>
			</div>
		</div>
	</div>

	<div id="overlayer"></div>
	<div class="loader">
		<div class="spinner-border" role="status">
			<span class="sr-only">Loading...</span>
		</div>
	</div>

	<script src="js/jquery-3.4.1.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.animateNumber.min.js"></script>
	<script src="js/jquery.waypoints.min.js"></script>
	<script src="js/jquery.fancybox.min.js"></script>
	<script src="js/aos.js"></script>
	<script src="js/moment.min.js"></script>
	<script src="js/daterangepicker.js"></script>

	<script src="js/typed.js"></script>
	<script src="js/custom.js"></script>
	
<script>

function passwordCheck() {
	var userpass1 = $("#userpass1").val();
	var userpass2 = $("#userpass2").val();
	if (userpass1 != userpass2) {
		$("#passMessage").html("비밀번호가 일치하지 않습니다.");
	}else {
		$("#passMessage").html("");
	}		
}

$(function() {
	
	$("#btn_submit").click(function(){
		var userid = $.trim($("#userid").val());
		var userpass = $.trim($("#userpass1").val());
		var userpass2 =  $.trim($("#userpass2").val());
		
		var username = $("#username").val();
		
		if(userid == "") {
			alert("아이디를 입력해주세요.");	
			$("#userid").focuse();
			return false;
		}
		
		if(userpass == "") {
			alert("암호를 입력해주세요.");	
			$("#userpass").focuse();
			return false;
		}
		if(userid == "") {
			alert("아이디를 입력해주세요." + userPhone);	
			$("#userid").focuse();
			return false;
		}
		if(userpass == "") {
			alert("암호를 입력해주세요.");	
			$("#userpass1").focuse();
			return false;
		}
		if(userpass != userpass2) {
			alert("비밀번호가 다릅니다.")	
			return false;
		}
		$.ajax({
			/* 전송 전 세팅 */
    		type:"POST",
    		data: "userid="+userid+ "&userpass=" + userpass+ "&username=" + username + "&useryn=" + useryn,
    		url:"kakaoRegister.do", //데이터를 보내는 곳
    		dataType:"text",     // 리턴 타입
    		
    		/* 전송 후 세팅  */
    		success: function(result) {
    			if(result == "ok") {
    				alert(username + "님 회원가입 되었습니다.");
    				location = "main.do";
    			} else {
    				alert("아이디 또는 패스워드를 확인해주세요.");
    			}
    		},
    		error: function() {  // 장애발생
    			alert("오류발생");
    		}
    	});	
	});
	
	
});

</script>

</body>
</html>