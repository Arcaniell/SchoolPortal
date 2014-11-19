<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<link href="<c:url value="/resources/css/diary.css" />" rel="stylesheet">

<nav>
	<form action="diary-change" method="post">
		<input name="date" value="${diaryMarks[0].date}" type="hidden">
		<button class="btn btn-default  btn-lg" type="submit"
			name="changePage" value="previous">
			<span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span> Prev
		</button>
		<button class="btn btn-default  btn-lg" type="submit"
			name="changePage" value="next">
			Next <span class="glyphicon glyphicon-arrow-right" aria-hidden="true"></span>
		</button>
	</form>
</nav>


<table class="table tableOnBack">
	<tr>
		<td>
			<div>
				<table class="table">
					<c:forEach items="${diaryMarks}" var="dm" begin="0" end="2">
						<tr>
							<td>
								<div>
									<table class="table table-striped">
										<thead class="divHeader">
											<tr>
												<td><fmt:formatDate value="${dm.date }"
														pattern="EEEE dd.MM.yyyy" /></td>
											</tr>
										</thead>
									</table>
								</div>
								<div class="table-responsive">
									<table class="table">
										<tbody>

											<tr class="info">
												<th class="thSizeN">N</th>
												<th class="thSizeSubject">Lesson</th>
												<th>Notes</th>
												<th class="thSizeMark">Mark</th>
											</tr>
											<c:forEach items="${dm.diaryMark }" var="mark">
												<tr>
													<td><c:out value="${mark.id }">
														</c:out></td>
													<td><c:out value="${mark.schedule.course.courseName}"></c:out></td>
													<td></td>
													<td class="tdCenter"><c:if
															test="${mark.journal.mark eq 0}">
															<c:out value=""></c:out>
														</c:if> <c:if test="${mark.journal.mark ne 0}">
															<c:out value="${mark.journal.mark}"></c:out>
														</c:if></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</td>
		<td>
			<div>
				<table class="table table-back ">
					<c:forEach items="${diaryMarks}" var="dm" begin="3" end="4">
						<tr>
							<td>
								<div>
									<table class="table table-striped">
										<thead class="divHeader">
											<tr>
												<td><fmt:formatDate value="${dm.date }"
														pattern="EEEE dd.MM.yyyy" /></td>
											</tr>
										</thead>
									</table>
								</div>
								<div class="table-responsive">
									<table class="table">
										<tbody>

											<tr class="info">
												<th class="thSizeN">N</th>
												<th class="thSizeSubject">Lesson</th>
												<th>Notes</th>
												<th class="thSizeMark">Mark</th>
											</tr>
											<c:forEach items="${dm.diaryMark }" var="mark">
												<tr>
													<td><c:out value="${mark.id }">
														</c:out></td>
													<td><c:out value="${mark.schedule.course.courseName}"></c:out></td>
													<td></td>
													<td class="tdCenter"><c:if
															test="${mark.journal.mark eq 0}">
															<c:out value=""></c:out>
														</c:if> <c:if test="${mark.journal.mark ne 0}">
															<c:out value="${mark.journal.mark}"></c:out>
														</c:if></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</td>
	</tr>
</table>

<script src="<c:url value="https://code.jquery.com/jquery-1.10.2.js" />"></script>
<script
	src="<c:url value="https://code.jquery.com/ui/1.11.2/jquery-ui.js" />"></script>
<script src="<c:url value="/resources/js/journal.js" />"
	type="text/javascript"></script>
