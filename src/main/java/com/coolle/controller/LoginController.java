package com.coolle.controller;

import com.coolle.entity.MALL_USER_ACCOUNT;
import com.coolle.repository.LoginRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class LoginController {

    @Autowired
    LoginRepository loginRepository;

    @RequestMapping("login")
    public String login(HttpSession session, MALL_USER_ACCOUNT user, HttpServletRequest request, ModelMap map){
        //完成登入认证逻辑
        MALL_USER_ACCOUNT select_user = loginRepository.select_user(user);
        if (select_user == null) {
            return "redirect:/login.do";
        } else {
            session.setAttribute("user",select_user);
        }
        return "redirect:/index.do";
    }
}
