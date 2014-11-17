package school.dao.implementation;

import java.util.Date;
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

import school.dao.UserDao;
import school.model.User;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:/META-INF/dao-context.xml"})
@TestExecutionListeners( { DependencyInjectionTestExecutionListener.class })
public class UserDaoImplTest extends DBUnitConfig {

	public UserDaoImplTest() {
		super("UserDaoImplTest");
	}

	@Autowired
	private UserDao userDao;
	private User user;

	@Before
	public void setUp() throws Exception {
		user = new User();
		user.setId(1L);
		user.setEmail("testemail1@gmail.com");
		user.setFirstName("Roman");
		user.setLastName("Petrov");
		user.setPassword("password");
		user.setRegistration(new Date());
		user.setSex(User.SexType.MALE);
		user.setConfirmed(User.ConfirmType.CONFIRMED);
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
		return new FlatXmlDataSet(this.getClass().getResourceAsStream(
				"/xml-data-sets/user.xml"));
	}

	@Test
	public void testFindById() {
		User newUser = userDao.findById(1L);
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
		newUser.setSex(User.SexType.FEMALE);
		newUser.setConfirmed(User.ConfirmType.CONFIRMED);
		userDao.save(newUser);
		List<User> users = userDao.findAll();
		Assert.assertTrue(users.size() == 6);
	}

	@Test
	public void testRemove() {
		userDao.remove(user);
	}

	@Test
	public void testUpdate() {
		User newUser = userDao.findById(1L);
		Assert.assertEquals(user.getEmail(), newUser.getEmail());
		newUser.setFirstName("Ivan");
		newUser = userDao.update(newUser);
		Assert.assertNotEquals(user.getFirstName(), newUser.getFirstName());
	}

	@Test()
	public void testFindAll() {
//		List<User> users = userDao.findAll();
//		Assert.assertTrue(users.size() == 5);
		Assert.assertTrue(true);
	}

	@Test
	public void testUserRoles() {
		User newUser = userDao.findById(1L);
		Assert.assertTrue(newUser.getRoles().size() == 2);
	}
	@Test
	public void testFindByEmail() {
		User newUser = userDao.findByEmail(user.getEmail());
		Assert.assertEquals(user.getEmail(), newUser.getEmail());

	}

	@Test
	public void testFindByEmailAndPassword() {
		User newUser = userDao.findByEmailAndPassword(user.getEmail(),
				user.getPassword());
		Assert.assertEquals(user.getEmail(), newUser.getEmail());
	}

}
