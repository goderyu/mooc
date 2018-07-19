package com.aaa.dao;

import java.util.List;

import com.aaa.entity.UserLoginInfo;

/**
 * 接口，对user_login_info数据表定义操作：增删查改
 * 
 * @author goderyu
 */
public interface UserDAO {
	// 增
	public int insertUserLoginInfo(UserLoginInfo user);

	// 改
	public int updateUserLoginInfo(UserLoginInfo user);

	// 删
	// public int deleteUserLoginInfo();
	// 查
	public List<UserLoginInfo> selectUserLoginInfo();
	
	public UserLoginInfo selectByTelAndPwd(String tel,String pwd);
}
