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
      	    <td colspan="2"><input type="text" id="datepicker" name="datepicker" class="col-sm-12 col-md-6 mb-3 mb-lg-0 col-lg-4" placeholder="생년월일" style="width:90%">
    		</td>
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
		   <tr class="mobileNo">
			<th>
				<label for="phone">휴대폰 번호</label>
			</th>
			<td>
				번호입력 <input type="button" id="send" value="전송" /> <!-- 문자보내는 전송버튼 -->
				<input type="text" id="userPhone" name="userPhone"class="form-control" style="width:80%"/>   <!-- 인증번호 받을사람 휴대폰 번호 -->
			    
			</td>
			<td>
				 인증번호 :    <input type="text" id="userNum" class="form-control">   <!-- 인증번호 입력창 -->
			  <input type="button" id="enterBtn" value="확인" >   <!-- 인증번호와 내가 입력창에 입력한 인증번호 비교하는 창 -->
			  
			  
			  <input type="hidden" name="text" id="text">   <!-- 인증번호를 히든으로 저장해서 보낸다 -->
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
          <p id="checkMessage" class="card-header bg-defualt"></p>
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
  
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
				$("#checkType").attr("class","bg-success")
			}else {
				$("#checkMessage").html("사용할 수 없는 아이디입니다.");
				$("#checkType").attr("class","bg-warning")
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
		
		var username = $("#username").val();
		
		var email_id = $("#email_id").val();
		var email_domain = $("#email_domain").val();
		var useremail = email_id + "@" + email_domain;
		
		var today = new Date();
		var birth = $.trim($("#datepicker").val());
		
		var userage= today.getFullYear()-birth.substr(0,4) +1;
		
		var userPhone =$("#userPhone").val();
		var sysNum = $("#text").val(); 
		var userNum = $("#userNum").val();
		if(userid == "") {
			alert("아이디를 입력해주세요." + userage);	
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
		  if(userNum == "" || userNum == null) {
	 			alert("인증번호를 입력해주세요.")	
	 			return false;
	 		}
         if(userNum.trim() != sysNum.trim()){
             alert("인증번호를 확인해주세요");
             return false;
          }
        
	
		$.ajax({
			/* 전송 전 세팅 */
    		type:"POST",
    		data: "userid="+userid+ "&userpass=" + userpass+ "&username=" + username
    				+ "&userage=" + userage + "&useremail=" + useremail + "&userPhone=" + userPhone ,
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
    			alert("중복된 아이디 입니다.");
    		}
    	});	
	});
});

function setEmailDomain(domain){
    $("#email_domain").val(domain);
}

//DatePicker
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


var count = 0; /* 문자 중복을 막기 위한 인증번호 */

$(document).ready(function() {
      
      var number = Math.floor(Math.random() * 100000) + 100000;
         if(number>100000){
            number = number - 10000;
         }

         $("#text").val(number);      /* 난수로 생성된 인증번호를 hidden name : text 에 숨긴다 */
      
      var userPhone = $("#userPhone").val();
      
      if(userPhone == "" || userPhone == null){
         alert("빈칸이나 공백을 채워주세요");
      }
      
      else {
      var con_test = confirm("해당번호로 인증문자를 발송하시겠습니까?");   /* 문자를 보낼껀지 물어본다 */
         
         if(con_test == true){
              
            if(count < 3){      /* 추후 데이터베이스에 컬럼 값을 확인하여 count 값을 비교 할 예정 */
                
              $.ajax({
                  url:"sendSms.do",
                  type:"post",
                  data:{userPhone: $("#userPhone").val(),
                       text: $("#text").val()
                       },
                success:function(){
                  alert("해당 휴대폰으로 인증번호를 발송했습니다");
                  count++;
                  
                  alert(count);
                  }
                 /*  error(){
                     
                  } */
                  
               });
            } else {
               alert("휴대폰 인증 그만하세요")
            }
         
         }
            else if(con_test == false){
               
            }
        }   
   })
   $("#enterBtn").click(function() {   /* 내가 작성한 번호와 인증번호를 비교한다 */
      var userNum = $("#userNum").val();
      
      var sysNum = $("#text").val();         
      
      if(userNum == null || userNum == ""){
         alert("휴대폰으로 발송된 인증번호를 입력해주세요");
      }     
     
   });
 });
</script>
</body>


</html>