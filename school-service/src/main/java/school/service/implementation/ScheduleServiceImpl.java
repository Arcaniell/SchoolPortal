package school.service.implementation;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Locale;
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

@Service
public class ScheduleServiceImpl implements ScheduleService {

	public final String[] array = { "01", "02", "03", "04", "05", "06", "07",
			"08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18",
			"19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29",
			"30", "31" };

	public static final String NEXT = "next";
	public static final String BACK = "back";
	public static final String ALL = "ALL";

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

	interface Strategy {
		String[] findStartDuration(String[] dayDuration, String way, Locale loc);
	}

	class DayDurationStrategy implements Strategy {
		public String[] findStartDuration(String[] dayDuration, String way,
				Locale loc) {
			String reportDate = "";
			String df = ScheduleUtil.getDateForSch(dayDuration[0]);
			String[] arr = df.split("-");
			String str = arr[0] + "-" + arr[1] + "-" + arr[2];

			try {

				Date date = DateUtil.getFormattedDate(str,
						DateUtil.SCHEDULE_DATE_FORMAT);
				Calendar cal = Calendar.getInstance();
				cal.setTime(date);

				if (way.equals(NEXT)) {
					cal.add(Calendar.DATE, +1);
				} else if (way.equals(BACK)) {

					cal.add(Calendar.DATE, -1);
				}
				Date dt = cal.getTime();

				reportDate = DateUtil.getFormattedDate(dt,
						DateUtil.SCHEDULE_DATEPICKER_FORMAT, loc);

			} catch (Exception e) {
				e.printStackTrace();
			}
			dayDuration[0] = reportDate;
			return dayDuration;
		}
	}

	class WeekDurationStrategy implements Strategy {
		public String[] findStartDuration(String[] dayDuration, String way,
				Locale loc) {
			String reportDate = "";
			String df = ScheduleUtil.getDateForSch(dayDuration[0]);

			String[] arr = df.split("-");
			String str = arr[0] + "-" + arr[1] + "-" + arr[2];

			try {

				Date date = DateUtil.getFormattedDate(str,
						DateUtil.SCHEDULE_DATE_FORMAT);
				Calendar cal = Calendar.getInstance();
				cal.setTime(date);

				if (way.equals(NEXT)) {
					cal.add(Calendar.DATE, +7);
				} else if (way.equals(BACK)) {

					cal.add(Calendar.DATE, -7);
				}
				Date dt = cal.getTime();

				reportDate = DateUtil.getFormattedDate(dt,
						DateUtil.SCHEDULE_DATEPICKER_FORMAT, loc);
			} catch (Exception e) {
				e.printStackTrace();
			}
			dayDuration[0] = reportDate;
			return dayDuration;
		}
	}

	class MonthDurationStrategy implements Strategy {
		public String[] findStartDuration(String[] dayDuration, String way,
				Locale loc) {

			String reportDate = "";
			String df = ScheduleUtil.getDateForSch(dayDuration[0]);

			String[] arr = df.split("-");
			String str = arr[0] + "-" + arr[1] + "-" + arr[2];

			try {

				Date date = DateUtil.getFormattedDate(str,
						DateUtil.SCHEDULE_DATE_FORMAT);

				Calendar cal = Calendar.getInstance();
				cal.setTime(date);
				Calendar cal1 = Calendar.getInstance();
				cal1.setTime(date);
				if (way.equals(NEXT)) {
					cal1.add(Calendar.MONTH, +1);
				} else if (way.equals(BACK)) {
					cal1.add(Calendar.MONTH, -1);
				}
				int daysInMonth = cal1.getActualMaximum(Calendar.DAY_OF_MONTH);
				if (way.equals(NEXT)) {
					cal.add(Calendar.DATE, +(daysInMonth));
				} else if (way.equals(BACK)) {
					cal.add(Calendar.DATE, -(daysInMonth));
				}

				Date dt = cal.getTime();

				reportDate = DateUtil.getFormattedDate(dt,
						DateUtil.SCHEDULE_DATEPICKER_FORMAT, loc);

			} catch (Exception e) {
				e.printStackTrace();
			}

			dayDuration[0] = reportDate;
			return dayDuration;
		}
	}

