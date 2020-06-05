package com.coolle.controller;

import com.coolle.entity.*;
import com.coolle.service.AttrService;
import com.coolle.service.ListService;
import com.coolle.service.SpuService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class IndexController {
    @Autowired
    private AttrService attrService;

    @Autowired
    private ListService listService;

    @RequestMapping("select_list")
    public String select_list(@Param("content")String content, ModelMap map) {
        //根据搜索出商品列表
        List<OBJECT_MALL_SKU> list_sku = listService.get_list_by_search(content);
        map.put("list_sku", list_sku);
        return "list";
    }

    @RequestMapping("goto_list")
    public String goto_list(int flbh2, ModelMap map) {

        //flbh2属性的集合
        List<OBJECT_MALL_ATTR> list_attr = attrService.get_attr_list(flbh2);
        //flbh2商品列表
        List<OBJECT_MALL_SKU> list_sku = listService.get_list_by_flbh2(flbh2);

        map.put("list_attr", list_attr);
        map.put("list_sku", list_sku);
        map.put("flbh2", flbh2);
        return "list";
    }

    @RequestMapping("/")
    public String defaultIndex(HttpServletRequest request, ModelMap map) {
        return "index";
    }

    @RequestMapping("index")
    public String index(HttpServletRequest request, ModelMap map) {
        return "index";
    }

    @RequestMapping("goto_center")
    public String goto_center(HttpServletRequest request, ModelMap map) {
        return "center";
    }


}
