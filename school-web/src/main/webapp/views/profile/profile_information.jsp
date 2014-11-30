<%@ page language="java" contentType="text/html; charset=UTF8"
	pageEncoding="UTF8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<h2 align="center">${profile.profileName}</h2>

<table class="profile_table">
	<tr>
		<td><img class="logo"
			src="<c:url value="/photo/${profile.profileId}" />" />
			</td>
		<td>
			<h4>Position: ${profile.profileRole}</h4>
			<h4>Birthday: 11.11.1111</h4>
			<h4>Email: ${profile.profileEmail}</h4>
		</td>
	</tr>
	<c:if test="${profile.family != null }">
		<tr>
			<td colspan="2">
				<div class="profile_information">
					<c:choose>
						<c:when test="${fn:length(profile.family) gt 1}">
							<hr>
							<div align="center">
								<sec:authorize access="hasRole('ROLE_PARENT')">
									<p>Children</p>
								</sec:authorize>
								<sec:authorize access="hasRole('ROLE_STUDENT')">
									<p>Parent</p>
								</sec:authorize>
							</div>

						</c:when>
						<c:otherwise>

							<hr>
							<div align="center">
								<sec:authorize access="hasRole('ROLE_PARENT')">
									<p>Child</p>
								</sec:authorize>
								<sec:authorize access="hasRole('ROLE_STUDENT')">
									<p>Parents</p>
								</sec:authorize>
							</div>
						</c:otherwise>
					</c:choose>

					<div class="chield_and_parent_container">
						<table class="table">
							<tr>
								<c:forEach items="${profile.family}" var="family_member">

									<td>
										<table class="profile_modal" id="${family_member.profileId}">
											<tr>
												<td><img class="logo small_logo"
													src="<c:url value="/photo/${family_member.profileId}" />" /></td>
												<td class="all_in_one_line">

													<h5>${family_member.profileName}</h5>
													<h6>Position: ${family_member.profileRole}</h6>
													<h6>Birthday: 11.11.1111</h6>
													<h6>Email: ${family_member.profileEmail}</h6>
												</td>
											</tr>
										</table>



									</td>
								</c:forEach>
							</tr>
						</table>
					</div>

				</div>
			</td>


		</tr>
	</c:if>






</table>

<input type="button" class="hidden_error" id="profileModalButton"
	data-toggle="modal" data-target="#profile_modal" />

<div id="profile_modal" class="modal fade" tabindex="-1" role="dialog">
	<div class="modal-dialog">
		<br>
		<div class="modal-content" align="center">

			<div class="modal-body">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>

				<div id="profile_modal_content"></div>

			</div>

		</div>
	</div>
</div>


