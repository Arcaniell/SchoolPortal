package school.dto;

public class SalaryDTO {
	private int hours;
	private int salary;
	private String issueDate;

	public SalaryDTO(int hours, int salary,
			String issueDate) {
		this.hours = hours;
		this.salary = salary;
		this.issueDate = issueDate;
	}

	public long getHours() {
		return hours;
	}

	public void setHours(int hours) {
		this.hours = hours;
	}

	public long getsalary() {
		return salary;
	}

	public void setsalary(int salary) {
		this.salary = salary;
	}

	public String getIssueDate() {
		return issueDate;
	}

	public void setIssueDate(String issueDate) {
		this.issueDate = issueDate;
	}

}
