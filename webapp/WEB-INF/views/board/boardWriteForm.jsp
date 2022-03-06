<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>

<!-- CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/common.css" />
<!-- // CSS -->
</head>
<body>

	<fieldset>
		<legend>게시글 작성</legend>
		<form action="${pageContext.request.contextPath}/main/boardWrite?userNo=${loginSession.userNo}" method="post">
			<label for="boardTitle">제목: </label> <input type="text" id="boardTitle" name="boardTitle">
			<label for="boardContext">내용: </label> <textarea id="boardContext" name="boardContext"></textarea>
			<button type="submit">글쓰기</button>
		</form>
	</fieldset>

</body>
</html>