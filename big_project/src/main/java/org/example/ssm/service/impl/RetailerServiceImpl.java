package org.example.ssm.service.impl;

import org.example.ssm.dao.RetailerDao;
import org.example.ssm.entity.Retailer;
import org.example.ssm.service.RetailerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

@Service
public class RetailerServiceImpl implements RetailerService {
    @Autowired
    RetailerDao retailerDao;

    public Retailer get(Serializable id) { return retailerDao.get(id); }
    public List<Retailer> find(Map map) { return retailerDao.find(map) ; }
    public void insert(Retailer retailer) { retailerDao.insert (retailer); }
    public void update(Retailer retailer) { retailerDao.update (retailer); }
    public void deleteById(Serializable id) { retailerDao.deleteById (id); }
    public void delete(Serializable[] ids) { retailerDao.delete(ids); }
    public int count(Map map) { return retailerDao.count(map); }
}