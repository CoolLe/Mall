package com.coolle.entity;

import lombok.Data;

import java.util.Date;

@Data
public class MALL_VALUE {
    private int id;
    private String shxzh;
    private int shfqy;
    private int shxm_id;
    private String shxzh_mch;
    private Date cream_time;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getShxzh() {
        return shxzh;
    }

    public void setShxzh(String shxzh) {
        this.shxzh = shxzh;
    }

    public int getShfqy() {
        return shfqy;
    }

    public void setShfqy(int shfqy) {
        this.shfqy = shfqy;
    }

    public int getShxm_id() {
        return shxm_id;
    }

    public void setShxm_id(int shxm_id) {
        this.shxm_id = shxm_id;
    }

    public String getShxzh_mch() {
        return shxzh_mch;
    }

    public void setShxzh_mch(String shxzh_mch) {
        this.shxzh_mch = shxzh_mch;
    }

    public Date getCream_time() {
        return cream_time;
    }

    public void setCream_time(Date cream_time) {
        this.cream_time = cream_time;
    }
}
