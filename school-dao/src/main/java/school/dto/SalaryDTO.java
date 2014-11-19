package school.dto;

public class SalaryDTO {
	private long hours;
	private long balance;
	private String issueDate;

	public SalaryDTO(long hours, long balance,
			String issueDate) {
		this.hours = hours;
		this.balance = balance;
		this.issueDate = issueDate;
	}

	public long getHours() {
		return hours;
	}

	public void setHours(long hours) {
		this.hours = hours;
	}

	public long getBalance() {
		return balance;
	}

	public void setBalance(long balance) {
		this.balance = balance;
	}

	public String getIssueDate() {
		return issueDate;
	}

	public void setIssueDate(String issueDate) {
		this.issueDate = issueDate;
	}

}
