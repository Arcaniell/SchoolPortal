package school.service.implementation;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import school.dao.CourseDao;
import school.dao.GroupDao;
import school.dao.LessonDao;
import school.dao.RoomDao;
import school.dao.ScheduleDao;
import school.dao.TeacherDao;
import school.dao.UserDao;
import school.dto.journal.JournalSearch;
import school.dto.schedule.CourseScheduleDTO;
import school.dto.schedule.GroupScheduleDTO;
import school.dto.schedule.LessonDTO;
import school.dto.schedule.RoomDTO;
import school.dto.schedule.ScheduleDTO;
import school.dto.schedule.SchedulePerGroupDTO;
import school.dto.schedule.UserDTO;
import school.model.Group;
import school.model.Role;
import school.model.Room;
import school.model.Schedule;
import school.model.Teacher;
import school.service.ScheduleService;
import school.service.utils.DateUtil;
import school.service.utils.JournalUtil;
import school.service.utils.ScheduleUtil;
import school.service.Strategy;


/**
 *This class provide such functionality
 *- finding information for comboboxs
 *- searching schedules according to chose interval
 *- searching schedules according three possible states: current? previous and future 
 *- additional function which help in process of representation of schedule information
 *
 * @author Natalya Kalynka
 * 
 */

@Service
public class ScheduleServiceImpl implements ScheduleService {

	public final String[] array = { "01", "02", "03", "04", "05", "06", "07",
			"08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18",
			"19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29",
			"30", "31" };

	public static final String NEXT = "next";
	public static final String BACK = "back";
	public static final String ALL = "ALL";
	public static final String WEEK = "week";
	public static final String DAY = "day";
	public static final String MONTH = "month";
	public static final String NONE = null;
	public static final int FROM = 0;
	public static final int TILL = 1;
	public static final int WEEKDAYS = 6;
	public static final int  RNUMB = 4;

	@Autowired
	private ScheduleDao scheduleDao;

	@Autowired
	private TeacherDao teacherDao;

	@Autowired
	private GroupDao groupDao;

	@Autowired
	private RoomDao roomDao;

	@Autowired
	private LessonDao lessonDao;

	@Autowired
	private CourseDao courseDao;

	@Autowired
	private UserDao userDao;

	/**
	 * 
	 * @param dayDuration
	 * @param way
	 * @param loc 
	 * @return String[]
	 */
	public String[] getScheduleWithWay(String[] dayDuration, String way,
			Locale loc) {
		String[] result;
		Context context = new Context();
		Map<String, Strategy> strategyMap = new HashMap<String, Strategy>();
		strategyMap.put(NONE, new WeekDurationStrategy());
		strategyMap.put(WEEK, new WeekDurationStrategy());
		strategyMap.put(DAY, new DayDurationStrategy());
		strategyMap.put(MONTH, new MonthDurationStrategy());

		context.setStrategy(strategyMap.get(dayDuration[ScheduleUtil.day]));

		result = context.executeStrategy(dayDuration, way, loc);
		return result;

	}

	/**
	 * This method searches schedules in pointed out interval.
	 * @param from
	 * @param till
	 * @return List<Schedule>
	 */
	@Transactional
	public List<Schedule> findByDates(Date from, Date till) {
		return scheduleDao.findByDates(from, till);
	}


	/**
	 * This method searches  schedules for select time duration according to typed date and selected teacher, room, group.
	 * @param teacherId
	 * @param roomId
	 * @param groupId
	 * @param strDate
	 * @param duration
	 * @return List<Schedule>
	 */
	@Transactional
	public List<Schedule> current(long teacherId, int roomId, long groupId,
			String strDate, Duration duration) {
		List<Date> interv = fromTillDay(strDate, duration);
		Date till = interv.get(TILL);
		Date from = interv.get(FROM);

		List<Schedule> schedule = button(teacherId, roomId, groupId, from, till);

		return schedule;

	}

