package org.example.ssm.dao;

import org.example.ssm.entity.Accessory;

import java.util.Map;

public interface AccessoryDao extends BaseDao<Accessory> {
    public int count(Map map); //根据
    public void deleteByFruitId(String fruitId);
}
