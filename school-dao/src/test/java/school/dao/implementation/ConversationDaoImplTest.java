package school.dao.implementation;

import java.io.IOException;
import java.util.Arrays;
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
@ContextConfiguration(locations = { "classpath:/META-INF/dao-context.xml" })
@TestExecutionListeners({ DependencyInjectionTestExecutionListener.class })
public class ConversationDaoImplTest extends DBUnitConfig {

	@Autowired
	private ConversationDao conversationDao;
	@Autowired
	private UserDao userDao;

	private User receiver;

	public ConversationDaoImplTest() {
		super("ConversationDaoImplTest");
	}

	@Before
	public void setUp() throws Exception {

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
		return new FlatXmlDataSet(this.getClass().getResourceAsStream(
				"/xml-data-sets/conversation.xml"));
	}

	@Test
	public void testFindInboxConversationsForUser() {
		receiver = userDao.findById(1L);
		List<Conversation> actualList = conversationDao
				.findInboxConversations(receiver);
		Conversation conversation1 = conversationDao.findById(1L);
		Conversation conversation3 = conversationDao.findById(3L);
		Conversation conversation4 = conversationDao.findById(4L);
		Conversation conversation5 = conversationDao.findById(5L);
		Conversation conversation6 = conversationDao.findById(6L);
		Conversation conversation7 = conversationDao.findById(7L);
		List<Conversation> expectedList = Arrays.asList(conversation1,
				conversation3, conversation4, conversation5, conversation6,
				conversation7);
		Assert.assertTrue(actualList.size() == expectedList.size());
		for (int i = 0; i < actualList.size(); i++) {
			Assert.assertTrue(actualList.get(i).getId() == expectedList.get(i)
					.getId());
		}
	}

	@Test
	public void testSentConversationsForUser() {
		receiver = userDao.findById(1L);
		List<Conversation> actualList = conversationDao
				.findSentConversations(receiver);
		Conversation conversation1 = conversationDao.findById(1L);
		Conversation conversation4 = conversationDao.findById(4L);
		Conversation conversation7 = conversationDao.findById(7L);
		List<Conversation> expectedList = Arrays.asList(conversation1,
				conversation4, conversation7);
		Assert.assertTrue(actualList.size() == expectedList.size());
		for (int i = 0; i < actualList.size(); i++) {
			Assert.assertTrue(actualList.get(i).getId() == expectedList.get(i)
					.getId());
		}
	}

}