package school.dao.implementation;

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

	@Before
	public void setUp() throws Exception {

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
	public void testFindMessagesOfConversation() {
		
		conversation = conversationDao.findById(5L);
		List<Message> actualMessages = messageDao.findReceiversMessagesOfConversation(conversation);
		Message message5 = messageDao.findById(5L);
		Message message8 = messageDao.findById(8L);
		Message message7 = messageDao.findById(7L);
		List<Message> expectedMessages = Arrays.asList(message5, message7, message8);
		Assert.assertTrue(actualMessages.get(0).getId() == expectedMessages.get(0).getId());
		Assert.assertTrue(actualMessages.get(1).getId() == expectedMessages.get(1).getId());
		Assert.assertTrue(actualMessages.get(2).getId() == expectedMessages.get(2).getId());
		for(int i = 0; i < actualMessages.size(); i++) {
			Assert.assertTrue(actualMessages.get(i).getId() == expectedMessages.get(i).getId());
		}
		
	}
}
