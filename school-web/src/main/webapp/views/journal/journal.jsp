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

<table class="table table-condensed">
	<tbody>
		<tr>
			<th>
				<h4>
					<spring:message code="journal.date" />
				</h4>
			</th>
			<th>
				<h4>
					<spring:message code="journal.group" />
				</h4>
			</th>
			<th>
				<h4>
					<spring:message code="journal.student" />
				</h4>
			</th>
			<th>
				<h4>
					<spring:message code="journal.subject" />
				</h4>
			</th>
			<th></th>
		</tr>
		<form method="POST" action="journal/submit">
			<tr>
				<th>
					<div>
						<b> <spring:message code="journal.date.from" /> <input
							name="dateFrom" value="${dateFrom}" type="text"
							placeholder="<spring:message code="journal.date.from"/>"
							class="datepicker form-control-small"> <spring:message
								code="journal.date.to" /> <input name="dateTo"
							value="${dateTo}" type="text"
							placeholder="<spring:message code="journal.date.to"/>"
							class="datepicker form-control-small"></b>
					</div>

				</th>
				<th>
					<div>
						<b> <spring:message code="journal.group.number" /> <select
							name="groupNumber" value="${groupNumber}"
							class="form-control-small" placeholder="number">
								<option>5</option>
								<option>6</option>
								<option>7</option>
								<option>8</option>
								<option>9</option>
								<option>10</option>
								<option>11</option>
						</select> <spring:message code="journal.group.letter" /> <select
							name="groupLetter" value="${groupLetter}"
							class="form-control-small">
								<option><spring:message code="journal.all" /></option>
								<option>A</option>
								<option>B</option>
								<option>C</option>
								<option>D</option>
						</select>
						</b>
					</div>
				</th>
				<th>
					<div>
						<select name="student" value="${student}" class="form-control">
							<option><spring:message code="journal.all" /></option>
						</select>
					</div>
				</th>
				<th><div>
						<select name="subject" value="${subject}" class="form-control">
							<option><spring:message code="journal.all" /></option>
						</select>
					</div></th>
				<th><button class="btn btn-default" type="submit">
						<spring:message code="journal.submit" />
					</button></th>
			</tr>
		</form>
	</tbody>
</table>



<c:if test="${!empty scheduleDates}">
	<table id="docTable" class="table table-striped table-bordered">
		<tr>
			<th><spring:message code="journal.student" /></th>
			<c:forEach items="${scheduleDates}" var="date">
				<th><fmt:formatDate value="${date}" pattern="dd.MM.yy" /></th>
			</c:forEach>
		</tr>
		<c:forEach items="${studentMarks}" var="student">
			<tr>
				<th>${student.key}</th>
				<c:forEach items="${scheduleDates}" var="date">
					<td><c:forEach items="${student.value}" var="journal">
							<c:if test="${date == journal.date}">
								<c:out value="${journal.mark}"></c:out>
							</c:if>
							<c:if test="${date ne journal.date}">
								<c:out value=" "></c:out>
							</c:if>
						</c:forEach></td>
				</c:forEach>
			</tr>
		</c:forEach>
	</table>
</c:if>
