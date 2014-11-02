package school.dao.implementation;

import java.io.IOException;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.dbunit.dataset.DataSetException;
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
import school.dao.UserDao;
import school.model.Conversation;
import school.model.User;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:/META-INF/dao-context.xml"})
@TestExecutionListeners( { DependencyInjectionTestExecutionListener.class })
public class ConversationDaoImplTest extends DBUnitConfig{

	@Autowired
	private ConversationDao conversationDao;
	@Autowired
	private UserDao userDao;
	
	private Conversation conversation;
	private User receiver;

	public ConversationDaoImplTest() {
		super("ConversationDaoImplTest");
	}

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
        DatabaseOperation.CLEAN_INSERT.execute(this.getDatabaseTester()
                .getConnection(), getBlank());
	}

	private IDataSet getBlank() throws DataSetException, IOException {
	    return new FlatXmlDataSet(this.getClass().getResourceAsStream(
                "/xml-data-sets/blank.xml"));
    }

    @Override
	protected IDataSet getDataSet() throws Exception {
		return new FlatXmlDataSet(this.getClass().getResourceAsStream("/xml-data-sets/conversation.xml"));
	}

	@Test
	public void testFindInboxConversationsForUser() {
		receiver = userDao.findById(1L);
		List<Conversation> actualList = conversationDao.findInboxConversationsForUser(receiver);
		Conversation conversation1 = conversationDao.findById(1L);
		Conversation conversation3 = conversationDao.findById(3L);
		Conversation conversation5 = conversationDao.findById(5L);
		Conversation conversation6 = conversationDao.findById(6L);
		Conversation conversation7 = conversationDao.findById(7L);
		List<Conversation> expectedList = Arrays.asList(conversation1, conversation3, 
				conversation5, conversation6, conversation7);
		Assert.assertTrue(actualList.size() == expectedList.size());
		for(int i = 0; i < actualList.size(); i++) {
			Assert.assertTrue(actualList.get(i).getId() == expectedList.get(i).getId());
		}
	}
	
	@Test
	public void testSentConversationsForUser() {
		receiver = userDao.findById(1L);
		List<Conversation> actualList = conversationDao.findSentConversationsForUser(receiver);
		Conversation conversation5 = conversationDao.findById(5L);
		Conversation conversation6 = conversationDao.findById(6L);
		Conversation conversation7 = conversationDao.findById(7L);
		List<Conversation> expectedList = Arrays.asList(conversation5, conversation6, conversation7);
		Assert.assertTrue(actualList.size() == expectedList.size());
		for(int i = 0; i < actualList.size(); i++) {
			Assert.assertTrue(actualList.get(i).getId() == expectedList.get(i).getId());
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
		
		userDao.save(newUser);
		userDao.save(newUser1);
		
		Conversation newConversation = new Conversation();
		newConversation.setSenderId(newUser);
		newConversation.setReceiverId(newUser1);
		newConversation.setSubject("SUB");
		
		conversationDao.save(newConversation);
		
		List<Conversation> convs = conversationDao.findAll();
		Assert.assertTrue(convs.size() == 8);
	}
	
	@Test
	public void testFindConversationById() {
		Conversation conv = conversationDao.findById(1L);
		Assert.assertEquals(conv.getId(), 1L);	
	}
	
	@Test
	public void testUpdateConversation() {
		Conversation newConversation = conversationDao.findById(1L);
		conversation.setSubject("Subject1");
		Assert.assertEquals(conversation.getSubject(), newConversation.getSubject());
		newConversation.setSubject("NewSubject");
		newConversation = conversationDao.update(newConversation);
		Assert.assertNotEquals(conversation.getSubject(), newConversation.getSubject());
	}
	
	@Test
	public void testRemoveConversation() {
		conversation = conversationDao.findById(1L);
		conversationDao.remove(conversation);
		Assert.assertNull(conversationDao.findById(1L));
	}
	
}