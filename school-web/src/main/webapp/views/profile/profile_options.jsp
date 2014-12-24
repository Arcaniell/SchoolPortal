<%@ page language="java" contentType="text/html; charset=UTF8"
	pageEncoding="UTF8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<br>
<div align="center">
	<h2>You can change information about you</h2>
	<br>
	<br>
	<table class="edit_profile_table">
		<tr>
			<td>Current first and last name</td>
			<td>${profile.profileName}</td>
			<td><input type="button" value="Change"></td>
			
		</tr>
	</table>
	<!-- <form id="upload_image_form" action="profile/upload_avatar" method="post" enctype="multipart/form-data">
<input type="file" name="file" accept="image/*" style="padding-left: 60px;"/>
<br><br>
<input type="button" class="btn btn-sample uploadButton"
									value="Upload" />
<input id="uploadButton" class = "hidden" type="submit"/>
</form> -->

</div>
