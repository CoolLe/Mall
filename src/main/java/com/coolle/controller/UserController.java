package com.coolle.controller;

import com.coolle.entity.MALL_USER_ACCOUNT;
import com.coolle.repository.UserRepository;
import com.coolle.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class UserController {

    @Autowired
    UserRepository userRepository;

    @Autowired
    UserService userService;

    @RequestMapping("goto_login")
    public String goto_login(HttpServletRequest request, ModelMap map) {
        return "login";
    }

    @RequestMapping("goto_register")
    public String goto_register(HttpServletRequest request, ModelMap map) {
        return "register";
    }


    @RequestMapping("login")
    public String login(HttpSession session, MALL_USER_ACCOUNT mall_user_account){
        MALL_USER_ACCOUNT select_user = userRepository.select_user(mall_user_account);
        if (select_user == null) {
            return "redirect:/login.do";
        } else {
            session.setAttribute("user",select_user);
        }
        return "redirect:/index.do";
    }

    @RequestMapping("register")
    @ResponseBody
    public String register(HttpSession session, MALL_USER_ACCOUNT mall_user_account){
        String currentUserName = mall_user_account.getUsername();
        if (userService.findUser(currentUserName) == null){
            userService.register(mall_user_account);
            session.setAttribute("user",mall_user_account);
            return "redirect:/login.do";
        }
        return "redirect:/goto_register.do";
    }

    @RequestMapping("logout")
    public String logout(HttpSession session){
        session.removeAttribute("user");
        return "redirect:/goto_register.do";
    }
}
