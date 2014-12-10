					$(function() {
						$("#my").datepicker({
							changeMonth : true,
							changeYear : true,
							firstDay : 1,
							autoSize : true

						});

					});
					

					$("#gr")
					.change(
							function() {
								$
										.ajax({
											headers : {
												'Accept' : 'application/json',
												'Content-Type' : 'application/json'
											},
											datatype : "json",
											url : 'schedule-group',
											type : 'post',
											data : $("#gr option:selected").val(),

											success : function(groups) {
												var content = " ";
												for (index in groups) {
													content += "<option value=\"";
						content += groups[index].id;
						content += "\">";
													if (groups[index].id == 0) {
														content += "ALL";
													} else {

														content += groups[index].number;
														content += "-";
														if (groups[index].letter == 'Z') {
															content +="optional";
														}else{
														content += groups[index].letter;
														}
													}
													content += "</option>\n";
												}
												$("#gr").html(content);
											}
										});
							});

			$("#rm")
					.change(
							function() {
								$
										.ajax({
											headers : {
												'Accept' : 'application/json',
												'Content-Type' : 'application/json'
											},
											datatype : "json",
											url : 'schedule-room',
											type : 'post',
											data : $("#rm option:selected").val(),

											success : function(rooms) {
												var content = " ";
												for (index in rooms) {
													content += "<option value=\"";

						content += rooms[index].id;
						content += "\">";
													if (rooms[index].id == 0) {
														content += "ALL";
													} else {
														content += rooms[index].roomNumber;
													}
													content += "</option>\n";
												}
												$("#rm").html(content);
											}
										});
							});

			$("#tch")
					.change(
							function() {
								$
										.ajax({
											headers : {
												'Accept' : 'application/json',
												'Content-Type' : 'application/json'
											},
											datatype : "json",
											url : 'schedule-teacher',
											type : 'post',
											data : $("#tch option:selected").val(),

											success : function(teachers) {
												var content = " ";
												for (index in teachers) {
													content += "<option value=\"";
							content += teachers[index].id;
							content += "\">";

													if (teachers[index].id == 0) {
														content += "ALL";
													} else {

														content += teachers[index].lastName;
														content += " ";
														content += teachers[index].firstName;
													}
													content += "</option>\n";
												}
												$("#tch").html(content);
											}
										});
							});

			$("#submit_ok")
					.click(
							function() {
								var group = $("#gr").val();
								var room = $("#rm").val();
								var teacher = $("#tch").val();
								var dateOfLife = $("#my_d").val();
								var radio = $("input[name='inputWalls']:checked").val();
								var json = {
									"group" : group,
									"room" : room,
									"teacher" : teacher,
									"dateOfLife" : dateOfLife,
									"radio" : radio
								}
								$
										.ajax({
											headers : {
												'Accept' : 'application/json',
												'Content-Type' : 'application/json'
											},
											url : 'schedule-select',
											type : 'POST',
											data : JSON.stringify(json),
											dataType : 'json',
											contentType : 'application/json',
											mimeType : 'application/json',
											success : function(schedule) {

												
												var container = "";
												var dateOf = $("#my_d").val();
												var now= new Date(dateOf);
												if ( now.getDay() == 0 || now.getDay() == 6 ) {
												$(".search_logo").hide();
													$(".weekend_logo").show();
												
												} else if(typeof schedule[0] == 'undefined'){
												
												$(".weekend_logo").hide();
													$(".search_logo").show();
												}
												else {
													$(".weekend_logo").hide();
													$(".search_logo").hide();

													container += "<thead><div id=\"gr_lessn_day\"><tr><th>Group</th>"
															+ "<th>Lesson</th>";

													for (indexD in schedule[0].tableDate) {
														container += "<th>"
																+ schedule[0].tableDate[indexD]
																+ "</th>";
													}
													container += "</tr></div></thead><tbody><div id=\"data_grid\">";
													for (index in schedule) {
														container += "<tr><th rowspan=\""
									  			+schedule[index].rowCount
									  			+"\">";

														
														if (schedule[index].group.letter == 'Z') {
																											
															var optional = "";
															for(index_opt in  schedule[index].listSchedule){
																if(schedule[index].listSchedule[index_opt].course != null){
																	optional =schedule[index].listSchedule[index_opt].course.courseName;
																}
															}
															container += optional
															+ " "
															+ "<p> for "
															+ schedule[index].group.number
															+ " grade</p>";
														} else {
															container += schedule[index].group.number
																	+ "-"
																	+ schedule[index].group.letter;
														}
														container +="</th>";
														for (indexA in schedule[index].setLess) {
															container += "<th>"
																	+ schedule[index].setLess[indexA].lessonNumb
																	+ "</th>";
														

															for (indexB in schedule[index].tableDate) {
																for (indexC in schedule[index].listSchedule) {
																	if (schedule[index].setLess[indexA].lessonNumb == schedule[index].listSchedule[indexC].lesson.lessonNumb) {

																		if (schedule[index].tableDate[indexB] == schedule[index].listSchedule[indexC].date) {
																			container += "<td><p>";
																			if (schedule[index].listSchedule[indexC].course != null) {
																				container += schedule[index].listSchedule[indexC].course.courseName;
																			} else {
																				container += " ";
																			}
																			container += "</p>";
																			if (schedule[index].listSchedule[indexC].teacher != null) {
																				container += schedule[index].listSchedule[indexC].teacher.lastName
																				          +" "
																				          + schedule[index].listSchedule[indexC].teacher.firstName.substring(0,1)
																				          +"., ";
																			} else {
																				container += " ";
																			}
																			if (schedule[index].listSchedule[indexC].room != null) {
																				container += schedule[index].listSchedule[indexC].room.roomNumber;
																			} else {
																				container += " ";
																			}
																			container += "</td>";
																		}
																	}
																}
															}

														

															container += "</tr><tr></tr><tr></tr><tr></tr>";
														}
													}
													container += "</td></div></tbody>";

												
												}
												$("#comp").html(container);

											}
										});
							});
			$("#submit_ok").click();

			$("#back").click(
					function() {

						var before = [ $("#my_d").val(),
								$("input[name='inputWalls']:checked").val() ];

						$.ajax({
							headers : {
								'Accept' : 'application/json',
								'Content-Type' : 'application/json'
							},

							'type' : 'POST',
							'url' : "schedule-back",
							'data' : JSON.stringify(before),
							'dataType' : 'json',
							success : function(befor) {
								//		alert("hi");

								$('#my_d').datepicker();
								$('#my_d').datepicker('setDate', befor[0]);

								$("#submit_ok").click();

								

							}
						});
					});

			$("#next").click(
					function() {

						var before = [ $("#my_d").val(),
								$("input[name='inputWalls']:checked").val() ];

						$.ajax({
							headers : {
								'Accept' : 'application/json',
								'Content-Type' : 'application/json'
							},

							'type' : 'POST',
							'url' : "schedule-next",
							'data' : JSON.stringify(before),
							'dataType' : 'json',
							success : function(befor) {
								//		alert("hi");

								$('#my_d').datepicker();
								$('#my_d').datepicker('setDate', befor[0]);

								$("#submit_ok").click();

								$("#submit_ok").click();

							}
						});
					});

			$('#refresh').click(function() {
				$("select#gr").val("0");
				$("select#tch").val("0");
				$("select#rm").val("0");
			});
					