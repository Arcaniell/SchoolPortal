package school.dto;

public class GroupEditResponseDTO {
    private long groupId;
    private long teacherId;
    private String dateFrom;
    private String dateTill;
    private StudentDTO[] students;

    public long getGroupId() {
        return groupId;
    }

    public void setGroupId(long groupId) {
        this.groupId = groupId;
    }

    public long getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(long teacherId) {
        this.teacherId = teacherId;
    }

    public String getDateFrom() {
        return dateFrom;
    }

    public void setDateFrom(String dateFrom) {
        this.dateFrom = dateFrom;
    }

    public String getDateTill() {
        return dateTill;
    }

    public void setDateTill(String dateTill) {
        this.dateTill = dateTill;
    }

    public StudentDTO[] getStudents() {
        return students;
    }

    public void setStudents(StudentDTO[] students) {
        this.students = students;
    }

}
