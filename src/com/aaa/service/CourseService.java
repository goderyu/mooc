package com.aaa.service;

import java.util.List;

import com.aaa.entity.CourseBase;

public interface CourseService {
	public List<CourseBase> selectAllCourse();
	public CourseBase getCourseBaseById(int id);
}
