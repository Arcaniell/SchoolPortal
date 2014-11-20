package school.dao.implementation;



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

import school.dao.RoomDao;
import school.model.Room;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:/META-INF/dao-context.xml" })
@TestExecutionListeners({ DependencyInjectionTestExecutionListener.class })

public class RoomDaoImplTest extends DBUnitConfig{
	@Autowired
	RoomDao roomDao;
	Room room;
	List<Room> rooms;
	
	public RoomDaoImplTest() {
		super("RoomDaoImplTest");
	}


	@Before
	public void setUp() throws Exception {
		super.setUp();
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
				"/xml-data-sets/room.xml"));
	}
	
	@Test
	public void testFindByRoomNumber() throws Exception {
		room = roomDao.findByRoomNumber(110);
		Assert.assertEquals(110, room.getRoomNumber());
	}
	
	@Test
	public void testFindByRoomSize() throws Exception {
		rooms = roomDao.findByRoomSize(25);
		Assert.assertEquals(2, rooms.size());
	}
	
	@Test
	public void testFindByRoomAvailable() throws Exception {
		rooms = roomDao.findByRoomAvailable(false);
		Assert.assertEquals(3, rooms.size());
	}
}
