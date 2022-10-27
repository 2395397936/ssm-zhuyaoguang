package org.example.ssm.dao;

import org.example.ssm.entity.Retailer;

import java.util.Map;


public interface RetailerDao extends BaseDao<Retailer> {

    public int count(Map map); //根据
    // 条件统计结果集数量
}