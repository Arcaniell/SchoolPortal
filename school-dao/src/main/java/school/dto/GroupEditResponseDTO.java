package school.dto;

import java.util.Arrays;

public class GroupEditResponseDTO {
    private long groupId;
    private long teacherId;
    private String dateFrom;
    private String dateTill;
    private UserDTO[] students;

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

    public UserDTO[] getStudents() {
        return students;
    }

    public void setStudents(UserDTO[] students) {
        this.students = students;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((dateFrom == null) ? 0 : dateFrom.hashCode());
        result = prime * result + ((dateTill == null) ? 0 : dateTill.hashCode());
        result = prime * result + (int) (groupId ^ (groupId >>> 32));
        result = prime * result + Arrays.hashCode(students);
        result = prime * result + (int) (teacherId ^ (teacherId >>> 32));
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
        GroupEditResponseDTO other = (GroupEditResponseDTO) obj;
        if (dateFrom == null) {
            if (other.dateFrom != null)
                return false;
        } else if (!dateFrom.equals(other.dateFrom))
            return false;
        if (dateTill == null) {
            if (other.dateTill != null)
                return false;
        } else if (!dateTill.equals(other.dateTill))
            return false;
        if (groupId != other.groupId)
            return false;
        if (!Arrays.equals(students, other.students))
            return false;
        if (teacherId != other.teacherId)
            return false;
        return true;
    }

}
