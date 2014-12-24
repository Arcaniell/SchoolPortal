package jms;

import java.security.Principal;

import jms.publisher.Publisher;
import jms.subscriber.Subscriber;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jms.listener.DefaultMessageListenerContainer;

import school.dao.ConversationDao;
import school.dao.GroupDao;
import school.dao.MessageDao;
import school.dao.UserDao;
import school.model.Group;
import school.model.Parent;
import school.model.Student;
import school.model.User;
import school.service.ConversationService;
import school.service.MessagesService;
import school.service.ParentService;

public class InitJmsContext {

	public static void initSubscriber(User user, boolean isParent,
			String userName, ParentService parentService, Principal principal) {

		/* Initialize subscriber */
		@SuppressWarnings("resource")
		ApplicationContext ac = new ClassPathXmlApplicationContext(
				"jmsSubscriberConfig.xml");
		Subscriber subscriber = (Subscriber) ac.getBean("subscriber");
		subscriber.setPrincipal(user);
		/* Configure DMLC */
		DefaultMessageListenerContainer container = (DefaultMessageListenerContainer) ac
				.getBean("messageListenerContainer");
		container.setClientId(principal.getName());
		container.setSubscriptionDurable(true);
		container.setDurableSubscriptionName(userName);
		/* Set selector */
		Parent p = parentService.findByUserId(user);
		Student s = p.getStudents().get(0);
		Group g = s.getGroup();
		container.setMessageSelector("group = '" + g.getNumber() + " - "
				+ g.getLetter() + "'");
	}

	public static void initPublisher(String token, Long principalId,
			String subject, String text, ConversationService conversationService) {

		/* Configure jms publisher and send */
		ApplicationContext ac = initApplContext();
		Publisher publisher = (Publisher) ac.getBean("publisher");
		publisher.setSenderId(principalId);
		publisher.setGroup(token);
		publisher.setSubject(subject);
		conversationService.createHeadConversation(subject, principalId, token,
				text, publisher.myHashCode());
		publisher.sendMessage(text);
	}

	private static ApplicationContext initApplContext() {
		ApplicationContext ctx = null;
		if (ctx == null) {
			ctx = new ClassPathXmlApplicationContext(
					"jmsPublisherConfig.xml");
		}
		return ctx;
	}
}
