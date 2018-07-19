package com.aaa.dao;

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

	/**
	 * @param tel
	 *            登录用户的手机号码
	 * @param pwd
	 *            登录用户的密码
	 * @return 登录用户个人信息实体对象
	 */
	public UserLoginInfo selectByTelAndPwd(String tel, String pwd);
}
