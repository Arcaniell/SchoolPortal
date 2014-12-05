<%@ page language="java" contentType="text/html; charset=UTF8"
	pageEncoding="UTF8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
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
			<input class="btn btn-sample" type="button" value="Write message" id="profile_message_button">
		</td>
	</tr>
	<c:if test="${profile.family != null }">
		<tr>
			<td colspan="2">
				<div class="profile_information">

							<hr>
							<div align="center">
								${profile.profileFamilyDescription}
							</div>


							<hr>
							
					<div class="chield_and_parent_container">
						<table>
							<tr>
								<c:forEach items="${profile.family}" var="family_member">

									<td>
										<table  class="table table-hover">
											<tr>
												<td><img class="logo small_logo"
													src="<c:url value="/photo/${family_member.profileId}" />" /></td>
												<td class="all_in_one_line">

													<h5 class="profile_modal" id="${family_member.profileId}">
													${family_member.profileName}</h5>
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



