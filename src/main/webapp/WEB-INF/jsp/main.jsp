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
						<h1 class="mb-5"><span class="d-block">Let's Enjoy Your </span> Taste In Gwangju </h1> 
					</div>
					<c:if test="${userSession==null }">
					<form id="sign-form">
		                <ul>
		                    <li>
			                    <input type="text" class="form-control" name="userid" id="userid" style="width:65%"
			                    placeholder="???????????? ???????????????." onkeyup="javascript:onEnterLogin();" value="${kakaoEmail }" required/>
		                    </li><p>
		                    <li>
		                        <input type="password" class="form-control" name="userpass" id="userpass" style="width:65%" onkeyup="javascript:onEnterLogin();" required placeholder="??????????????? ???????????????."/>
		                    </li><p>
		                    <li>
		                        <button type="button" id="btn_submit" name="btn_submit"  style="width:65%;" class="btn btn-success">?????????</button>
		                    </li>
		                </ul>
           			</form>
           			</c:if>
           			<c:if test="${userSession!=null }">
           			<h1 class="mb-5">Hello ${userSession.userid }</h1>
           			</c:if>
				</div>
				
				
				
				<div class="col-lg-5">
					<div class="slides">
						<img src="images/rest.jpg" alt="Image" class="img-fluid active">
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="untree_co-section" style="background: rgba(26, 55, 77, 0.05);">
		<div class="container">
			<div class="row text-center justify-content-center mb-5">
				<div class="col-lg-7"><h2 class="section-title text-center">????????????</h2></div>
			</div>
			<div class="owl-carousel owl-4-slider">
			
 			 <c:forEach var="notice" items="${notice }" varStatus="Loop">
 			 <c:if test="${notice.noticeimg != null }">
				<div class="item">
					<img src="<c:out value='file_repo/${notice.noticeimg}'/>" alt="Image" style="height:300px; padding:10px;">
					<p><p>
					<button class="btn btn-primary" onclick="location.href='noticeDetail.do?idx=${notice.idx}'">????????????</button>
					</p>
				</div>
			</c:if>
			</c:forEach>
			
			</div>

		</div>
	</div>


	<div class="untree_co-section">
		<div class="container">
			<div class="row justify-content-between align-items-center">
				
				<div class="col-lg-6">
					<figure class="img-play-video">
						<a id="play-video" class="video-play-button" href="https://www.youtube.com/watch?v=mwtbEGNABWU" data-fancybox>
							<span></span>
						</a>
						<img src="images/hero-slider-2.jpg" alt="Image" class="img-fluid rounded-20">
					</figure>
				</div>

				<div class="col-lg-5">
					<h2 class="section-title text-left mb-4">Take a look at Tour Video</h2>
					<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>

					<p class="mb-4">A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</p>

					<ul class="list-unstyled two-col clearfix">
						<li>Outdoor recreation activities</li>
						<li>Airlines</li>
						<li>Car Rentals</li>
						<li>Cruise Lines</li>
						<li>Hotels</li>
						<li>Railways</li>
						<li>Travel Insurance</li>
						<li>Package Tours</li>
						<li>Insurance</li>
						<li>Guide Books</li>
					</ul>

					<p><a href="#" class="btn btn-primary">Get Started</a></p>

					
				</div>
			</div>
		</div>
	</div>

	
	<!-- footer -->
	<div class="py-5 cta-section">
		<div class="container">
			<div class="row text-center">
				<div class="col-md-12">
					<h2 class="mb-2 text-white">Lets you Explore the Best. Contact Us Now</h2>
					<p class="mb-4 lead text-white text-white-opacity">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Excepturi, fugit?</p>
					<p class="mb-0"><a href="booking.html" class="btn btn-outline-white text-white btn-md font-weight-bold">Get in touch</a></p>
				</div>
			</div>
		</div>
	</div>

	<div class="site-footer">
		<div class="inner first">
			<div class="container">
				<div class="row">
					<div class="col-md-6 col-lg-4">
						<div class="widget">
							<h3 class="heading">Gwangju Donggu</h3>
							<p>?????? ?????? ?????? ?????????</p>
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
$(function() {
	
	$("#btn_submit").click(function(){
		var userid = $.trim($("#userid").val());
		var userpass = $.trim($("#userpass").val());
		
		if(userid == "") {
			alert("???????????? ??????????????????.");	
			$("#userid").focuse();
			return false;
		}
		
		if(userpass == "") {
			alert("????????? ??????????????????.");	
			$("#userpass").focuse();
			return false;
		}
		
		$.ajax({
			/* ?????? ??? ?????? */
    		type:"POST",
    		data: "userid="+userid+ "&userpass=" + userpass,
    		url:"userLogin.do", //???????????? ????????? ???
    		dataType:"text",     // ?????? ??????
    		
    		/* ?????? ??? ??????  */
    		success: function(result) {
    			if(result == "ok") {
    				alert(userid + "??? ????????? ???????????????.");
    				location = "main.do";
    			} 
    			if(result !="ok"){
    				alert("????????? ?????? ??????????????? ??????????????????.");
    			}
    		},
    		error: function() {  // ????????????
    			alert("????????????");
    		}
    	});	
	});
	
	
});

</script>

</body>
</html>