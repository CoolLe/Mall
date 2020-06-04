package com.coolle.repository;

import com.coolle.entity.MALL_USER_ACCOUNT;

public interface UserRepository {

    int findUser(String username);

    MALL_USER_ACCOUNT select_user(MALL_USER_ACCOUNT mall_user_account);

    void addUser(MALL_USER_ACCOUNT mall_user_account);
}