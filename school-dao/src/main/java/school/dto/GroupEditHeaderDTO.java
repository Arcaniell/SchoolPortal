package school.dto;

import java.util.List;

import school.model.Student;
import school.model.Teacher;

public class GroupEditHeaderDTO {
    private String name;
    private String dateFrom;
    private String dateTill;
    private List<TeacherDTO> teachers;
    private List<StudentDTO> groupStudents;
    private List<StudentDTO> allFreeStudents;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public List<TeacherDTO> getTeachers() {
        return teachers;
    }

    public void setTeachers(List<TeacherDTO> teachers) {
        this.teachers = teachers;
    }

    public List<StudentDTO> getGroupStudents() {
        return groupStudents;
    }

    public void setGroupStudents(List<StudentDTO> groupStudents) {
        this.groupStudents = groupStudents;
    }

    public List<StudentDTO> getAllFreeStudents() {
        return allFreeStudents;
    }

    public void setAllFreeStudents(List<StudentDTO> allFreeStudents) {
        this.allFreeStudents = allFreeStudents;
    }

}
