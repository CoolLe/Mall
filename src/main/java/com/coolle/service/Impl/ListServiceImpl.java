package com.coolle.service.Impl;

import com.coolle.entity.MALL_SKU_ATTR_VALUE;
import com.coolle.entity.OBJECT_MALL_SKU;
import com.coolle.repository.ListRepository;
import com.coolle.service.ListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
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
    public List<OBJECT_MALL_SKU> get_list_by_attr(List<MALL_SKU_ATTR_VALUE> list_attr, int flbh2) {

        //根据属性集合动态拼接sql语句
        StringBuffer subSql = new StringBuffer("");
        subSql.append(" and sku.id in ( select sku0.sku_id from ");
        if (list_attr != null && list_attr.size() > 0) {
            for (int i = 0;i < list_attr.size();i++) {
                subSql.append(" ( select sku_id from mall_sku_attr_value where shxm_id = "+list_attr.get(i).getShxm_id()+" " +
                        "and shxzh_id = " + list_attr.get(i).getShxzh_id() + " ) sku"+ i +" ");
                if ((i+1) < list_attr.size() && list_attr.size() > 1) {
                    subSql.append(" , ");
                }
            }
            if (list_attr.size() > 1) {
                subSql.append(" where ");
                for (int i = 0;i < list_attr.size();i++) {
                    if ((i+1) < list_attr.size()) {
                        subSql.append(" sku"+i+".sku_id="+"sku"+(i+1)+".sku_id");
                        if (list_attr.size() > 2 && i < (list_attr.size()-2)) {
                            subSql.append(" and ");
                        }
                    }
                }
            }

        }
        subSql.append(" ) ");

        System.out.println("查询语句：");
        System.out.println(subSql.toString());

        HashMap<Object,Object> hashMap = new HashMap<Object, Object>();
        hashMap.put("flbh2",flbh2);
        hashMap.put("subSql",subSql.toString());
        List<OBJECT_MALL_SKU> list_sku = listRepository.select_list_by_attr(hashMap);

        return list_sku;
    }
}
