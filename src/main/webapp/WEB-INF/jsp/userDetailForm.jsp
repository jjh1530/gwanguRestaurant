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

<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


<head>
<meta charset="UTF-8">
<title>회워정보수정</title>
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
  <span><button class="card-header bg-primary text-white" id="userDetail" onclick="userDetail();">회원정보</button>
  		<button class="card-header bg-primary text-white" id="imageUpdate" onclick="imageUpdate();">사진등록</button>
  		<button class="card-header bg-primary text-white" id="passUpdate" onclick="passUpdate();">비밀번호 변경</button>
  </span>
  
  <div class="panel panel-default">
    <div class="card-header bg-primary text-white">회원정보변경</div>
    <div class="panel-body" id="view"></div>
    <div class="panel-body" id="image">
    	 <form action="/imageUpload.do" class="form-horizontal" method="post" enctype="multipart/form-data">
    	 <div class="bg-light rounded h-100 p-4">
    	 <input type="hidden" name="userid" value="${userSession.userid }"/>
    	 <input type="hidden" name="userpass" value="${userSession.userpass}"/>
      	<table class="table table-bordered" style="text-align:center; border: 1px solid #dddddd;" >
      
      	  <tr>
      	    <td style="width:22%; vertical-align: middle;">아이디</td>
      	    <td colspan="2">${userSession.userid}</td>
      	  </tr>
 <!--     	  listHtml+="<div class='form-group'>";
		listHtml+="<label class='control-label col-sm-2' >이름</label>";
		listHtml+="<div class='col-sm-10'>";
		listHtml+=" <input type='text' class='form-control' id='username' name='username'readonly='readonly' value='"+username+"''>";
		listHtml+="</div>";
		listHtml+="</div>"; --> 
      	  <tr>
      	    <td style="width:15%; vertical-align: middle;">사진업로드</td>
      	    <td colspan="2">
      	    	  이미지를 업로드하세요.<input type="file" id="uploadFile" name="uploadFile"/>
      	    </td>
      	  </tr>
      	  <tr>
      	    <td colspan="2" style="text-align: left;">
      	    	<input type="submit" value="등록" class="btn btn-primary btn-sm pull-right"/>
      	    </td>
      	  </tr>
      	</table>
      	</div>
      </form>
    </div>
    
    <div class="panel-body" id="passUpdateCheck">
    	<div class="bg-light rounded h-100 p-4">
    	<form id="passfrm" name="passfrm"  action="userPassUpdate.do" method="post">
        <input type="hidden" name="userid" id="userid" value="${userSession.userid }"/>
      	<table class="table table-bordered" style="text-align:center; border: 1px solid #dddddd;" >
      	  <tr>
      	    <td style="width:15%; vertical-align: middle;">아이디</td>
      	    <td>${userSession.userid }</td>
      	  </tr>
      	  <tr>
      	    <td style="width:15%; vertical-align: middle;">비밀번호</td>
      	    <td colspan="2"><input id="userpass" name="userpass" onkeyup="passwordCheck();" class="form-control" type="password" placeholder="비밀번호" maxlength="20"/></td>
      	  </tr>
      	  <tr>
      	    <td style="width:15%; vertical-align: middle;">비밀번호 확인</td>
      	    <td colspan="2"><input id="userpass2" name="userpass2" onkeyup="passwordCheck();" class="form-control" type="password" placeholder="비밀번호 확인" maxlength="20"/></td>
      	  </tr>
     
      	  <tr>
      	    <td colspan="3" style="text-align: right;">
      	    	<div id="passMessage" style="color:red; text-align:left;"></div>
      	    	<input type="button" value="수정" data-toggle="modal" data-target="#updateModal" class='btn btn-primary  btn-sm pull-right'/>
      	    </td>
      	  </tr>
      	</table>
      	  </form>
      	</div>
    
    </div>
    
    <div class="panel-body" id="jspTagView">
    
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
 
 
	 <!-- Modal -->
  <div class="modal fade" id="registerModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div id="checkType" class="modal-content">
        <div class="modal-header panel-heading">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
          <p id="checkMessage" class="card-header bg-defualt text-white"></p>
        </div>
     
      </div>
    </div>
  </div> 
  
  <!-- 업데이트 Modal -->
