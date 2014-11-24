<%@ page language="java" contentType="text/html; charset=UTF8"
	pageEncoding="UTF8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div id="signUp" class="modal fade" tabindex="-1" role="dialog">
	<div class="modal-dialog">
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
							<td colspan="2"><table>
									<tr>
										<td colspan="2"><h4>
												<spring:message code="label.registration.data" />
											</h4></td>
									</tr>
									<tr>

										<td><spring:message code="label.registration.name" /></td>

										<td>
											<table>
												<tr>
													<td><input id="firstname" name="firstName"
														class="registration_names" type="text"
														placeholder="<spring:message code="label.firstname" />" /></td>
												</tr>
												<tr>
													<td><input id="lastname" name="lastName"
														class="registration_names" type="text"
														placeholder="<spring:message code="label.lastname" />" /></td>
												</tr>
											</table>
										</td>

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
										<td><input id="confirmapassword" name="password2"
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
								<table>
									<tr>
										<td>
											<h4>
												<spring:message code="label.question" />
											</h4>
										</td>
									</tr>
									<tr>
										<td>
											<table>
												<tr>
													<td>
														<div class="btn-group btn-group-vertical">
															<input type="button" id="question"
																class="dropdown-toggle question_drop_long" id="question"
																data-toggle="dropdown"
																value="<spring:message code="label.question1" /> ">
															<span class="caret" id="for_caret"></span>
															<ul class="dropdown-menu" role="menu">
																<li class="rquestion" id="question1"><spring:message
																		code="label.question1" /></li>
																<li class="rquestion" id="question2"><spring:message
																		code="label.question2" /></li>
																<li class="rquestion" id="question3"><spring:message
																		code="label.question3" /></li>
																<li class="rquestion" id="question4"><spring:message
																		code="label.question4" /></li>
																<li class="rquestion" id="question5"><spring:message
																		code="label.question5" /></li>

															</ul>
															<input class="question1" type="hidden"
																value="<spring:message code="label.question1" />">
															<input class="question2" type="hidden"
																value="<spring:message code="label.question2" />">
															<input class="question3" type="hidden"
																value="<spring:message code="label.question3" />">
															<input class="question4" type="hidden"
																value="<spring:message code="label.question4" />">
															<input class="question5" type="hidden"
																value="<spring:message code="label.question5" />">
															<input type="hidden" id="questionNumber"
																name="questionNumber" value="question1">
														</div>

													</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td>
											<h4>
												<spring:message code="label.ansver" />
											</h4>

										</td>
									</tr>
									<tr>
										<td><input name="questionAnsver" id="questionAnsver"
											type="text" class="question_drop_short"></td>
									</tr>
								</table>
							</td>

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
									data-target="#signUpSucces" /> <input type="button"
									class="hidden_error" id="signUpFailureButton"
									data-toggle="modal" data-target="#signUpFailure" /></td>
							</tr>
						</table>



					</div>

				</form>
			</div>

		</div>
	</div>
</div>
