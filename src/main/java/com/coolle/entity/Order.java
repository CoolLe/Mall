package com.coolle.entity;

import lombok.Data;

import java.util.Date;

@Data
public class Order {
    private int id;
    private int userId;
    private int shpId;
    private Date createTime;
    private String orderId;
    private int count;

    public Order(int userId, int shpId, String orderId, int count) {
        this.userId = userId;
        this.shpId = shpId;
        this.orderId = orderId;
        this.count = count;
    }
}
