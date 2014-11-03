package school.model;

import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "STUDENT")
@NamedQueries({
        @NamedQuery(name = Student.FIND_ALL_BY_STATUS, query = Student.FIND_ALL_BY_STATUS_QUERY),
        @NamedQuery(name = Student.FIND_BY_USER_ID, query = Student.FIND_BY_USER_ID_QUERY)
        })
public class Student {
    public static final String FIND_ALL_BY_STATUS = "Student.findAllByStatus";
    public static final String FIND_BY_USER_ID = "Student.findByUserId";
    public static final String FIND_ALL_BY_STATUS_QUERY = "SELECT u FROM Student u WHERE u.isActive = :active";
    public static final String FIND_BY_USER_ID_QUERY = "SELECT u FROM Student u WHERE u.user.id = :id";

    @Id
    @Column(unique = true)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @OneToOne(fetch = FetchType.EAGER, cascade = { CascadeType.PERSIST,
            CascadeType.MERGE })
    @JoinColumn(name = "userId", unique = true, nullable = false)
    private User user;

    @ManyToOne(fetch = FetchType.EAGER, cascade = { CascadeType.PERSIST,
            CascadeType.MERGE })
    @JoinColumn(name = "groupId")
    private Group group;

    @ManyToMany(fetch = FetchType.LAZY, cascade = { CascadeType.PERSIST,
            CascadeType.MERGE })
    @JoinTable(name = "STUDENT_ADDITION_GROUP_REF", joinColumns = @JoinColumn(name = "studentId"), inverseJoinColumns = @JoinColumn(name = "groupId"))
    private Set<Group> additionGroups;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "student", cascade = {
            CascadeType.PERSIST, CascadeType.MERGE })
    private List<Journal> journal;

    @ManyToMany(fetch = FetchType.LAZY, cascade = { CascadeType.PERSIST,
            CascadeType.MERGE })
    @JoinTable(name = "STUDENT_PARENT_REF", joinColumns = @JoinColumn(name = "studentId"), inverseJoinColumns = @JoinColumn(name = "parentId"))
    private Set<Parent> parents;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "student", cascade = {
            CascadeType.PERSIST, CascadeType.MERGE })
    private List<CourseRequest> courseRequest;

    private boolean isActive;

    @Override
    public final String toString() {
        return "Id = " + id;
    }

    public final boolean isActive() {
        return isActive;
    }

    public final void setActive(final boolean isActive) {
        this.isActive = isActive;
    }

    public final long getId() {
        return id;
    }

    public final void setId(final long id) {
        this.id = id;
    }

    public final User getUser() {
        return user;
    }

    public final void setUser(final User user) {
        this.user = user;
    }

    public final Group getGroup() {
        return group;
    }

    public final void setGroup(final Group group) {
        this.group = group;
    }

    public final Set<Group> getAdditionGroups() {
        return additionGroups;
    }

    public final void setAdditionGroups(final Set<Group> additionGroups) {
        this.additionGroups = additionGroups;
    }

    public final List<Journal> getJournal() {
        return journal;
    }

    public final void setJournal(final List<Journal> journal) {
        this.journal = journal;
    }

    public final Set<Parent> getParents() {
        return parents;
    }

    public final void setParents(final Set<Parent> parents) {
        this.parents = parents;
    }

    public final List<CourseRequest> getCourseRequest() {
        return courseRequest;
    }

    public final void setCourseRequest(final List<CourseRequest> courseRequest) {
        this.courseRequest = courseRequest;
    }

    public Student() {
        super();
    }

    @Override
    public final int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result
                + ((additionGroups == null) ? 0 : additionGroups.hashCode());
        result = prime * result
                + ((courseRequest == null) ? 0 : courseRequest.hashCode());
        result = prime * result + ((group == null) ? 0 : group.hashCode());
        result = prime * result + (int) (id ^ (id >>> 32));
        result = prime * result + ((journal == null) ? 0 : journal.hashCode());
        result = prime * result + ((parents == null) ? 0 : parents.hashCode());
        result = prime * result + ((user == null) ? 0 : user.hashCode());
        return result;
    }

    @Override
    public final boolean equals(final Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        Student other = (Student) obj;
        if (additionGroups == null) {
            if (other.additionGroups != null) {
                return false;
            }
        } else if (!additionGroups.equals(other.additionGroups)) {
            return false;
        }
        if (courseRequest == null) {
            if (other.courseRequest != null) {
                return false;
            }
        } else if (!courseRequest.equals(other.courseRequest)) {
            return false;
        }
        if (group == null) {
            if (other.group != null) {
                return false;
            }
        } else if (!group.equals(other.group)) {
            return false;
        }
        if (id != other.id) {
            return false;
        }
        if (journal == null) {
            if (other.journal != null) {
                return false;
            }
        } else if (!journal.equals(other.journal)) {
            return false;
        }
        if (parents == null) {
            if (other.parents != null) {
                return false;
            }
        } else if (!parents.equals(other.parents)) {
            return false;
        }
        if (user == null) {
            if (other.user != null) {
                return false;
            }
        } else if (!user.equals(other.user)) {
            return false;
        }
        return true;
    }

}
