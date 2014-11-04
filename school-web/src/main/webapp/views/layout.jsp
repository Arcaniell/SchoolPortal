<%@ page language="java" contentType="text/html; charset=UTF8"
	pageEncoding="UTF8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page session="false"%>


<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><tiles:getAsString name="title" /></title>
<!-- OUR LOCAL CSS -->
<link href="<c:url value="/resources/css/main.css" />" rel="stylesheet">
<!-- BOOTSTRAP -->
<link
	href="<c:url value="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" />"
	rel="stylesheet">
<link
	href="<c:url value="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap-theme.min.css" />"
	rel="stylesheet">
<!-- JQUERY -->
<script type="text/javascript"
	src="<c:url value="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js" />"></script>
<!-- BOOTSTRAP JS -->
<script type="text/javascript"
	src="<c:url value="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js" />"></script>
</head>
<body>
	<div class="header">
		<%@ taglib uri="http://tiles.apache.org/tags-tiles-extras"
			prefix="tilesx"%>

		<tilesx:useAttribute name="current" />

		<ul class="crumbs">
			<li class="first"><a href="home" style="z-index: 9;"><span></span>Home</a></li>
			<li class="${current == 'profile' ? '' : 'hidden'}"><a href="#"
				style="z-index: 8;">My profile</a></li>
			<li class="${current == 'journal' ? '' : 'hidden'}"><a href="journal"
				style="z-index: 7;">Journal</a></li>
			<li class="${current == 'messages' ? '' : 'hidden'}"><a href="#"
				style="z-index: 6;">Messages</a></li>
		</ul>

		<!-- <button class="btn btn-default" data-toggle="modal" data-target="#myModal">
   Log in
</button> -->
		<!-- Large modal -->
		<button class="btn btn-default" data-toggle="modal"
			data-target="#logIn">
			<spring:message code="label.enter" />
		</button>

		<div class="btn-group">
			<button type="button" class="btn btn-default dropdown-toggle"
				data-toggle="dropdown">
				<spring:message code="label.language" />
				<span class="caret"></span>
			</button>
			<ul class="dropdown-menu" role="menu">
				<li><a href="?lang=en">en</a></li>
				<li><a href="?lang=ua">ua</a></li>
				<li><a href="?lang=ru">ru</a></li>
			</ul>
		</div>

		<jsp:include page="/views/home/login.jsp" />
		<jsp:include page="/views/home/registration.jsp" />

	</div>
	<div class="sidebar">
		<tiles:insertAttribute name="sidebar" />
	</div>
	<div class="content">
		<tiles:insertAttribute name="main_content" />
	</div>
</body>
</html>