<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="deleteModalLabel">비밀번호 변경</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
            비밀번호를 정말 변경하시겠습니까?
      </div>
      <div class="modal-footer">
      	<button type="button" id="btn_submit" class="btn btn-primary">변경</button>
       	<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
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
	<script src="js/typed.js"></script>

	<script src="js/custom.js"></script>
  

</body>
<script type="text/javascript">
	
$(document).ready(function(){
	userDetail();
});

function userDetail() {
	$("#view").css("display","block"); 
	$("#image").css("display","none"); 
	$("#passUpdateCheck").css("display","none");
	var userid = '<c:out value="${userSession.userid}"/>';
	var username = '<c:out value="${userSession.username}"/>';
	var useremail = '<c:out value="${userSession.useremail}"/>';
	var listHtml="<div class='bg-light rounded h-100 p-4'>"
		listHtml+="<div class='form-group'>";
		listHtml+="<label class='control-label col-sm-2' >아이디</label>";
		listHtml+="<div class='col-sm-10'>";
		listHtml+=" <input type='text' class='form-control' id='userid' readonly='readonly' name='userid' value='"+userid+"''>";
		listHtml+="</div>";
		listHtml+="</div>";
		listHtml+="<div class='form-group'>";
		listHtml+="<label class='control-label col-sm-2' >이름</label>";
		listHtml+="<div class='col-sm-10'>";
		listHtml+=" <input type='text' class='form-control' id='username' name='username'readonly='readonly' value='"+username+"''>";
		listHtml+="</div>";
		listHtml+="</div>";
		listHtml+="<div class='form-group'>";
		listHtml+="<label class='control-label col-sm-2' >유저메일</label>";
		listHtml+="<div class='col-sm-10'>";
		listHtml+="<input type='text' class='form-control' id='useremail' name='useremail' readonly='readonly' value='"+useremail+"''>";
		listHtml+="</div>";
		listHtml+="</div>";
		listHtml+="<c:if test="${userSession.filename ne null }">";
		listHtml+="<label class='control-label col-sm-2' >유저 사진</label>";
		listHtml+="<div class='col-sm-10'>";
		listHtml+="<div class='owl-item'>";
		listHtml+="<img src='<c:out value='file_repo/${userSession.filename}'/>' style='max-width: 100%;width: auto;max-height: 500px; text-align:center;'>";
		listHtml+="</div>";
		listHtml+="</div>";
		listHtml+="</div>";
		listHtml+="</c:if>";
		$("#view").html(listHtml);
}

function imageUpdate() {
	$("#view").css("display","none"); 
	$("#image").css("display","block");
	$("#passUpdateCheck").css("display","none");
}

function passUpdate() {
	$("#view").css("display","none"); 
	$("#image").css("display","none");
	$("#passUpdateCheck").css("display","block");
}


function passwordCheck() {
	var userpass = $("#userpass").val();
	var userpass2 = $("#userpass2").val();
	if (userpass != userpass2) {
		$("#passMessage").html("비밀번호가 일치하지 않습니다.");
	}else {
		$("#passMessage").html("");
	}		
}
$(function() {
	
	$("#btn_submit").click(function(){
		
		var userpass = $.trim($("#userpass").val());
		var userpass2 =  $.trim($("#userpass2").val());
		
		if(userpass == "") {
			alert("암호를 입력해주세요.");	
			$("#userpass").focuse();
			return false;
		}
	
		if(userpass != userpass2) {
			alert("비밀번호가 다릅니다.")	
			return false;
		}

		  document.passfrm.action="<c:url value='/userPassUpdate.do'/>"; 
		  document.passfrm.submit();
	});
});

$(document).ready(function(){
	if(${!empty msgType}){
		$("#messageType").attr("class","modal-content panel-success");
		$("#myMessage").modal("show");	
	}
});
</script>

</html>