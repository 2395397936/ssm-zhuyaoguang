package org.example.sm.mapper;

import org.apache.ibatis.annotations.Select;
import org.example.sm.po.User;

public interface UserQueryMapper {
    @Select("SELECT * FROM USER WHERE id = #{id}")
    public User findUserById(int id) throws Exception;
}

