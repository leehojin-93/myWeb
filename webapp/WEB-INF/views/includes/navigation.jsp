<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/navigation.css">
<!-- // CSS -->

	<div id="nav" class="clearfix">
		<ul class="clearfix">
			<li><a href="${pageContext.request.contextPath}/main/home">집</a></li>
			<li>자기소개</li>
			<li><a href="${pageContext.request.contextPath}/board/list">게시판</a></li>
			<li class="lastLi">etc.</li>
		</ul>
	</div>