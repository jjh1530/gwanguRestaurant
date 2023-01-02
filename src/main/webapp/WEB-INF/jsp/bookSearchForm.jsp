<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<link rel="stylesheet" href="css/style2.css">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<div>
<h5 class="card-header bg-primary text-white">BookSearch
</h5>
</div>
 <div class="panel-body">
    <div class="input-group mb-3">
    <input type="text" class="form-control" placeholder="search" id="bookname">
    <div>
    	<button type="button" class=" btn btn-primary" id="search">Go</button>
    </div>
    </div>
    <div class="loadgin-progress" style="display: none;">
		<div class="spinner-border text-secondary"  role="status">
			<span class="sr-only">Loading...</span>
		</div>
    </div>
    <div id="bookList" style="background-color: white; overflow: scroll; height:500px; padding:10px;">
    	
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
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
 <script>
 $(function() {
	 $("#search").click(function(){
		var bookname = $("#bookname").val();
		if (bookname == "")  {
			alert("책 제목을 입력해주세요");
			return false;
		}
		// kakao 책 검색 API
		// URL : "https://dapi.kakao.com/v3/search/book?target=title"
		// HEADER : "Authorization: KakaoAK 990a8f8549c43383d5f7e1dd1572c6a5"
		$.ajax({
  			url : "https://dapi.kakao.com/v3/search/book?target=title",
  			headers : {"Authorization": "KakaoAK 990a8f8549c43383d5f7e1dd1572c6a5"},
  			type : "get",
  			data : {"query" : bookname},
  			dataType : "json",
  			success : bookPrint,
  			error : function(){ alert("error");}	
  		});
		$(document).ajaxStart(function(){$(".loading-progress").show();});
		$(document).ajaxStop(function(){$(".loading-progress").hide();});
	 });
	 //input box에 책 제목이 입력되면 자동 검색 하는 기능
	 // src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"> 추가해줘야 autocomplete사용
	 $("#bookname").autocomplete({
		 source : function() {
			 var bookname = $("#bookname").val();
			 $.ajax({
		  			url : "https://dapi.kakao.com/v3/search/book?target=title",
		  			headers : {"Authorization": "KakaoAK 990a8f8549c43383d5f7e1dd1572c6a5"},
		  			type : "get",
		  			data : {"query" : bookname},
		  			dataType : "json",
		  			success : bookPrint,
		  			error : function(){ alert("error");}	
		  		});
		 },
		 minLength : 1
	 });
 });
 
 function bookPrint2(data) {
	 alert(data);
 }
 
 function bookPrint(data){
  	 var bList="<table class='table table-hover'>";
  	 bList+="<thead>";
  	 bList+="<tr>";
  	 bList+="<th>책이미지</th>";
  	 bList+="<th>책가격</th>";
  	 bList+="</tr>";
  	 bList+="</thead>";
  	 bList+="<tbody>";
  	 $.each(data.documents,function(index, obj){
  		 var image=obj.thumbnail;
  		 var price=obj.price;
  		 var url=obj.url;
  		 bList+="<tr>";
      	 bList+="<td><a href='"+url+"'><img src='"+image+"' width='50px' height='60px'/></a></td>";
      	 bList+="<td>"+price+"</td>";
      	 bList+="</tr>";
  	 }); 
  	 bList+="</tbody>";
  	 bList+="</table>";
  	 $("#bookList").html(bList);
   }
	 
</script>
</body>

</html>