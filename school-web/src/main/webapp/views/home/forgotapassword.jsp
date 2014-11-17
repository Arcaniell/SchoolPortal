<%@ page language="java" contentType="text/html; charset=UTF8"
	pageEncoding="UTF8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div id="forgotAPassword" class="modal fade" tabindex="-1" role="dialog">
	<div class="modal-dialog">
		<br> <br> <br> <br> <br> <br> <br>
		<br>
		<div class="modal-content" align="center">

			<div class="modal-body">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
				<h3 class="modal-title">
					<spring:message code="label.forgotapassword" />
				</h3>
				<table>
					<tr>
						<td><h4>
								<spring:message code="label.forgotapassword.hint" />
							</h4></td>
					</tr>
					<tr><td>
					<table class="table"><tr><td><h4 class="margin_left"><spring:message code="label.email" /></h4></td>
					<td><input type="text" id="forgot_email"></td></tr>
					</table>
					</td></tr>
					<tr>
						<td><div align="center">
								<table>
									<tr>
										<td><input id="forgotAPasswordButton" type="button" class="btn btn-default"
											class="close" data-dismiss="modal" 
											value="<spring:message code="label.changeapassword" />"></td>
									</tr>
								</table>
							</div></td>
					</tr>
				</table>
			</div>

		</div>
	</div>
</div>
