package com.aaa.dao;

import java.util.List;

import com.aaa.entity.CourseBase;

/**  
 * @author goderyu
 * @date 2018年7月23日 上午9:24:34
 * @description 学生用户dao层操作接口
 */
public interface StudyDAO {
	
	/**
	 * @description: 通过userid做一个内连接查询查找出该用户学的所有课程
	 * @param @param userid
	 * @param @return   
	 * @return List<CourseBase> 
	 * @date 2018年7月23日上午9:25:51
	 */
	public List<CourseBase> getCourseBaseByUid(int userid);
}
