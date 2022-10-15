package org.example.ss.controller;

import org.example.ss.po.Fruit;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

public class FruitController implements Controller {
    private final FruitService fruitService = new FruitService();

    @Override
    public ModelAndView handleRequest(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws Exception {
        List<Fruit> fruitList = fruitService.queryFruitList();
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("fruitList", fruitList);
        modelAndView.setViewName("fruit");
        return modelAndView;
    }


    static class FruitService {
        public List<Fruit> queryFruitList() {
            List<Fruit> fruitList = new ArrayList<>();
            fruitList.add(new Fruit("红富士", 2.3, "山东"));
            fruitList.add(new Fruit("香蕉", 1.5, "上海"));
            return fruitList;
        }
    }
}
