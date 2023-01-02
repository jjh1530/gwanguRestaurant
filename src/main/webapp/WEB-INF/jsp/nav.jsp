<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Insert title here</title>
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
</head>
<body>
	<nav class="site-nav" style="background: #6998AB;">
		<div class="container">
			<div class="site-navigation">
				<a href="/main.do" class="logo m-0">Gwangju <span class="text-primary">.</span></a>

				<ul class="js-clone-nav d-none d-lg-inline-block text-left site-menu float-right">
					<li class="active"><a href="/main.do">Home</a></li>
					<li><a href="/list.do">식당 리스트</a></li>
					<li><a href="/notice.do">공지사항</a></li>
					<li><a href="contact.html">Contact Us</a></li>
					<li><a href="/bookSearchForm.do">책검색</a></li>
					<li class="has-children">
						<a href="#">회원관리</a>
						<ul class="dropdown">
							<c:if test="${userSession == null }">
							<li><a href="/userRegisterForm.do">회원가입</a></li>
							
							</c:if>
							<c:if test="${kakaoEmail == null}">
								<li><a href="/kakaoLoginForm.do">카카오 로그인</a></li>
							</c:if>
							<c:if test="${userSession != null }">
							<li><a href="/userLogout.do">로그아웃</a></li>
							<li><a href="/userDetailForm.do">회원정보수정</a></li>
							
							</c:if>
						</ul>
					</li>
				</ul>

				<a href="#" class="burger ml-auto float-right site-menu-toggle js-menu-toggle d-inline-block d-lg-none light" data-toggle="collapse" data-target="#main-navbar">
					<span></span>
				</a>

			</div>
		</div>
	</nav>
</body>
</html>