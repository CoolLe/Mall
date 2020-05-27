package com.coolle.service;

import com.coolle.entity.MALL_PRODUCT;

import java.util.List;


public interface SpuService {

    void save_spu(List<String> list_image, MALL_PRODUCT spu);

    List<MALL_PRODUCT> get_spu_list(int pp_id, int flbh2);

    MALL_PRODUCT get_spu(int id);

}
