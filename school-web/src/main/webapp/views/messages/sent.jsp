<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<link href="<c:url value="/resources/css/messages.css" />"
	rel="stylesheet">

<ul class="nav nav-tabs">
	<li><a href='<spring:url value="/inbox.html"></spring:url>'>Inbox()</a></li>
	<li class="active"><a href='<spring:url value="/sent.html"></spring:url>'>Sent()</a></li>
</ul>
<table class="tablem">
	<tbody>
		<c:set value="${firstNames}" var="fname" />
		<c:set value="${lastNames}" var="lname" />
		<c:set value="${dates}" var="dates" />
		<c:forEach items="${conversations}" var="conversation" varStatus="i">
			<tr>
				<td class="name">${fname[i.index]} ${lname[i.index]}</td>
				<td class="subject">${conversation.subject}</td>
				<td class="date">${dates[i.index]}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>