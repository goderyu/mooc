package com.aaa.dao.impl;

import java.util.List;

import com.aaa.dao.BaseDAO;
import com.aaa.dao.BasicinfoDAO;
import com.aaa.entity.Basicinfo;

/**
 * @author goderyu
 * @date 2018年7月24日 上午10:00:40
 * @description 用户个人信息dao层实现类
 */
public class BasicinfoDAOImpl extends BaseDAO implements BasicinfoDAO {

	@Override
	public Basicinfo getBasicinfo(int userid) {
		String sql = "select id,userid,email,sex,card from user_basic_info where id=?";
		Object[] params = { userid };
		List<Basicinfo> list = search(sql, Basicinfo.class, params);
		if (list.size() > 0) {
			return list.get(0);
		} else
			return null;
	}

	@Override
	public int updateBasicinfo(Basicinfo basicinfo) {
		String sql = "update user_basic_info set email=?,card=? where userid=?";
		Object[] params = { basicinfo.getEmail(), basicinfo.getCard(),
				basicinfo.getUserid() };
		return savaOrUpdate(sql, params);
	}

	@Override
	public Basicinfo selectEmail(String email) {
		String sql = "select * from user_basic_info where email=?";
		Object[] params = { email };
		List<Basicinfo> list = search(sql, Basicinfo.class, params);
		if (list.size() > 0) {
			return list.get(0);
		} else {
			return null;
		}
	}

	@Override
	public Basicinfo selectCard(String card) {
		String sql = "select * from user_basic_info where card=?";
		Object[] params = { card };
		List<Basicinfo> list = search(sql, Basicinfo.class, params);
		if (list.size() > 0) {
			return list.get(0);
		} else {
			return null;
		}
	}

}
