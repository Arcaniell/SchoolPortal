<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<link href="<c:url value="/resources/css/sortable-theme-minimal.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/css/course.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/css/base-pagination.css" />"
	rel="stylesheet">
<form id="manage" action="course-manage" method="post">
	<!-- ADD COURSE MODAL -->
	<div class="modal fade add_course_modal" tabindex="-1" role="dialog"
		aria-labelledby="mySmallModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h3 class="modal-title">Course create</h3>
				</div>
				<div class="modal-body create_course_view">
					<p>Enter course name</p>
					<input name="name_value" type="text" class="form-control" placeholder = "Course name">
					<table class="modal_table">
						<thead>
							<tr>
								<th>Study year</th>
								<th>Additional?</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><select name="year_value" class="form-control">
										<c:forEach items="${years}" var="year">
											<option>${year}</option>
										</c:forEach>
								</select></td>
								<td><select name="add_value" class="form-control">
										<option>NO</option>
										<option>YES</option>
								</select></td>
							</tr>
						</tbody>
					</table>
					<p>Chose coefficient</p>
					<select name="coef_value" class="form-control">
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
					</select>
					<div class="hidden_for_default_group">
						<p>Enter price</p>
						<input name="price_value" type="text" class="form-control" placeholder="Course price in $">
					</div>
					<button name="submit_button" type="button" value="create"
						class="btn btn-info submit">Create</button>
				</div>
			</div>
		</div>
	</div>
	<!-- ADD COURSE MODAL -->
	<!-- REMOVE COURSE MODAL -->
	<div class="modal fade delete_course_modal" tabindex="-1" role="dialog"
		aria-labelledby="mySmallModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h3 class="modal-title">Are you sure want to delete this
						course/courses?</h3>
				</div>
				<div class="modal-body button_body">
					<button name="submit_button" type="submit" value="delete"
						class="btn btn-info submit_button">
						<spring:message code="course.request.btn.yes" />
					</button>
					<button name="no" type="button" data-dismiss="modal"
						class="btn btn-sample">
						<spring:message code="course.request.btn.no" />
					</button>
				</div>
			</div>
		</div>
	</div>
	<!-- REMOVE COURSE MODAL -->
	<!-- TABLE -->
	<h3>All school courses</h3>
	<button type="button" class="btn btn-sample" data-toggle="modal"
		data-target=".add_course_modal">Create</button>
	<button type="button" class="btn btn-sample remove_button" data-toggle="modal"
		data-target=".delete_course_modal">Delete</button>
	<table
		class="table table-hover default_table sortable-theme-bootstrap paginated"
		data-sortable>
		<thead>
			<tr>
				<th data-sortable="false"><input type="checkbox"
					id="select-all"></th>
				<th><spring:message code="course.table.Name" /></th>
				<th><spring:message code="course.table.Year" /></th>
				<th><spring:message code="course.table.Additional" /></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${courses}" var="element">
				<tr>
					<td><input name="checkboxName" value="${element.id}"
						type="checkbox"></td>
					<td>${element.name}</td>
					<td>${element.year}</td>
					<td>${element.additional}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</form>
<!-- TABLE -->
<!-- Pagination footer -->
<div class="context-footer">
	<select class="form-control row_count">
		<option value="10">10</option>
		<option value="20">20</option>
		<option value="30">30</option>
		<option value="50">50</option>
	</select>
	<div class="pages"></div>
</div>
<!-- Pagination footer -->
<script src="<c:url value="/resources/js/course.js" />"
	type="text/javascript"></script>
<script src="<c:url value="/resources/js/course-request.js" />"
	type="text/javascript"></script>
<script src="<c:url value="/resources/js/utils/sortable.js" />"
	type="text/javascript"></script>
<script src="<c:url value="/resources/js/utils/pagination.js" />"
	type="text/javascript"></script>