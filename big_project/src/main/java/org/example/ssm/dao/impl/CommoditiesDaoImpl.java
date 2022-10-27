package org.example.ssm.dao.impl;

import org.example.ssm.dao.CommoditiesDao;
import org.example.ssm.entity.Commodities;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Repository
public class CommoditiesDaoImpl extends BaseDaoImpl<Commodities> implements CommoditiesDao {

    public CommoditiesDaoImpl() {
//设置命名空
        super.setNs("org.example.ssm.mapper.CommoditiesMapper");
    }

    //实现接口自己的方法定义
    public int count(Map map) {
        return this.getSqlSession().selectOne(this.getNs() + ".count", map);
    }
}
