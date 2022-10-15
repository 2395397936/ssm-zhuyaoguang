package bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Course {
    private int courseId;

    private int courseCode;

    private String courseName;

    private String courseType;

    private int semester;

    private int courseHour;

    private double credit;
}
