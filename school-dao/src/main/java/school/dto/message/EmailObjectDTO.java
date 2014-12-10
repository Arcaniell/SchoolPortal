package school.dto.message;

public class EmailObjectDTO {

	private String name;
	private long id;
	
	public EmailObjectDTO(String name, long id) {
		this.name = name;
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}
	
	
}
