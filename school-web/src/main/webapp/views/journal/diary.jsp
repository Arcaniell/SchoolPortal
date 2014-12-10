<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<link href="<c:url value="/resources/css/diary.css" />" rel="stylesheet">

<input id="weekDate" name="weekDate" value=" " type="hidden">
<nav class="table tableOnBack">
	
	<button id="prevWeek" class="btn btn-sample changeWeek" name="changePage"
		value="previous">
		<span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span>
		<spring:message code="diary.previous" />
	</button>
	<button id="nextWeek" class="btn btn-sample changeWeek"
		name="changePage" value="next">
		<spring:message code="diary.next" />
		<span class="glyphicon glyphicon-arrow-right" aria-hidden="true"></span>
	</button>
	<c:if test="${kids ne null}">
		<select id="kidSelect" name="kidSelect" class="btn btn-sample btnSelector">
			<c:forEach items="${kids}" var="kid">
				<option value="${kid.user.id}"><c:out
						value="${kid.user.firstName} ${kid.user.lastName}"></c:out></option>
			</c:forEach>
		</select>
	</c:if>

</nav>


<table id="noBorder" class="table tableOnBack">
	<tr>
		<td id="noBorder">
			<div>
				<table id="week" class="table">
					<tr id="day1">
					</tr>
					<tr id="day2">
					</tr>
					<tr id="day3">
					</tr>

				</table>
			</div>
		</td>
		<td id="noBorder">
			<div>
				<table id="week" class="table">
					<tr id="day4">
					</tr>
					<tr id="day5">

					</tr>
				</table>
			</div>
		</td>
	</tr>
</table>

<script src="<c:url value="https://code.jquery.com/jquery-1.10.2.js" />"></script>
<script
	src="<c:url value="https://code.jquery.com/ui/1.11.2/jquery-ui.js" />"></script>
<script src="<c:url value="/resources/js/diary.js" />"
	type="text/javascript"></script>