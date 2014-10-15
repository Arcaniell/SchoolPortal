package school.model;

import java.util.List;

import javax.persistence.*;
//commit test

@Entity
@Table(name = "Student")
public class Student {
	@Id
	@GeneratedValue
	@Column(name = "id")
	private int id;

	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "userId", unique = true)
	private User user;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "groupId")
	private Group2 group;
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "StudentAdGroupRef", joinColumns = @JoinColumn(name = "studentId"), inverseJoinColumns = @JoinColumn(name = "groupId"))
	private List<Group2> additionGroups;
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "student")
	private List<Journal> journal;

	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "StudentParentRef", joinColumns = @JoinColumn(name = "studentId"), inverseJoinColumns = @JoinColumn(name = "parentId"))
	private List<Parent> parents;
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "student")
	private List<CourseRequest> courseRequest;

	Student() {

	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}


	public Group2 getGroup() {
		return group;
	}

	public void setGroup(Group2 group) {
		this.group = group;
	}

	public List<Group2> getAdditionGroups() {
		return additionGroups;
	}

	public void setAdditionGroups(List<Group2> additionGroups) {
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

}
