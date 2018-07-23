package com.aaa.service;

import java.util.List;

import com.aaa.entity.CourseBase;

/**
 * @author goderyu
 * @date 2018年7月23日 上午9:27:19
 * @description 学生用户Service层操作接口
 */
public interface StudyService {
	/**
	 * @description: 通过userid做一个内连接查询查找出该用户学的所有课程
	 * @param @param userid
	 * @param @return
	 * @return List<CourseBase>
	 * @date 2018年7月23日上午9:25:51
	 */
	public List<CourseBase> getCourseBaseByUid(int userid);

	/**
	 * @description: 删除该用户该门选课
	 * @param @param userid
	 * @param @param courseid
	 * @param @return
	 * @return int
	 * @date 2018年7月23日上午10:25:15
	 */
	public int deleteStudyCourse(int userid, int courseid);
}
