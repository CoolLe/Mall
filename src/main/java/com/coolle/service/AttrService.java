package com.coolle.service;

import com.coolle.entity.OBJECT_MALL_ATTR;

import java.util.List;

public interface AttrService {
    void save_attr(int flbh2, List<OBJECT_MALL_ATTR> list_attr);

    List<OBJECT_MALL_ATTR> get_attr_list(int flbh2);
}
