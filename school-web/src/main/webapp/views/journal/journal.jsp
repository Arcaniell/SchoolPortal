<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script src="<c:url value="https://code.jquery.com/jquery-1.10.2.js" />"></script>
<script
	src="<c:url value="https://code.jquery.com/ui/1.11.2/jquery-ui.js" />"></script>
<script src="<c:url value="/resources/js/journal.js" />"
	type="text/javascript"></script>

<link href="<c:url value="/resources/css/journal.css" />"
	rel="stylesheet">

<div>
	<table class="table tableOnBackMark">
		<tr>
			<td>
				<table class="table table-striped table-bordered">
					<tr class="info">
						<th><spring:message code="journal.student" /></th>
					</tr>
					<c:forEach items="${groupMarks}" var="studentMark">
						<tr class="trSize">
							<th>${studentMark.studentName}</th>
						</tr>
					</c:forEach>
				</table>
			</td>
			<td>
				<div class="table-responsive">
					<table class="tableMark table table-striped table-bordered ">
						<tr class="info">
							<c:forEach items="${dates}" var="date">
								<th><fmt:formatDate value="${date.schedule.date }"
										pattern="dd.MM.yy" /></th>
							</c:forEach>
						</tr>
						<c:forEach items="${groupMarks}" var="studentMark">
							<tr class="trSize">
								<c:forEach items="${studentMark.diaryMark}" var="mark">
									<td class="tdCenter"><c:if test="${mark.journal.mark eq 0}">
											<c:out value=" ">
											</c:out>
										</c:if> <c:if test="${mark.journal.mark ne 0}">
											<c:out value="${mark.journal.mark}"></c:out>
										</c:if></td>
								</c:forEach>
							</tr>
						</c:forEach>
					</table>
				</div>
			</td>
			<td>
				<form method="POST" action="journal">
					<table class="table tableSider">
						<tr class="trSize trSide">
							<th class="thButton">
								<h4>

									<spring:message code="journal.subject" />
								</h4>
							</th>
						</tr>

						<tr class="trSize trSide">
							<th><select name="course" class="form-control">
									<c:forEach items="${teacher.courseNames}" var="course">
										<option value=${course }><c:out value="${course}"></c:out></option>
									</c:forEach>
							</select></th>
						</tr>
						<tr class="trSize trSide">
							<th class="thButton">
								<h4>
									<spring:message code="journal.group" />
								</h4>
							</th>
						</tr>
						<tr class="trSize trSide">
							<th class="thButton"><select name="idGroup"
								class="form-control-small">
									<c:forEach items="${teacher.groups}" var="group">
										<option value="${group.id}">${group.number}
											${group.letter}</option>
									</c:forEach>
							</select></th>
						</tr>
						<tr class="trSize trSide">
							<th class="thButton"><h4>Quarter</h4></th>
						</tr>
						<tr class="trSize trSide">
							<th class="thButton"><select name="quarter"
								class="form-control-small">
									<option value="1">1st</option>
									<option value="2">2nd</option>
									<option value="3">3rd</option>
									<option value="4">4th</option>
							</select></th>
						<tr class="trSize trSide">
							<th class="thButton"><button class="btn btn-default"
									type="submit">
									<spring:message code="journal.submit" />
								</button></th>
						</tr>
					</table>
				</form>
			</td>
		</tr>
	</table>
</div>