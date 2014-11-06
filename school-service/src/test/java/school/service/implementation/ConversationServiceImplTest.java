package school.service.implementation;

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
import school.model.Conversation;
import school.service.ConversationService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:/META-INF/service-context.xml"})
@TestExecutionListeners( { DependencyInjectionTestExecutionListener.class })
public class ConversationServiceImplTest {
	
	@Autowired
	private ConversationService conversationService;
	
	private Conversation conversation1;
	private Conversation conversation2;
	private Conversation conversation3;
	private List<Conversation> conversations;
	
	@Autowired
	private ConversationDao conversatinDao;
	
	@Before
	public void setUp() throws Exception {
		conversation1 = conversatinDao.findById(1L);
		conversation2 = conversatinDao.findById(2L);
		conversation3 = conversatinDao.findById(3L);
		conversations = Arrays.asList(conversation1, conversation2, conversation3);
	}

	@After
	public void tearDown() throws Exception {
		
	}

	@Test
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
	public void testInbox() {
		List<Conversation> names =  conversationService.findInbox();
		Assert.assertTrue(5 == names.size());
	}
	
	@Test
	public void testSent() {
		List<Conversation> names =  conversationService.findSent();
		Assert.assertTrue(5 == names.size());
	}
	
	@Test
	public void testGetDates() {
		List<String> dates =  conversationService.getDates(conversations);
		String date0 = "01-08-2015";
		String date1 = "05-11-2014";
		String date2 = "27-03-2014";
		Assert.assertEquals(date0, dates.get(0));
		Assert.assertEquals(date1, dates.get(1));
		Assert.assertEquals(date2, dates.get(2));
	}
}
