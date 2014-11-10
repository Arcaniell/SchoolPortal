<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
				<h4>Date</h4>
			</th>
			<th>
				<h4>Group</h4>
			</th>
			<th>
				<h4>Student</h4>
			</th>
			<th>
				<h4>Subject</h4>
			</th>
			<th></th>
		</tr>
		<form method="POST" action="journal/submit">
			<tr>
				<th>
					<div>
						<b> from: <input name="dateFrom" value="${dateFrom}"
							type="text" placeholder="From"
							class="datepicker form-control-small"> to:<input
							name="dateTo" value="${dateTo}" type="text" placeholder="To"
							class="datepicker form-control-small"></b>
					</div>

				</th>
				<th>
					<div>
						<b> number: <select name="groupNumber" value="${groupNumber}"
							class="form-control-small" placeholder="number">
								<option>5</option>
								<option>6</option>
								<option>7</option>
								<option>8</option>
								<option>9</option>
								<option>10</option>
								<option>11</option>
						</select> letter: <select name="groupLetter" value="${groupLetter}"
							class="form-control-small">
								<option>All</option>
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
							<option>All</option>
						</select>
					</div>
				</th>
				<th><div>
						<select name="subject" value="${subject}" class="form-control">
							<option>All</option>
						</select>
					</div></th>
				<th><button class="btn btn-default" type="submit">Submit</button></th>
			</tr>
		</form>
	</tbody>
</table>



<c:if test="${!empty scheduleDates}">
	<table id="docTable" class="table table-striped table-bordered">
		<tr>
			<th>Student</th>
			<c:forEach items="${scheduleDates}" var="date">
				<th>${date}</th>
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
