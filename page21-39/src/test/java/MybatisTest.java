import bean.User;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import utils.SqlConnection;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

public class MybatisTest {
    public SqlConnection sqlConnection = new SqlConnection();

    @Test
    public void TestSelect() throws IOException {
        SqlSession sqlSession = sqlConnection.getSqlSession();
//sq Session selectOne 最终结果与映射文件中所匹配的 resultType 类型
        User user = sqlSession.selectOne("test.findUserById", 1);
        System.out.println("姓名 ：" + user.getUsername());
        System.out.println("性别 ：" + user.getGender());
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        System.out.println("生日 ：" + sdf.format(user.getBirthday()));
        System.out.println("所在地 ：" + user.getProvince() + user.getCity());
        sqlSession.close();
    }

    @Test
    public void TestFuzzySearch() throws Exception {
        SqlSession sqlSession = sqlConnection.getSqlSession();
        List<User> userList = sqlSession.selectList("test.findUserByUsername", "丽");
        for (int i = 0; i < userList.size(); i++) {
            User u = userList.get(i);
            System.out.println("姓名" + u.getUsername());
            System.out.println("性别" + u.getGender());
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            System.out.println("生日" + sdf.format(u.getBirthday()));
            System.out.println("所在地" + u.getProvince() + u.getCity());
        }
        sqlSession.close();
    }

    @Test
    public void TestInsert() throws Exception {
        SqlSession sqlSession = sqlConnection.getSqlSession();
        User user = new User();
        user.setUsername("圭佳");
        user.setGender("男");
        user.setPassword("5555");
        user.setEmail("5555126.com");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        user.setBirthday(sdf.parse("1991-02-16"));
        user.setProvince("湖北省");
        user.setCity("武汉市");
        sqlSession.insert("test.insertUser", user);
        sqlSession.commit();
        sqlSession.close();
    }

    @Test
    public void TestDelete() throws Exception {
        SqlSession sqlSession = sqlConnection.getSqlSession();
        sqlSession.delete("test.deleteUser", 18);
        sqlSession.commit();
        sqlSession.close();
    }

    @Test
    public void testUpdate() throws Exception {
        SqlSession sqlSession = sqlConnection.getSqlSession();
        User user = new User();
        user.setId(19);
        user.setUsername("孙丽");
        sqlSession.update("test.updateUserName", user);
        sqlSession.commit();
        sqlSession.close();
    }
}