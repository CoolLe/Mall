package com.coolle.service.Impl;

import com.coolle.entity.MALL_ORDER;
import com.coolle.entity.OBJECT_ORDER;
import com.coolle.repository.OrderRepository;
import com.coolle.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    OrderRepository orderRepository;

    @Override
    public void addOrder(MALL_ORDER order) {
        orderRepository.insertOrder(order);
    }

    @Override
    public List<OBJECT_ORDER> selectAllDetail(int id) {
        List<OBJECT_ORDER> orders = orderRepository.selectAllDetail(id);
        return orders;
    }
}
