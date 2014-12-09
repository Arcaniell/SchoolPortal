<%@ page language="java" contentType="text/html; charset=UTF8"
	pageEncoding="UTF8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>


<table class="default_table admin_table">
	<thead>

		<tr>
			<th>User id</th>
			<th>Email</th>
			<th>First name</th>
			<th>Last Name</th>
			<th>Sex</th>
			<th>Role</th>
			<th>Date of registration</th>
			<th>Group</th>
	</thead>

	<c:forEach items="${role_requsts}" var="role_request">

		<tr class="admin_role_confirmation" id="${role_request.id}">
			<td>${role_request.user.id}</td>
			<td>${role_request.user.email}</td>
			<td>${role_request.user.firstName}</td>
			<td>${role_request.user.lastName}</td>
			<td>${role_request.user.sex}</td>
			<td>${role_request.user.registration}</td>
			<td>${role_request.role.name}</td>
			<td>${role_request.group.id}</td>
		</tr>

	</c:forEach>

</table>
<div id="admin_role_confirmation_container"></div>
<jsp:include page="/views/admin/role_confirmation_succes.jsp" />
<jsp:include page="/views/admin/role_confirmation_failure.jsp" />
<input type="button" class="hidden_error" id="roleConfirmationButton"
	data-toggle="modal" data-target="#admin_role_confirmation" />