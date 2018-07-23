package com.aaa.service.impl;

import java.util.List;

import com.aaa.dao.StudyDAO;
import com.aaa.dao.impl.StudyDAOImpl;
import com.aaa.entity.CourseBase;
import com.aaa.service.StudyService;

/**  
 * @author goderyu
 * @date 2018年7月23日 上午9:28:16
 * @description TODO  
 */
public class StudyServiceImpl implements StudyService {
	StudyDAO studyDAO = new StudyDAOImpl();
	@Override
	public List<CourseBase> getCourseBaseByUid(int userid) {
		return studyDAO.getCourseBaseByUid(userid);
	}

}
