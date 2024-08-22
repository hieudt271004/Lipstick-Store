package com.mystore.demo.service;

import com.mystore.demo.entity.User;

public interface UserService {

    User findByUsername(String username);
}
