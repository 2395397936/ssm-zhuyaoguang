package org.example.ssm.dao;

import org.example.ssm.entity.Commodities;

import java.util.Map;

public interface CommoditiesDao extends BaseDao<Commodities> {
    public int count(Map map);
}
