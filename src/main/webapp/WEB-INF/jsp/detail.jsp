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
<h5 class="card-header bg-primary text-white">식당 정보</h5>
 <div class="panel-body">
     <div class="bg-light rounded h-100 p-4">
         <h2 class="mb-4">${vo.resturantName }</h2>
         <div class="form-floating mb-3">
         	<label for="floatingPassword">도로명주소</label>
             <input type="text" class="form-control" id="loadaddress"  readonly="readonly"
                 value="${vo.loadaddress}">
         </div>
  		 <div class="form-floating mb-3">
  		 	<label for="floatingPassword">지번주소</label>
             <input type="text" class="form-control" id="address"  readonly="readonly"
                 value="${vo.address}">
         </div>
         <div class="form-floating mb-3">
         	<label for="floatingPassword">전화번호</label>
             <input type="text" class="form-control" id="restPhone"  readonly="readonly"
                 value="${vo.restPhone}">
         </div>
         <div class="form-floating mb-3">
         	<label for="floatingPassword">업종</label>
             <input type="text" class="form-control" id="restSector"  readonly="readonly"
                 value="${vo.restSector}">
         </div>
         <div class="form-floating mb-3">
         	<label for="floatingPassword">영업 허가명</label>
             <input type="text" class="form-control" id="restSectorName"  readonly="readonly"
                 value="${vo.restSectorName}">
         </div>
         <div class="form-floating">
         	<label for="floatingTextarea">Comments</label>
             <textarea class="form-control"
                 id="floatingTextarea" style="height: 150px;" readonly="readonly"> ${vo.restContent}</textarea>
         </div>
         <input type="hidden" id="lat" name="lat" value="${vo.lat }"/>
         <input type="hidden" id="lan" name="lan"value="${vo.lan }"/>
     </div>
     
     
 </div>
 </div>
 </div>
 <div class="untree_co-section">
 <div class="container">
 <div class="row justify-content-between align-items-center">
 	<div id="staticMap" style="width:100%;height:400px;"></div>
 <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=794d3dd52200f67afe9b912443ecd8da">
 </script>
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
 
  <script>
	var lat = $.trim($("#lat").val());
	var lan = $.trim($("#lan").val());
	var markerPosition  = new kakao.maps.LatLng(lat, lan); 
	var marker = {
		    position: markerPosition
		};
	
	var staticMapContainer  = document.getElementById('staticMap'), // 이미지 지도를 표시할 div  
    staticMapOption = { 
        center: new kakao.maps.LatLng(lat, lan), // 이미지 지도의 중심좌표
        level: 3, // 이미지 지도의 확대 레벨
        marker: marker // 이미지 지도에 표시할 마커 
    };    

// 이미지 지도를 생성합니다
var staticMap = new kakao.maps.StaticMap(staticMapContainer, staticMapOption);
	</script>
</body>
</html>