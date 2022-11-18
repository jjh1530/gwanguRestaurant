<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
 <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 
 <script>
 $(document).ready(function() {
	 
	    $("#datepicker").datepicker({

	          showOn: "both", // 버튼과 텍스트 필드 모두 캘린더를 보여준다.
	          changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
	          changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
	          minDate: '-100y', // 현재날짜로부터 100년이전까지 년을 표시한다.
	          nextText: '다음 달', // next 아이콘의 툴팁.
	          prevText: '이전 달', // prev 아이콘의 툴팁.
	          numberOfMonths: [1,1], // 한번에 얼마나 많은 월을 표시할것인가. [2,3] 일 경우, 2(행) x 3(열) = 6개의 월을 표시한다.
	          stepMonths: 3, // next, prev 버튼을 클릭했을때 얼마나 많은 월을 이동하여 표시하는가. 
	          yearRange: 'c-100:c+10', // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가.
	          currentText: '오늘 날짜' , // 오늘 날짜로 이동하는 버튼 패널
	          closeText: '닫기',  // 닫기 버튼 패널
	          dateFormat: "yy-mm-dd", // 텍스트 필드에 입력되는 날짜 형식.
	          showAnim: "slide", //애니메이션을 적용한다.  
	          showMonthAfterYear: true , // 월, 년순의 셀렉트 박스를 년,월 순으로 바꿔준다. 
	          dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], // 요일의 한글 형식.
	          monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] // 월의 한글 형식.

	     });

	});
 $(function() {
		
	$("#btn_submit").click(function(){
	var today = new Date();
	var birth = $.trim($("#datepicker").val());
	
	var userage= today.getFullYear()-birth.substr(0,4) +1;
	
	alert(userage);
	});
 });

	
	
 </script>
</head>
<body>
<!-- 
<div class="container">
 <div class="row justify-content-between align-items-center">
 	<div id="staticMap" style="width:100%;height:400px;"></div>
 <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=794d3dd52200f67afe9b912443ecd8da">
 </script>
  -->

<div class="container">
<h5 class="card-header bg-primary text-white">회원가입</h5>
    <div class="panel-body">
     <form id="form1" name="form1" class="form-horizontal" method="post" enctype="multipart/form-data" >
		  <div class="bg-light rounded h-100 p-4">
		   
		  <table class="table table-bordered" style="text-align:center; border: 1px solid #dddddd;" >
      	  <tr>
      	    <td style="width:22%; vertical-align: middle;">아이디</td>
      	    <td><input id="userid" name="userid" class="form-control" type="text" placeholder="아이디" maxlength="20"/></td>
      	  </tr>
      	  <tr>
      	    <td style="width:22%; vertical-align: middle;">암호</td>
      	    <td colspan="2"><input id="userpass1" name="userpass1"  class="form-control" type="password" placeholder="비밀번호" maxlength="20"/></td>
      	  </tr>
    
      	  <tr>
      	    <td style="width:22%; vertical-align: middle;">이름</td>
      	    <td colspan="2"><input id="username" name="username" class="form-control" type="text" placeholder="이름" maxlength="20"/></td>
      	  </tr>
      	 
      	  <tr>
      	    <td style="width:22%; vertical-align: middle;">나이</td>
      	    <td colspan="2"><input type="text" id="datepicker" name="datepicker" class="col-sm-12 col-md-6 mb-3 mb-lg-0 col-lg-4" placeholder="생년월일" style="width:90%">
    		</td>
      	  </tr>
      	  <tr>
      	    <td colspan="3" style="text-align: right;">
      	       <div id="passMessage" style="color:red; text-align:left;"></div>
      	       <button type="button" id="btn_submit" name="btn_submit"  class="btn btn-primary btn-sm">회원가입</button>
      	    </td>
      	  </tr>
      	</table>
      	</div>
    </form>
    </div>
    </div>
</body>

<script>

var markerPosition  = new kakao.maps.LatLng(35.153, 126.9); 
var marker = {
	    position: markerPosition
	};

var staticMapContainer  = document.getElementById('staticMap'), // 이미지 지도를 표시할 div  
staticMapOption = { 
    center: new kakao.maps.LatLng(35.153, 126.9), // 이미지 지도의 중심좌표
    level: 3, // 이미지 지도의 확대 레벨
    marker: marker // 이미지 지도에 표시할 마커 
};    

//이미지 지도를 생성합니다
var staticMap = new kakao.maps.StaticMap(staticMapContainer, staticMapOption);
</script>
</html>