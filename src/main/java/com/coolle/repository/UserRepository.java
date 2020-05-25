package com.coolle.repository;

import com.coolle.entity.User;

import java.util.List;

public interface UserRepository {
    public List<User> findAll();
}