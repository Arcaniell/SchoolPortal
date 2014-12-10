<%@ page language="java" contentType="text/html; charset=UTF8"
	pageEncoding="UTF8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div id="admin_role_confirmation" class="modal fade" tabindex="-1"
	role="dialog">
	<div class="modal-dialog">
		<br> <br> <br> <br> <br> <br> <br>
		<br>
		<div class="modal-content" align="center">

			<div class="modal-body">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>

				<table>
					<tr>
					<c:choose>
					
					<c:when test="${role_request.role.name == 'ROLE_STUDENT'}">
						<td><br><h3>Add Student Role to ${role_request.user.firstName} ${role_request.user.lastName}</h3><br><br></td></c:when>
					<c:when test="${role_request.role.name == 'ROLE_TEACHER'}">
						<td><br><h3>Add Teacher Role to ${role_request.user.firstName} ${role_request.user.lastName}</h3><br><br></td></c:when>
					
					<c:otherwise>
					<td><br><h3>Add Parent role to ${role_request.user.firstName} ${role_request.user.lastName}</h3><br><br></td>
					<table>
					<tr><td colspan="2"><div align="center">
					<p id="forgotten_chield" class="hidden_error">Choose a child !</p></div></td></tr>
					<tr><td>
					Select a child of  ${role_request.user.firstName} .
					<br><br><br><br><br><br>
					</td>
					<td><select  onchange="setStudentNumber(this.options[this.selectedIndex].value)">
					<option value="0"></option>
					<c:forEach items="${role_request.group.student}" var="student">
					<option value="${student.id}">${student.user.firstName} ${student.user.lastName}</option>
					</c:forEach>
					</select>
					<br><br><br><br><br><br>
					</td>
					</tr>
					</table>
					</c:otherwise>
					</c:choose>
					</tr>
					<tr>
						<td><div align="center">
								<input class="btn btn-sample" onclick="addRole()"
									type="button" value="Add"> <input
									class="btn btn-sample" type="button" class="close"
									data-dismiss="modal" value="Cancel">
							</div></td>
					</tr>
				</table>
				<input type="hidden" id="role_request_id" value="${role_request.id}">
				<input type="hidden" id="role_request_name" value="${role_request.role.name}">
				<input type="hidden" id="studentNumber" name="studentNumber" value="0"> <input
					type="button" class="hidden_error"
					id="roleConfirmationSuccesButton" data-toggle="modal" class="close"
									data-dismiss="modal"  
					data-target="#admin_role_confirmation_succes" />
					<input
					type="button" class="hidden_error"
					id="roleConfirmationFailureButton" data-toggle="modal" class="close"
									data-dismiss="modal"  
					data-target="#admin_role_confirmation_failure" />

			</div>

		</div>
	</div>
</div>
