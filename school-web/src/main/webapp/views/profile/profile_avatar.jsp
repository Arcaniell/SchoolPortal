<%@ page language="java" contentType="text/html; charset=UTF8"
	pageEncoding="UTF8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<br>
<div align="center">
<h2>You can change your avatar</h2>
<br>
<h4>Please select image </h4>
<br><br>
<form id="upload_image_form" action="profile/upload_avatar" method="post" enctype="multipart/form-data">
<input type="file" name="file" accept="image/*" style="padding-left: 60px;"/>
<br><br>
<input type="button" class="btn btn-default uploadButton"
									value="Upload" />
<input id="uploadButton" class = "hidden" type="submit"/>
</form>

</div>
