<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<link href="<c:url value="/resources/css/diary.css" />" rel="stylesheet">

<nav class="table tableOnBack">
	<form action="diary-parent/${kid.user.id}" method="post">
		<input name="date" value="${diaryMarks[0].date}" type="hidden">
		<button class="btn btn2 btn-lg" type="submit" name="changePage"
			value="previous">
			<span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span>
			<spring:message code="diary.previous" />
		</button>
		<button style="float: right;" class="btn btn2 btn-lg" type="submit"
			name="changePage" value="next">
			<spring:message code="diary.next" />
			<span class="glyphicon glyphicon-arrow-right" aria-hidden="true"></span>
		</button>
	</form>

	<div class="btn-group">
		<button type="button" class="btn btn2 btn-lg dropdown-toggle"
			data-toggle="dropdown" aria-expanded="false">
			Kids <span class="caret"></span>
		</button>
		<ul class="dropdown-menu" role="menu">
			<c:forEach items="${kids}" var="kid">
				<li><a href='<c:url value="/diary-parent/${kid.user.id}"/>'>${kid.user.firstName }${kid.user.lastName}</a></li>
			</c:forEach>
		</ul>
	</div>
</nav>
<c:if test="${diaryMarks ne null}">
	<table id="noBorder" class="table tableOnBack">
		<tr>
			<td id="noBorder">
				<div>
					<table id="noBorder" class="table">
						<c:forEach items="${diaryMarks}" var="dm" begin="0" end="2">
							<tr>
								<td id="noBorder">
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
													<th class="thSizeN"><spring:message code="diary.num" /></th>
													<th class="thSizeSubject"><spring:message
															code="diary.lesson" /></th>
													<th><spring:message code="diary.note" /></th>
													<th class="thSizeMark"><spring:message
															code="diary.mark" /></th>
												</tr>
												<c:forEach items="${dm.diaryMark }" var="mark">
													<tr>
														<td><c:out value="${mark.id }">
															</c:out></td>
														<td data-toggle="tooltip"
															title="Teacher-${mark.schedule.teacher.user.firstName} ${mark.schedule.teacher.user.lastName}"><c:out
																value="${mark.schedule.course.courseName}"></c:out></td>
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
			<td id="noBorder">
				<div>
					<table id="noBorder" class="table table-back ">
						<c:forEach items="${diaryMarks}" var="dm" begin="3" end="4">
							<tr>
								<td id="noBorder">
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
													<th class="thSizeN"><spring:message code="diary.num" /></th>
													<th class="thSizeSubject"><spring:message
															code="diary.lesson" /></th>
													<th><spring:message code="diary.note" /></th>
													<th class="thSizeMark"><spring:message
															code="diary.mark" /></th>
												</tr>
												<c:forEach items="${dm.diaryMark }" var="mark">
													<tr>
														<td><c:out value="${mark.id }">
															</c:out></td>
														<td><c:out value="${mark.schedule.course.courseName}"></c:out></td>
														<td></td>
														<td class="tdCenter"><c:if
																test="${mark.journal.mark eq 0}">
																<c:out value=" "></c:out>
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
</c:if>
<script src="<c:url value="https://code.jquery.com/jquery-1.10.2.js" />"></script>
<script
	src="<c:url value="https://code.jquery.com/ui/1.11.2/jquery-ui.js" />"></script>
<script src="<c:url value="/resources/js/diary.js" />"
	type="text/javascript"></script>