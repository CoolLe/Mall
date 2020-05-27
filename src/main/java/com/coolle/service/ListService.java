package com.coolle.service;
import com.coolle.entity.MALL_SKU_ATTR_VALUE;
import com.coolle.entity.OBJECT_MALL_SKU;
import java.util.List;

public interface ListService {
    List<OBJECT_MALL_SKU> get_list_by_flbh2(int flbh2);

    OBJECT_MALL_SKU get_product(int kid);
    
    List<OBJECT_MALL_SKU> get_list_by_attr(List<MALL_SKU_ATTR_VALUE> list_attr, int flbh2);
}
