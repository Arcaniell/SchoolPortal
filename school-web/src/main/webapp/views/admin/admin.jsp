<%@ page language="java" contentType="text/html; charset=UTF8"
	pageEncoding="UTF8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>


<link href="<c:url value="/resources/css/admin.css" />"
	rel="stylesheet">
<script type="text/javascript"
	src="<c:url value="/resources/js/admin.js" />"></script>
	
<div style="padding-left: 150px;">

	<table>
		<tr>
			
			<td><input type="hidden" id="admin_page_container"
				value="profile_information">
				<jsp:include
						page="/views/admin/role_requests.jsp" />
				<div class="hidden_error profile_avatar"><jsp:include
						page="/views/profile/profile_avatar.jsp" /></div>
					
			
		</tr>

	</table>

</div>
<div ><jsp:include page="/views/admin/buttons.jsp" /></div>

	
