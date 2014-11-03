<%@ page language="java" contentType="text/html; charset=UTF8"
	pageEncoding="UTF8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<ul class="crumbs">
	<li class="first"><a href="#" style="z-index: 9;"><span></span>Home</a>
	</li>
	<li><a href="#" style="z-index: 8;">Profile</a></li>
	<li><a href="#" style="z-index: 7;">Some Option</a></li>
	<li><a href="#" style="z-index: 6;">Another Option</a></li>
</ul>

<!-- <button class="btn btn-default" data-toggle="modal" data-target="#myModal">
   Log in
</button> -->
   <!-- Large modal -->
	<button class="btn btn-default" data-toggle="modal" data-target="#logIn">
	<spring:message code="label.enter" /></button>

<div class="btn-group">
	<button type="button" class="btn btn-default dropdown-toggle"
		data-toggle="dropdown">
		<spring:message code="label.language" /> <span class="caret"></span>
	</button>
	<ul class="dropdown-menu" role="menu">
		<li><a href="?lang=en">en</a></li>
		<li><a href="?lang=ua">ua</a></li>
		<li><a href="?lang=ru">ru</a></li>
	</ul>
</div>

<jsp:include page="/views/home/login.jsp"/>
<jsp:include page="/views/home/registration.jsp"/> 
