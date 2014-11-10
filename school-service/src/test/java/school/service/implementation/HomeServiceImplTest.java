package school.service.implementation;

import java.util.ArrayList;
import java.util.List;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.runners.MockitoJUnitRunner;

import school.dao.NewsDao;
import school.model.News;
import school.service.HomeService;

@RunWith(MockitoJUnitRunner.class)
public class HomeServiceImplTest {

	@Mock
	private NewsDao newsDao;
	@InjectMocks
	private HomeService homeService = new HomeServiceImpl();

	@Test
	public void testFindAllNews() {
		 List<News> expected = new ArrayList<News>();
		 Mockito.when(newsDao.findAll()).thenReturn(expected);
		 List<News> actual = homeService.findAllNews();
		 Assert.assertEquals(expected, actual);
	}

}
