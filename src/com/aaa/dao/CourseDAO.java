package com.aaa.dao;

import java.util.List;

import com.aaa.entity.CourseBase;
import com.aaa.entity.CourseFile;
import com.aaa.entity.FirstCatalog;
import com.aaa.entity.SecondCatalog;

public interface CourseDAO {
	public List<CourseBase> selectAllCourse();

	public CourseBase getCourseBaseById(int id);

	/**
	 * @description: 获得课程的第一标题
	 * @param @param id 课程id
	 * @param @return 查询结果集中的一级标题列表
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

	/**
	 * @description: 判断student_course表中是否有该用户该课程信息
	 * @param @param userid 当前登录用户的id
	 * @param @param courseid 点击进入的课程id
	 * @param @return 查询后返回的列表标志
	 * @return boolean
	 * @date 2018年7月20日下午3:56:36
	 */
	public boolean isStudyCourse(int userid, int courseid);

	/**
	 * @description: 向student_course表中插入用户选择课程信息
	 * @param @param userid 当前登录用户的id
	 * @param @param courseid 进入的课程id
	 * @param @return
	 * @return int
	 * @date 2018年7月20日下午5:25:46
	 */
	public int insStudentCourse(int userid, int courseid);

	/**
	 * @description: 报名课程后，总数加一
	 * @param @param courseid 该课程id
	 * @param @return
	 * @return int
	 * @date 2018年7月20日下午5:32:01
	 */
	public int updateCount(int courseid);

	/**
	 * @description: 获取课程文档的dao层接口
	 * @param @param courseid
	 * @param @return
	 * @return List<CourseFile>
	 * @date 2018年7月25日上午10:06:34
	 */
	public List<CourseFile> getCourseFile(int courseid);

	/**
	 * @description: 获取章节文本信息dao层接口
	 * @param @param catalogid 一级或二级标题id
	 * @param @param state 判断一级还是二级的标志
	 * @param @return 返回文本信息
	 * @return String
	 * @date 2018年7月26日下午5:04:00
	 */
	public String getFirstSecondCatalogText(int catalogid, int state);

	/**
	 * @description: 获取章节视频信息dao层接口
	 * @param @param catalogid
	 * @param @param state
	 * @param @return
	 * @return String
	 * @date 2018年7月26日下午5:32:14
	 */
	public String getFirstSecondCatalogVideo(int catalogid, int state);
}
