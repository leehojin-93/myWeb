<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<!-- CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/common.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/loginForm.css" />
<!-- // CSS -->

<!-- jQuery -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/jQuery/jquery-1.12.4.js"></script>
<!-- // jQuery -->

<meta charset="UTF-8">
<title>로그인</title>

</head>
<body>

	<!-- HEADER -->
	<c:import url="/WEB-INF/views/includes/header.jsp" />
	<!-- // HEADER -->
	
	<!-- NAVIGATION -->
	<c:import url="/WEB-INF/views/includes/navigation.jsp" />
	<!-- // NAVIGATION -->
	
	<fieldset>
		<legend>로그인</legend>
		<form action="${pageContext.request.contextPath}/main/login" method="post">
			<label for="userId">아이디</label> <input id="userId" type="text" name="userId"><br><br>
			<label for="userPassword">비밀번호</label> <input id="userPassword" type="password" name="userPassword"><br><br>
			<button type="submit" id="btnLogin">로그인</button>
		</form>
	</fieldset>

</body>

<script>

$('#btnLogin').on('click', function(){
	event.preventDefault();
	
	var id = $('#userId');
	var pwd = $('#userPassword');
	
	var userVO = { userId: id.val(), userPassword: pwd.val() };
	
	$.ajax({
		url: '${pageContext.request.contextPath}/main/login',
		type: 'post',
		data: userVO,
		success: function(login) {
			if (login === '') {
				alert('회원정보가 일치하지 않습니다. 다시 로그인 해주세요.');
				id.val('');
				pwd.val('');
			} else {
				alert('로그인 성공');
				window.location.href='${pageContext.request.contextPath}/main/home';
			}
		},
		error: function(XHR, status, error) {
			console.log(status + ' : ' + error);
		}
	});
});

</script>

</html>