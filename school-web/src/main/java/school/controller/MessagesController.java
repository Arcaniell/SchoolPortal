package school.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import school.dto.message.EmailObjectDTO;
import school.dto.message.MessageDto;
import school.dto.message.NewMessagesObjectDTO;
import school.model.Conversation;
import school.model.Message;
import school.model.User;
import school.service.ConversationService;
import school.service.MessagesService;

@Controller
public class MessagesController {

	@Autowired
	private MessagesService messagesService;

	@Autowired
	private ConversationService conversationService;

	@RequestMapping(value = "/inbox/{id}")
	public String inboxConversationMessages(Model model, @PathVariable long id,
			Principal principal, HttpServletRequest request) {
		long userId = Long.valueOf(principal.getName());
		Conversation conversation = conversationService.findById(id);
		List<Conversation> conversationsI = conversationService
				.findInbox(userId);
		List<Conversation> conversationsS = conversationService
				.findSent(userId);
		List<Message> messages = messagesService.findMessagesOfConversation(id,
				userId);
		messagesService.markAsRead(messages, userId);
		List<MessageDto> messagesDto = messagesService.constructMessagesDto(
				messages, conversation.getReceiverId().getId(), conversation
						.getSenderId().getId());
		model.addAttribute("messagesDto", messagesDto);
		model.addAttribute("inboxSize", conversationsI.size());
		model.addAttribute("sentSize", conversationsS.size());
		model.addAttribute("subject", conversation.getSubject());
		int newMessages = messagesService.countOfNewMessages(userId);
		request.getSession(false).setAttribute("newMessages", newMessages);
		request.getSession(false).setAttribute("currentPage", "inbox/" + id);
		return "inboxMessages";

	}

	@RequestMapping(value = "/sent/{id}")
	public String sentConversationMessages(Model model, @PathVariable long id,
			Principal principal, HttpServletRequest request) {
		long userId = Long.valueOf(principal.getName());
		Conversation conversation = conversationService.findById(id);
		List<Conversation> conversationsI = conversationService
				.findInbox(userId);
		List<Conversation> conversationsS = conversationService
				.findSent(userId);
		List<Message> messages = messagesService.findMessagesOfConversation(id,
				userId);
		messagesService.markAsRead(messages, userId);
		List<MessageDto> messagesDto = messagesService.constructMessagesDto(
				messages, conversation.getReceiverId().getId(), conversation
						.getSenderId().getId());
		model.addAttribute("messagesDto", messagesDto);
		model.addAttribute("inboxSize", conversationsI.size());
		model.addAttribute("sentSize", conversationsS.size());
		model.addAttribute("subject", conversation.getSubject());
		request.getSession().setAttribute("currentPage", "sent/" + id);
		return "sentMessages";

	}

	@RequestMapping(value = "delete-message", method = RequestMethod.POST)
	public String deleteMessages(
			@RequestParam(value = "messageId", required = false) String messageId,
			Principal principal, HttpServletRequest request) {
		long id = Long.valueOf(principal.getName());
		messagesService.deleteMessage(Long.valueOf(messageId), id);
		String currentPage = (String) request.getSession().getAttribute(
				"currentPage");
		return "redirect:/" + currentPage;
	}

	@RequestMapping(value = "reply", method = RequestMethod.POST)
	public String reply(
			@RequestParam("messageId") String messageId,
			@RequestParam(value = "replyText", required = false) String replyText,
			HttpServletRequest request, Principal principal) {

		long repliedMessageId = Long.valueOf(messageId);
		Message repliedMessage = messagesService.findById(repliedMessageId);
		Conversation conversation = conversationService.findById(repliedMessage
				.getConversationId().getId());
		long principalId = Long.valueOf(principal.getName());

		messagesService.replyMessage(conversation, replyText, principalId);

		String currentPage = (String) request.getSession().getAttribute(
				"currentPage");
		return "redirect:/" + currentPage;
	}

	@RequestMapping(value = "/emailInput", method = RequestMethod.GET)
	public @ResponseBody
	List<EmailObjectDTO> getEmails(@RequestParam String tagName,
			HttpServletRequest request) {
		boolean isParent = request.isUserInRole("ROLE_PARENT");
		List<User> users = messagesService.simulateSearchResult(tagName,
				isParent);
		return messagesService.contructEmailObjectDTO(users);
	}

	@RequestMapping(value = "/newMessages", method = RequestMethod.GET)
	public @ResponseBody
	NewMessagesObjectDTO getNewMessages(Principal principal) {
		NewMessagesObjectDTO newMessagesObjectDTO = new NewMessagesObjectDTO();
		if(principal != null) {
			newMessagesObjectDTO =  messagesService.constructNewMessagesObjectDTO(Long
					.valueOf(principal.getName()));
		} else {
			newMessagesObjectDTO.setNewMessages("0");
		}
		return newMessagesObjectDTO;
	}
}
