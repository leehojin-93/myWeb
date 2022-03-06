<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/common.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/header.css">
<!-- // CSS -->

	<div class="clearfix">
		<div>
	    	<h1 id="header"><a href="${pageContext.request.contextPath}/main/home">이호진's PORTFOLIO</a></h1>
	   	</div>
	   	<div id="userForm">
	   	<c:choose>
		   	<c:when test="${ empty loginSession }">
			    <ul class="clearfix">
			    	<li><a href="${pageContext.request.contextPath}/main/loginForm">로그인</a></li>
			    	<li><a href="${pageContext.request.contextPath}/main/joinForm">회원가입</a></li>
			    </ul>
			</c:when>
			<c:otherwise>
				<ul class="clearfix">
			    	<li>${ loginSession.userName }님 환영합니다</li>
			    	<li><a href="#">마이페이지</a></li>
			    	<li><a href="${pageContext.request.contextPath}/main/logout">로그아웃</a></li>
			    </ul>
			</c:otherwise>
		</c:choose>
	    </div>
    </div>
    <hr id="hrLine">