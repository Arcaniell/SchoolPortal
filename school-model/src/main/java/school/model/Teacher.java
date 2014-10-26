package school.model;

import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="TEACHER")
public class Teacher {
    public static final String FIND_ALL_BY_STATUS_QUERY = "SELECT u FROM Teacher u WHERE u.isActive = :active";
    public static final String FIND_BY_USER_ID_QUERY = "SELECT u FROM Teacher u WHERE u.user.id = :id";
    public static final String FIND_RATE_RANGE_QUERY = "SELECT u FROM Teacher u WHERE u.rate BETWEEN :from AND :till";
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    private int rate;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "teacher", cascade = { CascadeType.PERSIST,
            CascadeType.MERGE })
    private List<Salary> salaries;

    @OneToOne(fetch = FetchType.LAZY, cascade = { CascadeType.PERSIST,
            CascadeType.MERGE })
    @JoinColumn(name = "userId", nullable = false, unique = true)
    private User user;

    @ManyToMany(fetch = FetchType.LAZY, mappedBy = "teacher")
    private Set<Course> course;
    
    private boolean isActive; 
       

    public Teacher() {
        super();
    }

    public Set<Course> getCourse() {
        return course;
    }

    public void setCourse(Set<Course> course) {
        this.course = course;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean isActive) {
        this.isActive = isActive;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public int getRate() {
        return rate;
    }

    public void setRate(int rate) {
        this.rate = rate;
    }

    public List<Salary> getSalaries() {
        return salaries;
    }

    public void setSalaries(List<Salary> salaries) {
        this.salaries = salaries;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Set<Course> getSubject() {
        return course;
    }

    public void setSubject(Set<Course> subject) {
        this.course = subject;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((course == null) ? 0 : course.hashCode());
        result = prime * result + (int) (id ^ (id >>> 32));
        result = prime * result + (isActive ? 1231 : 1237);
        result = prime * result + rate;
        result = prime * result
                + ((salaries == null) ? 0 : salaries.hashCode());
        result = prime * result + ((user == null) ? 0 : user.hashCode());
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
        Teacher other = (Teacher) obj;
        if (course == null) {
            if (other.course != null)
                return false;
        } else if (!course.equals(other.course))
            return false;
        if (id != other.id)
            return false;
        if (isActive != other.isActive)
            return false;
        if (rate != other.rate)
            return false;
        if (salaries == null) {
            if (other.salaries != null)
                return false;
        } else if (!salaries.equals(other.salaries))
            return false;
        if (user == null) {
            if (other.user != null)
                return false;
        } else if (!user.equals(other.user))
            return false;
        return true;
    }

   

}
