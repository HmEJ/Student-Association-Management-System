package com.coursedesign.service;

import com.coursedesign.dao.userDao;
import com.coursedesign.model.UserBean;

public class userService {
    userDao userDao = new userDao();
    public UserBean selectByEmail(String email) {
        return userDao.selectByEmail(email);
    }
}
