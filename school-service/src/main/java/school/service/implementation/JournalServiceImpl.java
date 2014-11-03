package school.service.implementation;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import school.dao.JournalDao;
import school.model.Journal;
import school.service.JournalService;

@Service
public class JournalServiceImpl implements JournalService {

	@Autowired
	private JournalDao journalDao;

	@Transactional
	public List<Journal> findByInterval(Date from, Date till) {
		return journalDao.findByInterval(from, till);
	}

	@Transactional
	public List<Journal> findByStudentId(long studentId) {
		return journalDao.findByStudentId(studentId);
	}

	@Transactional
	public List<Journal> findByIntervalAndStudentId(long studentId, Date from,
			Date till) {
		return journalDao.findByIntervalAndStudentId(studentId, from, till);
	}

}
