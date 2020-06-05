package com.coolle.service;


import com.coolle.entity.MALL_USER_ACCOUNT;



public interface UserService {

    void register(MALL_USER_ACCOUNT mall_user_account);

    MALL_USER_ACCOUNT findUser(String currentUserName);

    MALL_USER_ACCOUNT select_user(MALL_USER_ACCOUNT mall_user_account);
}
