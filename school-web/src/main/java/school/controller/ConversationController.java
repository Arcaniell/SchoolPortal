package school.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jms.InitJmsContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.support.RequestContextUtils;

import school.dto.message.ConversationDto;
import school.dto.message.MessageButton;
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

	@RequestMapping(value = "inboxOrSentButton", method = RequestMethod.POST)
	public @ResponseBody
	List<ConversationDto> buildConversations(
			@RequestBody MessageButton messageButton, Principal principal,
			HttpServletRequest request, HttpServletResponse response) {

		if (principal == null) {
			List<ConversationDto> list = new ArrayList<ConversationDto>();
			list.add(new ConversationDto("null"));
			return list;
		}

		long principalId = Long.valueOf(principal.getName());
		Locale loc = RequestContextUtils.getLocale(request);

		List<Conversation> conversations;
		if (messageButton.getButton().equals("inbox")) {
			conversations = conversationService.findConversations(principalId,
					"inbox");
		} else {
			conversations = conversationService.findConversations(principalId,
					"sent");
		}
		List<ConversationDto> dtos = conversationService
				.constructConversationDto(conversations, principalId, loc);
		return dtos;
	}

	@RequestMapping("messages")
	public String inbox(Model model, Principal principal,
			HttpServletRequest request) {

		if (principal == null) {
			return "redirect:/signinfailure";
		}

		long principalId = Long.valueOf(principal.getName());

		List<Conversation> conversationsI = conversationService
				.findConversations(principalId, "inbox");

		List<ConversationDto> conversationsDto = new ArrayList<ConversationDto>();

		Locale loc = RequestContextUtils.getLocale(request);
		conversationsDto = conversationService.constructConversationDto(
				conversationsI, principalId, loc);

		model.addAttribute("conversationsDto", conversationsDto);
		model.addAttribute("current", "conversations");
		request.getSession(false).setAttribute("currentPage", "messages");
		return "messages";
	}

	@RequestMapping(value = "delete-conversations", method = RequestMethod.POST)
	public String deleteSentConversations(
			@RequestParam(value = "selected", required = false) String[] ids,
			Principal principal, HttpServletRequest request, Model model) {

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

		String[] tokens = to.split(",");

		for (String token : tokens) {

			if (!conversationService.isGroup(token)) {

				String email = token.split("-")[1].trim();
				User receiver = userService.findByEmail(email);
				Long receiverId = receiver.getId();

				conversationService.createConversation(subject, principalId,
						receiverId, text);
			} else {
				InitJmsContext.initPublisher(token, principalId, subject, text,
						conversationService);
			}
		}

		String currentPage = (String) request.getSession().getAttribute(
				"currentPage");
		return "redirect:/" + currentPage;
	}

	@RequestMapping("message")
	public String sent(Model model, Principal principal,
			HttpServletRequest request) {

		if (principal == null) {
			return "redirect:/signinfailure";
		}
		long principalId = Long.valueOf(principal.getName());

		List<Conversation> conversationsI = conversationService
				.findConversations(principalId, "sent");

		List<ConversationDto> conversationsDto = new ArrayList<ConversationDto>();

		Locale loc = RequestContextUtils.getLocale(request);
		conversationsDto = conversationService.constructConversationDto(
				conversationsI, principalId, loc);

		model.addAttribute("conversationsDto", conversationsDto);
		model.addAttribute("current", "conversation");
		request.getSession(false).setAttribute("currentPage", "message");
		return "message";
	}
}
