package com.coolle.controller;

import com.coolle.entity.MALL_PRODUCT;
import com.coolle.entity.MALL_USER_ACCOUNT;
import com.coolle.entity.OBJECT_MALL_ATTR;
import com.coolle.entity.OBJECT_MALL_SKU;
import com.coolle.repository.SpuRepository;
import com.coolle.service.AttrService;
import com.coolle.service.Impl.AttrServiceImpl;
import com.coolle.service.Impl.ListServiceImpl;
import com.coolle.service.ListService;
import com.coolle.service.SpuService;
import com.fasterxml.jackson.databind.util.JSONPObject;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@Controller
public class IndexController {
    private static final String shoppingChartPrefix = "mall:shoppingchart:";

    @Autowired
    private JedisPool jedisPool;

    @Autowired
    private AttrService attrService;

    @Autowired
    private ListService listService;

    @Autowired
    private SpuService spuService;

    @RequestMapping("goto_list")
    public String goto_list(int flbh2,ModelMap map){

        //flbh2属性的集合
        List<OBJECT_MALL_ATTR> list_attr = attrService.get_attr_list(flbh2);
        //flbh2商品列表
        List<OBJECT_MALL_SKU> list_sku = listService.get_list_by_flbh2(flbh2);

        map.put("list_attr",list_attr);
        map.put("list_sku",list_sku);
        map.put("flbh2",flbh2);
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

    @RequestMapping("shopping_chart")
    public String shoppingChart(HttpSession session,ModelMap map){

        ArrayList<OBJECT_MALL_SKU> products = new ArrayList<>();
        MALL_USER_ACCOUNT user = (MALL_USER_ACCOUNT) session.getAttribute("user");
        if(user!=null){
            try(Jedis jedis=jedisPool.getResource()){
                Set<String> chart = jedis.smembers("mall:shoppingchart:"+user.getId());
                for(String prodId:chart){
                    OBJECT_MALL_SKU sku = listService.get_product(Integer.parseInt(prodId));
                    final String countKey = shoppingChartPrefix+user.getId()+":"+prodId;
                    String count = jedis.get(countKey);
                    if(count!=null){
                        sku.setCount(Integer.parseInt(count));
                    }else{
                        sku.setCount(1);
                    }
                    products.add(sku);
                }
            }
        }
        map.put("products",products);
        double result = 0;
        for(OBJECT_MALL_SKU product:products){
           result+= product.getJg() * product.getCount();
        }
        map.put("init_price",result);

        return  "shopping_chart";
    }


    @RequestMapping("remove_from_shopping_chart")
    @ResponseBody
    public String removeFromShoppingChart(HttpSession session, @RequestParam("prod_id") int prodId){
        MALL_USER_ACCOUNT user = (MALL_USER_ACCOUNT) session.getAttribute("user");
        if(user!=null){
            try(Jedis jedis=jedisPool.getResource()){
                jedis.srem("mall:shoppingchart:"+user.getId(),String.valueOf(prodId));
                final String countKey = shoppingChartPrefix+user.getId()+":"+prodId;
                jedis.del(countKey);
            }
            return "ok";
        }
        return "error";

    }

    @RequestMapping("add_to_shopping_chart")
    @ResponseBody
    public String addToShoppingChart(HttpSession session, @RequestParam("prod_id") int prodId){

        MALL_USER_ACCOUNT user = (MALL_USER_ACCOUNT) session.getAttribute("user");
        if(user!=null){
            try(Jedis jedis=jedisPool.getResource()){
                jedis.sadd(shoppingChartPrefix+user.getId(),String.valueOf(prodId));
                final String countKey = shoppingChartPrefix+user.getId()+":"+prodId;
                String existingCount = jedis.get(countKey);
                if(existingCount!=null){
                    jedis.set(countKey, String.valueOf(Integer.parseInt(existingCount)+1));
                }else{
                    jedis.set(countKey,"1");
                }
            }
            return "ok";
        }
        return "error";

    }
}
