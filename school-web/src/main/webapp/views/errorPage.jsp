<%@ page language="java" contentType="text/html; charset=UTF8"
	pageEncoding="UTF8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<div>
	<table class="table">
		<tr>
			<th>
				<h1>
					Error -
					<c:out value="${message}"></c:out>
				</h1>

			</th>
		</tr>
		<tr style="border: 0;">
			<th>
				<h4>
					Exception =
					<c:out value="${exc}"></c:out>
				</h4>
			</th>
		</tr>
	</table>
</div>