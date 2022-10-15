import bean.*;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import utils.SqlConnection;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MybatisTest {
    public SqlConnection sqlConnection = new SqlConnection();
//t1
    @Test
    public void testChosenCourseStudent() throws Exception {

        SqlSession sqlSession = sqlConnection.getSqlSession();

        //调用userMapper的方法
        List<ChosenCourseStudent> chosenCourseStudentList = sqlSession.selectList("findCourseListStudent");
        if (chosenCourseStudentList != null) {
            ChosenCourseStudent chosenCourseStudent = null;
            for (int i = 0; i < chosenCourseStudentList.size(); i++) {
                chosenCourseStudent = chosenCourseStudentList.get(i);
                System.out.println("名为" + chosenCourseStudent.getStudentName() + "的学生:有课表在"
                        + chosenCourseStudent.getAcademicYear()+chosenCourseStudent.getTerm());
            }
        }
        sqlSession.close();
    }
//t2
    @Test
    public void testFindChosenCourseAndChosenCourseDetail() throws Exception {
        SqlSession sqlSession = sqlConnection.getSqlSession();
        Map<String,String> map = new HashMap<>();
        map.put("academicYear","2020");
        map.put("term","上");
        ChosenCourseItem chosenCourseItem = sqlSession.selectOne("findCourseListAndCourseStudentDetail",map);
        System.out.println(chosenCourseItem.toString());
        if (chosenCourseItem != null) {
            Student student = chosenCourseItem.getStudent();
            List<CourseStudentDetail> courseStudentDetails = chosenCourseItem.getCourseStudentDetails();
            System.out.println("名为" + student.getStudentName() + "的学生课表在学年"+
                    map.get("academicYear") +map.get("term")+"详情如下：");
            CourseStudentDetail courseStudentDetail = null;
            if (courseStudentDetails != null) {
                for (int i = 0; i < courseStudentDetails.size(); i++) {

                    courseStudentDetail = courseStudentDetails.get(i);
                    System.out.println("选择课程id：" + courseStudentDetail.getCourseId());
                }
            }
        }
        sqlSession.close();
    }
//t3
    @Test
    public void testFindCustomerAndProducts() throws Exception{

        SqlSession sqlSession=sqlConnection.getSqlSession();

        //获取学生信息
        List<Student> studentList=sqlSession.selectList("findStudentAndCourse");
        if(studentList!=null){
            Student student = null;
            for (int i = 0; i < studentList.size(); i++) {
                student = studentList.get(i);
                System.out.println("学号为"+student.getStudentNumber()+"的名为"
                        +student.getStudentName()+"的学生:");
                //2.取出选取的课程表
                List<CourseList> batchList=student.getCourseLists();
                CourseList courseList = null;
                for (int j = 0; j < batchList.size(); j++) {
                    courseList = batchList.get(j);
                    System.out.println("于"
                            +courseList.getAcademicYear()+courseList.getTerm()+"选取了id为："
                            +courseList.getCourseListId()+"的课程表，详情如下：");
                    //3.获取一个批次的明细
                    List<CourseStudentDetail> batchDetails = courseList.getCourseStudentDetails();
                    CourseStudentDetail courseStudentDetail = null;
                    Course course = null;
                    for (int k = 0; k < batchDetails.size(); k++) {
                        courseStudentDetail = batchDetails.get(k);
                        System.out.println("id为"+courseStudentDetail.getCourseId()
                                +"的课程。");
                        //4.获取每个课程表信息
                        course = courseStudentDetail.getCourse();
                        System.out.println("该课程详细信息：\n"
                                +"课程名称:"+course.getCourseName()
                                +"|类型:"+course.getCourseType()
                                +"|学分:"+course.getCredit());
                    }
                }
                System.out.println("**************************************");
            }

        }
        sqlSession.close();
    }
}


