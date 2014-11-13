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

			<div class="modal-body">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
				<h3 class="modal-title">
					<spring:message code="label.registration" />
				</h3>
				<form action="" method="post">
					<table class="table" style="white-space: nowrap;">
						<tr>
							<td><table>
									<tr>
										<td colspan="2"><h4 align="center">
												<spring:message code="label.registration.data" />
											</h4></td>
									</tr>
									<tr>

										<td><label class="control-label"><spring:message
													code="label.registration.name" /></label></td>

										<td><input style="width: 87px;" type="text"
											value="<spring:message code="label.firstname" />" /> <input
											style="width: 87px;" type="text"
											value="<spring:message code="label.lastname" />" /></td>

									</tr>
									<tr>
										<td><label class="control-label"><spring:message
													code="label.email" /></label></td>
										<td><input type="text"></td>
									</tr>
									<tr>
										<td><label class="control-label"><spring:message
													code="label.createapassword" /></label></td>
										<td><input type="password"></td>
									</tr>
									<tr>
										<td><label class="control-label"><spring:message
													code="label.confirmapassword" /></label></td>
										<td><input type="password"></td>
									</tr>

								</table></td>




							<td><table>
									<tr>
										<td><h4 align="center">
												<spring:message code="label.registration.type" />
											</h4></td>
									</tr>
									<tr>
										<td><input type="radio" checked="checked" name="role">
											<label class="control-label"><spring:message
													code="label.student" /></label></td>
									</tr>
									<tr>
										<td><input type="radio" name="role"> <label
											class="control-label"><spring:message
													code="label.parent" /></label></td>

									</tr>

								</table></td>
						</tr>
					</table>
					<div align="center">
						<table>
							<tr>
								<td><input type="submit" class="btn btn-default" style="width: 140px;"
									value="<spring:message code="label.signup"/>" /></td>
							</tr>
						</table>



					</div>

				</form>
			</div>

		</div>
	</div>
</div>

