package com.aaa.dao;

/**
 * @author 于好贤
 * @version 创建时间：2018年4月12日 上午10:15:05
 * @description 数据库连接接口类
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.aaa.util.DBConfig;

public class BaseDAO {
	private static Connection conn = null;
	static {
		// 加载驱动程序，调用com.aaa.util包中的数据库配置类的属性
		try {
			Class.forName(DBConfig.driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	// 取得数据库连接
	public static Connection getConnection() {
		try {
			conn = DriverManager.getConnection(DBConfig.url, DBConfig.username,
					DBConfig.password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}

	// 数据库关闭操作，关闭结果集，语句对象，连接
	public static void closeAll(ResultSet rs, PreparedStatement pstmt,
			Connection conn) {
		try {
			if (rs != null) {
				rs.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			if (pstmt != null) {
				pstmt.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// 公共的增删改方法
	public int savaOrUpdate(String sql, Object... params) {
		int result = 0;
		try {
			Connection conn = getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);

			if (params != null && params.length > 0) {
				// 对预编译的？逐个赋值
				for (int i = 0; i < params.length; i++) {
					pstmt.setObject(i + 1, params[i]);
				}
			}
			result = pstmt.executeUpdate();
			closeAll(null, pstmt, conn);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;

	}

}
