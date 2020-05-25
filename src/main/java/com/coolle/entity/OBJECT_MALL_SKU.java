package com.coolle.entity;

public class OBJECT_MALL_SKU extends MALL_SKU{

    private MALL_PRODUCT spu;
    private MALL_TRADE_MARK tm;

    public MALL_PRODUCT getSpu() {
        return spu;
    }

    public void setSpu(MALL_PRODUCT spu) {
        this.spu = spu;
    }

    public MALL_TRADE_MARK getTm() {
        return tm;
    }

    public void setTm(MALL_TRADE_MARK tm) {
        this.tm = tm;
    }
}
