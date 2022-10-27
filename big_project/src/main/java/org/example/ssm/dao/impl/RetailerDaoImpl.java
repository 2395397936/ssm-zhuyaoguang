package org.example.ssm.dao.impl;

import java.util.Map;

import org.example.ssm.dao.RetailerDao;
import org.example.ssm.entity.Retailer;
import org.springframework.stereotype.Repository;

@Repository
public class RetailerDaoImpl extends BaseDaoImpl<Retailer> implements RetailerDao {
    public RetailerDaoImpl() {
        //设置命名空间
        super.setNs("org.example.ssm.mapper.RetailerMapper");
    }

    //实现接口自己的方法
    public int count(Map map) {
        return this.getSqlSession().selectOne(this.getNs() + ".count", map);
    }
}