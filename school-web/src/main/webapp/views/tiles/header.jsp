<%@ page language="java" contentType="text/html; charset=UTF8"
	pageEncoding="UTF8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<h1>
	<spring:message code="label.welcome" />
</h1>
<h1>
	<a href="?lang=en">en</a> | <a href="?lang=ua">ua</a> | <a
		href="?lang=ru">ru</a>
</h1>