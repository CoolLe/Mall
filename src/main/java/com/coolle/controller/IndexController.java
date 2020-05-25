package com.coolle.controller;

import com.coolle.entity.OBJECT_MALL_ATTR;
import com.coolle.service.Impl.AttrServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;


import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class IndexController {

    @Autowired
    private AttrServiceImpl attrServiceImpl;

    @RequestMapping("goto_list")
    public String goto_list(int flbh2,ModelMap map){

        //flbh2属性的集合
        List<OBJECT_MALL_ATTR> list_attr = attrServiceImpl.get_attr_list(flbh2);
        //flbh2商品列表


        map.put("list_attr",list_attr);
        return "list";
    }

    @RequestMapping("goto_login")
    public String goto_login(HttpServletRequest request,ModelMap map){
        return "login";
    }

    @RequestMapping("index")
    public String index(HttpServletRequest request,ModelMap map){
        return "index";
    }
}
