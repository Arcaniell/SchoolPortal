<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>


<link href="<c:url value="/resources/css/journal.css" />"
	rel="stylesheet">



<div>
	<table class="table tableOnBackMark">
		<tbody class="bodyJournal">
			<tr>
				<td id="RightSideBarJournal">
					<table id="studentsNamesOfGroup"
						class="table table-striped table-bordered">
					</table>
				</td>
				<td id="RightSideBarJournal">
					<div class="table-responsive">
						<table class="tableMark table table-striped table-bordered ">
							<tr class="info trHeaderRow">
								<c:forEach items="${dates}" var="date">
									<th><fmt:formatDate value="${date.schedule.date}"
											pattern="dd.MM.yy" /></th>
								</c:forEach>
							</tr>
							<c:forEach items="${groupMarks}" var="studentMark">
								<tr class="trSize">
									<c:forEach items="${studentMark.diaryMark}" var="mark">
										<c:if test="${mark.journal.mark eq 0}">
											<td id="studentAndSchedule"
												data-value="${studentMark.studentId};${mark.schedule.id}"
												class="tdCenter addMark" data-toggle="modal"
												data-target=".journal-add-mark-modal"><c:out value=" "></c:out>
											</td>
										</c:if>
										<c:if test="${mark.journal.mark ne 0}">
											<td class="tdCenter"><c:out value="${mark.journal.mark}"></c:out>
												<input type="hidden" id="groupInfo"
												value="${mark.schedule.group.number} ${mark.schedule.group.letter}">
											</td>
										</c:if>
									</c:forEach>
								</tr>
							</c:forEach>
						</table>
					</div>
				</td>
				<td id="RightSideBarJournal">
					<div id="RightSide">
						<table class="tabletableOnBackMark">
							<tr>
								<td id="RightSideBarJournal">
									<!-- <form method="POST" action="journal-group-marks"> -->
									<table class="table tableSider">
										<tr class="trSize trSide">
											<th id="RightSideBarJournal" class="thButton">
												<h4>
													<spring:message code="journal.subject" />
												</h4>
											</th>
										</tr>

										<tr class="trSize trSide">
											<th id="RightSideBarJournal"><select id="subjectSelect"
												name="course" class="form-control">
													<c:forEach items="${teacher.courseNames}" var="course">
														<option value="${course }"><c:out
																value="${course}"></c:out></option>
													</c:forEach>
											</select></th>
										</tr>
										<tr class="trSize trSide">
											<th id="RightSideBarJournal" class="thButton">
												<h4>
													<spring:message code="journal.group" />
												</h4>
											</th>
										</tr>
										<tr class="trSize trSide">
											<th id="RightSideBarJournal" class="thButton"><select
												id="groupNumberSelect" name="groupNumber"
												class="form-control-small">
											</select> <select id="groupLetterSelect" name="groupLetter"
												class="form-control-small">
											</select></th>
										</tr>
										<tr class="trSize trSide">
											<th id="RightSideBarJournal" class="thButton"><h4>
													<spring:message code="journal.quarter" />
												</h4></th>
										</tr>
										<tr class="trSize trSide">
											<th id="RightSideBarJournal" class="thButton"><select
												id="quarterSelect" name="quarter" class="form-control-small">
													<option value="1"><spring:message
															code="journal.first" /></option>
													<option value="2"><spring:message
															code="journal.second" /></option>
													<option value="3"><spring:message
															code="journal.third" /></option>
													<option value="4"><spring:message
															code="journal.fourth" /></option>
											</select></th>
										<tr class="trSize trSide">
											<th id="RightSideBarJournal" class="thButton"><button
													id="submitSearch" class="btn btn-default" type="button">
													<spring:message code="journal.submit" />
												</button></th>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</div>
				</td>
			</tr>
		</tbody>
	</table>
</div>


<div class="modal fade journal-add-mark-modal" tabindex="-1"
	role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>

				<h4 class="modal-title">
					<spring:message code="journal.add_mark" />
				</h4>
			</div>
			<form action="journal-group-marks-add-mark" method="post">
				<input id="dateAndStudent" name="studentAndSchedule" type="hidden"
					value=" " />
				<div class="modal-body">
					<table class="table">
						<tr class="trSize">
							<th id="RightSideBarJournal" class="thButton tdCenter"><spring:message
									code="journal.select_mark" /></th>

						</tr>
						<tr>
							<td id="RightSideBarJournal" class="thButton tdCenter"><select
								id="markSelect" name="markSelect" class="form-control-small">
									<option value="0"><spring:message code="journal.none" /></option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									<option value="9">9</option>
									<option value="10">10</option>
									<option value="11">11</option>
									<option value="12">12</option>
							</select></td>
						</tr>
						<tr class="trSize">
							<th id="RightSideBarJournal" class="thButton tdCenter "><spring:message
									code="journal.select_mark_status" /></th>
						</tr>
						<tr>
							<td id="RightSideBarJournal" class="thButton tdCenter"><select
								id="coefficient" name="coefficient" class="form-control-small">
									<option value="1"><spring:message
											code="journal.regular" /></option>
									<option value="3"><spring:message code="journal.test" /></option>
									<option value="5"><spring:message code="journal.exam" /></option>
							</select></td>

						</tr>
						<tr class="trSize">
							<th id="RightSideBarJournal" class="thButton tdCenter"><spring:message
									code="journal.select_note" /></th>
						</tr>
						<tr>
							<td id="RightSideBarJournal" class="thButton tdCenter"><select
								id="note" name="note" class="form-control">
									<option value="0"><spring:message code="journal.none" /></option>
									<option value="1"><spring:message
											code="journal.student_absent" /></option>
							</select></td>
						</tr>
					</table>
				</div>
				<div class="modal-footer">
					<table class="table">
						<tr>
							<td id="RightSideBarJournal">
								<button id="submitMark" type="submit" class="btn btn-default"
									value=" ">OK</button>
							</td>
							<td id="RightSideBarJournal">
								<button id="cancelMark" type="button" class="btn btn-default"
									data-dismiss="modal">
									<spring:message code="journal.cancel" />
								</button>
							</td>
						</tr>
					</table>
				</div>
			</form>
		</div>
	</div>
</div>


<script
	src="<c:url value="http://code.jquery.com/jquery-2.1.1.min.js" />"></script>
<script src="<c:url value="/resources/js/journal.js" />"
	type="text/javascript"></script>
<script
	src="<c:url value="https://code.jquery.com/ui/1.11.2/jquery-ui.js" />"></script>
<script src="<c:url value="https://code.jquery.com/jquery-1.10.2.js" />"></script>
<script src="<c:url value="/resources/js/bootstrap-select.min.js" />"
	type="text/javascript"></script>