package school.dto;

public class SalaryPayrollDTO {
	private long userId;
	private long teacherId;
	private String teacherName;
	private int teacherRate;
	private int salary;
	private int hours;

	public SalaryPayrollDTO(long userId, long teacherId, String teacherName,
			int teacherRate, int salary, int hours) {
		this.userId = userId;
		this.teacherId = teacherId;
		this.teacherName = teacherName;
		this.teacherRate = teacherRate;
		this.salary = salary;
		this.hours = hours;
	}

	public long getTeacherId() {
		return teacherId;
	}

	public void setTeacherId(long teacherId) {
		this.teacherId = teacherId;
	}

	public String getTeacherName() {
		return teacherName;
	}

	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}

	public int getTeacherRate() {
		return teacherRate;
	}

	public void setTeacherRate(int teacherRate) {
		this.teacherRate = teacherRate;
	}

	public int getSalary() {
		return salary;
	}

	public void setSalary(int salary) {
		this.salary = salary;
	}

	public int getHours() {
		return hours;
	}

	public void setHours(int hours) {
		this.hours = hours;
	}

	public long getUserId() {
		return userId;
	}

	public void setUserId(long userId) {
		this.userId = userId;
	}

}
