package com.coolle.entity;

import lombok.Data;

import java.util.Date;

@Data
public class MALL_ATTR {
    private int id;
    private String shxm_mch;
    private int shfqy;
    private int flbh2;
    private Date creat_time;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getShxm_mch() {
        return shxm_mch;
    }

    public void setShxm_mch(String shxm_mch) {
        this.shxm_mch = shxm_mch;
    }

    public int getShfqy() {
        return shfqy;
    }

    public void setShfqy(int shfqy) {
        this.shfqy = shfqy;
    }

    public int getFlbh2() {
        return flbh2;
    }

    public void setFlbh2(int flbh2) {
        this.flbh2 = flbh2;
    }

    public Date getCreat_time() {
        return creat_time;
    }

    public void setCreat_time(Date creat_time) {
        this.creat_time = creat_time;
    }
}
