package school.dao.session.implementation;

import static org.junit.Assert.*;

import java.util.Date;

import org.junit.AfterClass;
import org.junit.Assert;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import school.model.Role;
import school.model.User;

public class UserDaoImplTest {
	
	private User user;
	private UserDaoImpl userDaoImpl;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		HibernateSessionFactory.shutdown();
	}

	@Before
	public void setUp() throws Exception {
//		beforeData = new FlatXmlDataSetBuilder().build(
//
//				 Thread.currentThread().getContextClassLoader()
//				 .getResourceAsStream("com/devcolibri/entity/person/person-data.xml"));
//
//				 tester.setDataSet(beforeData);
//
//				 tester.onSetup();

				

		userDaoImpl = new UserDaoImpl();
		user = new User();
		user.setEmail("testmail@gmail.com");
		user.setFirstName("Roman");
		user.setLastName("Romanovsky");
		user.setPassword("password");
		user.setRegistration(new Date());
		Role role1 = new Role();
		role1.setName("TestRole1");
		Role role2 = new Role();
		role2.setName("TestRole2");
		user.getRoles().add(role1);
		user.getRoles().add(role2);
	}

	public User testFindByEmail() {
		User newUser = userDaoImpl.findByEmail(user.getEmail());
		Assert.assertEquals(user.getEmail(), newUser.getEmail());
		return newUser;
	}

	public void testFindById(User newUser) {
		newUser = userDaoImpl.findById(newUser.getId());
		Assert.assertEquals(user.getEmail(), newUser.getEmail());
	}

	public void testSave() {
		userDaoImpl.save(user);
	}

	public void testRemove() {
		userDaoImpl.remove(user);
	}

	public void testUpdate() {
		///
	}

	
	public void testFindAll() {
		fail("Not yet implemented");
	}
	@Test
	public void test(){
		testSave();
		//////
	}

}
