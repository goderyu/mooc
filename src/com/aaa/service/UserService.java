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
	
	/**
	 * @description: 更新用户头像的service层接口
	 * @param @param userid 用户id
	 * @param @param headImg 头像
	 * @param @return   
	 * @return int 
	 * @date 2018年7月26日上午11:20:49
	 */
	public int updateHeadImg(int userid, String headImg);
	
	/**
	 * @description: 更新用户session时使用，解决加密冲突
	 * @param @param userid
	 * @param @return   
	 * @return UserLoginInfo 
	 * @date 2018年7月26日下午1:56:52
	 */
	public UserLoginInfo selectUserInfo(int userid);
}
