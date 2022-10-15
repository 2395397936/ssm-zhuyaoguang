package bean;

import lombok.Data;

import java.util.List;

@Data
public class ChosenCourseItem {
    private int courseListId;

    private int studentId;

    private int studentNumber;

    private Student student;

    private List<CourseStudentDetail> courseStudentDetails;

}
