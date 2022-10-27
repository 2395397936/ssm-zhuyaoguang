package org.example.ssm.controller;

import org.example.ssm.entity.Accessory;
import org.example.ssm.service.AccessoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class AccessoryController extends BaseController {
    @Autowired
    AccessoryService accessoryService;

    //跳转至 表页面
    @RequestMapping("/accessory/list.action")
    public String list(Model model, Accessory accessory) {
        Map<String, Object> map = new HashMap<>();
        map.put("fruitId", accessory.getFruitId());
        List<Accessory> accessoryList = accessoryService.find(map);
        model.addAttribute("fruitId", accessory.getFruitId());
        model.addAttribute("list", accessoryList.size() < 1 ? null : accessoryList);
        //计算附属品总价格并封装至 model 中
        model.addAttribute("sumPrice", sumPrice(accessoryList));
        return "accessoryHome"; //转向首页
    }

    private double sumPrice(List<Accessory> accessoryList) {
        double sum = 0.0;
        for (Accessory accessory : accessoryList) {
            sum += accessory.getPrice();
        }
        return sum;
    }

    @RequestMapping("/accessory/add.action")
    public String add(Model model, Accessory accessory) {
        accessory.setFruitId(accessory.getFruitId());
        accessoryService.insert(accessory);
        return list(model, accessory);
    }

    //删除一个数据
    @RequestMapping("/accessory/delete.action")
    public String delete(Model model, Accessory accessory) {
        accessoryService.deleteById(accessory.getAccessoryId());
        //重新刷新列
        return list(model, accessory);
    }

    //批量删除
    @RequestMapping("accessory/deleteList.action")
    public String deleteList(Model model, String[] arrays, Accessory accessory) {
        accessoryService.delete(arrays);
        //重新刷新列表
        return list(model, accessory);
    }
}
