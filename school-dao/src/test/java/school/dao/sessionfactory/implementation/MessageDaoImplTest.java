package school.dao.sessionfactory.implementation;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

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

import school.dao.sessionfactory.implementation.HibernateSessionFactory;
import school.dao.sessionfactory.implementation.MessageDaoImpl;
import school.model.Message;
import school.model.User;

public class MessageDaoImplTest extends DBUnitConfig{

	public MessageDaoImplTest() {
		super("MessageDaoImplTest");
	}

	private Message message;
	private MessageDaoImpl messageDaoImpl;
	
	@BeforeClass
	protected static void setUpBeforeClass() throws Exception {
	}
	
	@AfterClass
	protected static void tearDownAfterClass() throws Exception {
		HibernateSessionFactory.shutdown();
	}
	
	@Before
	public void setUp() throws Exception {
		User receiver = new User();
		receiver.setId(1L);
		User sender = new User();
		sender.setId(2L);
		message = new Message();
		message.setId(1L);
		message.setText("Text1");
		message.setDate(new Date());
		message.setRead(true);
		message.setReceiverId(receiver);
		message.setSenderId(sender);
		messageDaoImpl = new MessageDaoImpl();
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		IDataSet messageDataSet = getDataSet();
		DatabaseOperation.CLEAN_INSERT.execute(this.getDatabaseTester().getConnection(), messageDataSet);
		session.close();
		
	}
	
	@After
	public void tearDown() throws Exception {
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		IDataSet messageDataSet = getDataSet();
		DatabaseOperation.DELETE_ALL.execute(this.getDatabaseTester().getConnection(), messageDataSet);
		session.close();
	}
	
	@Override
	protected IDataSet getDataSet() throws Exception {
		return new FlatXmlDataSet(this.getClass().getResourceAsStream("/message.xml"));
	}
	
	@Test
	public void testFindById() {
		Message newMessage = messageDaoImpl.findById(1L);
		Assert.assertEquals(message.getId(), newMessage.getId());
	}
	
	@Test
	public void testSave() {
		User newReceiver = new User();
		newReceiver.setId(1L);
		User newSender = new User();
		newSender.setId(2L);
		Message newMessage = new Message();
		newMessage.setId(11L);
		newMessage.setText("Text");
		newMessage.setDate(new Date());
		newMessage.setRead(true);
		newMessage.setReceiverId(newReceiver);
		newMessage.setSenderId(newSender);
		messageDaoImpl.save(newMessage);
		Set<Message> users = new HashSet<Message>(messageDaoImpl.findAll());
		Assert.assertTrue(users.size() == 11);
	}

	@Test
	public void testRemove() {
		messageDaoImpl.remove(message);
		Assert.assertNull(messageDaoImpl.findById(1L));
	}

	@Test
	public void testUpdate() {
		Message newMessage = messageDaoImpl.findById(1L);
		Assert.assertEquals(message.getText(), newMessage.getText());
		newMessage.setText("NewText");
		newMessage = messageDaoImpl.update(newMessage);
		Assert.assertNotEquals(message.getText(), newMessage.getText());
	}

	@Test
	public void testFindAll() {
		Set<Message> users = new HashSet<Message>(messageDaoImpl.findAll());
		Assert.assertTrue(users.size() == 10);
	}
	
}
