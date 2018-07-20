package com.aaa.dao;

/**
 * @author 于好贤
 * @version 创建时间：2018年4月12日 上午10:15:05
 * @description 数据库连接接口类
 */
import java.lang.reflect.InvocationTargetException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ParameterMetaData;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;

import com.aaa.util.DBConfig;

/**
 * @ClassName: BaseDAO
 * @Description:TODO
 * @author: goderyu
 * @date: 2018年7月20日 上午8:53:58
 * 
 */
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

	/**
	 * @description: 公用的增删改方法
	 * @param @param sql 数据库操作语句
	 * @param @param params 变长通用类型变量
	 * @param @return 增删改操作的成败标志
	 * @return int
	 * @date 2018年7月20日上午9:37:42
	 */
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

	/**
	 * @param sql
	 *            查询语句
	 * @param clazz
	 *            类.class
	 * @param params
	 *            sql预编译语句需要的参数
	 * @return 类对象的列表
	 */
	public <T> List<T> search(String sql, Class<T> clazz, Object... params) {
		Connection conn = getConnection();
		ResultSet rs = null;
		List<T> list = new ArrayList<T>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			// 定义预编译对象的元数据对象
			ParameterMetaData pd = pstmt.getParameterMetaData();
			// 通过获取元数据的数量，进行依次设值操作
			for (int i = 0; i < pd.getParameterCount(); i++) {
				pstmt.setObject(i + 1, params[i]);
			}
			// 执行查询，获取结果集对象数据
			rs = pstmt.executeQuery();
			// 定义结果集对象的元数据对象
			ResultSetMetaData rsmd = rs.getMetaData();
			while (rs.next()) {

				// 通过此方式获取泛型类对象
				T obj = clazz.newInstance();
				// 遍历将结果集的数据封装在obj对象中
				for (int i = 0; i < rsmd.getColumnCount(); i++) {
					// 获取结果集的所有列名下的值封装在Object类对象中，这样防止传递数据不对号入座
					String colName = rsmd.getColumnName(i + 1);
					Object value = rs.getObject(colName);
					// 通过此泛型setter方法进行封装
					BeanUtils.setProperty(obj, colName, value);
				}
				list.add(obj);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}

		return list;

	}
}
