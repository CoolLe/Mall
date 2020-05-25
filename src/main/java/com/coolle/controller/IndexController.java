package com.coolle.controller;

import com.coolle.entity.OBJECT_MALL_ATTR;
import com.coolle.entity.OBJECT_MALL_SKU;
import com.coolle.service.AttrService;
import com.coolle.service.Impl.AttrServiceImpl;
import com.coolle.service.Impl.ListServiceImpl;
import com.coolle.service.ListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;


import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class IndexController {

    @Autowired
    private AttrService attrService;

    @Autowired
    private ListService listService;

    @RequestMapping("goto_list")
    public String goto_list(int flbh2,ModelMap map){

        //flbh2属性的集合
        List<OBJECT_MALL_ATTR> list_attr = attrService.get_attr_list(flbh2);
        //flbh2商品列表
        List<OBJECT_MALL_SKU> list_sku = listService.get_list_by_flbh2(flbh2);

        map.put("list_attr",list_attr);
        map.put("list_sku",list_sku);
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
