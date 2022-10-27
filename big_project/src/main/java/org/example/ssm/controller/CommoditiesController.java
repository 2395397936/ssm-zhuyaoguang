package org.example.ssm.controller;

import com.alibaba.fastjson.JSONObject;
import org.example.ssm.entity.Commodities;
import org.example.ssm.service.AccessoryService;
import org.example.ssm.service.CommoditiesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class CommoditiesController {
    @Autowired
    CommoditiesService commoditiesService;
    @Autowired
    AccessoryService accessoryService;

    //跳转至列表页面
    @RequestMapping("/commodities/list.action")
    public String list(Model model, Commodities commodities,
                       @RequestParam(defaultValue = "0.0") double startPrice,
                       @RequestParam(defaultValue = "0.0") double endPrice,
                       String startTime, String endTime) {
        Map<String, Object> map = this.CommoditiesToMap(commodities);
        if (startTime != null && !startTime.equals("")) {
            map.put("startTime", startTime);
        }
        if (endTime != null && !endTime.equals("")) {
            map.put("endTime", endTime);
        }
        if (startPrice > 0.0) {
            map.put("startPrice", startPrice);
        }
        if (endPrice > 0.0) {
            map.put("endPrice", endPrice);
        }
        List<Commodities> commoditiesList = commoditiesService.find(map);
        model.addAttribute("commodities", commodities); // 搜索条件回显
        model.addAttribute("startPrice", startPrice); // 搜索条件回显(价格区间)
        model.addAttribute("endPrice", endPrice); // 搜索条件回显(价格区间)
        model.addAttribute("startTime", startTime);//搜索条件回显(时间区间)
        model.addAttribute("endTime", endTime); //搜索条件回显 (时 间区间)
        model.addAttribute("list", commoditiesList.size() < 1 ? null : commoditiesList);
        model.addAttribute("currentPage", commodities.getCurrentPage());//当前页数
        System.out.println(commodities.getCurrentPage()+"---------");
        model.addAttribute("startPage", commodities.getStartPage()); //当前请求位置,默认为0
        int countNumber = commoditiesService.count(map);
        model.addAttribute("countNumber", countNumber); //数据总和
        int pageSize = commodities.getPageSize();
        model.addAttribute("pageSize", pageSize); //每页数据,默认为 10
        int sumPageNumber = countNumber % pageSize == 0 ? (countNumber / pageSize) : ((countNumber / pageSize) + 1);
        model.addAttribute("sumPageNumber", sumPageNumber); //总页数
        return "commoditiesHome";//转向首页
    }

    private Map<String, Object> CommoditiesToMap(Commodities commodities) {
        Map<String, Object> map = new HashMap<>();
        map.put("name", checkStringIsEmpty(commodities.getName()));
        map.put("locality", checkStringIsEmpty(commodities.getLocality()));
        map.put("createTime", checkStringIsEmpty(commodities.getCreateTime()));
        map.put("startPage", commodities.getStartPage());
        map.put("pageSize", commodities.getPageSize());
        return map;
    }

    private String checkStringIsEmpty(String param) {
        return param == null ? null : (param.equals("") ? null : "%" + param + "%");
    }

    @RequestMapping("/commodities/editCommodities.action")
    public @ResponseBody Commodities editCommodities(@RequestBody String json) {
        String id = JSONObject.parseObject(json).getString("id");
        //@ResponseBody Commodities 转成 JSON 格式输出
        return commoditiesService.get(id);
    }

    @RequestMapping("/commodities/edit.action")
    public String edit(Model model, Commodities commodities) {
        commoditiesService.update(commodities);
        //构建新的列表查询条件，只需要分页数据即可
        Commodities queryCommodities = new Commodities();
        queryCommodities.setStartPage(commodities.getStartPage());
        queryCommodities.setCurrentPage(commodities.getCurrentPage());
        queryCommodities.setPageSize(commodities.getPageSize());
        System.out.println(commodities.getCurrentPage()+"---------+");

        return list(model, queryCommodities, 0.0, 0.0, null, null);
    }

    @RequestMapping("/commodities/add.action")
    public String add(Model model, Commodities commodities) {
        commoditiesService.insert(commodities);
        //重新刷新至分页列表首页
        return list(model, new Commodities(), 0.0, 0.0, null, null);
    }

    @RequestMapping("/commodities/delete.action")
    public String delete(Model model, Commodities commodities) {
        commoditiesService.deleteById(commodities.getFruitId());
        accessoryService.deleteByFruitId(commodities.getFruitId());
        //构建新的列表查询条件，只需要分页数据即可
        Commodities queryCommodities = new Commodities();
        queryCommodities.setStartPage(commodities.getStartPage());
        queryCommodities.setCurrentPage(commodities.getCurrentPage());
        queryCommodities.setPageSize(commodities.getPageSize());
        return list(model, queryCommodities, 0.0, 0.0, null, null);
    }
}

