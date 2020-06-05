package com.coolle.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.coolle.entity.MALL_USER_ACCOUNT;
import com.coolle.entity.OBJECT_MALL_SKU;
import com.coolle.service.ListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Set;

@Controller
public class ShoppingChartController {
    private static final String shoppingChartPrefix = "mall:shoppingchart:";

    @Autowired
    private JedisPool jedisPool;

    @Autowired
    private ListService listService;

    @RequestMapping("get_shopping_chart_list")
    @ResponseBody
    public String getShoppingChartList(HttpSession session, ModelMap map) {

        ArrayList<OBJECT_MALL_SKU> products = new ArrayList<>();
        MALL_USER_ACCOUNT user = (MALL_USER_ACCOUNT) session.getAttribute("user");
        if (user != null) {
            try (Jedis jedis = jedisPool.getResource()) {
                Set<String> chart = jedis.smembers("mall:shoppingchart:" + user.getId());
                for (String prodId : chart) {
                    OBJECT_MALL_SKU sku = listService.get_product(Integer.parseInt(prodId));
                    final String countKey = shoppingChartPrefix + user.getId() + ":" + prodId;
                    String count = jedis.get(countKey);
                    if (count != null) {
                        sku.setCount(Integer.parseInt(count));
                    } else {
                        sku.setCount(1);
                    }
                    products.add(sku);
                }
            }
        }
        map.put("products", products);
        return JSONArray.toJSONString(products, SerializerFeature.BrowserCompatible);
    }

    @RequestMapping("shopping_chart")
    public String shoppingChart(HttpSession session, ModelMap map) {
        MALL_USER_ACCOUNT user = (MALL_USER_ACCOUNT) session.getAttribute("user");
        if (user == null) {
            return "login";
        }

        return "shopping_chart";
    }


    @RequestMapping(value = "remove_from_shopping_chart", method = RequestMethod.POST)
    @ResponseBody
    public String removeFromShoppingChart(HttpSession session, @RequestBody String data) {
        JSONObject ob = (JSONObject) JSONObject.parse(data);
        int prodId = ob.getInteger("prod_id");
        MALL_USER_ACCOUNT user = (MALL_USER_ACCOUNT) session.getAttribute("user");
        if (user != null) {
            try (Jedis jedis = jedisPool.getResource()) {
                jedis.srem("mall:shoppingchart:" + user.getId(), String.valueOf(prodId));
                final String countKey = shoppingChartPrefix + user.getId() + ":" + prodId;
                jedis.del(countKey);
            }
            return "ok";
        }
        return "error";

    }

    @RequestMapping("add_to_shopping_chart")
    @ResponseBody
    public String addToShoppingChart(HttpSession session, @RequestParam("prod_id") int prodId) {

        MALL_USER_ACCOUNT user = (MALL_USER_ACCOUNT) session.getAttribute("user");
        if (user != null) {
            try (Jedis jedis = jedisPool.getResource()) {
                jedis.sadd(shoppingChartPrefix + user.getId(), String.valueOf(prodId));
                final String countKey = shoppingChartPrefix + user.getId() + ":" + prodId;
                String existingCount = jedis.get(countKey);
                if (existingCount != null) {
                    jedis.set(countKey, String.valueOf(Integer.parseInt(existingCount) + 1));
                } else {
                    jedis.set(countKey, "1");
                }
            }
            return "ok";
        }
        return "error";

    }
}
