package org.example.sm.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.example.sm.dao.UserDao;
import org.example.sm.po.User;
import org.mybatis.spring.support.SqlSessionDaoSupport;

public class UserDaoImpl extends SqlSessionDaoSupport implements UserDao {
    @Override
    public User findUserById(int id) throws Exception {
//继承 SqlSessionDaoSupport类，通过this.getSqlSession()得到sqlSession
        SqlSession sqlSession = this.getSqlSession();
        return sqlSession.selectOne("test.findUserById", id);
    }
}

