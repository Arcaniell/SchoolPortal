<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script src="<c:url value="https://code.jquery.com/jquery-1.10.2.js" />"></script>
<script
	src="<c:url value="https://code.jquery.com/ui/1.11.2/jquery-ui.js" />"></script>
<script src="<c:url value="/resources/js/journal.js" />"
	type="text/javascript"></script>

<link href="<c:url value="/resources/css/diary.css" />" rel="stylesheet">

<nav>
	<ul class="pagination">
		<li><a href="#"><span aria-hidden="true">&laquo;</span><span
				class="sr-only">Previous</span></a></li>

		<li><a href="#"><span aria-hidden="true">&raquo;</span><span
				class="sr-only">Next</span></a></li>
	</ul>
</nav>

<table class="table tableOnBack">
	<tr>
		<td>
			<div>
				<table class="table">
					<tr>
						<td>
							<div>
								<table class="table table-striped">
									<thead class="divHeader">
										<tr>
											<td>MONDAY</td>
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
										<c:forEach items="${diaryMarks}" var="dm" begin="0" end="0">
											<c:forEach items="${dm.diaryMark }" var="mark">
												<tr>
													<td><c:out value="${mark.id }">
														</c:out></td>
													<td><c:out value="${mark.schedule.course.courseName}"></c:out></td>
													<td></td>
													<td><c:if test="${mark.journal.mark eq 0}">
															<c:out value=""></c:out>
														</c:if> <c:if test="${mark.journal.mark ne 0}">
															<c:out value="${mark.journal.mark}"></c:out>
														</c:if></td>
												</tr>
											</c:forEach>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div>
								<table class="table table-striped">
									<thead class="divHeader">
										<tr>
											<td>TUESDAY</td>
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
										<c:forEach items="${diaryMarks}" var="dm" begin="1" end="1">
											<c:forEach items="${dm.diaryMark }" var="mark">
												<tr>
													<td><c:out value="${mark.id }"></c:out></td>
													<td><c:out value="${mark.schedule.course.courseName}"></c:out></td>
													<td></td>
													<td><c:out value="${mark.journal.mark}"></c:out></td>
												</tr>
											</c:forEach>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div>
								<table class="table table-striped">
									<thead class="divHeader">
										<tr>
											<td>WEDNESDAY</td>
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
										<c:forEach items="${diaryMarks}" var="dm" begin="2" end="2">
											<c:forEach items="${dm.diaryMark }" var="mark">
												<tr>
													<td><c:out value="${mark.id }"></c:out></td>
													<td><c:out value="${mark.schedule.course.courseName}"></c:out></td>
													<td></td>
													<td><c:out value="${mark.journal.mark}"></c:out></td>
												</tr>
											</c:forEach>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</td>
					</tr>
				</table>
			</div>
		</td>
		<td>
			<div>
				<table class="table table-back ">
					<tr>
						<td>
							<div>
								<table class="table table-striped">
									<thead class="divHeader">
										<tr>
											<td>THURSDAY</td>
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
										<c:forEach items="${diaryMarks}" var="dm" begin="3" end="3">
											<c:forEach items="${dm.diaryMark }" var="mark">
												<tr>
													<td><c:out value="${mark.id }"></c:out></td>
													<td><c:out value="${mark.schedule.course.courseName}"></c:out></td>
													<td></td>
													<td><c:out value="${mark.journal.mark}"></c:out></td>
												</tr>
											</c:forEach>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div>
								<table class="table table-striped">
									<thead class="divHeader">
										<tr>
											<td>FRIDAY</td>
										</tr>
									</thead>
								</table>
							</div>
							<div>
								<table class="table tableInside">
									<tbody>

										<tr class="info">
											<th class="thSizeN">N</th>
											<th class="thSizeSubject">Lesson</th>
											<th>Notes</th>
											<th class="thSizeMark">Mark</th>
										</tr>
										<c:forEach items="${diaryMarks}" var="dm" begin="4">
											<c:forEach items="${dm.diaryMark }" var="mark">
												<tr>
													<td><c:out value="${mark.id }"></c:out></td>
													<td><c:out value="${mark.schedule.course.courseName}"></c:out></td>
													<td></td>
													<td><c:out value="${mark.journal.mark}"></c:out></td>
												</tr>
											</c:forEach>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div>
								<table class="table table-striped">
									<thead class="divHeader">
										<tr>
											<td>SATURDAY</td>
										</tr>
									</thead>
								</table>
							</div>
							<div>
								<table class="table">
									<tbody>

										<tr class="info">
											<th class="thSizeN">N</th>
											<th class="thSizeSubject">Lesson</th>
											<th>Notes</th>
											<th class="thSizeMark">Mark</th>
										</tr>
									</tbody>
								</table>
							</div>
						</td>
					</tr>
				</table>
			</div>
		</td>
	</tr>
</table>
