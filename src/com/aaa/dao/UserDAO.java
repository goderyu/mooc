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
	 * @description: 查询登录信息
	 * @param @param tel 登录用户的手机号码
	 * @param @param pwd 登录用户的密码
	 * @param @return 登录用户个人信息实体对象
	 * @return UserLoginInfo
	 * @date 2018年7月24日上午10:04:19
	 */
	public UserLoginInfo selectByTelAndPwd(String tel, String pwd);

	/**
	 * @description: 修改用户密码
	 * @param @param userid 用户id
	 * @param @param pwd 新密码
	 * @param @return
	 * @return int
	 * @date 2018年7月24日上午10:09:03
	 */
	public int updatePassword(int userid, String pwd);

	/**
	 * @description: 获取用户原密码
	 * @param @param userid 用户id
	 * @param @param pwd 用户原始密码
	 * @param @return
	 * @return boolean
	 * @date 2018年7月24日上午10:54:53
	 */
	public boolean selectPassword(int userid, String pwd);
}
