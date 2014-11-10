package school.model;

import java.util.List;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "COURSE")
@NamedQueries({
        @NamedQuery(name = Course.FIND_BY_COEFFICIENT, query = Course.FIND_BY_COEFFICIENT_QUERY),
        @NamedQuery(name = Course.FIND_BY_COURSE_NAME, query = Course.FIND_BY_COURSE_NAME_QUERY),
        @NamedQuery(name = Course.FIND_BY_GROUP_NUMBER, query = Course.FIND_BY_GROUP_NUMBER_QUERY),
        @NamedQuery(name = Course.FIND_BY_NAME_AND_NUMBER, query = Course.FIND_BY_NAME_AND_NUMBER_QUERY),
        @NamedQuery(name = Course.FIND_BY_PRICE_RANGE, query = Course.FIND_BY_PRICE_RANGE_QUERY),
        @NamedQuery(name = Course.FIND_BY_STATUS, query = Course.FIND_BY_STATUS_QUERY),
        @NamedQuery(name = Course.FIND_BY_GROUP_ID_AND_DATA_RANGE, query = Course.FIND_BY_GROUP_ID_AND_DATA_RANGE_QUERY) 
        })
public class Course {
    public static final String FIND_BY_STATUS = "Course.findAllByStatus";
    public static final String FIND_BY_GROUP_NUMBER = "Course.findAllByGroupNumber";
    public static final String FIND_BY_COEFFICIENT = "Course.findAllByCoeficient";
    public static final String FIND_BY_COURSE_NAME = "Course.findAllByCourseName";
    public static final String FIND_BY_NAME_AND_NUMBER = "Course.findAllByNameAndNumber";
    public static final String FIND_BY_PRICE_RANGE = "Course.findAllByPriceRange";
    public static final String FIND_BY_GROUP_ID_AND_DATA_RANGE = "Course.findByGroupIdAndDataRange";

    public static final String FIND_BY_STATUS_QUERY = "SELECT c FROM Course c WHERE c.additional = :active";
    public static final String FIND_BY_GROUP_NUMBER_QUERY = "SELECT c FROM Course c WHERE c.groupNumber = :groupNumber";
    public static final String FIND_BY_COEFFICIENT_QUERY = "SELECT c FROM Course c WHERE c.coeficient = :coefficient";
    public static final String FIND_BY_COURSE_NAME_QUERY = "SELECT c FROM Course c WHERE c.courseName LIKE :courseName";
    public static final String FIND_BY_NAME_AND_NUMBER_QUERY = "SELECT c FROM Course c WHERE c.courseName LIKE :courseName AND c.groupNumber = :groupNumber";
    public static final String FIND_BY_PRICE_RANGE_QUERY = "SELECT c FROM Course c WHERE c.price BETWEEN :from AND :to";
    public static final String FIND_BY_GROUP_ID_AND_DATA_RANGE_QUERY = "SELECT DISTINCT c FROM Course c INNER JOIN c.schedule s WHERE s.group.id = :groupId AND (s.date BETWEEN :from AND :till)";

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(nullable = false, length = 45)
    private String courseName;

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    @Column(nullable = false)
    private int groupNumber;

    private int coeficient;

    private int price;

    private boolean additional;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "course")
    private List<CourseRequest> courseRequest;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "course")
    private List<Schedule> schedule;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "COURSE_TEACHER_REF", joinColumns = @JoinColumn(name = "courseId"), inverseJoinColumns = @JoinColumn(name = "teacherId"))
    private Set<Teacher> teacher;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getSubjectName() {
        return courseName;
    }

    public void setSubjectName(String subjectName) {
        this.courseName = subjectName;
    }

    public int getGroupNumber() {
        return groupNumber;
    }

    public void setGroupNumber(int groupNumber) {
        this.groupNumber = groupNumber;
    }

    public int getCoeficient() {
        return coeficient;
    }

    public void setCoeficient(int coeficient) {
        this.coeficient = coeficient;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public boolean isAdditional() {
        return additional;
    }

    public void setAdditional(boolean additional) {
        this.additional = additional;
    }

    public List<CourseRequest> getCourseRequest() {
        return courseRequest;
    }

    public void setCourseRequest(List<CourseRequest> courseRequest) {
        this.courseRequest = courseRequest;
    }

    public List<Schedule> getSchedule() {
        return schedule;
    }

    public void setSchedule(List<Schedule> schedule) {
        this.schedule = schedule;
    }

    public Set<Teacher> getTeacher() {
        return teacher;
    }

    public void setTeacher(Set<Teacher> teacher) {
        this.teacher = teacher;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + (additional ? 1231 : 1237);
        result = prime * result + coeficient;
        result = prime * result
                + ((courseRequest == null) ? 0 : courseRequest.hashCode());
        result = prime * result + groupNumber;
        result = prime * result + (int) (id ^ (id >>> 32));
        result = prime * result + price;
        result = prime * result
                + ((schedule == null) ? 0 : schedule.hashCode());
        result = prime * result
                + ((courseName == null) ? 0 : courseName.hashCode());
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
        Course other = (Course) obj;
        if (additional != other.additional)
            return false;
        if (coeficient != other.coeficient)
            return false;
        if (courseRequest == null) {
            if (other.courseRequest != null)
                return false;
        } else if (!courseRequest.equals(other.courseRequest))
            return false;
        if (groupNumber != other.groupNumber)
            return false;
        if (id != other.id)
            return false;
        if (price != other.price)
            return false;
        if (schedule == null) {
            if (other.schedule != null)
                return false;
        } else if (!schedule.equals(other.schedule))
            return false;
        if (courseName == null) {
            if (other.courseName != null)
                return false;
        } else if (!courseName.equals(other.courseName))
            return false;
        if (teacher == null) {
            if (other.teacher != null)
                return false;
        } else if (!teacher.equals(other.teacher))
            return false;
        return true;
    }

}
