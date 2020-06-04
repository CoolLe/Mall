package com.coolle.service;


import com.coolle.entity.MALL_USER_ACCOUNT;



public interface UserService {


    void register(MALL_USER_ACCOUNT mall_user_account);

    boolean findUser(String currentUserName);
}
