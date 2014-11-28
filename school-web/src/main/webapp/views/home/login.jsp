<%@ page language="java" contentType="text/html; charset=UTF8"
	pageEncoding="UTF8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div id="logIn" class="modal fade" tabindex="-1" role="dialog">
	<div class="modal-dialog">
		<br> <br> <br> <br> <br> <br> <br>
		<br>
		<div class="modal-content" align="center">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
				<h3 class="modal-title">
					<spring:message code="label.entrance" />
				</h3>
			</div>
			<div class="modal-body">
				<c:choose>
					<c:when test="${fn:length(visible_forbiden) > 0}">
						<h3 class="red_message">
							<spring:message code="label.visible_login" />
						</h3>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when
								test="${(SPRING_SECURITY_LAST_EXCEPTION.message == 'Bad credentials')
								&& (signinfailure == 'signinfailure')}">
								<h3 class="red_message">
									<spring:message code="label.visible_credentials" />
								</h3>
							</c:when>
							<c:when
								test="${(SPRING_SECURITY_LAST_EXCEPTION.message == 'User is disabled')
								&& (signinfailure == 'signinfailure')}">
								<h3 class="red_message">
									<spring:message code="label.visible_disabled" />
								</h3>
							</c:when>
						</c:choose>
					</c:otherwise>

				</c:choose>

				<form action="${root_action}j_spring_security_check" method="post"
					id="login_form">
					<table>
						<tr>
							<td class="padding_right"><h4>
									<spring:message code="label.email" />
								</h4></td>
							<td class="for_input"><input class="input" id="j_username"
								name="j_username" type="text" value="${user_email}" /></td>
						</tr>
						<tr>
							<td class="padding_right"><h4>
									<spring:message code="label.password" />
								</h4></td>
							<td class="for_input"><input class="input" id="j_password"
								name="j_password" type="password" /></td>
						</tr>
						<tr>
							<td></td>
							<td style="font-size: small;"><p align="right">
									<a href="" data-toggle="modal" data-dismiss="modal"
										data-target="#forgotAPassword"> <spring:message
											code="label.forgotapassword" /></a>
								</p></td>
						</tr>
					</table>
					<div align="center">
						<table>
							<tr>
								<td><input type="submit" class="btn btn-default"
									value="<spring:message code="label.login"/>" /></td>
							</tr>
						</table>
					</div>
				</form>

				<div align="center">
					<hr>
					<table>
						<tr>
							<td>
								<h6>
									<spring:message code="label.notregistrated" />
								</h6>
							</td>
							<td>
								<button class="btn" data-toggle="modal" class="close"
									data-dismiss="modal" data-target="#signUp">
									<spring:message code="label.signup" />
								</button>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
