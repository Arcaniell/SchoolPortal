<%@ page language="java" contentType="text/html; charset=UTF8"
	pageEncoding="UTF8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<div>
	<div class="home">
		<div align="center">

			<img class="home_image"
				src="<c:url value="/resources/img/school.jpg" />" />
		</div>
		<div class="news">
			<table class="table table-hover">
				<c:forEach items="${newsList}" var="news">
					<c:if test="${news.information == false }">
						<tr>
							<td>
								<div>
									<img
										src="<c:url value="/resources/img/news/news${news.id}.jpg" />" />
								</div>
							</td>
							<td>
								<div>
									<h3>${news.title}</h3>
								</div>
								<p>${news.body}</p>
							</td>
						</tr>
					</c:if>
				</c:forEach>
			</table>
		</div>
	</div>

	<div class="home_info">
		<input type="button" class="hidehomeinfo" value="&uarr;"> <input
			type="button" class="showhomeinfo" value="&darr;">
		<table class="table table-hover">
			<c:forEach items="${newsList}" var="news">
				<c:if test="${news.information == true }">
					<tr data-toggle="modal" data-dismiss="modal"
						data-target="#news${news.id}">
						<td>
							<div>
								<img
									src="<c:url value="/resources/img/news/news${news.id}.jpg" />" />
							</div>
						</td>
						<td>
							<div>
								<h5>${news.title}</h5>



								<div id="news${news.id}" class="modal" tabindex="-1"
									role="dialog">
									<div class="modal-dialog">
										<div class="modal-content" align="center">
											<div class="modal-header">
												<button type="button" class="close">×</button>
												<h3 class="modal-title">${news.title}</h3>
											</div>
											<div class="modal-body">
												<div>
													<img
														src="<c:url value="/resources/img/news/news${news.id}.jpg" />" />
												</div>
												<div>
													<p>${news.body}</p>
												</div>


											</div>
										</div>
									</div>
								</div>



							</div>
						</td>
					</tr>

				</c:if>
			</c:forEach>
		</table>
	</div>
</div>
