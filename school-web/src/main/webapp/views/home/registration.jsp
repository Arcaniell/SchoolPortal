<%@ page language="java" contentType="text/html; charset=UTF8"
	pageEncoding="UTF8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div id="signUp" class="modal fade" tabindex="-1" role="dialog">
	<div class="modal-dialog">
		<br> <br> <br> <br> <br> <br> <br>
		<br>
		<div class="modal-content" align="center">

			<div class="modal-body">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
				<h3 class="modal-title">
					<spring:message code="label.registration" />
				</h3>
				<form action="" method="post" id="signup_from">
					<table class="table ">
						<tr>
							<td><table>
									<tr>
										<td colspan="2"><h4>
												<spring:message code="label.registration.data" />
											</h4></td>
									</tr>
									<tr>

										<td><spring:message code="label.registration.name" /></td>

										<td><input id="firstname" name="firstName"
											class="registration_names" type="text"
											placeholder="<spring:message code="label.firstname" />" /> <input
											id="lastname" name="lastName" class="registration_names"
											type="text"
											placeholder="<spring:message code="label.lastname" />" /></td>

									</tr>
									<tr>
										<td><spring:message code="label.email" /></td>
										<td><input id="email" name="email" type="text"
											class="registration_data"></td>
									</tr>
									<tr>
										<td><spring:message code="label.createapassword" /></td>
										<td><input id="createapassword" name="password"
											type="password" class="registration_data"></td>
									</tr>
									<tr>
										<td><spring:message code="label.confirmapassword" /></td>
										<td><input id="confirmapassword"
											equalto="#createapassword" type="password"
											class="registration_data"></td>
									</tr>
									<tr>
										<td colspan="2">
											<div align="center">
												<input type="radio" name="sex" value="1" checked="checked">
												<spring:message code="label.male" />
												<input type="radio" name="sex" value="2">
												<spring:message code="label.female" />
												<input type="radio" name="sex" value="3">
												<spring:message code="lable.other" />
											</div>
										</td>
									</tr>

								</table></td>
						


							
						</tr>
						<tr>
							<td>
							<table class="all_in_one_line">
									<tr>
										<td><h4 align="center">
												<spring:message code="label.registration.type" />
											</h4></td>
									</tr>
									<tr>
										<td><input value="4" type="radio" checked="checked"
											name="role"> <spring:message code="label.student" /></td>
									</tr>
									<tr>
										<td><input value="3" type="radio" name="role"> <spring:message
												code="label.parent" /></td>

									</tr>

								</table>
							
							</td>
							<td>
							<h4>Secret secret question</h4>
							<div class="btn-group">
			<button type="button" class="btn btn-default dropdown-toggle"
				data-toggle="dropdown">
				<spring:message code="label.language" />
				<span class="caret"></span>
			</button>
			<ul class="dropdown-menu" role="menu">
				<li><a href="?lang=en">English</a></li>
				<li><a href="?lang=ua">Українська</a></li>
				<li><a href="?lang=ru">Русский</a></li>
			</ul>
		</div>
		<div>
		<h4>Give secret answer to your question</h4>
		<input type="text">
			</div>				
							</td>
						
						</tr>
						
					</table>
					<div align="center">
						<table>
							<tr>
								<td><input type="button" class="btn btn-default"
									id="signup_button"
									value="<spring:message code="label.signup"/>" /> <input
									type="button" class="hidden_error" id="signUpSuccesButton"
									data-toggle="modal" class="close" data-dismiss="modal"
									data-target="#signUpSucces" /></td>
							</tr>
						</table>



					</div>

				</form>
			</div>

		</div>
	</div>
</div>
