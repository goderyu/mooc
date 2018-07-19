package com.aaa.service.impl;

import java.util.List;

import com.aaa.dao.CourseDAO;
import com.aaa.dao.impl.CourseDAOImpl;
import com.aaa.entity.CourseBase;
import com.aaa.service.CourseService;

public class CourseServiceImpl implements CourseService {
	CourseDAO courseDAO = new CourseDAOImpl();
	@Override
	public List<CourseBase> selectAllCourse() {
		return courseDAO.selectAllCourse();
	}

}
