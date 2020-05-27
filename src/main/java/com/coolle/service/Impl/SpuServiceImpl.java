package com.coolle.service.Impl;

import com.coolle.entity.MALL_PRODUCT;
import com.coolle.repository.SpuRepository;
import com.coolle.service.SpuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class SpuServiceImpl implements SpuService {

    @Autowired
    private SpuRepository spuRepository;

    @Override
    public void save_spu(List<String> list_image, MALL_PRODUCT spu) {
        //插入spu信息,返回生成的主键
        spu.setShp_tp(list_image.get(0));
        spuRepository.insert_spu(spu);
        //根据spu主键，批量插入spu图片
        Map<Object,Object> map = new HashMap<Object, Object>();
        map.put("shp_id",spu.getId());
        map.put("list_image",list_image);
        spuRepository.insert_images(map);
    }

    @Override
    public List<MALL_PRODUCT> get_spu_list(int pp_id, int flbh2) {
        Map<Object,Object> map = new HashMap<Object, Object>();
        map.put("pp_id",pp_id);
        map.put("flbh2",flbh2);
        List<MALL_PRODUCT> list_spu = spuRepository.select_spu_list(map);
        return list_spu;
    }

    @Override
    public MALL_PRODUCT get_spu(int id) {
        return spuRepository.select_spu(id);
    }

}
