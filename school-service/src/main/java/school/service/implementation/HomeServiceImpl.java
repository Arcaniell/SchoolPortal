package school.service.implementation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import school.dao.NewsDao;
import school.model.News;
import school.service.HomeService;

@Service
public class HomeServiceImpl implements HomeService{
	
	@Autowired
	NewsDao newsDao;
	
	@Transactional
	public List<News> findAllNews() {
		return newsDao.findAll();
	}

}
