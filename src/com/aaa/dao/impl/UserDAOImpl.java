package com.aaa.dao.impl;

import java.util.List;

import com.aaa.dao.BaseDAO;
import com.aaa.dao.UserDAO;
import com.aaa.entity.UserLoginInfo;

public class UserDAOImpl extends BaseDAO implements UserDAO {

	@Override
	public int insertUserLoginInfo(UserLoginInfo user) {
		// jdbc操作：连接数据库 执行语句 返回东西
		int result = 0;
		String sql = "INSERT INTO user_login_info(headImg,username,telephone,password,state) VALUES('img/person.png',?,?,?,0)";
		String[] params = { user.getUsername(), user.getTelephone(),
				user.getPassword() };
		result = savaOrUpdate(sql, params);
		return result;
	}

	@Override
	public int updateUserLoginInfo(UserLoginInfo user) {
		return 0;
	}

	@Override
	public UserLoginInfo selectByTelAndPwd(String tel, String pwd) {

		String sql = "select id,headImg,username,telephone,password,state from user_login_info where telephone=? and password=?";
		Object[] params = { tel, pwd };
		List<UserLoginInfo> list = search(sql, UserLoginInfo.class, params);
		if (list.size() > 0)
			return list.get(0);
		else
			return null;

	}

	@Override
	public int updatePassword(int userid, String pwd) {
		String sql = "update user_login_info set password=? where id=?";
		Object[] params = { pwd, userid };
		return savaOrUpdate(sql, params);
	}

	@Override
	public UserLoginInfo selectPassword(int userid, String pwd) {
		String sql = "select * from user_login_info where id=? and password=?";
		Object[] params = { userid, pwd };
		List<UserLoginInfo> list = search(sql, UserLoginInfo.class, params);
		if (list.size() > 0)
			return list.get(0);
		else
			return null;
	}

}
