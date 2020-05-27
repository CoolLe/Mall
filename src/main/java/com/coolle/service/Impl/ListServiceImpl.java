package com.coolle.service.Impl;

import com.coolle.entity.OBJECT_MALL_SKU;
import com.coolle.repository.ListRepository;
import com.coolle.service.ListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ListServiceImpl implements ListService {

    @Autowired
    ListRepository listRepository;

    @Override
    public List<OBJECT_MALL_SKU> get_list_by_flbh2(int flbh2) {

        List<OBJECT_MALL_SKU> list_sku = listRepository.select_list_by_flbh2(flbh2);
        return list_sku;
    }

    @Override
    public OBJECT_MALL_SKU get_product(int kid) {
        System.out.println("id"+kid);
        return listRepository.select_product(kid);
    }
}
