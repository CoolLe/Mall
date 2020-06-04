package com.coolle.service.Impl;

import com.coolle.entity.MALL_USER_ACCOUNT;
import com.coolle.repository.UserRepository;
import com.coolle.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;


    @Override
    public void register(MALL_USER_ACCOUNT mall_user_account) {
        userRepository.addUser(mall_user_account);
    }

    @Override
    public boolean findUser(String currentUserName) {
        return userRepository.findUser(currentUserName) != 0;
    }
}
