<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<button class="mainButton btn">Submit</button>
<select class="someSelect">
	<option value="0">zero</option>
	<option value="1">one</option>
	<option value="2">two</option>
</select>





	<select name="roomy" class="slectR"> 
					
					<option value="0">Room</option>
					<c:forEach items="${rooms}" var="room">
						<option <c:if test="${roomy==room.id}"> selected </c:if>  value="${room.id}">${room.roomNumber}</option>
					</c:forEach>
					<option value="0">ALL</option>
				</select> 
		
			
			
				<select name="groupy" class="slectG">
					
					<option value="0">Group</option>
					<c:forEach items="${groups}" var="group">
						<option <c:if test="${groupy==group.id}"> selected </c:if> value="${group.id}">${group.number}-${group.letter}</option>
					</c:forEach>
					<option value="0">ALL</option>
				</select> 
    	 <select name="teacheryy" class="slectT">
					
					<option value="0">Teacher</option>
					<c:forEach items="${teachers}" var="teacher">
						<option <c:if test="${teacheryy==teacher.id}"> selected </c:if> value="${teacher.id}">${teacher.user.lastName} ${teacher.user.firstName}</option>
					</c:forEach>
					<option value="0">ALL</option>
				</select>













<table class="main_table">
	<thead>
		<th>ID</th>
		<th>NAME</th>
	</thead>
	<tbody></tbody>
</table>
<script>
	$(".selectT").change(function() {
		alert(this.value);
	});
	$(".selectG").change(function() {
		alert(this.value);
	});
	$(".selectR").change(function() {
		alert(this.value);
	});
	$(".someSelect").change(function() {
		alert(this.value);
	});
	$(".mainButton").click(function() {
		var colors = [ "red", "green", "blue" ];

		$.ajax({
			headers : {
				'Accept' : 'application/json',
				'Content-Type' : 'application/json'
			},
			'type' : 'POST',
			'url' : "response",
			'data' : JSON.stringify(colors),
			'dataType' : 'json',
			'success' : function(data) {
				var container = "";
				for (i in data) {
					container += "<tr>";
					container += "<td>";
					container += data[i].id;
					container += "</td>";
					container += "<td>";
					container += data[i].name;
					container += "</td>";
					container += "</tr>\n";
				}
				$(".main_table tbody").html(container)
			}
		});
	});
	/*$.ajax({
		url : 'responce',
		type : 'post',
		headers:"",
		data : {},
		success : function(data) {
		 	var container = "";
			for (i in data) {
				container += "<tr>";
				container += "<td>";
				container += data[i].id;
				container += "</td>";
				container += "<td>";
				container += data[i].name;
				container += "</td>";
				container += "</tr>\n";
			}
			alert(data); 
		}
	});*/
	//$.post("responce");
</script>
