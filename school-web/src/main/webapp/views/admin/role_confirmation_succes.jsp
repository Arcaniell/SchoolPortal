<%@ page language="java" contentType="text/html; charset=UTF8"
	pageEncoding="UTF8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div id="admin_role_confirmation_succes" class="modal fade"
	tabindex="-1" role="dialog">
	<div class="modal-dialog">
		<br> <br> <br> <br> <br> <br> <br>
		<br>
		<div class="modal-content" align="center">

			<div class="modal-body">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>

				<table>
					<tr>
						<td>
							<h3>Role successfully added to user</h3>
						</td>
					</tr>
					<tr>
						<td><div align="center">
						<form action="admin">
								<input class="btn btn-sample" type="submit"  value="Ok">
									</form>
							</div></td>
					</tr>
				</table>

			</div>

		</div>
	</div>
</div>