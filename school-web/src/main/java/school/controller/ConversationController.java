package school.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import school.dto.ConversationDto;
import school.model.Conversation;
import school.service.ConversationService;

@Controller
public class ConversationController {

	@Inject
	private ConversationService conversationService;

	@RequestMapping("/inbox")
	public String inbox(Model model) {
		List<Conversation> conversations = conversationService.findInbox();
		List<ConversationDto> conversationsDto = conversationService
				.constructConversationsDto(conversations);
		model.addAttribute("conversationsDto", conversationsDto);
		return "inbox";
	}

	@RequestMapping("/sent")
	public String sent(Model model) {
		List<Conversation> conversations = conversationService.findSent();
		List<ConversationDto> conversationsDto = conversationService
				.constructConversationsDto(conversations);
		model.addAttribute("conversationsDto", conversationsDto);
		return "sent";
	}

}
