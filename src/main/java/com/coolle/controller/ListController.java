package com.coolle.controller;

import com.coolle.entity.MODEL_MALL_SKU_ATTR_VALUE;
import com.coolle.entity.OBJECT_MALL_SKU;
import com.coolle.service.ListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class ListController {

    @Autowired
    ListService listService;

    @RequestMapping("get_list_by_attr")
    public String get_list_by_attr(MODEL_MALL_SKU_ATTR_VALUE list_attr,int flbh2,ModelMap map){

        //根据属性查询商品
        List<OBJECT_MALL_SKU> list_sku = listService.get_list_by_attr(list_attr.getList_attr(),flbh2);

        map.put("list_sku",list_sku);
        return "skuList";
    }
}
