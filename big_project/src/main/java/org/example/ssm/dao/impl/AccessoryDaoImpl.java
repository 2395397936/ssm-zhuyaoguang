package org.example.ssm.dao.impl;

import org.example.ssm.dao.AccessoryDao;
import org.example.ssm.entity.Accessory;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Repository
public class AccessoryDaoImpl extends BaseDaoImpl<Accessory> implements AccessoryDao {
    public AccessoryDaoImpl() {
        //设置命名空间
        super.setNs("org.example.ssm.mapper.AccessoryMapper");
    }

    //实现接口自己的方法
    public int count(Map map) {
        return this.getSqlSession().selectOne(this.getNs() + ".count", map);
    }
    public void deleteByFruitId(String fruitId) {
        this.getSqlSession().delete(this.getNs() + ".deleteByFruitId", fruitId);
    }
}
