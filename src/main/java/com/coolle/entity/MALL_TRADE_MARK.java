package com.coolle.entity;

import lombok.Data;

@Data
public class MALL_TRADE_MARK {
    private int id;
    private String ppmch;
    private String url;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPpmch() {
        return ppmch;
    }

    public void setPpmch(String ppmch) {
        this.ppmch = ppmch;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}
