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
					<table class="table">
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
										<td></td>
										<td>
											<div>
												<input type="radio" name="sex" value="1" checked="checked">
												<spring:message code="label.male" />
												<input type="radio" name="sex" value="2">
												<spring:message code="label.female" />
												<input type="radio" name="sex" value="3">
												<spring:message code="label.other" />
											</div>
										</td>
									</tr>
									<tr>
										<td><spring:message code="label.birthday" /></td>
										<td>
											<table class="table_birthday">
												<tr>
													<td><spring:message code="label.month" /><input
														name="month" type="text" placeholder="MM"></td>
													<td><spring:message code="label.day" /><input
														name="day" type="text" placeholder="DD"></td>
													<td><spring:message code="label.year" /><input
														name="year" type="text" placeholder="YYYY"></td>
												</tr>
											</table>
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
													<td><select class="btn-sample question_drop_long">
															<option class="rquestion" id="question1"><spring:message
																	code="label.question1" /></option>
															<option class="rquestion" id="question2"><spring:message
																	code="label.question2" /></option>
															<option class="rquestion" id="question3"><spring:message
																	code="label.question3" /></option>
															<option class="rquestion" id="question4"><spring:message
																	code="label.question4" /></option>
															<option class="rquestion" id="question5"><spring:message
																	code="label.question5" /></option>
													</select> <input type="hidden" id="questionNumber"
														name="questionNumber" value="question1"></td>
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
										<td><input id="hide_groups_action_false1" value="4" type="radio" checked="checked"
											name="role"> <spring:message code="label.student" /></td>
									</tr>
									<tr>
										<td><input id="hide_groups_action_false2" value="5" type="radio" name="role"> <spring:message
												code="label.parent" /></td>

									</tr>
									<tr>
										<td><input id="hide_groups_action_true" value="3" type="radio" name="role"> <spring:message
												code="label.teacher" /></td>

									</tr>
									<tr>
									<td><div id = "hide_groups_action"><table><tr>
										<td>Choose a group</td>
									</tr>
									<tr>
										<td><div id="for_registration_group_select">
												<jsp:include page="/views/home/registration_groups.jsp"></jsp:include>
											</div><tr>
										<td><input type="hidden" id="groupNumber" name="groupNumber" value="0"></td>
									</tr></table></div></td>
									</tr>


									<tr>
										<td><p id="forGroupNumber" class="hidden_error">Choose group</p></td>
									</tr>

								</table>

							</td>

						</tr>

					</table>
					<div align="center">
						<table>
							<tr>
								<td><input type="button" class="btn btn-sample"
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
