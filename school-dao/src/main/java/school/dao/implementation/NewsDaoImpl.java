package school.dao.implementation;

import org.springframework.stereotype.Repository;

import school.dao.NewsDao;
import school.model.News;

@Repository
public class NewsDaoImpl extends BaseDaoImpl<News, Long> implements NewsDao{

	public NewsDaoImpl() {
		super(News.class);
	}

}
