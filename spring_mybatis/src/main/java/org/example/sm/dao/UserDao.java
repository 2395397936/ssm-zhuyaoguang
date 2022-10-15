package org.example.sm.dao;

import org.example.sm.po.User;

public interface UserDao {
    public User findUserById(int id) throws Exception;
}

