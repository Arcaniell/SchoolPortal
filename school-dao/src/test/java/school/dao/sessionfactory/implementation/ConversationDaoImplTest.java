package school.dao.sessionfactory.implementation;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.dbunit.dataset.DataSetException;
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
import school.model.User;

public class ConversationDaoImplTest extends DBUnitConfig{

	private Conversation conversation;
	private ConversationDaoImpl conversationDaoImpl;
	private User receiver;
	private User sender;

	public ConversationDaoImplTest() {
		super("ConversationDaoImplTest");
	}

    @BeforeClass
    protected void setUpBeforeClass() throws Exception {
    }
    
	@AfterClass
	protected static void tearDownAfterClass() throws Exception {
		HibernateSessionFactory.shutdown();
	}

	@Before
	public void setUp() throws Exception {
	    Session session = HibernateSessionFactory.getSessionFactory()
                .openSession();
        session.close();
	    receiver = new User();
		receiver.setId(1L);
		receiver.setEmail("testemail1@gmail.com");
		receiver.setFirstName("Vladyslav");
		receiver.setLastName("Maksymenko");
		receiver.setPassword("password");
		receiver.setRegistration(new Date());
		receiver.setSex(User.SexType.MALE.getSex());
				
		sender = new User();
		sender.setId(2L);
		sender.setEmail("testemail2@gmail.com");
		sender.setFirstName("Roman");
		sender.setLastName("Mudry");
		sender.setPassword("password");
		sender.setRegistration(new Date());
		sender.setSex(User.SexType.MALE.getSex());
		
		conversation = new Conversation();
		conversation.setId(1L);
		conversation.setReceiverId(receiver);
		conversation.setSenderId(sender);
		conversation.setSubject("Subject1");
		
		conversationDaoImpl = new ConversationDaoImpl();
		
        DatabaseOperation.CLEAN_INSERT.execute(this.getDatabaseTester()
                .getConnection(), getDataSet());
	}

	@After
	public void tearDown() throws Exception {
        DatabaseOperation.DELETE_ALL.execute(this.getDatabaseTester()
                .getConnection(), getDataSet());
        DatabaseOperation.CLEAN_INSERT.execute(this.getDatabaseTester()
                .getConnection(), getBlank());
	}

	private IDataSet getBlank() throws DataSetException, IOException {
	    return new FlatXmlDataSet(this.getClass().getResourceAsStream(
                "/blank.xml"));
    }

    @Override
	protected IDataSet getDataSet() throws Exception {
		return new FlatXmlDataSet(this.getClass().getResourceAsStream("/conversation.xml"));
	}

	@Test
	public void testFindInboxConversationsForUser() {
		List<Conversation> actualList = conversationDaoImpl.findInboxConversationsForUser(receiver);
		Conversation conversation1 = conversationDaoImpl.findById(1L);
		Conversation conversation3 = conversationDaoImpl.findById(3L);
		Conversation conversation5 = conversationDaoImpl.findById(5L);
		Conversation conversation6 = conversationDaoImpl.findById(6L);
		Conversation conversation7 = conversationDaoImpl.findById(7L);
		List<Conversation> expectedList = Arrays.asList(conversation1, conversation3, 
				conversation5, conversation6, conversation7);
		Assert.assertTrue(actualList.size() == expectedList.size());
		for(int i = 0; i < actualList.size(); i++) {
			Assert.assertTrue(actualList.get(i).getId() == expectedList.get(i).getId());
		}
	}
	
	@Test
	public void testSentConversationsForUser() {
		List<Conversation> actualList = conversationDaoImpl.findSentConversationsForUser(receiver);
		Conversation conversation5 = conversationDaoImpl.findById(5L);
		Conversation conversation6 = conversationDaoImpl.findById(6L);
		Conversation conversation7 = conversationDaoImpl.findById(7L);
		List<Conversation> expectedList = Arrays.asList(conversation5, conversation6, conversation7);
		Assert.assertTrue(actualList.size() == expectedList.size());
		for(int i = 0; i < actualList.size(); i++) {
			Assert.assertTrue(actualList.get(i).getId() == expectedList.get(i).getId());
		}
	}
	
	@Test
	public void testFindSenderNameFromConversation() {
		List<Conversation> actualList = conversationDaoImpl.findInboxConversationsForUser(receiver);
		
		List<Conversation> expectedList = Arrays.asList(conversationDaoImpl.findById(1L), 
				conversationDaoImpl.findById(3L), conversationDaoImpl.findById(5L), 
				conversationDaoImpl.findById(6L), conversationDaoImpl.findById(7L));
		for(int i = 0; i < actualList.size(); i++) {
			Assert.assertTrue(actualList.get(i).getSenderId().getFirstName()
					.equals(expectedList.get(i).getSenderId().getFirstName()));
		}
	}
	
	@Test
	public void testSaveConversation() {
		User newUser = new User();
		newUser.setEmail("testemail60@gmail.com");
		newUser.setFirstName("Anna");
		newUser.setLastName("Petrova");
		newUser.setPassword("password");
		newUser.setRegistration(new Date());
		newUser.setSex(User.SexType.FEMALE.getSex());
		
		User newUser1 = new User();
		newUser1.setEmail("testemail61@gmail.com");
		newUser1.setFirstName("Anna");
		newUser1.setLastName("Petrova");
		newUser1.setPassword("password");
		newUser1.setRegistration(new Date());
		newUser1.setSex(User.SexType.FEMALE.getSex());
		
		UserDaoImpl userDaoImpl = new UserDaoImpl();
		userDaoImpl.save(newUser);
		userDaoImpl.save(newUser1);
		
		Conversation newConversation = new Conversation();
		newConversation.setSenderId(newUser);
		newConversation.setReceiverId(newUser1);
		newConversation.setSubject("SUB");
		
		conversationDaoImpl.save(newConversation);
		
		List<Conversation> convs = conversationDaoImpl.findAll();
		Assert.assertTrue(convs.size() == 8);
	}
	
	@Test
	public void testFindMessagesOfConversation() {
		
		Conversation conv = conversationDaoImpl.findById(1L);
		
		List<Message> actualList = conv.getMessages();
		
		List<Message> expectedList = new ArrayList<Message>();
		
		MessageDaoImpl messageDaoImpl = new MessageDaoImpl();
		List<Message> messages = messageDaoImpl.findAll();
		
		for(Message m:messages) {
			if(m.getConversationId().getId() == conv.getId()) {
				expectedList.add(m);
			}
		}
		
		for(int i = 0; i < actualList.size(); i++) {
			Assert.assertTrue(actualList.get(i).getId() == expectedList.get(i).getId());
		}
		
	}
	
	@Test
	public void testFindConversationById() {
		Conversation conv = conversationDaoImpl.findById(1L);
		Assert.assertEquals(conv.getId(), conversation.getId());	
	}
	
	@Test
	public void testUpdateConversation() {
		Conversation newConversation = conversationDaoImpl.findById(1L);
		conversation.setSubject("Subject1");
		Assert.assertEquals(conversation.getSubject(), newConversation.getSubject());
		newConversation.setSubject("NewSubject");
		newConversation = conversationDaoImpl.update(newConversation);
		Assert.assertNotEquals(conversation.getSubject(), newConversation.getSubject());
	}
	
	@Test
	public void testRemoveConversation() {
		conversation = conversationDaoImpl.findById(1L);
		conversationDaoImpl.remove(conversation);
		Assert.assertNull(conversationDaoImpl.findById(1L));
	}
	
}