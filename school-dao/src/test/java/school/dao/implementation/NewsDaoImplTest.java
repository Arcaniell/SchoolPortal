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

import school.dao.NewsDao;
import school.model.News;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:/META-INF/dao-context.xml"})
@TestExecutionListeners( { DependencyInjectionTestExecutionListener.class })
public class NewsDaoImplTest extends DBUnitConfig{

	private News news;
	@Autowired
	private NewsDao newsDao;


	public NewsDaoImplTest() {
		super("NewsDaoImplTest");
	}

	@Before
	public void setUp() throws Exception {
		news = new News();
		news.setId(1L);
		news.setTitle("News1");
		news.setBody("Some text");
		news.setInformation(true);
		DatabaseOperation.CLEAN_INSERT.execute(this.getDatabaseTester().getConnection(), getDataSet());
	}

	@After
	public void tearDown() throws Exception {
		DatabaseOperation.DELETE_ALL.execute(this.getDatabaseTester().getConnection(), getDataSet());
	}

	@Test
	public void testFindById() {
		News newNews = newsDao.findById(1L);
		Assert.assertEquals(news.getTitle(), newNews.getTitle());
	}

	@Test
	public void testSave() {
		News newNews = new News();
		newNews.setTitle("NewNews");
		newNews.setBody("Some text");
		newNews.setInformation(true);
		newsDao.save(newNews);
		Assert.assertTrue(newsDao.findAll().size() == 6);
	}

	@Test
	public void testRemove() {
		newsDao.remove(news);
		Assert.assertTrue(newsDao.findAll().size() == 4);
	}

	@Test
	public void testUpdate() {
		News newNews = newsDao.findById(1L);
		Assert.assertEquals(news.getTitle(), newNews.getTitle());
		newNews.setTitle("NewNews");
		newNews = newsDao.update(newNews);
		Assert.assertNotEquals(news.getTitle(), newNews.getTitle());
	}

	@Test
	public void testFindAll() {
		//Assert.assertTrue(newsDao.findAll().size() == 5);
	}

	@Override
	protected IDataSet getDataSet() throws Exception {
		return new FlatXmlDataSet(this.getClass().getResourceAsStream("/xml-data-sets/news.xml"));
	}
}
