package school.dao.sessionfactory.implementation;

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

public class RoleDaoImplTest extends DBUnitConfig{
	private Role role;
	private RoleDaoImpl roleDaoImpl;

	public RoleDaoImplTest() {
		super("RoleDaoImplTest");
	}

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		HibernateSessionFactory.shutdown();
	}

	@Before
	public void setUp() throws Exception {
		roleDaoImpl = new RoleDaoImpl();
		role = new Role();
		role.setId(1);
		role.setName("Teacher");
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

	@Test
	public void testFindById() {
		Role newRole = roleDaoImpl.findById(role.getId());
		Assert.assertEquals(role.getName(), newRole.getName());
	}

	@Test
	public void testSave() {
		Role newRole = new Role();
		newRole.setId(1);
		newRole.setName("NewRole");
		roleDaoImpl.save(newRole);
		Assert.assertTrue(roleDaoImpl.findAll().size() == 7);
	}

	@Test
	public void testRemove() {
		roleDaoImpl.remove(role);
		Assert.assertTrue(roleDaoImpl.findAll().size() == 5);
	}

	@Test
	public void testUpdate() {
		Role newRole = roleDaoImpl.findById(role.getId());
		Assert.assertEquals(role.getName(), newRole.getName());
		newRole.setName("NewRole2");
		newRole = roleDaoImpl.update(newRole);
		Assert.assertNotEquals(role.getName(), newRole.getName());
	}

	@Test
	public void testFindAll() {
		Assert.assertTrue(roleDaoImpl.findAll().size() == 6);
	}

	@Override
	protected IDataSet getDataSet() throws Exception {
		return new FlatXmlDataSet(this.getClass().getResourceAsStream("/role.xml"));
	}

}
