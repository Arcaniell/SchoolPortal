$("#inboxButton").click(function() {
	
	var json = {
		"button" : "inbox"
	};
	
	$.ajax({
		headers: { 
	        'Accept': 'application/json',
	        'Content-Type': 'application/json' 
	    },
		url : 'inboxOrSentButton',
		type : 'post',
		data : JSON.stringify(json),

		success : function(ConversationDto) {
			$("#inboxEmptyDefault").css("display", "none");
			
            if($("#sentButton").hasClass("active")) {
            	$("#sentButton").removeClass("active");
			}
            if(!$("#inboxButton").hasClass("active")) {
            	$("#inboxButton").addClass("active");
            }
            
			$("#inboxCount").html(ConversationDto[inboxCount]);
			$("#sentCount").html(ConversationDto[sentCount]);
			
			var tableBody = " ";
			
			if(ConversationDto[0].inboxCount != "0"){
				$("#conversationTable").css("display", "");
				$("#inboxEmptyDefault").css("display", "none");
				$("#inboxEmpty").css("display", "none");
				$("#sentEmpty").css("display", "none");
				for(dto in ConversationDto) {
					$("#inboxEmpty").css("display", "none");
					tableBody += "<tr>";
					tableBody += "<td class=\"checkBox\"><input type=\"checkbox\" name=\"selected\"";
					tableBody += "value=\""+ConversationDto[dto].id+"\" /></td>";
					
					if(ConversationDto[dto].hasNewMessages == true) {
						tableBody += "<td class=\"name bold\"><a ";
					} else {
						tableBody += "<td class=\"name\"><a ";
					}
					tableBody += "href=\"/school-web/inbox/"+ConversationDto[dto].id+"\">"+ConversationDto[dto].name+"</a></td>";
					if(ConversationDto[dto].hasNewMessages == true) {
						tableBody += "<td class=\"subject bold\"><a ";
					} else {
						tableBody += "<td class=\"subject\"><a ";
					}
					tableBody += "href=\"/school-web/inbox/"+ConversationDto[dto].id+"\">"+ConversationDto[dto].subject+"</a></td>";
					if(ConversationDto[dto].hasNewMessages == true) {
						tableBody += "<td class=\"date bold\"><a ";
					} else {
						tableBody += "<td class=\"date\"><a ";
					}
					tableBody += "href=\"/school-web/inbox/"+ConversationDto[dto].id+"\">"+ConversationDto[dto].date+"</a></td>";
					tableBody += "</tr>";
				}
			} else {
				
				$("#conversationTable").css("display", "none");
				$("#sentEmpty").css("display", "none");
				$("#inboxEmpty").css("display", "");
			}

			$("#conversationBody").html(tableBody);
			
		}
	});
});

$("#sentButton").click(function() {
	
	var json = {
		"button" : "sent"
	};
	
	$.ajax({
		headers: { 
	        'Accept': 'application/json',
	        'Content-Type': 'application/json' 
	    },
		url : 'inboxOrSentButton',
		type : 'post',
		data : JSON.stringify(json),

		success : function(ConversationDto) {
			$("#inboxEmptyDefault").css("display", "none");
			$("#inboxEmpty").css("display", "none");
			$("#sentEmpty").css("display", "none");
			
            if($("#inboxButton").hasClass("active")) {
            	$("#inboxButton").removeClass("active");
			}
            if(!$("#sentButton").hasClass("active")) {
            	$("#sentButton").addClass("active");
            }
            
			$("#inboxCount").html(ConversationDto[inboxCount]);
			$("#sentCount").html(ConversationDto[sentCount]);
			
			var tableBody = " ";
			
			if(ConversationDto[0].sentCount != "0"){
				$("#conversationTable").css("display", "");
				$("#sentEmptyDefault").css("display", "none");
				for(dto in ConversationDto) {
					$("#sentEmpty").css("display", "none");
					tableBody += "<tr>";
					tableBody += "<td class=\"checkBox\"><input type=\"checkbox\" name=\"selected\"";
					tableBody += "value=\""+ConversationDto[dto].id+"\" /></td>";
					
					if(ConversationDto[dto].hasNewMessages == true) {
						tableBody += "<td class=\"name bold\"><a ";
					} else {
						tableBody += "<td class=\"name\"><a ";
					}
					tableBody += "href=\"/school-web/sent/"+ConversationDto[dto].id+"\">"+ConversationDto[dto].name+"</a></td>";
					if(ConversationDto[dto].hasNewMessages == true) {
						tableBody += "<td class=\"subject bold\"><a ";
					} else {
						tableBody += "<td class=\"subject\"><a ";
					}
					tableBody += "href=\"/school-web/sent/"+ConversationDto[dto].id+"\">"+ConversationDto[dto].subject+"</a></td>";
					if(ConversationDto[dto].hasNewMessages == true) {
						tableBody += "<td class=\"date bold\"><a ";
					} else {
						tableBody += "<td class=\"date\"><a ";
					}
					tableBody += "href=\"/school-web/sent/"+ConversationDto[dto].id+"\">"+ConversationDto[dto].date+"</a></td>";
					tableBody += "</tr>";
				}
				
			} else {
				$("#conversationTable").css("display", "none");
				$("#inboxEmpty").css("display", "none");
				$("#sentEmpty").css("display", "");
			}
			
			$("#conversationBody").html(tableBody);
			
		}
	});
});
