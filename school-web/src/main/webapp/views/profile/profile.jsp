<%@ page language="java" contentType="text/html; charset=UTF8"
	pageEncoding="UTF8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>


<link href="<c:url value="/resources/css/profile.css" />"
	rel="stylesheet">
<script type="text/javascript"
	src="<c:url value="/resources/js/profile.js" />"></script>

<div style="padding-left: 150px;">

	<table>
		<tr>
			
			<td><input type="hidden" id="profile_page_container"
				value="profile_information">
				<jsp:include
						page="/views/profile/profile_information.jsp" />
				<div class="hidden_error profile_options">
					<jsp:include page="/views/profile/profile_options.jsp" /></div>
				<div class="hidden_error profile_avatar"><jsp:include
						page="/views/profile/profile_avatar.jsp" /></div>
				<div class="hidden_error profile_requests">
					<jsp:include page="/views/profile/profile_requests.jsp" /></div></td>
					
					<td></td>
			
		</tr>

	</table>

</div>
<div style="position: fixed; right:0px; top: 120px;"><jsp:include page="/views/profile/profile_buttons.jsp" /></div>
