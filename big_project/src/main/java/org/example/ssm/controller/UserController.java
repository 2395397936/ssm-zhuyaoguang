package org.example.ssm.controller;

import org.example.ssm.service.UserService;
import org.example.ssm.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class UserController {
    @Autowired
    UserService userService;

    @RequestMapping("/user/toLogin.action")
    public String toLogin() {
        return "login";
    }

    @RequestMapping("/user/login.action")
    public String login(User user, Model model, HttpServletRequest request) {
        Map<String, String> map = new HashMap<String, String>();
        map.put("username", user.getUsername());
        map.put("password", user.getPassword());
        List<User> userList = userService.find(map);
        if (userList != null && userList.size() > 0) {
            request.getSession().setAttribute("username", userList.get(0).getUsername());
            return "home";
        }
        model.addAttribute("errorMsg", "用户名或密码错误！");
        return "login";
    }

    @RequestMapping("user/registerPage.action")
    public String toRegister() {
        return "register";
    }

    @RequestMapping("/user/register.action")
    public String register(User user, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {

        Map<String, String> map = new HashMap<>();
        map.put("username", user.getUsername());
        List<User> userList = userService.find(map);
        if (userList != null && userList.size() > 0) {
            model.addAttribute("errorMsg", "注册失败，用户名已被占用");
            return "regıster";
        }
        userService.insert(user);
        model.addAttribute("noticeMsg","注册成功，请输入账号密码登录");
        return "login";

    }
}
