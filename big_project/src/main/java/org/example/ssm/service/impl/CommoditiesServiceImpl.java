package org.example.ssm.service.impl;

import org.example.ssm.dao.CommoditiesDao;
import org.example.ssm.entity.Commodities;
import org.example.ssm.service.CommoditiesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

@Service
public class CommoditiesServiceImpl implements CommoditiesService {
    @Autowired
    CommoditiesDao commoditiesDao;

    public Commodities get(Serializable id) { return commoditiesDao.get(id);}
    public List<Commodities> find(Map map) { return commoditiesDao.find(map); }
    public void insert (Commodities commodities) { commoditiesDao.insert
            (commodities); }
    public void update(Commodities commodities) { commoditiesDao.update
            (commodities); }
    public void deleteById(Serializable id) { commoditiesDao.deleteById
            (id); }
    public void delete(Serializable[] ids) { commoditiesDao.delete(ids); }
    public int count (Map map) { return commoditiesDao.count(map); }
}
