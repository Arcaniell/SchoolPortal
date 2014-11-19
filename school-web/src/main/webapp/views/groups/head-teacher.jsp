<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<table class="table table-hover">
	<thead>
		<tr>
			<th>Group name</th>
			<th>Year</th>
			<th>Additional</th>
			<th>Members</th>
			<th>Curator</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${groupList}" var="element">
			<tr>
				<td>${element.name}</td>
				<td>${element.year}</td>
				<td>${element.additional}</td>
				<td>${element.members}</td>
				<td>${element.teacher}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>