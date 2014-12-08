<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>


<link href="<c:url value="/resources/css/journal.css" />"
	rel="stylesheet">

<div class="journalTitle" >
	<h3>Journal</h3>
</div>
<div>
	<table class="table tableOnBackMark">
		<tbody class="bodyJournal">
			<tr>
				<td id="RightSideBarJournal" class="sizeForNames">
					<table id="studentsNamesOfGroup"
						class="table table-striped table-bordered sizeForNames">
						<tr class="info trHeaderRow">
							<th>Students</th>
						</tr>
						<c:forEach items="${groupMarks}" var="studentWithMarks">
							<tr>
								<th><c:out value="${studentWithMarks.studentName}"></c:out>
								</th>
							</tr>
						</c:forEach>
					</table>
				</td>
				<td id="RightSideBarJournal" class="tableMarkPosition">
					<div class="table-responsive">
						<table id="journalStudentMarksJS"
							class="tableMark table table-striped table-bordered ">

							<c:forEach items="${groupMarks}" var="studentWithMarks" begin="0"
								end="0">
								<tr class="info trHeaderRow">
									<c:forEach items="${studentWithMarks.markList}" var="markList">
										<th data-toggle="modal" data-target=".journal-add-mark-modal"
											class="date ${markList.scheduleId}"
											data-value="${markList.scheduleId}"><fmt:formatDate
												value="${markList.date}" pattern="dd.MM.yy" /></th>
									</c:forEach>
								</tr>
							</c:forEach>
							<c:forEach items="${groupMarks}" var="studentWithMarks">
								<tr class="trSize">
									<c:forEach items="${studentWithMarks.markList}" var="marks">
										<c:if test="${marks.mark eq 0}">
											<td name="mark${marks.scheduleId}"
												id="${studentWithMarks.studentId}j${marks.scheduleId}"
												data-value="${studentWithMarks.studentId}j${marks.scheduleId}"
												class="tdCenter addMark"><input id="dateAndStudent"
												type="hidden" value=" " />
												<ul class="nav nav-pills pillsSizeForMark">
													<li role="presentation" class="dropdown"><a
														class="btn2 dropdown-toggle markItemCnfg"
														data-toggle="dropdown"></a>
														<ul class="dropdown-menu" role="menu">
															<li class="selectOfMarkCnfg selectedMark" data-value="1"><a
																class="selectOfMarkCnfg"> 1</a></li>
															<li class="selectOfMarkCnfg selectedMark" data-value="2"><a
																class="selectOfMarkCnfg"> 2</a></li>
															<li class="selectOfMarkCnfg selectedMark" data-value="3"><a
																class="selectOfMarkCnfg"> 3</a></li>
															<li class="selectOfMarkCnfg selectedMark" data-value="4"><a
																class="selectOfMarkCnfg"> 4</a></li>
															<li class="selectOfMarkCnfg selectedMark" data-value="5"><a
																class="selectOfMarkCnfg"> 5</a></li>
															<li class="selectOfMarkCnfg selectedMark" data-value="6"><a
																class="selectOfMarkCnfg"> 6</a></li>
															<li class="selectOfMarkCnfg selectedMark" data-value="7"><a
																class="selectOfMarkCnfg"> 7</a></li>
															<li class="selectOfMarkCnfg selectedMark" data-value="8"><a
																class="selectOfMarkCnfg"> 8</a></li>
															<li class="selectOfMarkCnfg selectedMark" data-value="9"><a
																class="selectOfMarkCnfg"> 9</a></li>
															<li class="selectOfMarkCnfg selectedMark" data-value="10"><a
																class="selectOfMarkCnfg"> 10</a></li>
															<li class="selectOfMarkCnfg selectedMark" data-value="11"><a
																class="selectOfMarkCnfg"> 11</a></li>
															<li class="selectOfMarkCnfg selectedMark" data-value="12"><a
																class="selectOfMarkCnfg"> 12</a></li>
															<li class="divider"></li>
															<li class="selectOfMarkCnfg selectedMark" data-value="-1">
																<a role="menuitem" class="selectOfMarkCnfg selectedMark">Absent</a>
															</li>
														</ul></li>
												</ul></td>
										</c:if>
										<c:if test="${marks.mark eq (-1)}">
											<td class="tdCenter ${ marks.scheduleId}"><span
												class="glyphicon glyphicon-remove"> </span></td>
										</c:if>
										<c:if test="${marks.mark ne (-1) && marks.mark ne 0}">
											<td class="tdCenter ${ marks.scheduleId}"><c:out
													value="${marks.mark}"></c:out></td>
										</c:if>
									</c:forEach>
								</tr>
							</c:forEach>
						</table>
					</div>
				</td>
				<td id="RightSideBarJournal">
					<table class="table tableSider">
						<tr class="info trHeaderRow trSideHeader">
							<th id="RightSideBarJournal" class="thButton">
								<h4 style="text-align: center;">Journal search</h4>
							</th>
						</tr>

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
										<option value="${course }"><c:out value="${course}"></c:out></option>
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
									<c:forEach items="${teacher.groupNumbers}" var="groupNumber">
										<c:if test="${searchData.groupNumber eq groupNumber}">
											<option selected="selected" value="${groupNumber}"><c:out
													value="${groupNumber}"></c:out></option>
										</c:if>
										<c:if test="${searchData.groupNumber ne groupNumber}">
											<option value="${groupNumber}"><c:out
													value="${groupNumber}"></c:out></option>
										</c:if>
									</c:forEach>
							</select> <select id="groupLetterSelect" name="groupLetter"
								class="form-control-small">
									<c:forEach items="${teacher.groupLetters}" var="groupLetter">
										<c:if test="${searchData.groupLetter eq groupLetter}">
											<option selected="selected" value="${groupLetter}"><c:out
													value="${groupLetter}"></c:out></option>
										</c:if>
										<c:if test="${searchData.groupLetter ne groupLetter}">
											<option value="${groupLetter }"><c:out
													value="${groupLetter}"></c:out></option>
										</c:if>
									</c:forEach>
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
									<c:if test="${searchData.quarter eq 1}">
										<option selected="selected" value="1"><spring:message
												code="journal.first" /></option>
									</c:if>
									<c:if test="${searchData.quarter ne 1}">
										<option value="1"><spring:message
												code="journal.first" /></option>
									</c:if>
									<c:if test="${searchData.quarter eq 2}">
										<option selected="selected" value="2"><spring:message
												code="journal.second" /></option>
									</c:if>
									<c:if test="${searchData.quarter ne 2}">
										<option value="2"><spring:message
												code="journal.second" /></option>
									</c:if>
									<c:if test="${searchData.quarter eq 3}">
										<option selected="selected" value="3"><spring:message
												code="journal.third" /></option>
									</c:if>
									<c:if test="${searchData.quarter ne 3}">
										<option value="3"><spring:message
												code="journal.third" /></option>
									</c:if>
									<c:if test="${searchData.quarter eq 4}">
										<<option selected="selected" value="4"><spring:message
												code="journal.fourth" /></option>
									</c:if>
									<c:if test="${searchData.quarter ne 4}">
										<option value="4"><spring:message
												code="journal.fourth" /></option>>
									</c:if>
							</select></th>
						<tr class="trSize trSide">
							<th id="RightSideBarJournal" class="thButton"><button
									id="submitSearch" class="btn btn-sample" type="button">
									<spring:message code="journal.submit" />
								</button></th>
						</tr>
					</table>
				</td>
			</tr>
		</tbody>
	</table>
	<input id="clickSearchButton" type="hidden" value="${clickSearch}">
