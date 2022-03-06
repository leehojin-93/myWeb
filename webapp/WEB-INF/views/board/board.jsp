<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>

<!-- CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/board.css">
<!-- // CSS -->
</head>
<body>
	<!-- HEADER -->
	<c:import url="/WEB-INF/views/includes/header.jsp" />
	<!-- // HEADER -->
	
	<!-- NAVIGATION -->
	<c:import url="/WEB-INF/views/includes/navigation.jsp" />
	<!-- // NAVIGATION -->
	
	<!-- BOARD -->
	<table>
		<thead>
			<tr>
				<td>글번호</td>
				<td>글제목</td>
				<td>작성자(내용)</td>
				<td>조회수</td>
				<td>등록일</td>
				<td>수정일</td>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${boardList}" var="bList" varStatus="status">
			<tr>
				<td>${bList.boardNo}</td>
				<td>${bList.boardTitle}</td>
				<td>${bList.userName}</td>
				<td>${bList.boardHit}</td>
				<td>${bList.boardRegDate}</td>
				<td>${bList.boardModDate}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div id="divBtnWrite">
	<c:choose>
		<c:when test="${ empty loginSession }">
		<a href="${pageContext.request.contextPath}/main/loginForm"><button>로그인하고 글쓰기</button></a>
		</c:when>
		<c:otherwise>
		<a href="${pageContext.request.contextPath}/main/boardWriteForm"><button>글쓰기</button></a>
		</c:otherwise>
	</c:choose>
	</div>
	<!-- // BOARD -->

</body>
</html>