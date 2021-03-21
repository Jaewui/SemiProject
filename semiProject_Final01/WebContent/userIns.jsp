<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">

<title>KH DentalCare</title>

<!-- bootstrap -->
<link rel="stylesheet" href="css/bootstrap.css">

<!-- Icon -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

<!-- AJax -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	// ajax형식으로 중복 확인하는 방법.
	// 1. javascript ajax
	// 2. jQuery ajax
	$(function(){	// onload() 가 기본 원리.
		$('#usersDataDup').on('click', function(){
			var userStr = $('#userId').val();	// ~.val() : 값을 구하는 함수
			if(userStr == ""){
				alert('id를 입력하세요.');
			}else{
				$.ajax({
					url : '/semiProject_Final/usersData.do',
					data : { user : userStr },
					dataType : 'json',
					success: function(data){
						if(data.userDup == 'dup'){
							alert('아이디 중복');
						}else{
							alert('사용가능 아이디');
						}
					},
					error: function(request, status, error){
						alert("code : " + request.status + "\n"
								+ "message : " + request.responseText + "\n"
								+ "error : " + error);
					}
				});
			}
		});
	});
</script>
<style>
	.collapse ul li{
		width: 170px;
	}
	h4{
		color: white;
	}
	section{
		background-image: url('image/background.png');
		width: 1920px;
	}
	section div{
		text-align: left;
		margin-left: 38%;
		margin-right: 38%;
	}
	section div form{
		background-color: white;
		padding: 60px;
		border: 3px groove dodgerblue;
		border-radius: 8px;
	}
	section div form p{
		margin-left: 20px;
	}
	section div form label{
		margin-left: 20px;
		margin-bottom: 3px;
		color: dodgerblue;
	}
	section div form p input{
		width: 240px;
	}
	footer{
		width: 1920px;
		height: 100px;
		background-color: #5AAEFF;
		text-align: center;
		color: white;
	}
</style>
</head>
<body>
	<!-- logo -->
	<div style="text-align: center;">
		<a href="main.jsp"><img src="image/logo2.png"
			style="width: 270px; height: 90px; padding: 10px;"></a>
	</div>

	<!-- DropDown nav -->
	<nav class="navbar navbar-default" style="border: hidden">
		<div class="navbar-header" style="background-color: dodgerblue;">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
			</button>
		</div>

		<!-- nav -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1"
			style="background-color: dodgerblue; width: 1920px; text-align: center; padding-left: 200px; padding-right: 200px;">
			<ul class="nav navbar-nav">
				<li><a href="dentalInf.jsp"><h4><span class="fas fa-book-open">&nbsp;병원소개</h4></a></li>
				<li><a href="dentalItems.jsp"><h4><span class="fas fa-book-medical">&nbsp;전문
						진료과목</h4></a></li>
				<li><a href="dentalTool.jsp"><h4><span class="fas fa-microscope">&nbsp;장비소개</h4></a></li>
				<li><a href="bookCheckCon.do"><h4><h4><span class="fas fa-calendar-alt">&nbsp;온라인
						예약</h4></a></li>
				<li><a href="boardListCon.do"><h4><span class="fas fa-comments">&nbsp;Q&A</h4></a></li>
				<li><a href="dentalWay.jsp"><h4><span class="fas fa-map-marked-alt">&nbsp;오시는
						길</h4></a></li>
			</ul>
			<!-- 
			해당 페이지 작동 시 색상 변경
			<li style="width: 120px; text-align: center; background-color: #489CFF;"><a href="bbs.jsp" style="color: gray;">전문
						진료과목</a></li> -->
			<ul class="nav navbar-nav navbar-right">
				<li><a href="login.jsp"><h4><span class="fas fa-user">&nbsp;로그인</h4></a></li>
				<li style="background-color: #489CFF;"><a href="userIns.jsp" style="color: gray;"><h4><span class="fas fa-id-badge">&nbsp;회원가입</span></h4></a></li>
			</ul>
		</div>
	</nav>

	<!-- section -->
	<section>
		<br>
		<div>
			<form name="userIns" action="/semiProject_Final/userIns.do" method="post" onsubmit="return check()">
				<h3><span class="fas fa-id-badge" style="color: dodgerblue;">&nbsp; 회원가입</span></h3><hr><br>
				<label>
					아이디
					<input type="button" class="btn-sm" style="margin-left: 110px;" value="Id 중복검사" id="usersDataDup">
				</label>
				<p><input type="text" name="userId" id="userId" style="margin-bottom: 3px;"><br>
				</p>
				<label>비밀번호</label>
				<p><input type="password" name="userPw" id="userPw" required></p>
				<label>이름</label>
				<p><input type="text" name="userName" required></p>
				<label>생년월일</label>
				<p><input type="date" name="userBirth" id="userBirth" required></p>
				<label>성별</label>
				<input type="radio" name="userGender" value="남" checked>남자
				<input type="radio" name="userGender" value="여" style="margin-bottom: 10px;">여자<br>
				<label>전화번호</label>
				<p><input type="text" name="userPhone" id="userPhone" placeholder=" - 를 빼고 입력하세요" required></p>
				<label>주소</label>
				<p><input type="text" name="userAddr"></p>
				<label>이메일</label>
				<p><input type="email" name="userEmail" id="userEmail"></p>
				<label style="float: right;">
					<input type="submit" class="btn-sm" value="회원 가입">
				</label>
			</form>
		</div>
		<script>
			function check(){
				id = document.getElementById("userId").value;
				pw = document.getElementById("userPw").value;
				phone = document.getElementById("userPhone").value;
				
				regId = /[a-z|0-9]{5,10}/;
				regPw = /[a-zA-Z|0-9]{8,20}/;
				regPhone = /[0-9]{8,11}/;
				if(regId.test(id)){
				}else{
					alert('아이디는 소문자, 숫자로 5글자 이상, 10글자 이하만 사용 가능합니다.');
					return false;
				}
				if(regPw.test(pw)){
				}else{
					alert('비밀번호는 영문자, 숫자로 8글자 이상, 20글자 이하만 사용 가능합니다.');
					return false;
				}
				if(regPhone.test(phone)){
				}else{
					alert('전화번호를 확인해주세요.');
					return false;
				}
			}
		</script>
		<br>
	</section>

	<!-- footer -->
	<footer>
		<br>KH Dental Clinic<br>
		대표 : 김재윤<br>
		사업자등록번호 : xxx-xx-xxxxx&nbsp;&nbsp;&nbsp;주소 : 서울시 종로구 익선동 123-12&nbsp;&nbsp;&nbsp;병원 전화 : 02-123-4567
	</footer>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>