	class Context {
		private Strategy strategy;

		public Context() {
		}

		public void setStrategy(Strategy strategy) {
			this.strategy = strategy;
		}

		public String[] executeStrategy(String[] dayDuration, String way,
				Locale loc) {

			return strategy.findStartDuration(dayDuration, way, loc);
		}
	}

	public String[] getScheduleWithWay(String[] dayDuration, String way,
			Locale loc) {
		String[] result;
		Context context = new Context();

		if (dayDuration[1] == null) {
			dayDuration[1] = "week";
		}
		if (dayDuration[1].equals("week")) {
			context.setStrategy(new WeekDurationStrategy());

		} else if (dayDuration[1].equals("day")) {
			context.setStrategy(new DayDurationStrategy());
		} else if (dayDuration[1].equals("month")) {
			context.setStrategy(new MonthDurationStrategy());
		}

		result = context.executeStrategy(dayDuration, way, loc);
		return result;
	}

	@Transactional
	public void addSchedule(Schedule schedule) {
		scheduleDao.save(schedule);
	}

	@Transactional
	public List<Schedule> findByDates(Date from, Date till) {
		return scheduleDao.findByDates(from, till);
	}

	@Transactional
	public void deleteSchedule(Schedule schedule) {
		scheduleDao.remove(schedule);

	}

	@Transactional
	public Schedule updateSchedule(Schedule schedule) {
		return scheduleDao.update(schedule);

	}

	@Transactional
	public List<Schedule> current(long teacherId, int roomId, long groupId,
			String strDate, Duration duration) {

		Date till = null;
		Date from = null;
		List<Schedule> schedule = null;
		List<Date> interv = fromTillDay(strDate, duration);
		from = interv.get(0);
		till = interv.get(1);

		schedule = button(teacherId, roomId, groupId, from, till);

		return schedule;

	}

