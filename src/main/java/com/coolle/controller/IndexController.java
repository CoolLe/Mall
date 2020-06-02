package com.coolle.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.coolle.entity.*;
import com.coolle.repository.OrderRepository;
import com.coolle.service.AttrService;
import com.coolle.service.ListService;
import com.coolle.service.SpuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.concurrent.ThreadLocalRandom;

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

    @Autowired
    private OrderRepository orderRepository;

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

    @RequestMapping("goto_login")
    public String goto_login(HttpServletRequest request, ModelMap map) {
        return "login";
    }

    @RequestMapping("/")
    public String defaultIndex(HttpServletRequest request, ModelMap map) {
        return "index";
    }

    @RequestMapping("index")
    public String index(HttpServletRequest request, ModelMap map) {
        return "index";
    }


    @RequestMapping("my_order")
    public String myOrder(HttpServletRequest request, ModelMap map) {
        return "my_order";
    }


    @RequestMapping("create_order")
    @ResponseBody
    public String createOrder(HttpSession session, @RequestBody List<OBJECT_MALL_SKU> data) {
        MALL_USER_ACCOUNT user = (MALL_USER_ACCOUNT) session.getAttribute("user");
        if (user == null) {
            return "error";
        }

        int uid = user.getId();
        String orderId = String.valueOf(System.currentTimeMillis()) +
                ThreadLocalRandom.current().nextLong() + "3" +
                (618 ^ uid);

        for (OBJECT_MALL_SKU sku : data) {
            Order order =  Order.builder()
                    .user_id(uid).shp_id(sku.getShp_id()).order_id(orderId).count(sku.getCount()).build();
            orderRepository.insertOrder(order);
        }

        System.out.println(data);
        return "ok";
    }

    @RequestMapping("get_order_list")
    @ResponseBody
    public String getOrderList(HttpSession session) {
        MALL_USER_ACCOUNT user = (MALL_USER_ACCOUNT) session.getAttribute("user");
        if (user == null) {
            return "error";
        }
        List<OBJECT_ORDER> orders = orderRepository.selectAllDetail(user.getId());
        return JSONArray.toJSONString(orders);
    }

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
