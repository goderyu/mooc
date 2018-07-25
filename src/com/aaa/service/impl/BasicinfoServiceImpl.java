package com.aaa.service.impl;

import com.aaa.dao.BasicinfoDAO;
import com.aaa.dao.impl.BasicinfoDAOImpl;
import com.aaa.entity.Basicinfo;
import com.aaa.service.BasicinfoService;

/**
 * @author goderyu
 * @date 2018年7月24日 上午10:02:07
 * @description 用户个人信息Service层实现类
 */
public class BasicinfoServiceImpl implements BasicinfoService {

	BasicinfoDAO basicinfoDAO = new BasicinfoDAOImpl();

	@Override
	public Basicinfo getBasicinfo(int userid) {
		return basicinfoDAO.getBasicinfo(userid);
	}

	@Override
	public int updateBasicinfo(Basicinfo basicinfo) {
		return basicinfoDAO.updateBasicinfo(basicinfo);
	}

	@Override
	public boolean selectEmail(String email, int userid) {
		return basicinfoDAO.selectEmail(email, userid);
	}

	@Override
	public boolean selectCard(String card, int userid) {
		return basicinfoDAO.selectCard(card, userid);
	}

}
