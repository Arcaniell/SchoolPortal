<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<link href="<c:url value="/resources/css/course.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/css/sortable-theme-minimal.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/css/profile.css" />"
	rel="stylesheet">
<h3>All student groups</h3>
<table class="table table-hover default_table sortable-theme-bootstrap"
	data-sortable>
	<thead>
		<tr>
			<th><spring:message code="groups.table.name" /></th>
			<th><spring:message code="course.table.Year" /></th>
			<th><spring:message code="course.table.Additional" /></th>
			<th><spring:message code="course.request.members" /></th>
			<th><spring:message code="groups.table.curator" /></th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${groupList}" var="element">
			<tr>
				<td>${element.name}</td>
				<td>${element.year}</td>
				<td>${element.additional}</td>
				<td>${element.members}</td>
				<td><a class="anchor" data-value="${element.teacherUserId}">${element.teacher}</a></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<jsp:include page="/views/profile/profile_information_runner.jsp" />

<script src="<c:url value="/resources/js/course.js" />"
	type="text/javascript"></script>
<script src="<c:url value="/resources/js/utils/sortable.js" />"
	type="text/javascript"></script>