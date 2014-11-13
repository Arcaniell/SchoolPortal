<%@ page language="java" contentType="text/html; charset=UTF8"
	pageEncoding="UTF8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<div id="logIn" class="modal fade" tabindex="-1" role="dialog">
	<div class="modal-dialog">
		<br> <br> <br> <br> <br> <br> <br>
		<br>
		<div class="modal-content" align="center" style="overflow: auto;">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
				<h3 class="modal-title">
					<spring:message code="label.entrance" />
				</h3>
			</div>
			<div class="modal-body">
				<form action="j_spring_security_check" method="post">
					<table>
						<tr>
							<td style="padding-right: 20px;"><label
								class="control-label" for="j_username"><spring:message
										code="label.email" /></label></td>
							<td><input class="input" id="j_username" name="j_username"
								size="20" maxlength="50" type="text" /></td>
						</tr>
						<tr>
							<td style="padding-right: 20px;"><label for="j_password"><spring:message
										code="label.password" /></label></td>
							<td><input class="input" id="j_password" name="j_password"
								size="20" maxlength="50" type="password" /></td>
						</tr>
						<tr>
							<td></td>
							<td style="font-size: small;"><p align="right"><a href="">
							<spring:message code="label.forgotapassword"/></a></p></td>
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
								<h6><spring:message code="label.notregistrated"/></h6>
							</td>
							<td>
								<button class="btn" data-toggle="modal" class="close"
									data-dismiss="modal" data-target="#signUp"><spring:message code="label.signup"/></button>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>