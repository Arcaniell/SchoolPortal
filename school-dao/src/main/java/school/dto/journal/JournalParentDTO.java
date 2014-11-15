package school.dto.journal;

import java.util.Set;

public class JournalParentDTO extends JournalDTO {

	private long id;
	private String name;
	private Set<JournalStudentDTO> kids;

	public JournalParentDTO() {
	}

	public JournalParentDTO(long id, String name, Set<JournalStudentDTO> kids) {
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

	public Set<JournalStudentDTO> getKids() {
		return kids;
	}

	public void setKids(Set<JournalStudentDTO> kids) {
		this.kids = kids;
	}

}
