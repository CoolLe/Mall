package com.coolle.repository;

import com.coolle.entity.OBJECT_ORDER;
import com.coolle.entity.MALL_ORDER;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderRepository {
    List<MALL_ORDER> selectAll();

    void insertOrder(MALL_ORDER order);

    List<OBJECT_ORDER> selectAllDetail(int userId);
}