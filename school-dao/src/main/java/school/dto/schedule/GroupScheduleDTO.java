package school.dto.schedule;

public class GroupScheduleDTO implements Comparable<GroupScheduleDTO> {
	private byte number;
	private char letter;
	private Long id;

	public GroupScheduleDTO() {
letter ='o';
number = (byte)0;
id =new Long(0);
	}

	public GroupScheduleDTO(byte number, char letter) {
		super();
		this.number = number;
		this.letter = letter;

	}

	public GroupScheduleDTO(byte number, char letter, Long id) {
		super();
		this.number = number;
		this.letter = letter;
		this.id = id;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
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

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + letter;
		result = prime * result + number;
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
		GroupScheduleDTO other = (GroupScheduleDTO) obj;
		if (letter != other.letter)
			return false;
		if (number != other.number)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "GroupDTO [number=" + number + ", letter=" + letter + "]";
	}

	@Override
	public int compareTo(GroupScheduleDTO group) {
		String obj1 = this.number + "-" + this.letter;
		String obj2 = group.getNumber() + "-" + group.getLetter();
		return obj1.compareTo(obj2);
	}

}
