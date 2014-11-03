package school.dao.implementation;

import java.util.Date;
import java.util.Arrays;
import java.util.List;

import org.dbunit.dataset.IDataSet;
import org.dbunit.dataset.xml.FlatXmlDataSet;
import org.dbunit.operation.DatabaseOperation;
import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
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

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:/META-INF/dao-context.xml"})
@TestExecutionListeners( { DependencyInjectionTestExecutionListener.class })
public class MessageDaoImplTest extends DBUnitConfig {

	public MessageDaoImplTest() {
		super("MessageDaoImplTest");
	}

	@Autowired
	private ConversationDao conversationDao;
	@Autowired
	private MessageDao messageDao;
	
	private Conversation conversation;
	private Message message;

	@Before
	public void setUp() throws Exception {
		message = new Message();
		conversation = new Conversation();
		
        DatabaseOperation.CLEAN_INSERT.execute(this.getDatabaseTester()
                .getConnection(), getDataSet());
	}

	@After
	public void tearDown() throws Exception {
        DatabaseOperation.DELETE_ALL.execute(this.getDatabaseTester()
                .getConnection(), getDataSet());
	}

	@Override
	protected IDataSet getDataSet() throws Exception {
		return new FlatXmlDataSet(this.getClass().getResourceAsStream("/xml-data-sets/conversation.xml"));
	}

	@Test
	public void testSaveMessage() {
		conversation = conversationDao.findById(1L);
		message.setConversationId(conversation);
		message.setDateTime(new Date());
		message.setFromSender(true);
		message.setRead(false);
		message.setText("OLOLO");
		messageDao.save(message);
		List<Message> mList = messageDao.findAll();
		Assert.assertTrue(mList.size() == 11);
	}
	
	@Test
	public void testUpdateMessage() {
		message = messageDao.findById(1L);
		Message secondMessage = messageDao.findById(1L);
		Assert.assertEquals(message.getText(), secondMessage.getText());
		message.setText("NewTestText");
		messageDao.update(message);
		message = messageDao.findById(1L);
		Assert.assertNotEquals(message.getText(), secondMessage.getText());
	}
	
	@Test
	public void testRemoveMessage() {
		List<Message> firstList = messageDao.findAll();
		Assert.assertTrue(firstList.size() == 10);
		message = messageDao.findById(1L);
		messageDao.remove(message);
		firstList = messageDao.findAll();
		Assert.assertFalse(firstList.size() == 9);
	}
	
	@Test
	public void testFindById() {
		message = messageDao.findById(1L);
		Assert.assertTrue(message.getId() == 1L);
	}
	
	@Test
	public void testFindAll() {
		List<Message> mList = messageDao.findAll();
		Assert.assertTrue(mList.size() == 10);
	}
	
	@Test
	public void testFindMessagesOfConversation() {
		
		conversation = conversationDao.findById(5L);
		List<Message> actualMessages = messageDao.findMessagesOfConversation(conversation);
		Message message1 = messageDao.findById(5L);
		Message message2 = messageDao.findById(8L);
		List<Message> expectedMessages = Arrays.asList(message1, message2);
		Assert.assertTrue(actualMessages.get(0).getId() == message1.getId());
		Assert.assertTrue(actualMessages.get(1).getId() == message2.getId());
		for(int i = 0; i < actualMessages.size(); i++) {
			Assert.assertTrue(actualMessages.get(i).getId() == expectedMessages.get(i).getId());
		}
		
	}
}
