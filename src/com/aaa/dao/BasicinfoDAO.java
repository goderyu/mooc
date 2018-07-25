package com.aaa.dao;

import com.aaa.entity.Basicinfo;

/**
 * @author goderyu
 * @date 2018年7月24日 上午9:57:35
 * @description 用户个人信息dao层接口
 */
public interface BasicinfoDAO {
	/**
	 * @description: 获取用户个人信息dao层接口
	 * @param @param userid user_login_info表中的id
	 * @param @return 用户实体类对象
	 * @return Basicinfo
	 * @date 2018年7月24日上午9:58:33
	 */
	public Basicinfo getBasicinfo(int userid);

	/**
	 * @description: 更新用户个人信息dao层接口
	 * @param @param basicinfo user_login_info表的实体对象
	 * @param @return 更新标志
	 * @return int
	 * @date 2018年7月24日上午9:59:22
	 */
	public int updateBasicinfo(Basicinfo basicinfo);

	/**
	 * @description: 查找用户信息表中是否已存在此邮箱
	 * @param @param email 电子邮箱地址
	 * @param @return
	 * @return boolean
	 * @date 2018年7月24日下午1:25:46
	 */
	public boolean selectEmail(String email, int userid);

	/**
	 * @description: 查找用户信息表中是否已存在此身份证
	 * @param @param card 身份证号
	 * @param @return
	 * @return boolean
	 * @date 2018年7月24日下午1:26:22
	 */
	public boolean selectCard(String card, int userid);
}
