package school.dao.sessionfactory.implementation;

import java.util.Arrays;
import java.util.List;

import org.dbunit.dataset.IDataSet;
import org.dbunit.dataset.xml.FlatXmlDataSet;
import org.dbunit.operation.DatabaseOperation;
import org.hibernate.Session;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Assert;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import school.model.Conversation;
import school.model.Message;

public class MessageDaoImplTest extends DBUnitConfig {

	public MessageDaoImplTest() {
		super("MessageDaoImplTest");
	}

	private Conversation conversation;
	private ConversationDaoImpl conversationDaoImpl;
	private MessageDaoImpl messageDaoImpl;
	private Message message;

    @BeforeClass
    protected void setUpBeforeClass() throws Exception {
    }
    
	@AfterClass
	protected static void tearDownAfterClass() throws Exception {
		HibernateSessionFactory.shutdown();
	}

	@Before
	public void setUp() throws Exception {
		message = new Message();
		conversation = new Conversation();
		conversationDaoImpl = new ConversationDaoImpl();
		messageDaoImpl = new MessageDaoImpl();
		
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		session.close();
		
        DatabaseOperation.CLEAN_INSERT.execute(this.getDatabaseTester()
                .getConnection(), getDataSet());
	}

	@After
	public void tearDown() throws Exception {
        DatabaseOperation.DELETE_ALL.execute(this.getDatabaseTester()
                .getConnection(), getDataSet());
//        DatabaseOperation.CLEAN_INSERT.execute(this.getDatabaseTester()
//                .getConnection(), getBlank());
	}

	@Override
	protected IDataSet getDataSet() throws Exception {
		return new FlatXmlDataSet(this.getClass().getResourceAsStream("/conversation.xml"));
	}
	
	protected IDataSet getBlank() throws Exception {
		return new FlatXmlDataSet(this.getClass().getResourceAsStream("/messageBlank.xml"));
	}

	@Test
	public void testSaveMessage() {
		message = messageDaoImpl.findById(1L);
		messageDaoImpl.save(message);
		List<Message> mList = messageDaoImpl.findAll();
		Assert.assertTrue(mList.size() == 11);
	}
	
	@Test
	public void testUpdateMessage() {
		message = messageDaoImpl.findById(1L);
		Message secondMessage = messageDaoImpl.findById(1L);
		Assert.assertEquals(message.getText(), secondMessage.getText());
		message.setText("NewTestText");
		messageDaoImpl.update(message);
		message = messageDaoImpl.findById(1L);
		Assert.assertNotEquals(message.getText(), secondMessage.getText());
	}
	
	@Test
	public void testRemoveMessage() {
		List<Message> firstList = messageDaoImpl.findAll();
		Assert.assertTrue(firstList.size() == 10);
		message = messageDaoImpl.findById(1L);
		messageDaoImpl.remove(message);
		firstList = messageDaoImpl.findAll();
		Assert.assertFalse(firstList.size() == 10);
	}
	
	@Test
	public void testFindById() {
		message = messageDaoImpl.findById(1L);
		Assert.assertTrue(message.getId() == 1L);
	}
	
	@Test
	public void testFindAll() {
		List<Message> mList = messageDaoImpl.findAll();
		Assert.assertTrue(mList.size() == 10);
	}
	
	@Test
	public void testFindMessagesOfConversation() {
		
		conversation = conversationDaoImpl.findById(5L);
		List<Message> actualMessages = messageDaoImpl.findMessagesOfConversation(conversation);
		Message message1 = messageDaoImpl.findById(5L);
		Message message2 = messageDaoImpl.findById(8L);
		List<Message> expectedMessages = Arrays.asList(message1, message2);
		Assert.assertTrue(actualMessages.get(0).getId() == message1.getId());
		Assert.assertTrue(actualMessages.get(1).getId() == message2.getId());
		for(int i = 0; i < actualMessages.size(); i++) {
			Assert.assertTrue(actualMessages.get(i).getId() == expectedMessages.get(i).getId());
		}
		
	}
}
