package bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CourseStudentDetail {
    private int courseStudentDetailId;

    private int courseListId;

    private int courseId;

    private Course course;
}
