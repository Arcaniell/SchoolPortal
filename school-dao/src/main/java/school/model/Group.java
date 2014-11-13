package school.model;

import java.util.Comparator;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "GROUPS")
@NamedQueries({
        @NamedQuery(name = Group.FIND_BY_STATUS, query = Group.FIND_BY_STATUS_QUERY),
        @NamedQuery(name = Group.FIND_BY_NUMBER, query = "SELECT g FROM Group g WHERE g.number = :number"),
        @NamedQuery(name = Group.FIND_BY_STARTDATE, query = "SELECT g FROM Group g WHERE g.startDate = :startDate"),
        @NamedQuery(name = Group.FIND_BY_TEACHER, query = "SELECT g FROM Group g WHERE g.teacher.id = :teacherId"),
        @NamedQuery(name = Group.FIND_BY_COURSE, query = "SELECT g FROM Group g WHERE g.additionCourse.id = :courseId"),
        @NamedQuery(name = Group.FIND_BY_NUMBER_LETTER, query = "SELECT g FROM Group g WHERE g.number = :number and g.letter = :letter"),
        @NamedQuery(name = Group.FIND_ALL_ACTIVE_GROUP, query = "SELECT g FROM Group g WHERE :actualDate BETWEEN g.startDate and g.endDate"), })
public class Group implements Comparable<Group> {

    public static final String FIND_BY_STATUS = "Group.findByStatus";
    public static final String FIND_BY_STATUS_QUERY = "SELECT g FROM Group g WHERE g.additional = :additional";
    public static final String FIND_BY_NUMBER = "Group.findByNumber";
    public static final String FIND_BY_STARTDATE = "Group.findByStartDate";
    public static final String FIND_BY_TEACHER = "Group.findByTeacherId";
    public static final String FIND_BY_COURSE = "Group.findByCourseId";
    public static final String FIND_BY_NUMBER_LETTER = "Group.findByNumberAndLetter";
    public static final String FIND_ALL_ACTIVE_GROUP = "Group.findAllActiveGroups";

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(unique = true)
    private long id;
    @OneToOne
    @JoinColumn(name = "teacherId")
    private Teacher teacher;
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "group")
    private List<Schedule> schedule;
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "group")
    private List<Student> student;
    @ManyToMany(fetch = FetchType.LAZY, mappedBy = "additionGroups")
    private List<Student> addStudent;
    private byte number;
    private char letter;
    private boolean additional;
    @Column(nullable = false)
    private Date startDate;
    private Date endDate;
    @OneToOne
    @JoinColumn(name = "additionCourseId")
    private Course additionCourse;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Teacher getTeacher() {
        return teacher;
    }

    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }

    public List<Schedule> getSchedule() {
        return schedule;
    }

    public void setSchedule(List<Schedule> schedule) {
        this.schedule = schedule;
    }

    public List<Student> getStudent() {
        return student;
    }

    public void setStudent(List<Student> student) {
        this.student = student;
    }

    public byte getNumber() {
        return number;
    }

    public void setNumber(byte number) {
        this.number = number;
    }

    public char getLetter() {
        return letter;
    }

    public void setLetter(char letter) {
        this.letter = letter;
    }

    public boolean isAdditional() {
        return additional;
    }

    public void setAdditional(boolean additional) {
        this.additional = additional;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public List<Student> getAddStudent() {
        return addStudent;
    }

    public void setAddStudent(List<Student> addStudent) {
        this.addStudent = addStudent;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public Course getAdditionCourse() {
        return additionCourse;
    }

    public void setAdditionCourse(Course additionCourse) {
        this.additionCourse = additionCourse;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result
                + ((addStudent == null) ? 0 : addStudent.hashCode());
        result = prime * result
                + ((additionCourse == null) ? 0 : additionCourse.hashCode());
        result = prime * result + (additional ? 1231 : 1237);
        result = prime * result + ((endDate == null) ? 0 : endDate.hashCode());
        result = prime * result + (int) (id ^ (id >>> 32));
        result = prime * result + letter;
        result = prime * result + number;
        result = prime * result
                + ((schedule == null) ? 0 : schedule.hashCode());
        result = prime * result
                + ((startDate == null) ? 0 : startDate.hashCode());
        result = prime * result + ((student == null) ? 0 : student.hashCode());
        result = prime * result + ((teacher == null) ? 0 : teacher.hashCode());
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        Group other = (Group) obj;
        if (addStudent == null) {
            if (other.addStudent != null)
                return false;
        } else if (!addStudent.equals(other.addStudent))
            return false;
        if (additionCourse == null) {
            if (other.additionCourse != null)
                return false;
        } else if (!additionCourse.equals(other.additionCourse))
            return false;
        if (additional != other.additional)
            return false;
        if (endDate == null) {
            if (other.endDate != null)
                return false;
        } else if (!endDate.equals(other.endDate))
            return false;
        if (id != other.id)
            return false;
        if (letter != other.letter)
            return false;
        if (number != other.number)
            return false;
        if (schedule == null) {
            if (other.schedule != null)
                return false;
        } else if (!schedule.equals(other.schedule))
            return false;
        if (startDate == null) {
            if (other.startDate != null)
                return false;
        } else if (!startDate.equals(other.startDate))
            return false;
        if (student == null) {
            if (other.student != null)
                return false;
        } else if (!student.equals(other.student))
            return false;
        if (teacher == null) {
            if (other.teacher != null)
                return false;
        } else if (!teacher.equals(other.teacher))
            return false;
        return true;
    }

    @Override
    public int compareTo(Group group) {
        if (this.number < group.getNumber()) {
            return -1;
        } else if (this.number > group.getNumber()) {
            return 1;
        }
        return 0;
    }

}