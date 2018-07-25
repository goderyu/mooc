package com.aaa.service;

import com.aaa.entity.UserLoginInfo;

/**
 * 业务层接口的定义，很多时候和dao层接口相同，但是必须有
 * 
 * @author goderyu
 * 
 */
public interface UserService {
	public int insertUserLoginInfo(UserLoginInfo user);

	public UserLoginInfo selectByTelAndPwd(String tel, String pwd);

	/**
	 * @description: 修改用户密码
	 * @param @param userid 用户id
	 * @param @param pwd 用户新密码
	 * @param @return
	 * @return int
	 * @date 2018年7月24日上午10:05:24
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
