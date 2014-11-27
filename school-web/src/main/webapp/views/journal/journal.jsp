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
						<table id="journalStudentMarksJS"
							class="tableMark table table-striped table-bordered ">
						</table>
					</div>
				</td>
				<td id="RightSideBarJournal">
					<div id="RightSide">
						<table class="tabletableOnBackMark">
							<tr>
								<td id="RightSideBarJournal">
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
													id="submitSearch" class="btn btn2" type="button">
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

				<h4 class="modal-title">Set event on this day</h4>
			</div>
			<input id="dateEvent" value=" ">
			<div class="modal-body">

				<table id="markSelectTable" class="table">
					<tr class="trSize">
						<th id="RightSideBarJournal" class="thButton tdCenter ">Select
							event type</th>
					</tr>
					<tr>
						<td id="RightSideBarJournal" class="thButton tdCenter"><select
							id="eventTypeSelect" name="coefficient"
							class="form-control-small">
								<option value="3"><spring:message code="journal.test" /></option>
								<option value="5"><spring:message code="journal.exam" /></option>
						</select></td>

					</tr>
					<tr class="trSize">
						<th id="RightSideBarJournal" class="thButton tdCenter">Write
							event description</th>
					</tr>
					<tr>
						<td id="RightSideBarJournal" class="thButton tdCenter"><input
						id="eventDescriptionSelect"
							type="text" class="form-control" placeholder="Event description">
						</td>
					</tr>
				</table>
				<table class="table">
					<tr>
						<td id="RightSideBarJournal">
							<button id="submitEvent" type="button" class="btn btn-default"
								data-dismiss="modal">OK</button>
						</td>
						<td id="RightSideBarJournal">
							<button id="cancelEvent" type="button" class="btn btn-default"
								data-dismiss="modal">
								<spring:message code="journal.cancel" />
							</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</div>
<script
	src="<c:url value="http://code.jquery.com/jquery-2.1.1.min.js" />">
	
</script>
<script src="<c:url value="/resources/js/journal.js" />"
	type="text/javascript"></script>
<script
	src="<c:url value="https://code.jquery.com/ui/1.11.2/jquery-ui.js" />"></script>

<script src="<c:url value="https://code.jquery.com/jquery-1.10.2.js" />">
	
</script>
<script
	src="<c:url value="https://code.jquery.com/ui/1.11.2/jquery-ui.js" />"></script>
<script src="<c:url value="/resources/js/bootstrap-select.min.js" />"
	type="text/javascript"></script>
<!--  
<script
	src="<c:url value="http://code.jquery.com/jquery-2.1.1.min.js" />"></script>
<script
	src="<c:url value="https://code.jquery.com/ui/1.11.2/jquery-ui.js" />"></script>
<script src="<c:url value="https://code.jquery.com/jquery-1.10.2.js" />"></script>
<script src="<c:url value="/resources/js/bootstrap-select.min.js" />"
	type="text/javascript"></script>
<script src="<c:url value="/resources/js/journal.js" />"
	type="text/javascript"></script> -->