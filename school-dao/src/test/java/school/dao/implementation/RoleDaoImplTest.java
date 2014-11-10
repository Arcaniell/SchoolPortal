package school.dao.implementation;

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

import school.dao.RoleDao;
import school.model.Role;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:/META-INF/dao-context.xml"})
@TestExecutionListeners( { DependencyInjectionTestExecutionListener.class })
public class RoleDaoImplTest extends DBUnitConfig{

	private Role role;
	@Autowired
	private RoleDao roleDao;

	public RoleDaoImplTest() {
		super("RoleDaoImplTest");
	}

	@Before
	public void setUp() throws Exception {
		role = new Role();
		role.setId(1);
		role.setName("Teacher");
		
		DatabaseOperation.CLEAN_INSERT.execute(this.getDatabaseTester().getConnection(), getDataSet());
	}

	@After
	public void tearDown() throws Exception {
		DatabaseOperation.DELETE_ALL.execute(this.getDatabaseTester().getConnection(), getDataSet());
	}

	@Test
	public void testFindById() {
		Role newRole = roleDao.findById(role.getId());
		Assert.assertEquals(role.getName(), newRole.getName());
	}

	@Test
	public void testSave() {
		Role newRole = new Role();
		newRole.setName("NewRole");
		roleDao.save(newRole);
		Assert.assertTrue(roleDao.findAll().size() == 7);
	}

	@Test
	public void testRemove() {
		roleDao.remove(role);
		Assert.assertTrue(roleDao.findAll().size() == 5);
	}

	@Test
	public void testUpdate() {
		Role newRole = roleDao.findById(role.getId());
		Assert.assertEquals(role.getName(), newRole.getName());
		newRole.setName("NewRole2");
		newRole = roleDao.update(newRole);
		Assert.assertNotEquals(role.getName(), newRole.getName());
	}

	@Test
	public void testFindAll() {
	    while(roleDao.findAll().size()==0){}
		Assert.assertTrue(roleDao.findAll().size() == 6);
	}

	@Override
	protected IDataSet getDataSet() throws Exception {
		return new FlatXmlDataSet(this.getClass().getResourceAsStream("/xml-data-sets/role.xml"));
	}

}
