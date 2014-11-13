package school.dto;

import java.util.Set;

public class JournalParentDTO {

	private long id;
	private String name;
	private Set<JournalStudentDto> kids;

	public JournalParentDTO() {
	}

	public JournalParentDTO(long id, String name, Set<JournalStudentDto> kids) {
		this.id = id;
		this.name = name;
		this.kids = kids;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Set<JournalStudentDto> getKids() {
		return kids;
	}

	public void setKids(Set<JournalStudentDto> kids) {
		this.kids = kids;
	}

}
