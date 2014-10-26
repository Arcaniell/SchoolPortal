package school.dao.sessionfactory.implementation;

import static org.junit.Assert.*;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

import org.dbunit.dataset.DataSetException;
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

import school.model.Group;
import school.model.Room;

public class RoomDaoImplTest extends DBUnitConfig {
	private RoomDaoImpl roomDaoImpl;
	private Room room;
	private List<Room> rooms;

	public RoomDaoImplTest() {
		super("RoomDaoImplTest");
		// TODO Auto-generated constructor stub
	}

	@BeforeClass
	protected void setUpBeforeClass() throws Exception {
	}

	@AfterClass
	protected void tearDownAfterClass() throws Exception {
		HibernateSessionFactory.shutdown();
	}

	@Before
	public void setUp() throws Exception {
		Session session = HibernateSessionFactory.getSessionFactory()
				.openSession();
		roomDaoImpl = new RoomDaoImpl();
		DatabaseOperation.CLEAN_INSERT.execute(this.getDatabaseTester()
				.getConnection(), getDataSet());
		DatabaseOperation.INSERT.execute(this.getDatabaseTester()
				.getConnection(), getDataSet());
		session.close();
	}

	@After
	public void tearDown() throws Exception {
		DatabaseOperation.CLEAN_INSERT.execute(this.getDatabaseTester()
				.getConnection(), getBlank());
	}

	private IDataSet getBlank() throws DataSetException, IOException {
		return new FlatXmlDataSet(this.getClass().getResourceAsStream(
				"/blank.xml"));
	}

	@Override
	protected IDataSet getDataSet() throws DataSetException,
			FileNotFoundException, IOException {
		return new FlatXmlDataSet(this.getClass().getResourceAsStream(
				"/room.xml"));
	}

	@Test
	public void testFindByRoomNumber() {
		room = roomDaoImpl.findByRoomNumber(1);
		Assert.assertEquals(1L, room.getId());
	}
	
	@Test
	public void testFindByRoomAvailable() {
		rooms = roomDaoImpl.findByRoomAvailable(true);
		Assert.assertTrue(rooms.size() == 1);
	}
	
	@Test
	public void testFindByRoomSize() {
		rooms = roomDaoImpl.findByRoomSize(20);
		Assert.assertTrue(rooms.size() == 1);
	}

}
