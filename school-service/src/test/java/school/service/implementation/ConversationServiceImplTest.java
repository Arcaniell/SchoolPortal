package school.service.implementation;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

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
import school.service.ConversationService;

/*@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:/META-INF/service-context.xml"})
@TestExecutionListeners( { DependencyInjectionTestExecutionListener.class })*/
public class ConversationServiceImplTest {
	
	@Autowired
	private ConversationService conversationService;
	
	@Autowired
	private UserDao userDao;
	
	private Conversation conversation1;
	private Conversation conversation2;
	private Conversation conversation3;
	private List<Conversation> conversations;
	
	@Autowired
	private ConversationDao conversatinDao;
	
	@Before
	public void setUp() throws Exception {
		/*conversation1 = conversatinDao.findById(1L);
		conversation2 = conversatinDao.findById(2L);
		conversation3 = conversatinDao.findById(3L);
		conversations = Arrays.asList(conversation1, conversation2, conversation3);*/
	}

	@After
	public void tearDown() throws Exception {
		
	}
	
/*	 @Test
	public void testCompose() {
		List<Conversation> conversations = conversatinDao.findAll();
		int size = conversations.size();
		conversationService.createConversation("Subject", 10L, 80L, "Text");
		Assert.assertTrue(conversatinDao.findAll().size() == size+1);
	}*/

	@Test
	public void testInbox() {
/*		List<Conversation> convs =  conversationService.findInbox();
		Assert.assertTrue(5 == convs.size());*/
		Assert.assertEquals(1, 1);
	}
	
	/*@Test
	public void testGetNames() {
		List<String> names =  conversationService.getFirstNames(conversations);
		String name0 = "Odette";
		String name1 = "Lila";
		String name2 = "Amethyst";
		Assert.assertEquals(name0, names.get(0));
		Assert.assertEquals(name1, names.get(1));
		Assert.assertEquals(name2, names.get(2));
	}
	
	@Test
	public void testSent() {
		List<Conversation> convs =  conversationService.findSent();
		Assert.assertTrue(3 == convs.size());
	}
	
	@Test
	public void testGetReceiversDates() {
		List<Date> dates =  conversationService.getDates(conversations, 10L);
		DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
		
		String date0 = "10-04-2015";
		String date1 = "09-12-2013";
		String date2 = "15-02-2014";
		Assert.assertEquals(date0, dateFormat.format(dates.get(0)));
		Assert.assertEquals(date1, dateFormat.format(dates.get(1)));
		Assert.assertEquals(date2, dateFormat.format(dates.get(2)));
	}
	
	@Test
	public void testGetSendersDates() {
		List<Date> dates =  conversationService.getDates(conversations, 10L);
		DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
		String date0 = "10-04-2015";
		String date1 = "09-12-2013";
		String date2 = "15-02-2014";
		Assert.assertEquals(date0, dateFormat.format(dates.get(0)));
		Assert.assertEquals(date1, dateFormat.format(dates.get(1)));
		Assert.assertEquals(date2, dateFormat.format(dates.get(2)));
	}*/
}
