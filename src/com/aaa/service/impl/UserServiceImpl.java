package com.aaa.service.impl;

import com.aaa.dao.UserDAO;
import com.aaa.dao.impl.UserDAOImpl;
import com.aaa.entity.UserLoginInfo;
import com.aaa.service.UserService;

public class UserServiceImpl implements UserService {

	UserDAO userDAO = new UserDAOImpl();

	@Override
	public int insertUserLoginInfo(UserLoginInfo user) {
		return userDAO.insertUserLoginInfo(user);
	}

	@Override
	public UserLoginInfo selectByTelAndPwd(String tel, String pwd) {
		return userDAO.selectByTelAndPwd(tel, pwd);
	}

}