</div>


<div class="modal fade journal-add-mark-modal" tabindex="-1"
	role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>

				<h4 class="modal-title">Edit Date</h4>
			</div>
			<input id="editedDate" value=" " type="hidden">
			<div class="modal-body">
				<div class="checkbox editDateCheckBox">
					<label> <input id="eventCB" type="checkbox"> Add
						event
					</label>
				</div>
				<table id="eventSelect" class="table" hidden="hidden">
					<tr class="trSize">
						<th id="RightSideBarJournal" class="thButton tdCenter ">Select
							type</th>
					</tr>
					<tr>
						<td id="RightSideBarJournal" class="thButton tdCenter"><select
							id="eventTypeSelect" name="coefficient"
							class="form-control-small">
								<option value="0" disabled selected style="display: none;">Select</option>
								<option value="3"><spring:message code="journal.test" /></option>
								<option value="5"><spring:message code="journal.exam" /></option>
						</select></td>

					</tr>
					<tr class="trSize">
						<th id="RightSideBarJournal" class="thButton tdCenter">Write
							description</th>
					</tr>
					<tr>
						<td id="RightSideBarJournal" class="thButton tdCenter"><input
							id="eventDescriptionSelect" type="text" class="form-control"
							placeholder="Event description"></td>
					</tr>
				</table>
				<div class="checkbox editDateCheckBox">
					<label> <input id="homeworkCB" type="checkbox"> Add
						home work
					</label>
				</div>
				<table id="homeworkSelect" class="table" hidden="hidden">
					<tr class="trSize">
						<th id="RightSideBarJournal" class="thButton tdCenter ">Input
							tasks</th>
					</tr>
					<tr>
						<td id="RightSideBarJournal" class="thButton tdCenter"><input
							id="homeTasksSelect" type="text" class="form-control"
							placeholder="Home tasks"></td>
					</tr>
				</table>
				<table class="table">
					<tr>
						<td id="RightSideBarJournal" class="submitEditDateButton">
							<button id="submitEditDate" type="button" class="btn btn-default"
								data-dismiss="modal">OK</button>
						</td>
						<td id="RightSideBarJournal">
							<button id="cancelEditDate" type="button" class="btn btn-default"
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