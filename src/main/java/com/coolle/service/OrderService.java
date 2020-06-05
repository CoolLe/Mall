package com.coolle.service;

import com.coolle.entity.MALL_ORDER;
import com.coolle.entity.OBJECT_ORDER;

import java.util.List;

public interface OrderService {

    void addOrder(MALL_ORDER order);

    List<OBJECT_ORDER> selectAllDetail(int id);
}
