package bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CourseList {
    private int courseListId;

    private int studentId;

    private String term;

    private int academicYear;

    private String studentNumber;

    private String studentName;

    private int courseNumber;

    private double credit;

    private int period;

    private int optionalCourseNumber;

    private int compulsoryCourseNumber;

    private Student student;

    private List<CourseStudentDetail> courseStudentDetails;
}
