package com.coolle.entity;

import lombok.Data;

@Data
public class OBJECT_ORDER {
    private MALL_ORDER order;
    private MALL_PRODUCT spu;
    private MALL_SKU sku;
}
