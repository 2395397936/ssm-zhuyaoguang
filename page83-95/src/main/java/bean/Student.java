package bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Student {
    private int studentId;

    private String studentNumber;

    private String studentName;

    private String college;

    private Date admissionDate;

    private List<CourseList> courseLists;
}
