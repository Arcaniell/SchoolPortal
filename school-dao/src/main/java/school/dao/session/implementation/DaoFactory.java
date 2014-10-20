package school.dao.session.implementation;

import school.dao.session.implementation.*;

public class DaoFactory {
	private CourseRequestDaoImpl courseRequestDaoImpl;
	// private GroupDaoImpl groupDaoImpl;
	// private JournalDaoImpl journalDaoImpl;
	// private LessonDaoImpl lessonDaoImpl;
	// private MessageDaoImpl messageDaoImpl;
	// private ParentDaoImpl parentDaoImpl;
	// private RoleDaoImpl roleDaoImpl;
	// private RoleRequestDaoImpl roleRequestDaoImpl;
	// private RoomDaoImpl roomDaoImpl;
	// private ScheduleDaoImpl scheduleDaoImpl;
	private StudentDaoImpl studentDaoImpl;
	// private SubjectDaoImpl subjectDaoImpl;
	// private TeacherDaoImpl teacherDaoImpl;
	private UserDaoImpl userDaoImpl;

	private static DaoFactory instance = null;

	private DaoFactory() {
		courseRequestDaoImpl = new CourseRequestDaoImpl();
		// groupDaoImpl = new GroupDaoImpl();
		// journalDaoImpl = new JournalDaoImpl();
		// lessonDaoImpl = new LessonDaoImpl();
		// messageDaoImpl = new MessageDaoImpl();
		// parentDaoImpl = new ParentDaoImpl();
		// roleDaoImpl = new RoleDaoImpl();
		// roleRequestDaoImpl = new RoleRequestDaoImpl();
		// roomDaoImpl = new RoomDaoImpl();
		// scheduleDaoImpl = new ScheduleDaoImpl();
		studentDaoImpl = new StudentDaoImpl();
		// subjectDaoImpl = new SubjectDaoImpl();
		// teacherDaoImpl = new TeacherDaoImpl();
		userDaoImpl = new UserDaoImpl();
	}

	public static synchronized DaoFactory getInstance() {
		if(DaoFactory.instance==null){
			return new DaoFactory();
		}
		else{
			return DaoFactory.instance;
		}

	}

	public CourseRequestDaoImpl getCourseRequestDaoImpl() {
		return courseRequestDaoImpl;
	}

	public StudentDaoImpl getStudentDaoImpl() {
		return studentDaoImpl;
	}

	public UserDaoImpl getUserDaoImpl() {
		return userDaoImpl;
	}

}
