package school.model;

import java.util.List;

import javax.persistence.*;

@Entity
@Table(name = "Student")
public class Student {

	@Id
	@Column(unique = true)
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;

	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "userId", unique = true)
	private User user;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "groupId")
	private Group group;
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "StudentAdGroupRef", joinColumns = @JoinColumn(name = "studentId"), inverseJoinColumns = @JoinColumn(name = "groupId"))
	private List<Group> additionGroups;
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "student")
	private List<Journal> journal;

	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "StudentParentRef", joinColumns = @JoinColumn(name = "studentId"), inverseJoinColumns = @JoinColumn(name = "parentId"))
	private List<Parent> parents;
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "student")
	private List<CourseRequest> courseRequest;
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Group getGroup() {
		return group;
	}
	public void setGroup(Group group) {
		this.group = group;
	}
	public List<Group> getAdditionGroups() {
		return additionGroups;
	}
	public void setAdditionGroups(List<Group> additionGroups) {
		this.additionGroups = additionGroups;
	}
	public List<Journal> getJournal() {
		return journal;
	}
	public void setJournal(List<Journal> journal) {
		this.journal = journal;
	}
	public List<Parent> getParents() {
		return parents;
	}
	public void setParents(List<Parent> parents) {
		this.parents = parents;
	}
	public List<CourseRequest> getCourseRequest() {
		return courseRequest;
	}
	public void setCourseRequest(List<CourseRequest> courseRequest) {
		this.courseRequest = courseRequest;
	}
	public Student() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public int hashCode() {
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
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Student other = (Student) obj;
		if (additionGroups == null) {
			if (other.additionGroups != null)
				return false;
		} else if (!additionGroups.equals(other.additionGroups))
			return false;
		if (courseRequest == null) {
			if (other.courseRequest != null)
				return false;
		} else if (!courseRequest.equals(other.courseRequest))
			return false;
		if (group == null) {
			if (other.group != null)
				return false;
		} else if (!group.equals(other.group))
			return false;
		if (id != other.id)
			return false;
		if (journal == null) {
			if (other.journal != null)
				return false;
		} else if (!journal.equals(other.journal))
			return false;
		if (parents == null) {
			if (other.parents != null)
				return false;
		} else if (!parents.equals(other.parents))
			return false;
		if (user == null) {
			if (other.user != null)
				return false;
		} else if (!user.equals(other.user))
			return false;
		return true;
	}



}
