<%@ page language="java" contentType="text/html; charset=UTF8"
	pageEncoding="UTF8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%-- 
<script type="text/javascript"
	src="<c:url value="/resources/js/profile_information.js" />"></script> --%>

<h2 align="center">${profile.profileName}</h2>

<table class="profile_table">
	<tr>
		<td><img class="logo"
			src="<c:url value="/resources/img/logos/${profile.profileId}.png" />" />

		</td>
		<td>
			<h4>Position: ${profile.profileRole}</h4>
			<h4>Birthday: 11.11.1111</h4>
			<h4>Email: ${profile.profileEmail}</h4>
		</td>
	</tr>
	<c:if test="${profile.chieldren != null }">
		<tr>
			<td colspan="2">
			<div class="profile_information" >
			<c:choose>
					<c:when test="${fn:length(profile.chieldren) gt 1}">
						<hr>
						<div align="center">
							<p>Children</p>
						</div>
					</c:when>
					<c:otherwise>

						<hr>
						<div align="center">
							<p>Child</p>
						</div>
					</c:otherwise>
				</c:choose>

				<div class="chield_and_parent_container">
					<table class="table">
						<tr>
							<c:forEach items="${profile.chieldren}" var="chield">

								<td>
									<table class="profile_modal" id="${chield.profileId}">
										<tr>
											<td><img class="logo small_logo"
												src="<c:url value="/resources/img/logos/${chield.profileId}.png" />" />
											</td>
											<td class="all_in_one_line">

												<h5>${chield.profileName}</h5>
												<h6>Position: ${chield.profileRole}</h6>
												<h6>Birthday: 11.11.1111</h6>
												<h6>Email: ${chield.profileEmail}</h6>
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
	
	
	<c:if test="${profile.parents != null }">
		<tr>
			<td colspan="2">
			<div class="profile_information" >
			<c:choose>
					<c:when test="${fn:length(profile.parents) gt 1}">
						<hr>
						<div align="center">
							<p>Parent</p>
						</div>
					</c:when>
					<c:otherwise>

						<hr>
						<div align="center">
							<p>Parents</p>
						</div>
					</c:otherwise>
				</c:choose>

				<div class="chield_and_parent_container">
					<table class="table">
						<tr>
							<c:forEach items="${profile.parents}" var="parent">

								<td>
									<table class="profile_modal" id="${chield.profileId}">
										<tr>
											<td><img class="logo small_logo"
												src="<c:url value="/resources/img/logos/${parent.profileId}.png" />" />
											</td>
											<td class="all_in_one_line">

												<h5>${parent.profileName}</h5>
												<h6>Position: ${parent.profileRole}</h6>
												<h6>Birthday: 11.11.1111</h6>
												<h6>Email: ${parent.profileEmail}</h6>
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

<input type="button" class="hidden_error"
	id="profileModalButton" data-toggle="modal"
	data-target="#profile_modal" />
	
<div id="profile_modal" class="modal fade" tabindex="-1"
	role="dialog">
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
	
<script type="text/javascript">
$(".logo").load(function() {})
.error(function() { $(this).attr("src", $(".default_logo").attr("src")); });
</script>
