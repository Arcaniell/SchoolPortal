<%@ page language="java" contentType="text/html; charset=UTF8"
	pageEncoding="UTF8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<link href="<c:url value="/resources/css/token-input.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/css/token-input-facebook.css" />"
	rel="stylesheet">

<script src="<c:url value="/resources/js/jquery.autosize.js" />"></script>
<script src="<c:url value="/resources/js/jquery.tokeninput.js" />"></script>

<h2 align="center">${profile.profileName}</h2>

<table class="profile_table">
	<tr>
		<td><img class="logo"
			src="<c:url value="/photo/${profile.profileId}" />" /></td>
		<td>
			<h4>Position: ${profile.profileRole}</h4>
			<h4>Birthday: 11.11.1111</h4>
			<h4>Email: ${profile.profileEmail}</h4> <sec:authorize
				access="hasRole('ROLE_PARENT')">
				<c:set var="profileRole" value="${profile.profileRole}" />
				<c:if test="${profileRole == 'Teacher'}">
					<c:set var="namePlusEmail"
						value="${profile.profileName} - ${profile.profileEmail}" />
					<input class="btn btn-sample" data-toggle="modal"
						data-target="#composeModal" data-id="${namePlusEmail}"
						data-dismiss="modal" type="button" value="Write message"
						id="profile_message_button">
				</c:if>
			</sec:authorize> <sec:authorize access="hasRole('ROLE_TEACHER')">
				<c:set var="profileRole" value="${profile.profileRole}" />
				<c:if test="${profileRole == 'Parent'}">
					<c:set var="namePlusEmail"
						value="${profile.profileName} - ${profile.profileEmail}" />
					<input class="btn btn-sample" data-toggle="modal"
						data-target="#composeModal" data-id="${namePlusEmail}"
						data-dismiss="modal" type="button" value="Write message"
						id="profile_message_button">
				</c:if>
			</sec:authorize>
		</td>
	</tr>
	<c:if test="${profile.family != null }">
		<tr>
			<td colspan="2">
				<div class="profile_information">

					<hr>
					<div align="center">${profile.profileFamilyDescription}</div>


					<hr>

					<div class="chield_and_parent_container">
						<table>
							<tr>
								<c:forEach items="${profile.family}" var="family_member">

									<td>
										<table class="table table-hover">
											<tr>
												<td><img class="logo small_logo"
													src="<c:url value="/photo/${family_member.profileId}" />" /></td>
												<td class="all_in_one_line">

													<h5 class="profile_modal" id="${family_member.profileId}">
														${family_member.profileName}</h5>
													<h6>Position: ${family_member.profileRole}</h6>
													<h6>Birthday: 11.11.1111</h6>
													<h6>Email: ${family_member.profileEmail}</h6> <sec:authorize
														access="hasRole('ROLE_TEACHER')">
														<c:set var="profileR" value="${profile.profileRole}" />
														<c:set var="profileRole"
															value="${fn:substring(profileR, 0, 7)}" />
														<c:if test="${profileRole == 'Student'}">
															<c:set var="namePlusEmail"
																value="${profile.profileName} - ${profile.profileEmail}" />
															<input class="btn1 btn-sample1 " type="button"
																data-toggle="modal" data-id="${namePlusEmail}"
																data-dismiss="modal" data-target="#composeModal"
																value="Write message" id="profile_message_button">
														</c:if>
													</sec:authorize>
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
<script>
	$(document).on(
			"click",
			"#profile_message_button",
			function() {
				var nameAndEmail = $(this).data('id');
				$(".token-input-list-facebook").remove();
				$(".token-input-token-facebook").remove();
				$('#tokenfieldtypeahead').tokenInput(
						"${pageContext.request.contextPath}/emailInput", {
							theme : "facebook",
							queryParam : 'tagName',
							preventDuplicates : true,
							prePopulate : [ {
								id : 999,
								name : nameAndEmail
							} ]
						});
				$('#tokenfieldtypeahead').html("123 - asd");
			});
</script>

