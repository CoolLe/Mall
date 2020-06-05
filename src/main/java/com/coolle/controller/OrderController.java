package com.coolle.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.coolle.entity.MALL_ORDER;
import com.coolle.entity.MALL_USER_ACCOUNT;
import com.coolle.entity.OBJECT_MALL_SKU;
import com.coolle.entity.OBJECT_ORDER;
import com.coolle.repository.OrderRepository;
import com.coolle.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.concurrent.ThreadLocalRandom;

@Controller
public class OrderController {

    @Autowired
    OrderService orderService;

    @RequestMapping("my_order")
    public String myOrder(HttpSession session, ModelMap map) {
        MALL_USER_ACCOUNT user = (MALL_USER_ACCOUNT) session.getAttribute("user");
        if (user != null) {
            return "my_order";
        }
        return "login";
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
            MALL_ORDER order =  MALL_ORDER.builder()
                    .user_id(uid).shp_id(sku.getShp_id()).order_id(orderId).count(sku.getCount()).build();
            orderService.addOrder(order);
        }

        return "ok";
    }

    @RequestMapping("get_order_list")
    @ResponseBody
    public String getOrderList(HttpSession session) {
        MALL_USER_ACCOUNT user = (MALL_USER_ACCOUNT) session.getAttribute("user");
        if (user == null) {
            return "error";
        }
        List<OBJECT_ORDER> orders = orderService.selectAllDetail(user.getId());

        return JSONArray.toJSONString(orders, SerializerFeature.BrowserCompatible);
    }
}
