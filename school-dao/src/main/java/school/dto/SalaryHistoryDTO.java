package school.dto;

public class SalaryHistoryDTO extends SalaryDTO {
	private int additional;
	private int sum;

	public SalaryHistoryDTO(int hours, int salary, String issueDate,
			int additional, int sum) {
		super(hours, salary, issueDate);
		this.additional = additional;
		this.sum = sum;
	}

	public int getAdditional() {
		return additional;
	}

	public void setAdditional(int additional) {
		this.additional = additional;
	}

	public int getSum() {
		return sum;
	}

	public void setSum(int sum) {
		this.sum = sum;
	}

}
