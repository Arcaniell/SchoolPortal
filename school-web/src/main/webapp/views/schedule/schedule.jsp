<%@ page language="java" contentType="text/html; charset=UTF8"
	pageEncoding="UTF8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link href="<c:url value="/resources/css/bootstrap-select.min.css" />"
	rel="stylesheet">

<h3>Schedule for the Academic Year 2014/2015</h3>






<form method="POST" action="schedule">
	<table>
		<div id="navigation_bar">
		<tr>
		<div id="col1">
			<td >
			
				<!-- NAVIGATION-->
				<div class="btn-group" style="height: 100%">
					<input id="back" type="button" class="btn btn-default"
						name="previous" value="&lt;"> <input id="next"
						type="button" class="btn btn-default" name="forward" value="&gt;">
				</div> <!-- DAYPEACKER--> <input id="my_d" name="dateFrom"
				value="${dateFrom}" type="text" class="datepicker"> <!-- DAY/WEEK/MONTH-->
				<div class="btn-group" data-toggle="buttons" style="height: 100%">
					<c:if test="${inputWalls eq 'day'}">
						<label class="btn btn-default active"> <input type="radio"
							name="inputWalls" value="day"> day
						</label>
						<label class="btn btn-default"> <input type="radio"
							name="inputWalls" value="week"> week
						</label>
						<label class="btn btn-default"> <input type="radio"
							name="inputWalls" value="month"> month
						</label>
					</c:if>
					<c:if test="${(inputWalls eq 'week') || (inputWalls == null)}">
						<label class="btn btn-default "> <input type="radio"
							name="inputWalls" value="day"> day
						</label>
						<label class="btn btn-default active"> <input type="radio"
							name="inputWalls" value="week"> week
						</label>
						<label class="btn btn-default"> <input type="radio"
							name="inputWalls" value="month"> month
						</label>
					</c:if>
					<c:if test="${inputWalls eq 'month'}">
						<label class="btn btn-default "> <input type="radio"
							name="inputWalls" value="day"> day
						</label>
						<label class="btn btn-default"> <input type="radio"
							name="inputWalls" value="week"> week
						</label>
						<label class="btn btn-default active"> <input type="radio"
							name="inputWalls" value="month"> month
						</label>
					</c:if>

				</div>
				
			</td>
			</div>
<td><div id="col2">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


</div>
</td>
<div id="col3">
			<td ><select id="rm" name="roomy" style="height: 100%">
			

					<option value="0">Room</option>
					<c:forEach items="${rooms}" var="room">
						<option <c:if test="${roomy==room.id}"> selected </c:if>
							value="${room.id}">${room.roomNumber}</option>
					</c:forEach>
					<option value="0">ALL</option>
			</select> <select id="gr" name="groupy" style="height: 100%">

					<option value="0">Group</option>
					<c:forEach items="${groups}" var="group">
						<option <c:if test="${groupy==group.id}"> selected </c:if>
							value="${group.id}">${group.number}-${group.letter}</option>
					</c:forEach>
					<option value="0">ALL</option>
			</select> <select id="tch" name="teacheryy" style="height: 100%">

					<option value="0">Teacher</option>
					<c:forEach items="${teachers}" var="teacher">
						<option <c:if test="${teacheryy==teacher.id}"> selected </c:if>
							value="${teacher.id}">${teacher.user.lastName}
							${teacher.user.firstName}</option>
					</c:forEach>
					<option value="0">ALL</option>
			</select>


				<button id="submit_ok" type="button" class="btn btn-default">OK</button>
				<button id="refresh" type="button" class="btn btn-default">Refresh</button>


			</td>
			</div>
		</tr>
		</div>
	</table>
</form>


<!-- TABLE -->
 
<div class="table-responsive ">


	<table id="comp" class="table  table-bordered table-striped default_table table-hover">

	</table>
	</div>
	<img class="weekend_logo"
		src="<c:url value="/resources/img/photo/weekend.png"/>" />
		<img class="search_logo"
		src="<c:url value="/resources/img/photo/search.png"/>" />
	
	












<jsp:include page="/views/schedule/editing.jsp" />
<link href="<c:url value="/resources/css/schedules.css" />"
	rel="stylesheet">

	
	  
<script src="<c:url value="/resources/js/course.js" />"
	type="text/javascript"></script>
	<script src="<c:url value="/resources/js/schedule.js" />"
	type="text/javascript"></script>

	












