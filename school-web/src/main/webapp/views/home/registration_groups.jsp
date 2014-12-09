<%@ page language="java" contentType="text/html; charset=UTF8"
	pageEncoding="UTF8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<select id="registration_group_select" class="btn btn-sample" onchange="setGroupNumber(this.options[this.selectedIndex].value)">
	<option></option>
	<c:forEach items="${groups}" var="group">

		<option value="${group.id}">${group.number}-${group.letter}</option>

	</c:forEach>
</select>