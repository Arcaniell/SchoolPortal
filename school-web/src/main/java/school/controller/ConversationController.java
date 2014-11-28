package school.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.support.RequestContextUtils;

import school.dto.message.ConversationDto;
import school.model.Conversation;
import school.model.User;
import school.service.ConversationService;
import school.service.MessagesService;
import school.service.UserService;

@Controller
public class ConversationController {

	@Autowired
	public ConversationService conversationService;

	@Autowired
	public MessagesService messagesService;

	@Autowired
	public UserService userService;

	@RequestMapping("inbox")
	public String inbox(Model model, Principal principal,
			HttpServletRequest request) {
		long principalId = Long.valueOf(principal.getName());
		List<Conversation> conversationsS = conversationService
				.findSent(principalId);
		List<Conversation> conversationsI = conversationService
				.findInbox(principalId);
		int sentSize = conversationsS.size();
		List<ConversationDto> conversationsDto = new ArrayList<ConversationDto>();
		if (conversationsI.size() > 0) {
			Locale loc = RequestContextUtils.getLocale(request);
			conversationsDto = conversationService
					.constructInboxConversationsDto(conversationsI,
							principalId, loc);
		}
		model.addAttribute("conversationsDto", conversationsDto);
		model.addAttribute("sentSize", sentSize);
		int newMessages = messagesService.countOfNewMessages(principalId);
		request.getSession(false).setAttribute("newMessages", newMessages);
		request.getSession(false).setAttribute("currentPage", "inbox");
		return "inbox";
	}

	@RequestMapping("sent")
	public String sent(Model model, Principal principal,
			HttpServletRequest request) {
		long principalId = Long.valueOf(principal.getName());
		List<Conversation> conversationsI = conversationService
				.findInbox(principalId);
		List<Conversation> conversationsS = conversationService
				.findSent(principalId);
		int inboxSize = conversationsI.size();
		List<ConversationDto> conversationsDto = new ArrayList<ConversationDto>();
		if (conversationsS.size() > 0) {
			Locale loc = RequestContextUtils.getLocale(request);
			conversationsDto = conversationService
					.constructSentConversationsDto(conversationsS, principalId,
							loc);
		}
		model.addAttribute("conversationsDto", conversationsDto);
		model.addAttribute("inboxSize", inboxSize);
		int newMessages = messagesService.countOfNewMessages(principalId);
		request.getSession(false).setAttribute("newMessages", newMessages);
		request.getSession(false).setAttribute("currentPage", "sent");
		return "sent";
	}

	@RequestMapping(value = "delete-conversations", method = RequestMethod.POST)
	public String deleteSentConversations(
			@RequestParam(value = "selected", required = false) String[] ids,
			Principal principal, HttpServletRequest request) {

		long id = Long.valueOf(principal.getName());
		if (ids != null) {
			conversationService.deleteConversations(ids, id);
		}
		String currentPage = (String) request.getSession().getAttribute(
				"currentPage");
		return "redirect:/" + currentPage;
	}

	@RequestMapping(value = "compose", method = RequestMethod.POST)
	public String compose(
			@RequestParam(value = "to", required = false) String to,
			@RequestParam(value = "subject", required = false) String subject,
			@RequestParam(value = "text", required = false) String text,
			HttpServletRequest request, Principal principal) {

		Long principalId = Long.valueOf(principal.getName());
		String[] namesAndEmails = to.split(",");
		
		for(String s:namesAndEmails) {
			String email = s.split("-")[1].trim();
			User receiver = userService.findByEmail(email);
			Long receiverId = receiver.getId();

			conversationService.createConversation(subject, principalId,
					receiverId, text);
		}
		
		String currectPage = (String) request.getSession().getAttribute(
				"currentPage");
		return "redirect:/" + currectPage;
	}
}
