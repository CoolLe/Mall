package com.coolle.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Order {
    private int id;
    private int user_id;
    private int shp_id;
    private Date create_time;
    private String order_id;
    private int count;
    private String state;
}
