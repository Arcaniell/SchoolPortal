package school.dao.session.implementation;

import static org.junit.Assert.*;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import school.model.User;

public class UserDaoImplTest {

	private User user;
	private UserDaoImpl userDaoImpl;

	@Before
	public void setUp() throws Exception {
		user = new User();
		user.setId(1L);
		user.setEmail("a");
		userDaoImpl = new UserDaoImpl();
	}

	@Test
	public void testfindById() {
		User newUser = userDaoImpl.findById(user.getId());
		Assert.assertTrue(newUser.getId()==1);
	}
	@Test
	public void testfindByEmail() {
		User newUser = userDaoImpl.findByEmail(user.getEmail());
		Assert.assertTrue(newUser.getId()==1);
	}

}
