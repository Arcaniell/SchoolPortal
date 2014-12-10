package school.dto.schedule;

public class LessonDTO implements Comparable<LessonDTO> {

	private long lessonNumb;

	public LessonDTO() {
	}

	public LessonDTO(long lessonNumb) {
		super();
		this.lessonNumb = lessonNumb;
	}

	public long getLessonNumb() {
		return lessonNumb;
	}

	public void setLessonNumb(long lessonNumb) {
		this.lessonNumb = lessonNumb;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (int) (lessonNumb ^ (lessonNumb >>> 32));
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
		LessonDTO other = (LessonDTO) obj;
		if (lessonNumb != other.lessonNumb)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "LessonDTO [lessonNumb=" + lessonNumb + "]";
	}

	@Override
	public int compareTo(LessonDTO lesson) {
		Long obj1 = this.lessonNumb;
		Long obj2 = lesson.getLessonNumb();

		return obj1.compareTo(obj2);
	}

}
