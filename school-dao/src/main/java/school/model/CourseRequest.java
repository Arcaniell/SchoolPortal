package school.model;

import java.util.Date;

import javax.persistence.*;

@Entity
@Table(name = "COURSE_REQUEST")
@NamedQueries({
        @NamedQuery(name = CourseRequest.FIND_ALL_BY_STATUS, query = CourseRequest.FIND_ALL_BY_STATUS_QUERY),
        @NamedQuery(name = CourseRequest.FIND_BY_INTERVAL, query = CourseRequest.FIND_BY_INTERVAL_QUERY),
        @NamedQuery(name = CourseRequest.FIND_BY_STUDENT_ID, query = CourseRequest.FIND_BY_STUDENT_ID_QUERY),
        @NamedQuery(name = CourseRequest.FIND_BY_SUBJECT_ID, query = CourseRequest.FIND_BY_SUBJECT_ID_QUERY) 
        })
public class CourseRequest {

    public static final String FIND_ALL_BY_STATUS = "CourseRequest.findAllByStatus";
    public static final String FIND_BY_INTERVAL = "CourseRequest.findByInterval";
    public static final String FIND_BY_STUDENT_ID = "CourseRequest.findByStudentId";
    public static final String FIND_BY_SUBJECT_ID = "CourseRequest.findBySubjectId";
    public static final String FIND_ALL_BY_STATUS_QUERY = "SELECT u FROM CourseRequest u WHERE u.isActive = :active";
    public static final String FIND_BY_INTERVAL_QUERY = "SELECT u FROM CourseRequest u WHERE u.date BETWEEN :from AND :till";
    public static final String FIND_BY_STUDENT_ID_QUERY = "SELECT u FROM CourseRequest u WHERE u.student.id = :id";
    public static final String FIND_BY_SUBJECT_ID_QUERY = "SELECT DISTINCT u FROM CourseRequest u WHERE u.course.id = :id";

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(unique = true)
    private long id;

    @ManyToOne(fetch = FetchType.EAGER, cascade = { CascadeType.PERSIST,
            CascadeType.MERGE })
    @JoinColumn(name = "studentId", nullable = false)
    private Student student;

    @ManyToOne(fetch = FetchType.EAGER, cascade = { CascadeType.PERSIST,
            CascadeType.MERGE })
    @JoinColumn(name = "courseId", nullable = false)
    private Course course;

    private Date date;

    private boolean isActive;

    public String toString() {
        return "Id = " + id;

    }

    public CourseRequest() {
        super();
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean isActive) {
        this.isActive = isActive;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((course == null) ? 0 : course.hashCode());
        result = prime * result + ((date == null) ? 0 : date.hashCode());
        result = prime * result + (int) (id ^ (id >>> 32));
        result = prime * result + (isActive ? 1231 : 1237);
        result = prime * result + ((student == null) ? 0 : student.hashCode());
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
        CourseRequest other = (CourseRequest) obj;
        if (course == null) {
            if (other.course != null)
                return false;
        } else if (!course.equals(other.course))
            return false;
        if (date == null) {
            if (other.date != null)
                return false;
        } else if (!date.equals(other.date))
            return false;
        if (id != other.id)
            return false;
        if (isActive != other.isActive)
            return false;
        if (student == null) {
            if (other.student != null)
                return false;
        } else if (!student.equals(other.student))
            return false;
        return true;
    }

}
