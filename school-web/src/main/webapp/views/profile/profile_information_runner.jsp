<%@ page language="java" contentType="text/html; charset=UTF8"
	pageEncoding="UTF8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>


<script type="text/javascript"
	src="<c:url value="/resources/js/profile_information_runner.js" />"></script>
	
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