<%@ page language="java" contentType="text/html; charset=UTF8"
	pageEncoding="UTF8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<div id="signUp" class="modal fade" tabindex="-1" role="dialog">
	<div class="modal-dialog">
		<br> <br> <br> <br> <br> <br> <br>
		<br>
		<div class="modal-content" align="center" style="overflow: auto;">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
				<h4 class="modal-title">
					<spring:message code="label.registration" />
				</h4>
			</div>
			<div class="modal-body">

				<form action="" method="post">
					<table>
						<tr>
							<td><label class="control-label" for="j_username"><spring:message
										code="label.username" /></label></td>
							<td><input class="input" id="j_username" name="j_username"
								size="20" maxlength="50" type="text" /></td>
						</tr>
						<tr>
							<td><label for="j_password"><spring:message
										code="label.password" /></label></td>
							<td><input class="input" id="j_password" name="j_password"
								size="20" maxlength="50" type="password" /></td>
						</tr>
					</table>
					<div align="center">
					<table>
						<tr><td>
						<input type="submit" class="btn btn-default"
						value="<spring:message code="label.enter"/>" />
						</td></tr>
					</table>
						
						
					
					</div>
					
				</form>
			</div>

		</div>
	</div>
</div>