package school.dao.session.implementation;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import org.dbunit.DBTestCase;
import org.dbunit.IDatabaseTester;
import org.dbunit.JdbcDatabaseTester;
import org.dbunit.PropertiesBasedJdbcDatabaseTester;
import org.junit.Before;

public abstract class DBUnitConfig extends DBTestCase {
	protected IDatabaseTester tester;
	private Properties properties;
	@Before
	public void setUp() throws Exception {
		tester = new JdbcDatabaseTester(properties.getProperty("db.driver"),
				properties.getProperty("db.url"),
				properties.getProperty("db.username"),
				properties.getProperty("db.password"));
	}

	public DBUnitConfig(String name) {
		super(name);
		properties = new Properties();
		InputStream inputStream = getClass().getClassLoader()
				.getResourceAsStream("db.config.properties");
		try {
			properties.load(inputStream);
			System.setProperty(
					PropertiesBasedJdbcDatabaseTester.DBUNIT_DRIVER_CLASS,
					properties.getProperty("db.driver"));
			System.setProperty(
					PropertiesBasedJdbcDatabaseTester.DBUNIT_CONNECTION_URL,
					properties.getProperty("db.url"));
			System.setProperty(
					PropertiesBasedJdbcDatabaseTester.DBUNIT_USERNAME,
					properties.getProperty("db.username"));
			System.setProperty(
					PropertiesBasedJdbcDatabaseTester.DBUNIT_PASSWORD,
					properties.getProperty("db.password"));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
