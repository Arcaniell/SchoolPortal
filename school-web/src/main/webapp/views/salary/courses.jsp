<%@ page language="java" contentType="text/html; charset=UTF8"
	pageEncoding="UTF8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<div id="coursesrate" class="modal fade" tabindex="-1" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content" align="center">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
			</div>
			<h3 class="modal-title">
				<spring:message code="salary.courses" />
			</h3>
			<div class="modal-body">
				<table class="table table-hover">
					<thead>
						<tr>
							<th><spring:message code="salary.coursename" /></th>
							<th><spring:message code="salary.courserate" /></th>
							<th><spring:message code="salary.sumperhour" /></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${courses}" var="course">
							<tr>
								<td>${course.courseName}</td>
								<td>${course.rating}</td>
								<td>${course.sumPerHour}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>