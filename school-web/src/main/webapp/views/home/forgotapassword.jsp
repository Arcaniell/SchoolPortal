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
				<form action="" id="forgot_form">
					<table>
						<tr>
							<td><div align="center">
									<table>
										<tr>
											<td><h4>
													<spring:message code="label.forgotapassword.hint" />
												</h4></td>
										</tr>
									</table>
								</div></td>
						</tr>
						<tr>
							<td><div align="center">
									<table>
										<tr>

											<td><input type="text" name="email" id="forgot_email"
												class="question_drop_short"></td>
										</tr>
									</table>
								</div></td>
						</tr>
						<tr>
							<td>
								<table>
									<tr>
										<td><br>
											<div class="btn-group btn-group-vertical">
												<input type="button" id="fquestion"
													class="dropdown-toggle question_drop_long"
													data-toggle="dropdown"
													value="<spring:message code="label.question1" /> ">
												<span class="caret" id="for_caret"></span>
												<ul class="dropdown-menu" role="menu">
													<li class="fquestion" id="question1"><spring:message
															code="label.question1" /></li>
													<li class="fquestion" id="question2"><spring:message
															code="label.question2" /></li>
													<li class="fquestion" id="question3"><spring:message
															code="label.question3" /></li>
													<li class="fquestion" id="question4"><spring:message
															code="label.question4" /></li>
													<li class="fquestion" id="question5"><spring:message
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
												<input type="hidden" id="forgotQuestionNumber"
													name="questionNumber" value="question1">
											</div></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td><div align="center">
									<table>
										<tr>
											<td>
												<h4>
													<spring:message code="label.ansver" />
												</h4>
											</td>
										</tr>
										<tr>
											<td><div align="center">
													<table>
														<tr>
															<td><input name="questionAnsver"
																id="forgotQuestionAnsver" type="text"
																class="question_drop_short"></td>
														</tr>
													</table>
												</div></td>
										</tr>
									</table>

								</div></td>
						</tr>

						<tr>
							<td><div align="center">
									<br>
									<table>
										<tr>
											<td><input type="button" class="btn btn-sample"
												id="forgot_button"
												value="<spring:message code="label.changeapassword"/>" /> <input
												type="button" class="hidden_error"
												id="forgotAPasswordButtonSucces" data-toggle="modal"
												class="close" data-dismiss="modal"
												data-target="#forgotAPasswordSucces" /> <input
												type="button" class="hidden_error"
												id="forgotAPasswordButtonFailure" data-toggle="modal"
												data-target="#forgotAPasswordFailure" /></td>
										</tr>
									</table>
								</div></td>
						</tr>
					</table>
				</form>
			</div>

		</div>
	</div>
</div>
