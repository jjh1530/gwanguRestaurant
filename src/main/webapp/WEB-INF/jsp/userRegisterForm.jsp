<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<link rel="stylesheet" href="css/bootstrap.min.css"><link rel="stylesheet" href="css/owl.carousel.min.css">

<link rel="stylesheet" href="css/owl.theme.default.min.css">
<link rel="stylesheet" href="css/jquery.fancybox.min.css">
<link rel="stylesheet" href="fonts/icomoon/style.css">
<link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">
<link rel="stylesheet" href="css/daterangepicker.css">
<link rel="stylesheet" href="css/aos.css">
<link rel="stylesheet" href="css/style.css">

<head>
<meta charset="UTF-8">
<title>회원가입</title>
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
<h5 class="card-header bg-primary text-white">공지사항 작성</h5>
    <div class="panel-body">
     <form id="form1" name="form1" class="form-horizontal" method="post" enctype="multipart/form-data" >
		  <div class="bg-light rounded h-100 p-4">
		   
		   <div class="form-floating mb-3">
			    <label for="title">아이디</label>
			      <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력하세요">
		   </div>
		   
		   <div class="form-floating mb-3">
		    <label for="content">비밀번호</label>
		      <textarea  class="form-control" id="content" name="content" placeholder="내용을 입력하세요" rows="10"></textarea>
		    </div>
		    
		    <label class="control-label col-sm-2" for="writer">이름</label>
		    <div class="col-sm-10">
		     <input type="text" class="form-control" id="writer" name="writer">
		    </div>
		    <label class="control-label col-sm-2" for="writer">나이</label>
		    <div class="col-sm-10">
		     <input type="text" class="form-control" id="writer" name="writer">
		    </div>
		    <label class="control-label col-sm-2" for="writer">이메일</label>
		    <div class="col-sm-10">
		     <input type="text" class="form-control" id="writer" name="writer">
		    </div>
		    
		    <div style="text-align:center;">
	   	   <input type="button" value="등록" id ="btn_add" name="btn_add" class='btn btn-primary' onclick="noticeWrite()"/>
	       <input type="button" value="리스트"  onclick="location.href='/notice.do'" class='btn btn-success'/>
   			</div>
   			</div>
    </form>
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
  
</body>


</html>