package com.aaa.dao;

import java.util.List;

import com.aaa.entity.CourseBase;
import com.aaa.entity.FirstCatalog;

public interface CourseDAO {
	public List<CourseBase> selectAllCourse();

	public CourseBase getCourseBaseById(int id);

	/**
	 * @description: 获得课程的第一标题
	 * @param @param id 课程id
	 * @param @return 查询结果集中对象
	 * @return List<FirstCatalog>
	 * @date 2018年7月20日上午9:55:39
	 */
	public List<FirstCatalog> getFirstCatalog(int id);
}
