<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<table style="border: 0">
	<tbody>
		<tr>
			<th style="padding: 10px 10px;">
				<h4>Date</h4> <b style="margin-left: 2px;">from:</b>
				<div class="btn-group btn-group-sm">
					<input type="date" style="margin: 1px 2px; text-align: left;"
						class="btn btn-default dropdown-toggle" data-toggle="dropdown"
						size="10">
					<ul class="dropdown-menu">
						<li><a href="#">Action</a></li>
						<li><a href="#">Another action</a></li>
						<li><a href="#">Something else here</a></li>
					</ul>
				</div> <br> <b style="margin-left: 20px;">to:</b>
				<div class="btn-group btn-group-sm">
					<input type="date" style="margin: 1px 2px; text-align: left;"
						class="btn btn-default dropdown-toggle" data-toggle="dropdown"
						size="10">
					<ul class="dropdown-menu" type="disc">
						<li><a href="#">Action</a></li>
						<li><a href="#">Another action</a></li>
						<li><a href="#">Something else hesre</a></li>
					</ul>
				</div>
			</th>
			<th style="padding: 10px 10px;">
				<h4>Group</h4> <b style="margin-left: 2px;">number:</b>
				<div class="btn-group btn-group-sm">
					<input type="search" style="margin: 1px 1px; text-align: left;"
						class="btn btn-default dropdown-toggle" data-toggle="dropdown"
						size="10">
					<ul class="dropdown-menu">
						<li><a href="#">5</a></li>
						<li><a href="#">6</a></li>
						<li><a href="#">7</a></li>
						<li><a href="#">8</a></li>
						<li><a href="#">9</a></li>
						<li><a href="#">10</a></li>
					</ul>
				</div> <br> <b style="margin-left: 19px;">letter:</b>
				<div class="btn-group btn-group-sm">
					<input type="search" style="margin: 1px 1px; text-align: left;"
						class="btn btn-default dropdown-toggle" data-toggle="dropdown"
						size="10">
					<ul class="dropdown-menu">
						<li value="a"><a href="a">a</a></li>
						<li value="b"><a href="#">b</a></li>
						<li value="c"><a href="#">c</a></li>
						<li value="d"><a href="#">c</a></li>
					</ul>
				</div>
			</th>
			<th style="padding: 10px 10px; padding-bottom: 42px;">
				<h4>Quarter Mark</h4>
				<div class="btn-group btn-group-sm">
					<input type="search" style="margin: 1px 1px; text-align: left;"
						class="btn btn-default dropdown-toggle" data-toggle="dropdown"
						size="15">
					<ul class="dropdown-menu">
						<li><a href="#">first</a></li>
						<li><a href="#">second</a></li>
						<li><a href="#">third</a></li>
						<li><a href="#">fourth</a></li>
					</ul>
				</div>
			</th>
			<th style="padding: 10px 10px; padding-bottom: 42px;">
				<h4>Subject</h4>
				<div class="btn-group btn-group-sm">
					<input type="search" style="margin: 1px 1px; text-align: left;"
						class="btn btn-default dropdown-toggle" data-toggle="dropdown"
						size="30">
					<ul class="dropdown-menu">
						<li><a href="#">Action</a></li>
						<li><a href="#">Another action</a></li>
						<li><a href="#">Something else here</a></li>
					</ul>
				</div>
			</th>
			<th style="padding: 10px 10px; padding-bottom: 42px;">
				<h4>Student</h4>
				<div class="btn-group btn-group-sm">
					<input type="search" style="margin: 1px 1px; text-align: left;"
						class="btn btn-default dropdown-toggle" data-toggle="dropdown"
						size="30">
					<ul class="dropdown-menu">
						<li><a href="#">Action</a></li>
						<li><a href="#">Another action</a></li>
						<li><a href="#">Something else here</a></li>
					</ul>
				</div>
			</th>
		</tr>
	</tbody>
</table>


<h3>Journals</h3>
<%=request.getAttribute("name")%>


