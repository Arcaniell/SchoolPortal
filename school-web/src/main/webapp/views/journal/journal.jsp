<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<link href="<c:url value="/resources/css/journal.css" />"
	rel="stylesheet">

<div id="RightSide">
	<table class="tabletableOnBackMark">
		<tr>
			<td>
				<form method="POST" action="journal-group-marks">
					<table class="table tableSider">
						<tr class="trSize trSide">
							<th id="RightSideBarJournal" class="thButton">
								<h4>
									<spring:message code="journal.subject" />
								</h4>
							</th>
						</tr>

						<tr class="trSize trSide">
							<th id="RightSideBarJournal"><select name="course"
								class="form-control">
									<c:forEach items="${teacher.courseNames}" var="course">
										<option value=${course }><c:out value="${course}"></c:out></option>
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
								name="idGroup" class="form-control-small">
									<c:forEach items="${teacher.groups}" var="group">
										<option value="${group.id}">${group.number}
											${group.letter}</option>
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
								name="quarter" class="form-control-small">
									<option value="1">
										<spring:message code="journal.first" />
									</option>
									<option value="2">
										<spring:message code="journal.second" />
									</option>
									<option value="3">
										<spring:message code="journal.third" />
									</option>
									<option value="4">
										<spring:message code="journal.fourth" />
									</option>
							</select></th>
						<tr class="trSize trSide">
							<th id="RightSideBarJournal" class="thButton"><button
									class="btn btn-default" type="submit">
									<spring:message code="journal.submit" />
								</button></th>
						</tr>
					</table>
				</form>
			</td>
		</tr>
	</table>
</div>

<script src="<c:url value="https://code.jquery.com/jquery-1.10.2.js" />"></script>
<script
	src="<c:url value="https://code.jquery.com/ui/1.11.2/jquery-ui.js" />"></script>
<script src="<c:url value="/resources/js/journal.js" />"
	type="text/javascript"></script>
