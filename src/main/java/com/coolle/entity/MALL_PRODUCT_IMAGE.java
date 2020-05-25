package com.coolle.entity;

import lombok.Data;

@Data
public class MALL_PRODUCT_IMAGE {
    private int id;
    private String effect;
    private int shp_id;
    private String url;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEffect() {
        return effect;
    }

    public void setEffect(String effect) {
        this.effect = effect;
    }

    public int getShp_id() {
        return shp_id;
    }

    public void setShp_id(int shp_id) {
        this.shp_id = shp_id;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}
