<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>

<!-- CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/common.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/joinForm.css"/>
<!-- // CSS -->

<!-- jQuery -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/jQuery/jquery-1.12.4.js"></script>
<!-- // jQuery -->

<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>

	<!-- HEADER -->
	<c:import url="/WEB-INF/views/includes/header.jsp" />
	<!-- // HEADER -->
	
	<!-- NAVIGATION -->
	<c:import url="/WEB-INF/views/includes/navigation.jsp" />
	<!-- // NAVIGATION -->
	
	<fieldset id="joinForm">
		<legend>회원가입</legend>
		<form action="${pageContext.request.contextPath}/main/joinUser" method="post">
			<label for="user_id">아이디</label><input id="user_id" type="text" name="userId" placeholder="영문대소문자, 숫자, 언더바(_) 4자리 이상"><button type="button" id="idCheck">중복체크</button><br>
			<label></label><span id="idValidTxt">영문대소문자, 숫자, -, _ 포함 4자리이상 20자리 이하로 입력해주세요</span><br>
			<label for="user_password">비밀번호</label><input id="user_password" type="password" name="userPassword" placeholder="비밀번호를 입력해주세요"><br>
			<label></label><span id="pwdValidTxt"></span><br>
			<label for="user_password2">비밀번호확인</label><input id="user_password2" type="password" name="userPassword2" placeholder="비밀번호를 입력해주세요"><br>
			<label></label><span id="passEQpass"></span><br>
			<label for="user_name">이름</label><input id="user_name" type="text" name="userName" placeholder="이름을 입력해주세요"><br>
			<label></label><span></span><br>
			<!-- nickname 추가 DBtable, VO -->
			<button type="submit" id="btnJoin">회원가입</button>
		</form>
	</fieldset>

</body>

<script>

/* 아이디 유효성 검사 */
var inputID = $('#user_id');
var IDpattern = /^[a-zA-Z0-9_-][a-zA-Z0-9_-]{3,20}$/;

inputID.on('keyup', function() {
	IDpattern.test(inputID.val());
	console.log(IDpattern.test(inputID.val()));
	
	if (IDpattern.test(inputID.val()) === false) {
		$('#idValidTxt').text('영문대소문자, 숫자, -, _ 포함 4자리이상 20자리 이하로 입력해주세요').css({'color':'#f00', 'font-weight':'bold'});
		
		if (inputID.val().length > 0 && inputID.val().length < 4) {
			$('#idValidTxt').text('4자리이상 입력해주세요').css({'color':'#f00', 'font-weight':'bold'});
		} else if (inputID.val().length === 0) {
			$('#idValidTxt').text('영문대소문자, 숫자, -, _ 포함 4자리이상 20자리 이하로 입력해주세요').css({'color':'#fff', 'font-weight':'normal'});
		} else if (inputID.val().length > 20) {
			$('#idValidTxt').text('20자리까지 입력 가능합니다.').css({'color':'#f00', 'font-weight':'bold'});
		}
	} else {
		$('#idValidTxt').text('ID 중복체크를 해주세요').css({'color':'#00f', 'font-weight':'bold'});
	}
});
/* // 아이디 유효성 검사 */

/* ID 중복체크 */
var idCheck = false;

$('#idCheck').on('click', function(){
	var id = $('#user_id').val();

	$.ajax({
		url: '${pageContext.request.contextPath}/main/idCheck',
		type: 'post',
		data: { id : id },
		success: function(DBid){
			if (IDpattern.test(inputID.val()) == false) {
				idCheck = false;
				$('#idValidTxt').text('영문대소문자, 숫자, -, _ 포함 4자리이상 20자리 이하로 입력해주세요').css({'color':'#f00', 'font-weight':'bold'});
				alert('ID형식이 올바르지 않습니다');
				inputID.focus();
			} else {
				if (DBid === 1) {
					idCheck = false;
					alert('중복된 ID 입니다. 다시 입력해주세요.');
					$('#idValidTxt').text('영문대소문자, 숫자, -, _ 포함 4자리이상 20자리 이하로 입력해주세요').css({'color':'#fff', 'font-weight':'normal'});
				} else if( id === '' ) {
					idCheck = false;
					alert('ID를 입력해 주세요');
					inputID.focus();
				} else {
					$('#idValidTxt').text('ID 중복체크 완료!').css({'color':'#00f', 'font-weight':'bold'});
					idCheck = true;
					alert('사용 가능한 ID 입니다. 회원가입을 진행해주세요');
					inputPWD.focus();
				}
			}
		},
		error: function(XHR, status, error) {
			console.log(status + ' : ' + error);
		}
	});
});
	/* ID 중복체크 안했을때, 사용중인 아이디 일때 회원가입 form preventDefault() */
$('#btnJoin').on('click', function() {
	if (idCheck === false) {
		event.preventDefault();
	} else {
		alert('회원가입 성공!');
	}
});
	/* // ID 중복체크 안했을때, 사용중인 아이디 일때 회원가입 form preventDefault() */
/* // ID 중복체크 */

/* 비밀번호 유효성 검사 */
var inputPWD = $('#user_password');
var PWDpattern = /^[A-Z][a-zA-Z0-9_~!@#$%^&*()=+,.<>?/}{-]{7,25}$/;

inputPWD.on('keyup', function() {
	PWDpattern.test(inputPWD.val());
	console.log(PWDpattern.test(inputPWD.val()));
	
	if (PWDpattern.test(inputPWD.val()) === false) {
		$('#pwdValidTxt').text('false');
	} else {
		$('#pwdValidTxt').text('true');
	}
});

	/* 비밀번호 확인 */
var inputPWD2 = $('#user_password2');

inputPWD2.on('keyup', function() {
	if (inputPWD.val() !== inputPWD2.val()) {
		$('#passEQpass').empty();
		$('#passEQpass').text('일치하지 않습니다').css({'color':'#f00', 'font-weight':'bold'});
	} else {
		$('#passEQpass').empty();
		$('#passEQpass').text('일치합니다').css({'color':'#00f', 'font-weight':'bold'});
	}
});
	/* // 비밀번호 확인 */

/* // 비밀번호 유효성 검사 */

</script>

</html>