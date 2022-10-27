package org.example.ssm.service.impl;

import org.example.ssm.dao.AccessoryDao;
import org.example.ssm.entity.Accessory;
import org.example.ssm.service.AccessoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

@Service
public class AccessoryServiceImpl implements AccessoryService {
    @Autowired
    AccessoryDao accessoryDao;

    public Accessory get(Serializable id) { return accessoryDao.get(id);}
    public List<Accessory> find(Map map) { return accessoryDao.find(map); }
    public void insert (Accessory accessory) { accessoryDao.insert(accessory); }
    public void update(Accessory accessory) { accessoryDao.update(accessory); }
    public void deleteById(Serializable id) { accessoryDao.deleteById(id); }
    public void delete(Serializable[] ids) { accessoryDao.delete(ids); }
    public int count (Map map) { return accessoryDao.count(map); }
    public void deleteByFruitId(String fruitId) {
        accessoryDao.deleteByFruitId(fruitId);
    }
}
