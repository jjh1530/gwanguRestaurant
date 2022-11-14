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


    <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.1.4/js/bootstrap-datetimepicker.min.js"></script>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.1.4/css/bootstrap-datetimepicker.min.css">

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
<h5 class="card-header bg-primary text-white">회원가입</h5>
    <div class="panel-body">
     <form id="form1" name="form1" class="form-horizontal" method="post" enctype="multipart/form-data" >
		  <div class="bg-light rounded h-100 p-4">
		   
		  <table class="table table-bordered" style="text-align:center; border: 1px solid #dddddd;" >
      	  <tr>
      	    <td style="width:22%; vertical-align: middle;">아이디</td>
      	    <td><input id="userid" name="userid" class="form-control" type="text" placeholder="아이디" maxlength="20"/></td>
      	  	 <td><button type="button" class="btn btn-primary btn-sm" onclick="registerCheck();">중복확인</button></td>
      	  </tr>
      	  <tr>
      	    <td style="width:22%; vertical-align: middle;">암호</td>
      	    <td colspan="2"><input id="userpass1" name="userpass1" onkeyup="passwordCheck();" class="form-control" type="password" placeholder="비밀번호" maxlength="20"/></td>
      	  </tr>
      	  <tr>
      	    <td style="width:22%; vertical-align: middle;">암호 확인</td>
      	    <td colspan="2"><input id="userpass2" name="userpass2" onkeyup="passwordCheck();" class="form-control" type="password" placeholder="비밀번호 확인" maxlength="20"/></td>
      	  </tr>
      	  <tr>
      	    <td style="width:22%; vertical-align: middle;">이름</td>
      	    <td colspan="2"><input id="username" name="username" class="form-control" type="text" placeholder="이름" maxlength="20"/></td>
      	  </tr>
      	  <tr>
      	    <td style="width:22%; vertical-align: middle;">나이</td>
      	    <td colspan="2"><input id="userage" name="userage" class="form-control" type="text" placeholder="나이" maxlength="20" value="0"/></td>
      	  </tr>
      	  
		  <tr>
      	    <td style="width:22%; vertical-align: middle;">이메일</td>
		  	<td colspan="2">
			<input type="text" id="email_id" name="email_id" class="form_w200" value="" title="이메일 아이디" placeholder="이메일" maxlength="18" /> @ 
			<input type="text" id="email_domain" name="email_domain" class="form_w200" value="" title="이메일 도메인" placeholder="이메일 도메인" maxlength="18"/> 
			<select class="select" title="이메일 도메인 주소 선택" onclick="setEmailDomain(this.value);return false;">
			    <option value="">-선택-</option>
			    <option value="naver.com">naver.com</option>
			    <option value="gmail.com">gmail.com</option>
			    <option value="hanmail.net">hanmail.net</option>
			    <option value="korea.com">korea.com</option>
			    <option value="nate.com">nate.com</option>
			</select>
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
          <p id="checkMessage" class="card-header bg-primary text-white"></p>
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
<script>
$(document).ready(function(){
	if(${!empty msgType}){
		$("#messageType").attr("class","modal-content panel-warning");
		$("#myMessage").modal("show");	
	}
});
function registerCheck() {
	var userid = $("#userid").val();
	
	if(userid == "") {
		alert("아이디를 입력해주세요.");	
		$("#userid").focuse();
		return false;
	} 
	$.ajax({
		url : "/registerCheck.do",
		type : "get",
		data : {"userid" : userid},
		success : function(result) {
			//중복 유무 체크(result = 1 사용할 수 있는 아이디)
			//중복 유무 체크(result = 1 사용할 수 있는 아이디)
			if(result =="ok") {
				$("#checkMessage").html("사용할 수 있는 아이디입니다.");
				$("#checkType").attr("class","modal-content panel-success")
			}else {
				$("#checkMessage").html("사용할 수 없는 아이디입니다.");
				$("#checkType").attr("class","modal-content panel-danger")
			}
			$("#registerModal").modal("show");
		},
		error : function() {alert("error");}
	});
}

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
		
		var email_rule =  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		
		var userid = $.trim($("#userid").val());
		var userpass = $.trim($("#userpass1").val());
		var userpass2 =  $.trim($("#userpass2").val());
		var userage= $("#userage").val();
		var username = $("#username").val();
		
		var email_id = $("#email_id").val();
		var email_domain = $("#email_domain").val();
		var useremail = email_id + "@" + email_domain;
		
		if(userid == "") {
			alert("아이디를 입력해주세요.");	
			$("#userid").focuse();
			return false;
		}
		if(userpass == "") {
			alert("암호를 입력해주세요.");	
			$("#userpass1").focuse();
			return false;
		}
		if (userage == null || userage == "" || userage == 0  ) {
			alert("나이를 입력하세요");
			return false;
		}
		if (userage < 0 ) {
			alert("나이는 1세부터 100세까지 가능합니다.");
			return false;
		}
		if (userage > 100 ) {
			alert("나이는 1세부터 100세까지 가능합니다.");
			return false;
		}
		if(userpass != userpass2) {
			alert("비밀번호가 다릅니다.")	
			return false;
		}
		if(!email_id){
		      alert("이메일을 입력해주세요");
		    $("#email_id").focus();
		    return false;
		  }
		  if(!email_domain){
		      alert("도메인을 입력해주세요");
		    $("#email_domain").focus();
		    return false;
		  }
		  mail = email_id+"@"+email_domain;
		  $("#mail").val(mail);  
		  
		  if(!email_rule.test(mail)){
		      alert("이메일을 형식에 맞게 입력해주세요.");
		    return false;
		  }
	
		$.ajax({
			/* 전송 전 세팅 */
    		type:"POST",
    		data: "userid="+userid+ "&userpass=" + userpass+ "&username=" + username
    				+ "&userage=" + userage + "&useremail=" + useremail,
    		url:"userRegister.do", //데이터를 보내는 곳
    		dataType:"text",     // 리턴 타입
    		
    		/* 전송 후 세팅  */
    		success: function(result) {
    			if(result == "ok") {
    				alert("회원가입 되었습니다.");
    				location = "main.do";
    			} else {
    				alert("중복된 아이디 입니다.");
    			}
    		},
    		error: function() {  // 장애발생
    			alert("나이에 숫자만 입력 또는 중복된 아이디 입니다.");
    		}
    	});	
	});
});

function setEmailDomain(domain){
    $("#email_domain").val(domain);
}


</script>
</html>