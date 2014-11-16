package school.service.implementation;

import java.util.List;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.TestExecutionListeners;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.support.DependencyInjectionTestExecutionListener;

import school.dao.ConversationDao;
import school.dao.MessageDao;
import school.model.Conversation;
import school.model.Message;
import school.service.MessagesService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:/META-INF/service-context.xml"})
@TestExecutionListeners( { DependencyInjectionTestExecutionListener.class })
public class MessageServiceImplTest {

	@Autowired
	private MessagesService messagesService;
	
	@Autowired
	private MessageDao messageDao;
	
	@Autowired
	private ConversationDao conversationDao;
	
	@Test
	public void testCreateMessage() {
		List<Message> messageList = messageDao.findAll();
		int size = messageList.size();
		System.out.println(size);
		Conversation conversation = conversationDao.findById(10L);
		messagesService.createNewMessage(conversation, "TEXT");
		Assert.assertTrue(messageDao.findAll().size() == size+1);
	}
}
