package org.example.ssm.dao.impl;

import org.example.ssm.dao.UserDao;
import org.example.ssm.entity.User;
import org.springframework.stereotype.Repository;

@Repository
public class UserDaoImpl extends BaseDaoImpl<User> implements UserDao {
    public UserDaoImpl() {
        setNs("org.example.ssm.mapper.UserMapper");
    }
}
