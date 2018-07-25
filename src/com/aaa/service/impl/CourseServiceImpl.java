package com.aaa.service.impl;

import java.util.List;

import com.aaa.dao.CourseDAO;
import com.aaa.dao.impl.CourseDAOImpl;
import com.aaa.entity.CourseBase;
import com.aaa.entity.CourseFile;
import com.aaa.entity.FirstCatalog;
import com.aaa.entity.SecondCatalog;
import com.aaa.service.CourseService;

public class CourseServiceImpl implements CourseService {
	CourseDAO courseDAO = new CourseDAOImpl();

	@Override
	public List<CourseBase> selectAllCourse() {
		return courseDAO.selectAllCourse();
	}

	@Override
	public CourseBase getCourseBaseById(int id) {
		return courseDAO.getCourseBaseById(id);
	}

	@Override
	public List<FirstCatalog> getFirstCatalog(int id) {
		return courseDAO.getFirstCatalog(id);
	}

	@Override
	public List<SecondCatalog> getSecondCatalog(int id) {
		return courseDAO.getSecondCatalog(id);
	}

	@Override
	public boolean isStudyCourse(int userid, int courseid) {
		return courseDAO.isStudyCourse(userid, courseid);
	}

	@Override
	public int insStudentCourse(int userid, int courseid) {
		return courseDAO.insStudentCourse(userid, courseid);
	}

	@Override
	public int updateCount(int courseid) {
		return courseDAO.updateCount(courseid);
	}

	@Override
	public List<CourseFile> getCourseFile(int courseid) {
		return courseDAO.getCourseFile(courseid);
	}

}
