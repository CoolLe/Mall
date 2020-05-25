package com.coolle.entity;

import lombok.Data;

import java.util.Date;

@Data
public class MALL_SKU {

    private int id;
    private int shp_id;
    private int kc;             //库存
    private int jg;             //价格
    private Date creat_time;
    private String sku_mch;
    private int sku_xl;
    private String kcdz;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getShp_id() {
        return shp_id;
    }

    public void setShp_id(int shp_id) {
        this.shp_id = shp_id;
    }

    public int getKc() {
        return kc;
    }

    public void setKc(int kc) {
        this.kc = kc;
    }

    public int getJg() {
        return jg;
    }

    public void setJg(int jg) {
        this.jg = jg;
    }

    public Date getCreat_time() {
        return creat_time;
    }

    public void setCreat_time(Date creat_time) {
        this.creat_time = creat_time;
    }

    public String getSku_mch() {
        return sku_mch;
    }

    public void setSku_mch(String sku_mch) {
        this.sku_mch = sku_mch;
    }

    public int getSku_xl() {
        return sku_xl;
    }

    public void setSku_xl(int sku_xl) {
        this.sku_xl = sku_xl;
    }

    public String getKcdz() {
        return kcdz;
    }

    public void setKcdz(String kcdz) {
        this.kcdz = kcdz;
    }
}
