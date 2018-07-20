package com.aaa.service;

import java.util.List;

import com.aaa.entity.CourseBase;
import com.aaa.entity.FirstCatalog;
import com.aaa.entity.SecondCatalog;

public interface CourseService {
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

	/**
	 * @description: 获得一级标题下的二级标题
	 * @param @param id 一级标题的id
	 * @param @return 查询结果集中的二级标题列表
	 * @return List<SecondCatalog>
	 * @date 2018年7月20日上午10:29:38
	 */
	public List<SecondCatalog> getSecondCatalog(int id);
}
