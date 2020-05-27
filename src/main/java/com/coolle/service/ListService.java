package com.coolle.service;
import com.coolle.entity.OBJECT_MALL_SKU;
import java.util.List;

public interface ListService {
    List<OBJECT_MALL_SKU> get_list_by_flbh2(int flbh2);

    OBJECT_MALL_SKU get_product(int kid);
}
