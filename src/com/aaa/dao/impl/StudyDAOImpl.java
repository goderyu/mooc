package com.aaa.dao.impl;

import java.util.List;

import com.aaa.dao.BaseDAO;
import com.aaa.dao.StudyDAO;
import com.aaa.entity.CourseBase;

/**  
 * @author goderyu
 * @date 2018年7月23日 上午9:26:59
 * @description 学生dao层操作实现类 
 */
public class StudyDAOImpl extends BaseDAO implements StudyDAO {

	@Override
	public List<CourseBase> getCourseBaseByUid(int userid) {
		String sql = "SELECT c.id,c.cname,c.img FROM student_course sc INNER JOIN coursebase c ON sc.courseid=c.id where sc.userid=?";
		Object[] params = {userid};
		List<CourseBase> list = search(sql, CourseBase.class, params);
		if(list!=null)
			return list;
		else
			return null;
	}

}
