<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<table class="table table-hover">
	<thead>
		<tr>
			<th>ID</th>
			<th>Number</th>
			<th>Letter</th>
			<th>Is additional</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${Message}" var="element">
			<tr>
				<td>${element.id}</td>
				<td>${element.number}</td>
				<td>${element.letter}</td>
				<td>${element.additional}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>

<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<script src="student.js" type="text/javascript"></script>