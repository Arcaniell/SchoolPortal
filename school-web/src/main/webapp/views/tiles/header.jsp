<%@ page language="java" contentType="text/html; charset=UTF8"
	pageEncoding="UTF8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page session="false"%>

<body>
	<div class="header">

		<ul class="crumbs">
			<li class="first"><a href="${root_action}home"
				style="z-index: 9;"><span></span> <spring:message
						code="header.home" /></a></li>
			<c:if test="${not empty subject}">
				<li class="active"><a href="../messages" style="z-index: 8;"><spring:message
							code="sidebar.messages" /></a></li>
				<c:if test="${subject.length() > 10}">
					<c:set var="tenMore" value="${fn:substring(subject, 0, 10)}" />
					<li class="active"><a href="" style="z-index: 7;">${tenMore}</a></li>
				</c:if>
				<c:if test="${subject.length() < 10}">
					<li class="active"><a href="" style="z-index: 7;">${subject}</a></li>
				</c:if>
			</c:if>
			<c:if test="${not empty current}">
				<c:if test="${current == 'courses'}">
					<li class="active"><a href="courses" style="z-index: 8;"><spring:message
								code="sidebar.course" /></a></li>
				</c:if>
				<c:if test="${current == 'group'||current == 'group_edit'}">
					<li class="active"><a href="groups" style="z-index: 8;"><spring:message
								code="sidebar.groups" /></a></li>
				</c:if>
				<c:if test="${current == 'group_edit'}">
					<li class="active"><a href="" style="z-index: 7;">Group
							edit</a></li>
				</c:if>
				<c:if test="${current == 'history'}">
					<li class="active"><a href="salary" style="z-index: 8;"><spring:message
								code="sidebar.salary" /></a></li>
					<li class="active"><a href="history" style="z-index: 7;"><spring:message
								code="salary.history" /></a></li>
				</c:if>
				<c:if test="${current == 'payroll'}">
					<li class="active"><a href="payroll" style="z-index: 8;"><spring:message
								code="sidebar.payroll" /></a></li>
				</c:if>
				<c:if test="${current == 'request'}">
					<li class="active"><a href="course-request"
						style="z-index: 8;"><spring:message code="sidebar.request" /></a></li>
				</c:if>
				<c:if test="${current == 'salary'}">
					<li class="active"><a href="salary" style="z-index: 8;"><spring:message
								code="sidebar.salary" /></a></li>
				</c:if>
				<c:if test="${current == 'conversation'}">
					<li class="active"><a href="message" style="z-index: 8;"><spring:message
								code="sidebar.messages" /></a></li>
				</c:if>
				<c:if test="${current == 'conversations'}">
					<li class="active"><a href="messages" style="z-index: 8;"><spring:message
								code="sidebar.messages" /></a></li>
				</c:if>
				<c:if test="${current == 'journal'}">
					<li class="active"><a href="journal" style="z-index: 8;"><spring:message
								code="sidebar.journal" /></a></li>
				</c:if>
				<c:if test="${current == 'diary'}">
					<li class="active"><a href="journal" style="z-index: 8;"><spring:message
								code="sidebar.diary" /></a></li>
				</c:if>
			</c:if>
		</ul>


		<sec:authorize access="hasAnyRole('ROLE_TEACHER', 'ROLE_PARENT')">
			<span class="counterPosition"> <a
				href='<c:url value="/messages"/>'><img class="newMessageImage"
					src="<c:url value="/resources/img/envelopeW8.png" />" /> <span
					id="newMessages" class="badgeMessage"></span></a>
			</span>
		</sec:authorize>

		<sec:authorize access="isAnonymous()">

			<button id="loginButton" class="btn btn-sample" data-toggle="modal"
				data-target="#logIn">
				<spring:message code="label.login" />
			</button>

		</sec:authorize>
		<sec:authorize access="isAuthenticated()">
			<a id="logoutButton" class="btn btn-sample"
				href="<c:url value="/j_spring_security_logout"/>"><spring:message
					code="label.logout" /></a>
		</sec:authorize>

		<div class="btn-group">
			<button id="languageButton" type="button"
				class="btn btn-sample dropdown-toggle" data-toggle="dropdown">
				<spring:message code="label.language" />
				<span class="caret"></span>
			</button>
			<ul class="dropdown-menu" role="menu">
				<li><a href="?lang=en">English</a></li>
				<li><a href="?lang=ua">Українська</a></li>
				<li><a href="?lang=ru">Русский</a></li>
			</ul>
		</div>

		<jsp:include page="/views/home/login.jsp" />
		<jsp:include page="/views/home/registration.jsp" />
		<jsp:include page="/views/home/registration_succes.jsp" />
		<jsp:include page="/views/home/registration_failure.jsp" />
		<jsp:include page="/views/home/forgotapassword.jsp" />
		<jsp:include page="/views/home/forgotapassword_succes.jsp" />
		<jsp:include page="/views/home/forgotapassword_failure.jsp" />
		<input type="hidden" id="root_action" value="${root_action}">



	</div>