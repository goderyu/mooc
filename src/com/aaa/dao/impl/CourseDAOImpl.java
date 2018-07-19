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
		List<CourseBase> list = new ArrayList<CourseBase>();
		String sql = "select id,cname,summary,img,count,introduce,teacherid,clickRate from coursebase";
		conn=getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				CourseBase course = new CourseBase();
				course.setId(rs.getInt("id"));
				course.setCname(rs.getString("cname"));
				course.setSummary(rs.getString("summary"));
				course.setImg(rs.getString("img"));
				course.setCount(rs.getInt("count"));
				course.setIntroduce(rs.getString("introduce"));
				course.setTeacherid(rs.getInt("teacherid"));
				course.setClickRate(rs.getInt("clickRate"));
				list.add(course);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

}
