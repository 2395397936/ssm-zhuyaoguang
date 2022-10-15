package org.example.ssm.dao.impl;

import org.apache.ibatis.session.SqlSessionFactory;
import org.example.ssm.dao.UserDao;
import org.example.ssm.po.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDaoImpl extends BaseDaoImpl<User> implements UserDao {
    public UserDaoImpl() {
        setNs("org.example.ssm.mapper.UserMapper");
    }
}
