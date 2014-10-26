package school.dao.sessionfactory.implementation;

import java.util.Date;
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

import school.model.User;

public class UserDaoImplTest extends DBUnitConfig{

	public UserDaoImplTest() {
		super("UserDaoImplTest");
	}

	private User user;
	private UserDaoImpl userDaoImpl;
	@BeforeClass
	protected static void setUpBeforeClass() throws Exception {
	}
	@AfterClass
	protected static void tearDownAfterClass() throws Exception {
		HibernateSessionFactory.shutdown();
	}
	
	@Before
	public void setUp() throws Exception {
		user = new User();
		user.setId(1L);
		user.setEmail("testemail1@gmail.com");
		user.setFirstName("Roman");
		user.setLastName("Petrov");
		user.setPassword("password");
		user.setRegistration(new Date());
		user.setSex(User.SexType.MALE.getSex());
		userDaoImpl = new UserDaoImpl();
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		IDataSet userDataSet = getDataSet();
//        DatabaseOperation.CLEAN_INSERT.execute(this.getDatabaseTester()
//                .getConnection(), getBlank());
		DatabaseOperation.CLEAN_INSERT.execute(this.getDatabaseTester().getConnection(), userDataSet);
		session.close();
		  
	}
	@After
	public void tearDown() throws Exception {
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		IDataSet userDataSet = getDataSet();
		DatabaseOperation.DELETE_ALL.execute(this.getDatabaseTester().getConnection(), userDataSet);
		session.close();
	}
	
	@Override
	protected IDataSet getDataSet() throws Exception {
		return new FlatXmlDataSet(this.getClass().getResourceAsStream("/user.xml"));
	}
	
	protected IDataSet getBlank() throws Exception {
		return new FlatXmlDataSet(this.getClass().getResourceAsStream("/messageBlank.xml"));
	}
	
	@Test
	public void testFindByEmail() {
		User newUser = userDaoImpl.findByEmail(user.getEmail());
		Assert.assertEquals(user.getEmail(), newUser.getEmail());
		
	}

	@Test
	public void testFindById() {
		User newUser = userDaoImpl.findById(1L);
		Assert.assertEquals(user.getId(), newUser.getId());		
	}

	@Test
	public void testSave() {
		User newUser = new User();
		newUser.setEmail("testemail6@gmail.com");
		newUser.setFirstName("Anna");
		newUser.setLastName("Petrova");
		newUser.setPassword("password");
		newUser.setRegistration(new Date());
		newUser.setSex(User.SexType.FEMALE.getSex());
		userDaoImpl.save(newUser);
		List<User> users = userDaoImpl.findAll();
		Assert.assertTrue(users.size()==6);
	}

	@Test
	public void testRemove() {
		userDaoImpl.remove(user);
		Assert.assertNull(userDaoImpl.findById(1L));
	}

	@Test
	public void testUpdate() {
		User newUser = userDaoImpl.findById(1L);
		Assert.assertEquals(user.getEmail(), newUser.getEmail());
		newUser.setFirstName("Ivan");;
		newUser = userDaoImpl.update(newUser);
		Assert.assertNotEquals(user.getFirstName(), newUser.getFirstName());
	}

	@Test
	public void testFindAll() {
		List<User> users = userDaoImpl.findAll();
		Assert.assertTrue(users.size()==5);
	}
	@Test
	public void testUserRoles(){
		User newUser = userDaoImpl.findById(1L);
		Assert.assertTrue(newUser.getRoles().size()==2);
	}

}
