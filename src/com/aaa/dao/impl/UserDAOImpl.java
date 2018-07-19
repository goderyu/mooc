package com.aaa.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.aaa.dao.BaseDAO;
import com.aaa.dao.UserDAO;
import com.aaa.entity.UserLoginInfo;

public class UserDAOImpl extends BaseDAO implements UserDAO {
	private Connection conn = null;
	private Statement st = null;// 数据库操作对象
	private PreparedStatement pstmt = null;// 数据库预操作对象
	private ResultSet rs = null;

	@Override
	public int insertUserLoginInfo(UserLoginInfo user) {
		// jdbc操作：连接数据库 执行语句 返回东西
		int result = 0;
		String sql = "INSERT INTO user_login_info(headImg,username,telephone,password,state) VALUES('img/person.png',?,?,?,0)";
		String[] params={user.getUserName(),user.getTelephone(),user.getPassword()};
		result = savaOrUpdate(sql, params);
		return result;
	}

	@Override
	public int updateUserLoginInfo(UserLoginInfo user) {
		return 0;
	}

	@Override
	public List<UserLoginInfo> selectUserLoginInfo() {
		List<UserLoginInfo> all = null;
		try {
			all = new ArrayList<UserLoginInfo>();
			String sql = "SELECT id,username,telephone,password,state FROM user_login_info";
			ResultSet rs = st.executeQuery(sql);
			UserLoginInfo userLoginInfo = null;
			while (rs.next()) {
				userLoginInfo = new UserLoginInfo();
				userLoginInfo.setId(rs.getInt(1));
				userLoginInfo.setUserName(rs.getString(2));
				userLoginInfo.setTelephone(rs.getString(3));
				userLoginInfo.setPassword(rs.getString(4));
				userLoginInfo.setState(rs.getInt(5));
				all.add(userLoginInfo);
			}
			//BaseDAO.closeAll(rs, st, conn);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return all;

	}

	@Override
	public UserLoginInfo selectByTelAndPwd(String tel, String pwd) {
		UserLoginInfo user = null;
		String sql = "select id,headImg,username,telephone,password,state from user_login_info where telephone=? and password=?";
		conn=getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, tel);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			while(rs.next()){
				user = new UserLoginInfo();
				user.setId(rs.getInt("id"));
				user.setUserName(rs.getString("username"));
				user.setTelephone(rs.getString("telephone"));
				user.setPassword(rs.getString("password"));
				user.setState(rs.getInt("state"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}

}
