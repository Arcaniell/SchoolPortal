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

import school.dao.RoleRequestDao;
import school.model.Role;
import school.model.RoleRequest;
import school.model.User;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:/META-INF/dao-context.xml"})
@TestExecutionListeners( { DependencyInjectionTestExecutionListener.class })
public class RoleRequestDaoImplTest extends DBUnitConfig{

	public RoleRequestDaoImplTest() {
		super("RoleRequestDaoImplTest");
	}

	private RoleRequest roleRequest;
	@Autowired
	private RoleRequestDao roleRequestDao;
	
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
		DatabaseOperation.CLEAN_INSERT.execute(this.getDatabaseTester().getConnection(), getDataSet());
	}
	@After
	public void tearDown() throws Exception {
		DatabaseOperation.DELETE_ALL.execute(this.getDatabaseTester().getConnection(), getDataSet());
	}

	
	@Override
	protected IDataSet getDataSet() throws Exception {
		return new FlatXmlDataSet(this.getClass().getResourceAsStream("/xml-data-sets/rolerequest.xml"));
	}

	@Test
	public void testFindById() {
		RoleRequest newroleRequest = roleRequestDao.findById(1L);
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
		roleRequestDao.save(newRoleRequest);
		List<RoleRequest> roleRequests = roleRequestDao.findAll();
		Assert.assertTrue(roleRequests.size()==4);
	}

	@Test
	public void testRemove() {
		roleRequestDao.remove(roleRequest);
		Assert.assertNull(roleRequestDao.findById(1L));
	}

	@Test
	public void testUpdate() {
		RoleRequest newRoleRequest = roleRequestDao.findById(1L);
		Assert.assertEquals(roleRequest.getRole(), newRoleRequest.getRole());
		Role role = new Role();
		role.setId(2);
		newRoleRequest.setRole(role);
		newRoleRequest = roleRequestDao.update(newRoleRequest);
		Assert.assertNotEquals(roleRequest.getRole(), newRoleRequest.getRole());
	}

	@Test
	public void testFindAll() {
		List<RoleRequest> roleRequests = roleRequestDao.findAll();
		Assert.assertTrue(roleRequests.size()==3);
	}


}
