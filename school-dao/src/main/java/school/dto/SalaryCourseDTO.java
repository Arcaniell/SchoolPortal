package school.dto;


public class SalaryCourseDTO {
	private String courseName;
	private int rating;
	private int sumPerHour;

	public SalaryCourseDTO(String courseName, int rating, int sumPerHour) {

		this.courseName = courseName;
		this.rating = rating;
		this.sumPerHour = sumPerHour;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public int getSumPerHour() {
		return sumPerHour;
	}

	public void setSumPerHour(int sumPerHour) {
		this.sumPerHour = sumPerHour;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

}
