package com.coolle.repository;

import com.coolle.entity.Order;
import com.coolle.entity.User;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderRepository {
    List<Order> selectAll();

    void insertOrder(Order order);

}