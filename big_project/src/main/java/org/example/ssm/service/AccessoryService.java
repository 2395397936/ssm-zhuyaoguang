package org.example.ssm.service;

import org.example.ssm.entity.Accessory;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

public interface AccessoryService {
    public Accessory get(Serializable id); //只查询一个数据，常用于修改

    public List<Accessory> find(Map map); //根据条件查询多个结果

    public void insert(Accessory retailer); //插入，用实体作为参数

    public void update(Accessory retailer);//修改，用实体作为参数

    public void deleteById(Serializable id); //按id删除，删除一条；支持整型和字符串类型 id

    public void delete(Serializable[] ids); //批量删除；支持整型和字符串类型工

    public int count(Map map);//根据条件统计结果集数量

    void deleteByFruitId(String fruitId);
}
