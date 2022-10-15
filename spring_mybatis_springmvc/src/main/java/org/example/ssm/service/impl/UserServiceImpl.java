package org.example.ssm.service.impl;

import org.example.ssm.dao.UserDao;
import org.example.ssm.service.UserService;
import org.example.ssm.po.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.List;
import java.util.Map;
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserDao userDao;

    @Override
    public User get(Serializable id) {
        return userDao.get(id);
    }

    @Override
    public List<User> find(Map map) {
        return userDao.find(map);
    }

    @Override
    public void insert(User entity) {
        userDao.insert(entity);
    }

    @Override
    public void update(User entity) {
        userDao.update(entity);
    }

    @Override
    public void deleteById(Serializable id) {
        userDao.deleteById(id);
    }

    @Override
    public void delete(Serializable[] ids) {
        userDao.delete(ids);
    }
}
