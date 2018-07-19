package com.aaa.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.aaa.dao.BaseDAO;
import com.aaa.dao.CourseDAO;
import com.aaa.entity.CourseBase;

public class CourseDAOImpl extends BaseDAO implements CourseDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;// 数据库预操作对象
	private ResultSet rs = null;

	@Override
	public List<CourseBase> selectAllCourse() {
		
		String sql = "select id,cname,summary,img,count,introduce,teacherid,clickRate from coursebase";
		List<CourseBase> list = search(sql, CourseBase.class, null);
		return list;
		
	}

	@Override
	public CourseBase getCourseBaseById(int id) {
		String sql = "select id,cname,summary,img,count,introduce,teacherid,clickRate from coursebase where id = ?";
		
		Object[] params = {id};
		
		List<CourseBase> list = search(sql, CourseBase.class, params);
		return list.get(0);
	}

}
