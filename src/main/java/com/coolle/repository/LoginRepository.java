package com.coolle.repository;

import com.coolle.entity.MALL_PRODUCT;
import com.coolle.entity.MALL_USER_ACCOUNT;

import java.util.List;
import java.util.Map;

public interface LoginRepository {

    MALL_USER_ACCOUNT select_user(MALL_USER_ACCOUNT user);
}
