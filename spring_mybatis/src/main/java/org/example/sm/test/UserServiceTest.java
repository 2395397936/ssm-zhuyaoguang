package org.example.sm.test;

import org.example.sm.dao.UserDao;
import org.example.sm.mapper.UserMapper;
import org.example.sm.mapper.UserQueryMapper;
import org.example.sm.po.User;
import org.example.sm.po.UserExample;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class UserServiceTest {
    private ApplicationContext applicationContext;


    // 在执行测试方法之前首先获取 Spring 配置文件对象
// 注解@Before在执行本类所有测试方法之前先调用这个方法
    @Before
    public void setup() throws Exception {
        applicationContext = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
    }

    @Test
    public void testFindUserById() throws Exception {
// 通过配置资源对象获取 userDAO 对象
        UserDao userDAO = (UserDao) applicationContext.getBean("userDao");
// 调用 UserDAO 的方法
        User user = userDAO.findUserById(1);
// 输出用户信息
        System.out.println(user.getId() + ":" + user.getUsername());
    }

    @Test
    public void testFindUserById2() throws Exception {
// 通过配置资源对象获取 userDAO 对象
        UserQueryMapper userQueryMapper = (UserQueryMapper) applicationContext.getBean("userQueryMapper");
// 调用 UserDAO 的方法
        User user = userQueryMapper.findUserById(1);
// 输出用户信息
        System.out.println(user.getId() + ":" + user.getUsername());
    }

    @Test
    public void testInsert() throws Exception {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        UserMapper userMapper = (UserMapper) applicationContext.getBean("userMapper");
        User user = new User();
        user.setUsername("李磊磊");
        user.setPassword("123qwe");
        user.setGender("男");
        user.setBirthday(sdf.parse("1992-01-01"));
        user.setProvince("云南");
        user.setCity("大理");
        user.setEmail("lileilei@126.com");
        userMapper.insert(user);
        System.out.println("1.插入了名为: " + user.getUsername() + "的用户");

    }

    @Test
    public void testQuery() throws Exception {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        UserMapper userMapper = (UserMapper) applicationContext.getBean("userMapper");
        UserExample userExample = new UserExample();
        //通过Criteria构造查询条件
        UserExample.Criteria criteria = userExample.createCriteria();
        //查询条件1:username equal '李磊磊'
        criteria.andUsernameEqualTo("李磊磊");
        //查询条件2: gender>'女'
        criteria.andGenderNotEqualTo("女");
//查询条件3: birthday between '1990-01-01'and '1994-01-01'
        criteria.andBirthdayBetween(sdf.parse("1990-01-01"),
                sdf.parse("1994-01-01"));
//查询条件4:email is not nullcriteria.andEmailIsNotNull();/可能返回多条记录
        List<User> list = userMapper.selectByExample(userExample);
        for (int i = 0; i < list.size(); i++) {
            User ultem = list.get(i);
            System.out.println(ultem.getId() + ": " + ultem.getUsername());
//3.测试查询操作(主键id查询)
            User user2 = userMapper.selectByPrimaryKey(1);
            System.out.println("3.主键查询出id为1的用户，名为" + user2.getUsername());
        }
    }

    @Test
    public void testUpdate() {
        UserMapper userMapper = (UserMapper) applicationContext.getBean("userMapper");
        User user = userMapper.selectByPrimaryKey(1);
        user.setEmail("zhangsan@125.com");
        userMapper.updateByPrimaryKey(user);
        System.out.println("4.更新id为" + user.getId() + "的用户的所有信息");
    }

    @Test
    public void testUpdate2() {
        UserMapper userMapper = (UserMapper) applicationContext.getBean("userMapper");
        User user = new User();//只修改用户的Email信息user4.setId(1);
        user.setId(1);
        user.setEmail("zhangsan@126.com");
        userMapper.updateByPrimaryKeySelective(user);
        System.out.println("5.更新id为" + user.getId() + "的用户 Email为:" + user.getEmail());
    }

    @Test
    public void testDelete() {
        UserMapper userMapper = (UserMapper) applicationContext.getBean("userMapper");
        int deleteId = 22;
        userMapper.deleteByPrimaryKey(deleteId);
        User user = userMapper.selectByPrimaryKey(deleteId);
        if (user == null) {
            System.out.println("6.删除id为" + deleteId + "的用户成功，删除成功");
        }
    }
}
