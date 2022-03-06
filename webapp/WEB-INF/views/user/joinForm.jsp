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
			<label for="user_id">아이디</label><input id="user_id" type="text" name="userId"><button type="button" id="idCheck">중복체크</button><br>
			<label></label><span></span><br>
			<label for="user_password">비밀번호</label><input id="user_password" type="password" name="userPassword"><br>
			<label></label><span></span><br>
			<label for="user_password2">비밀번호확인</label><input id="user_password2" type="password" name="userPassword2"><br>
			<label></label><span id="passEQpass"></span><br>
			<label for="user_name">이름</label><input id="user_name" type="text" name="userName"><br>
			<label></label><span></span><br>
			<button type="submit" id="btnJoin">회원가입</button>
		</form>
	</fieldset>

</body>

<script>
/* 변수 */
var idCheck = false;
/* // 변수 */

/* 아이디 유효성 검사 */
var inputID = $('#user_id');

inputID.on('keyup', function() {
});
/* // 아이디 유효성 검사 */

/* ID 중복체크 */
$('#idCheck').on('click', function(){
	var id = $('#user_id').val();

	$.ajax({
		url: '${pageContext.request.contextPath}/main/idCheck',
		type: 'post',
		data: { id : id },
		success: function(DBid){
			if (DBid === 1) {
				idCheck = false;
				alert('중복된 ID 입니다. 다시 입력해주세요.');
				$('#user_id').val('');
			} else if( id === '' ) {
				idCheck = false;
				alert('ID를 입력해 주세요');
			} else {
				idCheck = true;
				alert('사용 가능한 ID 입니다. 회원가입을 진행해주세요');
			}
		},
		error: function(XHR, status, error) {
			console.log(status + ' : ' + error);
		}
	});
});
/* // ID 중복체크 */

/* ID 중복체크 안했을때, 사용중인 아이디 일때 회원가입 form preventDefault() */
$('#btnJoin').on('click', function() {
	if (idCheck === false) {
		event.preventDefault();
	} else {
		alert('회원가입 성공!');
	}
});
/* // ID 중복체크 안했을때, 사용중인 아이디 일때 회원가입 form preventDefault() */

/* 비밀번호 확인 */
var pass1 = $('#user_password');
var pass2 = $('#user_password2');

pass2.on('keyup', function() {
	if (pass1.val() !== pass2.val()) {
		$('#passEQpass').empty();
		$('#passEQpass').css({'color':'#f00', 'font-weight':'bold'});
		$('#passEQpass').text('일치하지 않습니다');
	} else {
		$('#passEQpass').empty();
		$('#passEQpass').css({'color':'#00f', 'font-weight':'bold'});
		$('#passEQpass').text('일치합니다');
	}
});
/* // 비밀번호 확인 */
</script>

</html>