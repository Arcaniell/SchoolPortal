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

import school.model.Role;
import school.model.RoleRequest;
import school.model.User;

public class RoleRequestDaoTest extends DBUnitConfig{

	public RoleRequestDaoTest() {
		super("RoleRequestDaoTest");
	}

	private RoleRequest roleRequest;
	private RoleRequestDaoImpl roleRequestDaoImpl;
	@BeforeClass
	protected static void setUpBeforeClass() throws Exception {
	}
	@AfterClass
	protected static void tearDownAfterClass() throws Exception {
		HibernateSessionFactory.shutdown();
	}
	
	@Before
	public void setUp() throws Exception {
		User user = new User();
		user.setId(1L);
		user.setEmail("testemail1@gmail.com");
		user.setFirstName("Roman");
		user.setLastName("Petrov");
		user.setPassword("password");
		user.setRegistration(new Date());
		user.setSex(User.SexType.MALE.getSex());
		Role role = new Role();
		role.setId(1);
		role.setName("Teacher");
		roleRequest = new RoleRequest();
		roleRequest.setId(1L);
		roleRequest.setUser(user);
		roleRequest.setRole(role);
		roleRequest.setRequestDate(new Date());
		roleRequestDaoImpl = new RoleRequestDaoImpl();
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		DatabaseOperation.CLEAN_INSERT.execute(this.getDatabaseTester().getConnection(), getDataSet());
		session.close();
		  
	}
	@After
	public void tearDown() throws Exception {
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		DatabaseOperation.DELETE_ALL.execute(this.getDatabaseTester().getConnection(), getDataSet());
		session.close();
	}

	
	@Override
	protected IDataSet getDataSet() throws Exception {
		return new FlatXmlDataSet(this.getClass().getResourceAsStream("/rolerequest.xml"));
	}

	@Test
	public void testFindById() {
		RoleRequest newroleRequest = roleRequestDaoImpl.findById(1L);
		Assert.assertEquals(roleRequest.getId(), newroleRequest.getId());
	}

	@Test
	public void testSave() {
		User newUser = new User();
		newUser.setId(1L);
		Role newRole = new Role();
		newRole.setId(1);
		RoleRequest newRoleRequest = new RoleRequest();
		newRoleRequest.setUser(newUser);
		newRoleRequest.setRole(newRole);
		newRoleRequest.setRequestDate(new Date());
		roleRequestDaoImpl.save(newRoleRequest);
		List<RoleRequest> roleRequests = roleRequestDaoImpl.findAll();
		Assert.assertTrue(roleRequests.size()==4);
	}

	@Test
	public void testRemove() {
		roleRequestDaoImpl.remove(roleRequest);
		Assert.assertNull(roleRequestDaoImpl.findById(1L));
	}

	@Test
	public void testUpdate() {
		RoleRequest newRoleRequest = roleRequestDaoImpl.findById(1L);
		Assert.assertEquals(roleRequest.getRole(), newRoleRequest.getRole());
		Role role = new Role();
		role.setId(2);
		roleRequest.setRole(role);
		newRoleRequest = roleRequestDaoImpl.update(newRoleRequest);
		Assert.assertNotEquals(roleRequest.getRole(), newRoleRequest.getRole());
	}

	@Test
	public void testFindAll() {
		List<RoleRequest> roleRequests = roleRequestDaoImpl.findAll();
		Assert.assertTrue(roleRequests.size()==3);
	}

}