	@Transactional
	private List<Date> fromTillDay(String strDate, Duration duration) {
		Date till = null;
		Date from = null;
		List<Date> interval = new ArrayList<Date>();

		if (duration == Duration.day) {
			try {

				till = DateUtil.getFormattedDate(strDate,
						DateUtil.SCHEDULE_DATE_FORMAT);
				from = till;
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (duration == Duration.month) {

			try {

				Date date = DateUtil.getFormattedDate(strDate,
						DateUtil.SCHEDULE_DATE_FORMAT);
				Calendar cal = Calendar.getInstance();
				cal.setTime(date);
				Calendar first = (Calendar) cal.clone();
				first.set(Calendar.DAY_OF_MONTH,
						first.getActualMaximum(Calendar.DAY_OF_MONTH));
				Calendar last = (Calendar) cal.clone();
				last.set(Calendar.DAY_OF_MONTH,
						last.getActualMinimum(Calendar.DAY_OF_MONTH));

				till = first.getTime();

				from = last.getTime();

			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (duration == Duration.week) {

			try {

				Date date = DateUtil.getFormattedDate(strDate,
						DateUtil.SCHEDULE_DATE_FORMAT);
				Calendar cal = Calendar.getInstance();
				cal.setTime(date);

				Calendar first = (Calendar) cal.clone();
				first.add(Calendar.DAY_OF_WEEK, first.getFirstDayOfWeek()
						- first.get(Calendar.DAY_OF_WEEK));

				Calendar last = (Calendar) first.clone();
				last.add(Calendar.DAY_OF_YEAR, 6);

				from = first.getTime();
				till = last.getTime();

			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		interval.add(from);
		interval.add(till);

		return interval;
	}

	@Transactional
	public List<Teacher> allTeacher() {
		return teacherDao.findAll();

	}

	@Transactional
	public List<Group> allGroup() {
		List<Group> listGroup = groupDao.findAll();
		Collections.sort(listGroup);
		return listGroup;

	}

	@Transactional(propagation = Propagation.SUPPORTS)
	public List<GroupScheduleDTO> getGroupName(List<Group> groups, String id) {
		List<GroupScheduleDTO> listGroup = new ArrayList<GroupScheduleDTO>();
		Group selectGroup;
		Long groupId;
		if (id.equals(ALL) || id.equals("Group")) {
			groupId = new Long(0);
			selectGroup = null;
		} else {
			groupId = Long.parseLong(id);

			selectGroup = groupDao.findById(groupId);
		}

		if (selectGroup == null) {
			listGroup.add(0, new GroupScheduleDTO((byte) 0, 'o', new Long(0)));
			for (Group group : groups) {
				listGroup.add(new GroupScheduleDTO(group.getNumber(), group
						.getLetter(), group.getId()));
			}
		} else {
			for (Group group : groups) {
				if (selectGroup.equals(group)) {
					listGroup.add(0, new GroupScheduleDTO(group.getNumber(),
							group.getLetter(), group.getId()));
				}

				else {

					listGroup.add(new GroupScheduleDTO(group.getNumber(), group
							.getLetter(), group.getId()));
				}
			}
			listGroup.add(listGroup.size(), new GroupScheduleDTO((byte) 0, 'o',
					new Long(0)));
		}

		return listGroup;
	}

	@Transactional(propagation = Propagation.SUPPORTS)
	public List<RoomDTO> getRoomName(List<Room> room, String id) {
		List<RoomDTO> listRooms = new ArrayList<RoomDTO>();
		Integer roomId;
		Room selectRoom;
		if (id.equals(ALL) || id.equals("Room")) {
			roomId = new Integer(0);
			selectRoom = null;
		} else {
			roomId = Integer.parseInt(id);
			selectRoom = roomDao.findById(roomId);
		}
		List<Room> rooms = roomDao.findAll();

		if (selectRoom == null) {
			listRooms.add(0, new RoomDTO(roomId, 0));
			for (Room rom : rooms) {

				listRooms.add(new RoomDTO(rom.getRoomNumber(), rom.getId()));
			}
		} else {

			for (Room rom : rooms) {
				if (selectRoom.equals(rom)) {
					listRooms.add(0,
							new RoomDTO(rom.getRoomNumber(), rom.getId()));
				} else {
					listRooms
							.add(new RoomDTO(rom.getRoomNumber(), rom.getId()));
				}

			}
			listRooms.add(listRooms.size(), new RoomDTO(0, 0));
		}

		return listRooms;
	}

	@Transactional(propagation = Propagation.SUPPORTS)
	public List<UserDTO> getTeacherName(List<Teacher> teacher, String id) {
		List<UserDTO> listTeachers = new ArrayList<UserDTO>();
		Long teacherId;
		Teacher selectTeacher;

		if (id.equals(ALL) || id.equals("Teacher")) {
			teacherId = new Long(0);
			selectTeacher = null;
		} else {
			teacherId = Long.parseLong(id);
			selectTeacher = teacherDao.findById(teacherId);
		}

		List<Teacher> teachers = teacherDao.findAll();

		if (selectTeacher == null) {
			listTeachers.add(0, new UserDTO("", "", new Long(0)));
			for (Teacher tch : teachers) {

				listTeachers.add(new UserDTO(tch.getUser().getFirstName(), tch
						.getUser().getLastName(), tch.getId()));
			}

		} else {
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
			listTeachers.add(listTeachers.size(), new UserDTO("", "", new Long(
					0)));
		}
		return listTeachers;

	}

	@Transactional
	public List<Room> allRoom() {
		return roomDao.findAll();

	}

	@Transactional
	public Set<String> intervalForHeader(List<Schedule> schedules, Locale loc) {
		Set<String> headerDate = new TreeSet<String>();

		for (Schedule schedule : schedules) {

			headerDate.add(DateUtil.getFormattedDate(schedule.getDate(),
					DateUtil.SCHEDULE_DATE_FORMAT, loc));

		}
		return headerDate;
	}

	@Transactional(propagation = Propagation.SUPPORTS)
	public List<ScheduleDTO> getScheduleDto(List<Schedule> schedules, Locale loc) {

		List<ScheduleDTO> schedulesDto = new ArrayList<ScheduleDTO>();

		ScheduleDTO schDto = null;
		for (Schedule sch : schedules) {
			schDto = new ScheduleDTO();
			schDto.setGroup(new GroupScheduleDTO(sch.getGroup().getNumber(),
					sch.getGroup().getLetter()));

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

	@Transactional
	private List<Schedule> getGroupSchedule(List<Schedule> sch, long groupId) {
		if (groupId != 0) {
			List<Schedule> groups = scheduleDao.findByGroup(groupDao
					.findById(groupId));
			sch.retainAll(groups);
		}
		return sch;
	}

	@Transactional
	private List<Schedule> getTeacherSchedule(List<Schedule> sch, long teachId) {
		if (teachId != 0) {
			List<Schedule> teachers = scheduleDao.findByTeacher(teacherDao
					.findById(teachId));
			sch.retainAll(teachers);
		}
		return sch;
	}

	@Transactional
	private List<Schedule> getRoomSchedule(List<Schedule> sch, int roomId) {
		if (roomId != 0) {
			List<Schedule> rooms = scheduleDao.findByRoom(roomId);
			sch.retainAll(rooms);
		}
		return sch;
	}

	@Transactional
	private List<Schedule> button(long teacherId, int roomId, long groupId,
			Date from, Date till) {
		List<Schedule> schedule = scheduleDao.findByDates(from, till);
		List<Schedule> scheduleTech = getTeacherSchedule(schedule, teacherId);
		List<Schedule> scheduleGroup = getGroupSchedule(scheduleTech, groupId);
		List<Schedule> scheduleRoom = getRoomSchedule(scheduleGroup, roomId);
		return scheduleRoom;
	}

	public List<SchedulePerGroupDTO> sortScheduleForTable(
			List<ScheduleDTO> schDto, Set<String> dates) {
		Set<GroupScheduleDTO> uniqueGroups = new TreeSet<GroupScheduleDTO>();

		List<ScheduleDTO> listSch = new ArrayList<ScheduleDTO>();
		List<SchedulePerGroupDTO> result = new ArrayList<SchedulePerGroupDTO>();
		List<ScheduleDTO> temp = new ArrayList<ScheduleDTO>();
		Set<LessonDTO> lesson = new TreeSet<LessonDTO>();
		int k = 0;
		int rNuumb = 4;
		for (ScheduleDTO sch : schDto) {
			uniqueGroups.add(sch.getGroup());
		}
		for (GroupScheduleDTO group : uniqueGroups) {
			for (ScheduleDTO sch : schDto) {
				if ((sch.getGroup()).equals(group)) {
					listSch.add(sch);
				}
			}

			temp = new ArrayList<ScheduleDTO>(
					listSch.subList(k, listSch.size()));

			lesson = getListLess(temp);
			result.add(new SchedulePerGroupDTO(group, temp, getListLess(temp)
					.size(), getListLess(temp).size() * rNuumb, lesson, dates));

			k = listSch.size();

		}
		return addNullField(result, dates);
	}

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
		int rNuumb = 4;
		Set<LessonDTO> lesson = new TreeSet<LessonDTO>();

		List<ScheduleDTO> schLess = new ArrayList<ScheduleDTO>();
		List<ScheduleDTO> schLessNull = new ArrayList<ScheduleDTO>();
		List<SchedulePerGroupDTO> result = new ArrayList<SchedulePerGroupDTO>();

		List<ScheduleDTO> listBegin = new ArrayList<ScheduleDTO>();
		List<ScheduleDTO> temp2 = new ArrayList<ScheduleDTO>();
		List<ScheduleDTO> temp3 = new ArrayList<ScheduleDTO>();

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
				temp2 = new ArrayList<ScheduleDTO>(schLessNull.subList(y,
						schLessNull.size()));

				for (ScheduleDTO sortNull : temp2) {
					zagListG.add(sortNull);
				}

				y = schLessNull.size();

			}

			temp3 = new ArrayList<ScheduleDTO>(zagListG.subList(z,
					zagListG.size()));
			result.add(new SchedulePerGroupDTO(schedule.getGroup(), temp3,
					getListLess(temp3).size(), getListLess(temp3).size()
							* rNuumb, lesson, dates));
			z = zagListG.size();

		}
		return result;
	}

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