	/**
	 * This method searches interval in which we will be search schedules.
	 * @param strDate
	 * @param duration
	 * @return List<Date> 
	 */
	@Transactional
	private List<Date> fromTillDay(String strDate, Duration duration) {

		Calendar first = activeDate(strDate);
		Calendar last = null;

		List<Date> interval = new ArrayList<Date>();

		if (duration == Duration.day) {
			last = first;

		} else if (duration == Duration.month) {
			last = activeDate(strDate);
			last.set(Calendar.DAY_OF_MONTH,
					first.getActualMaximum(Calendar.DAY_OF_MONTH));
			first.set(Calendar.DAY_OF_MONTH,
					last.getActualMinimum(Calendar.DAY_OF_MONTH));

		} else if (duration == Duration.week) {

			first.add(Calendar.DAY_OF_WEEK,
					first.getFirstDayOfWeek() - first.get(Calendar.DAY_OF_WEEK));
			last = (Calendar) first.clone();
			last.add(Calendar.DAY_OF_YEAR, WEEKDAYS);

		}

		interval.add(first.getTime());
		interval.add(last.getTime());

		return interval;
	}

	/**
	 * This method finds date for start counting an interal for schedules.
	 * @param strDate
	 * @return Calendar 
	 */
	private Calendar activeDate(String strDate) {
		Date date = null;
		Calendar calendar = Calendar.getInstance();

		try {
			date = DateUtil.getFormattedDate(strDate,
					DateUtil.SCHEDULE_DATE_FORMAT);
			calendar.setTime(date);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return calendar;

	}
	

	/**
	 * This method finds list of teachers of school.
	 * @return List<Teacher>
	 */
	@Transactional
	public List<Teacher> allTeacher() {
		return teacherDao.findAll();

	}

	/**
	 * This method finds list of groups of school.
	 * @return  List<Group>
	 */
	@Transactional
	public List<Group> allGroup() {
		List<Group> listGroup = groupDao.findAll();
		Collections.sort(listGroup);
		return listGroup;

	}

	/**
	 * This method form DTO objects for Group checkbox
	 * @param groups
	 * @param id
	 * @return List<GroupScheduleDTO>
	 */
	@Transactional(propagation = Propagation.SUPPORTS)
	public List<GroupScheduleDTO> getGroupName(List<Group> groups, String id) {
		List<GroupScheduleDTO> listGroup = new ArrayList<GroupScheduleDTO>();
		Long groupId = idDefaultValue(id);
		if (groupId == 0) {
			listGroup = noneSelect(groups);
		} else {
			listGroup = madeSelect(groups, groupDao.findById(groupId));
		}
		return listGroup;
	}

	
	/**
	 * This method create  list with default selected option of combobox on top.
	 * @param groups
	 * @return List<GroupScheduleDTO>
	 */
	@Transactional(propagation = Propagation.SUPPORTS)
	private List<GroupScheduleDTO> noneSelect(List<Group> groups) {
		List<GroupScheduleDTO> listGroup = new ArrayList<GroupScheduleDTO>();
		listGroup.add(0, new GroupScheduleDTO());
		for (Group group : groups) {
			listGroup.add(new GroupScheduleDTO(group.getNumber(), group
					.getLetter(), group.getId()));
		}
		return listGroup;

	}

	
	/**
	 * This method create  list with selected option of combobox on top.
	 * @param groups
	 * @param selectGroup
	 * @return List<GroupScheduleDTO>
	 */
	@Transactional(propagation = Propagation.SUPPORTS)
	private List<GroupScheduleDTO> madeSelect(List<Group> groups,
			Group selectGroup) {
		List<GroupScheduleDTO> listGroup = new ArrayList<GroupScheduleDTO>();
		for (Group group : groups) {
			if (selectGroup.equals(group)) {
				listGroup.add(
						0,
						new GroupScheduleDTO(group.getNumber(), group
								.getLetter(), group.getId()));
			} else {

				listGroup.add(new GroupScheduleDTO(group.getNumber(), group
						.getLetter(), group.getId()));
			}
		}
		listGroup.add(listGroup.size(), new GroupScheduleDTO());
		return listGroup;

	}
 
	/**
	 * This method sets id for default and just selected option of comboboxs 
	 * @param id
	 * @return long
	 */
	private long idDefaultValue(String id) {
		switch (id) {
		case "Group":
		case "Room":
		case "Teacher":
		case ALL:
			return 0;
		default:
			return Long.parseLong(id);

		}
	}

	/**
	 * This method form DTO objects for Room checkbox
	 * @param room
	 * @param id
	 * @return List<RoomDTO>
	 */
	@Transactional(propagation = Propagation.SUPPORTS)
	public List<RoomDTO> getRoomName(List<Room> room, String id) {
		List<RoomDTO> listRooms = new ArrayList<RoomDTO>();
		Integer roomId = (int) idDefaultValue(id);
		if (roomId == 0) {
			listRooms = noneSelect(roomDao.findAll(), roomId);
		} else {
			listRooms = madeSelect(roomDao.findAll(), roomDao.findById(roomId));
		}

		return listRooms;
	}

	/**
	 * This method create  list with default selected option of combobox on top.
	 * @param rooms
	 * @param roomId
	 * @return List<RoomDTO>
	 */
	@Transactional(propagation = Propagation.SUPPORTS)
	private List<RoomDTO> noneSelect(List<Room> rooms, Integer roomId) {
		List<RoomDTO> listRooms = new ArrayList<RoomDTO>();
		listRooms.add(0, new RoomDTO(roomId, 0));
		for (Room rom : rooms) {
			listRooms.add(new RoomDTO(rom.getRoomNumber(), rom.getId()));
		}
		return listRooms;

	}

	
	/**
	 * This method create  list with selected option of combobox on top.
	 * @param rooms
	 * @param selectRoom
	 * @return List<RoomDTO>
	 */
	@Transactional(propagation = Propagation.SUPPORTS)
	private List<RoomDTO> madeSelect(List<Room> rooms, Room selectRoom) {
		List<RoomDTO> listRooms = new ArrayList<RoomDTO>();
		for (Room rom : rooms) {
			if (selectRoom.equals(rom)) {
				listRooms.add(0, new RoomDTO(rom.getRoomNumber(), rom.getId()));
			} else {
				listRooms.add(new RoomDTO(rom.getRoomNumber(), rom.getId()));
			}

		}
		listRooms.add(listRooms.size(), new RoomDTO(0, 0));
		return listRooms;

	}

	
	/**
	 * This method form DTO objects for Teacher checkbox
	 * @param teacher
	 * @param id
	 * @return List<UserDTO>
	 */
	@Transactional(propagation = Propagation.SUPPORTS)
	public List<UserDTO> getTeacherName(List<Teacher> teacher, String id) {
		List<UserDTO> listTeachers = new ArrayList<UserDTO>();
		Long teacherId= idDefaultValue(id);
		if (teacherId == 0) {
			listTeachers = noneSelect(teacherDao.findAll(), teacherId);
		} else {
			listTeachers = madeSelect(teacherDao.findAll(),teacherDao.findById(teacherId) );
		}
	
		return listTeachers;
		
	}
	
	/**
	 * This method create  list with default selected option of combobox on top.
	 * @param teachers
	 * @param teacherId
	 * @return List<UserDTO>
	 */
	@Transactional(propagation = Propagation.SUPPORTS)
	private List<UserDTO> noneSelect(List<Teacher> teachers, Long teacherId) {
		List<UserDTO> listTeachers = new ArrayList<UserDTO>();
		listTeachers.add(0, new UserDTO());
		for (Teacher tch : teachers) {

			listTeachers.add(new UserDTO(tch.getUser().getFirstName(), tch
					.getUser().getLastName(), tch.getId()));
		}
		return listTeachers;

	}

	/**
	 * This method create  list with selected option of combobox on top.
	 * @param teachers
	 * @param selectTeacher
	 * @return List<UserDTO>
	 */
	@Transactional(propagation = Propagation.SUPPORTS)
	private List<UserDTO> madeSelect(List<Teacher> teachers, Teacher selectTeacher) {
		List<UserDTO> listTeachers = new ArrayList<UserDTO>();
		for (Teacher tch : teachers) {
			if (selectTeacher.equals(tch)) {
				listTeachers.add(0,
						new UserDTO(tch.getUser().getFirstName(), tch
								.getUser().getLastName(), tch.getId()));
			} else {
				listTeachers.add(new UserDTO(tch.getUser().getFirstName(),
						tch.getUser().getLastName(), tch.getId()));
			}
		}
		listTeachers.add(listTeachers.size(), new UserDTO());
		return listTeachers;

	}

	/**
	 * This method create  list of all rooms in school.
	 * @return  List<Room>
	 */
	@Transactional
	public List<Room> allRoom() {
		return roomDao.findAll();

	}

	
	/**
	 * This method creates  interval of dates for header of schedule table.
	 * @param schedules
	 * @param loc
	 * @return  Set<String>
	 */
	@Transactional
	public Set<String> intervalForHeader(List<Schedule> schedules, Locale loc) {
		Set<String> headerDate = new TreeSet<String>();

		for (Schedule schedule : schedules) {

			headerDate.add(DateUtil.getFormattedDate(schedule.getDate(),
					DateUtil.SCHEDULE_DATE_FORMAT, loc));

		}
		return headerDate;
	}

	/**
	 * Method which form DTO of schedule with mentioned is person who look at schedule is avtorized
	 * @param schedules
	 * @param loc
	 * @param isAvtor
	 * @return List<ScheduleDTO>
	 */

	@Transactional(propagation = Propagation.SUPPORTS)
	public List<ScheduleDTO> getScheduleDto(List<Schedule> schedules,
			Locale loc, boolean isAvtor) {

		List<ScheduleDTO> schedulesDto = new ArrayList<ScheduleDTO>();

		ScheduleDTO schDto = null;
		for (Schedule sch : schedules) {

			schDto = new ScheduleDTO();
			schDto.setLoginned(isAvtor);
			schDto.setGroup(new GroupScheduleDTO(sch.getGroup().getNumber(),
					sch.getGroup().getLetter()));
			schDto.setUserId(sch.getTeacher().getUser().getId());
			schDto.setScheduleId(sch.getId());

			schDto.setLesson(new LessonDTO(sch.getLesson().getId()));
			schDto.setTeacher(new UserDTO(sch.getTeacher().getUser()
					.getFirstName(), sch.getTeacher().getUser().getLastName()));
			schDto.setCourse(new CourseScheduleDTO(sch.getCourse()
					.getCourseName()));
			schDto.setRoom(new RoomDTO(sch.getRoom().getRoomNumber()));

			schDto.setDate(DateUtil.getFormattedDate(sch.getDate(),
					DateUtil.SCHEDULE_DATE_FORMAT, loc));
			schedulesDto.add(schDto);
			schDto = null;

		}

		return schedulesDto;
	}

	/**
	 * Method get range of Date from schedule
	 * @param schedules
	 * @param loc
	 * @return List<String>
	 */
	 
	@Transactional
	public List<String> getDates(List<Schedule> schedules, Locale loc) {
		List<String> dates = new ArrayList<String>();

		for (Schedule sch : schedules) {

			String date = DateUtil.getFormattedDate(sch.getDate(),
					DateUtil.SCHEDULE_DATE_FORMAT, loc);

			dates.add(date);
		}

		return dates;
	}
	
	/**
	 * Method gets schedules for selected group from income list of schedules
	 * @param sch
	 * @param groupId
	 * @return List<Schedule>
	 */
	@Transactional
	private List<Schedule> getGroupSchedule(List<Schedule> sch, long groupId) {
		if (groupId != 0) {
			List<Schedule> groups = scheduleDao.findByGroup(groupDao
					.findById(groupId));
			sch.retainAll(groups);
		}
		return sch;
	}

	
	/**
	 * Method gets schedules for selected teacher from income list of schedules
	 * @param sch
	 * @param teacherId
	 * @return List<Schedule>
	 */
	@Transactional
	private List<Schedule> getTeacherSchedule(List<Schedule> sch, long teachId) {
		if (teachId != 0) {
			List<Schedule> teachers = scheduleDao.findByTeacher(teacherDao
					.findById(teachId));
			sch.retainAll(teachers);
		}
		return sch;
	}

	/**
	 * Method gets schedules for selected room from income list of schedules
	 * @param sch
	 * @param roomId
	 * @return List<Schedule>
	 */
	@Transactional
	private List<Schedule> getRoomSchedule(List<Schedule> sch, int roomId) {
		if (roomId != 0) {
			List<Schedule> rooms = scheduleDao.findByRoom(roomId);
			sch.retainAll(rooms);
		}
		return sch;
	}

	/**
	 * Method gets schedules for combination of selected options of schedule form.
	 * @param teacherId
	 * @param groupId
	 * @param roomId
	 * @param from
	 * @param till
	 * @return List<Schedule>
	 */
	@Transactional
	private List<Schedule> button(long teacherId, int roomId, long groupId,
			Date from, Date till) {
		List<Schedule> schedule = scheduleDao.findByDates(from, till);
		List<Schedule> scheduleTech = getTeacherSchedule(schedule, teacherId);
		List<Schedule> scheduleGroup = getGroupSchedule(scheduleTech, groupId);
		List<Schedule> scheduleRoom = getRoomSchedule(scheduleGroup, roomId);
		return scheduleRoom;
	}

	/**
	 * Method gets schedules according to group.
	 * @param schDto
	 * @param dates
	 * @return List<SchedulePerGroupDTO>
	 */
	public List<SchedulePerGroupDTO> sortScheduleForTable(
			List<ScheduleDTO> schDto, Set<String> dates) {

		List<ScheduleDTO> listSch = new ArrayList<ScheduleDTO>();
		List<SchedulePerGroupDTO> result = new ArrayList<SchedulePerGroupDTO>();
		List<ScheduleDTO> schForGroup = new ArrayList<ScheduleDTO>();
		Set<LessonDTO> lesson = new TreeSet<LessonDTO>();
		int startNewGroup = 0;

		for (GroupScheduleDTO group : uniqGroups(schDto)) {
			for (ScheduleDTO sch : schDto) {
				if ((sch.getGroup()).equals(group)) {
					listSch.add(sch);
				}
			}

			schForGroup = new ArrayList<ScheduleDTO>(
					listSch.subList(startNewGroup, listSch.size()));

			lesson = getListLess(schForGroup);
			result.add(new SchedulePerGroupDTO(group, schForGroup, getListLess(schForGroup)
					.size(), getListLess(schForGroup).size() * RNUMB, lesson, dates));

			startNewGroup = listSch.size();

		}
		return addNullField(result, dates);
	}
	
	/**
	 * Method gets unique groups for schedule table.
	 * @param schDto
	 * @return Set<GroupScheduleDTO>
	 */
	 private Set<GroupScheduleDTO> uniqGroups(List<ScheduleDTO> schDto){
			Set<GroupScheduleDTO> rezult = new TreeSet<GroupScheduleDTO>();
			for (ScheduleDTO sch : schDto) {
				rezult.add(sch.getGroup());
			}
		 return rezult;
	 }

		/**
		 * Method gets schedules for group in full interval of dates. It replaced absent dates with null.
		 * @param sch
		 * @param dates 
		 * @return List<SchedulePerGroupDTO>
		 */
	private List<SchedulePerGroupDTO> addNullField(
			List<SchedulePerGroupDTO> sch, Set<String> dates) {
		List<ScheduleDTO> zagListG = new ArrayList<ScheduleDTO>();
		String dateFromSch = null;
		String tailDate = null;
		List<ScheduleDTO> scheduleG = new ArrayList<ScheduleDTO>();
		int flag = 0;
		int x = 0;
		int y = 0;
		int z = 0;
	
		Set<LessonDTO> lesson = new TreeSet<LessonDTO>();

		List<ScheduleDTO> schLess = new ArrayList<ScheduleDTO>();
		List<ScheduleDTO> schLessNull = new ArrayList<ScheduleDTO>();
		List<SchedulePerGroupDTO> result = new ArrayList<SchedulePerGroupDTO>();

		List<ScheduleDTO> listBegin = new ArrayList<ScheduleDTO>();
		List<ScheduleDTO> start_null = new ArrayList<ScheduleDTO>();
		List<ScheduleDTO> start_zag = new ArrayList<ScheduleDTO>();

		for (SchedulePerGroupDTO schedule : sch) {

			scheduleG = schedule.getListSchedule();

			lesson = getListLess(scheduleG);

			for (LessonDTO less : lesson) {
				for (ScheduleDTO schG : scheduleG) {
					if (less.equals(schG.getLesson())) {
						schLess.add(schG);
					}
				}
				listBegin = new ArrayList<ScheduleDTO>(schLess.subList(x,
						schLess.size()));
				for (String date : array) {

					for (ScheduleDTO sor : listBegin) {
						dateFromSch = sor.getDate().substring(0, 2);
						if (date.equals(dateFromSch)) {
							schLessNull.add(sor);
							flag = 1;
						} else {
							tailDate = sor.getDate().substring(2);
						}
					}
					if (flag != 1) {
						schLessNull.add(new ScheduleDTO(schedule.getGroup(),
								less, (date + tailDate)));
					} else {
						flag = 0;
					}
				}
				x = schLess.size();
				start_null = new ArrayList<ScheduleDTO>(schLessNull.subList(y,
						schLessNull.size()));

				for (ScheduleDTO sortNull : start_null) {

					zagListG.add(sortNull);
				}
				y = schLessNull.size();
			}

			start_zag = new ArrayList<ScheduleDTO>(zagListG.subList(z,

			zagListG.size()));
			result.add(new SchedulePerGroupDTO(schedule.getGroup(), start_zag,
					getListLess(start_zag).size(), getListLess(start_zag)
							.size() * RNUMB, lesson, dates));
			z = zagListG.size();
		}
		return result;
	}

	

	
	/**
	 * Method gets unique lessons numbers for schedule table.
	 * @param schedules
	 * @return Set<LessonDTO
	 */
	private Set<LessonDTO> getListLess(List<ScheduleDTO> schedules) {
		Set<LessonDTO> uniqueLesson = new TreeSet<LessonDTO>();
		for (ScheduleDTO sch : schedules) {
			uniqueLesson.add(sch.getLesson());
		}

		return uniqueLesson;
	}

	/**
	 * @author Ihor Uksta
	 * 
	 *         This method gets all schedules from DB by role and some chosen
	 *         subject. For teacher gets only schedules that include chosen
	 *         subject and teacher involves in. For other staff gets all school
	 *         schedules by chosen subject.
	 * 
	 * @param userId
	 * @param role
	 * @param subject
	 * @return
	 */
	public List<Schedule> getSchedulesByRoleAndSubject(long userId,
			String role, String subject) {
		if (role.equals(Role.Secured.TEACHER)) {
			return scheduleDao.findByTeacherAndCourse(
					teacherDao.findByUserId(userId).getId(), subject);
		}
		if (role.equals(Role.Secured.HEAD_TEACHER)
				|| role.equals(Role.Secured.DIRECTOR)) {
			return scheduleDao.findByCourse(subject);
		}
		return null;
	}

	/**
	 * @author Ihor Uksta
	 * 
	 *         This method gets all schedules from DB by role. For teacher gets
	 *         only schedules that teacher involves in. For other staff gets all
	 *         school schedules.
	 * 
	 * @param userId
	 * @param role
	 * @return
	 */
	public List<Schedule> getSchedulesByRole(long userId, String role) {

		if (role.equals(Role.Secured.TEACHER)) {
			return scheduleDao.findByTeacher(teacherDao.findByUserId(userId));
		} else if (role.equals(Role.Secured.HEAD_TEACHER)
				|| role.equals(Role.Secured.DIRECTOR)) {
			return scheduleDao.findAll();
		}
		return null;
	}

	/**
	 * @author Ihor Uksta
	 * 
	 *         This method gets all schedules by some chosen period, group, and
	 *         subject.
	 * 
	 * @param search
	 * @param group
	 * @return List<Schedule>
	 */
	public List<Schedule> getSchedulesForStudentMarks(JournalSearch search,
			Group group) {
		Date[] quarterDates = JournalUtil
				.getDatesByQuarter(search.getQuarter());
		return scheduleDao.findByGroupCourseInterval(group.getId(),
				search.getSubject(),
				quarterDates[JournalUtil.FIRST_DATE_OF_QUARTER],
				quarterDates[JournalUtil.LAST_DATE_OF_QUARTER]);
	}
}
