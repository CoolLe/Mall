package com.coolle.repository;

import com.coolle.entity.OBJECT_MALL_SKU;

import java.util.HashMap;
import java.util.List;

public interface ListRepository {
    List<OBJECT_MALL_SKU> select_list_by_flbh2(int flbh2);

    List<OBJECT_MALL_SKU> select_list_by_attr(HashMap<Object, Object> hashMap);
}
