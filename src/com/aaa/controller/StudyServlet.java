package com.aaa.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aaa.entity.CourseBase;
import com.aaa.entity.FirstCatalog;
import com.aaa.entity.SecondCatalog;
import com.aaa.entity.UserLoginInfo;
import com.aaa.service.CourseService;
import com.aaa.service.StudyService;
import com.aaa.service.impl.CourseServiceImpl;
import com.aaa.service.impl.StudyServiceImpl;

/**
 * @author goderyu
 * @date 2018年7月20日 下午2:41:00
 * @description 学生实体操作的Servlet
 */
public class StudyServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	HttpServletRequest req = null;
	HttpServletResponse resp = null;
	StudyService studyService = new StudyServiceImpl();
	CourseService courseService = new CourseServiceImpl();

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		req = request;
		resp = response;
		String method = req.getParameter("method");
		if (method.equals("toMain")) {
			toMain();
		} else if (method.equals("toCourse")) {
			toCourse();
		} else if (method.equals("toDelete")) {
			toDelete();
		} else if (method.equals("getCourseContent")) {
			getCourseContent();
		}
	}

	/**
	 * @description: 在学习课程页面显示一级二级目录事件
	 * @param @throws ServletException
	 * @param @throws IOException   
	 * @return void 
	 * @date 2018年7月23日下午4:58:46
	 */
	private void getCourseContent() throws ServletException, IOException {
		int courseid = Integer.parseInt(req.getParameter("courseid"));
		CourseBase courseBase = courseService.getCourseBaseById(courseid);
		req.setAttribute("course", courseBase);
		List<FirstCatalog> firstlist = courseService.getFirstCatalog(courseid);
		req.setAttribute("firstlist", firstlist);
		List<List<SecondCatalog>> secondlists = new ArrayList<List<SecondCatalog>>();
		for (int i = 0; i < firstlist.size(); i++) {
			List<SecondCatalog> asecondlist = courseService
					.getSecondCatalog(firstlist.get(i).getId());
			secondlists.add(asecondlist);
		}
		req.setAttribute("secondlists", secondlists);
		req.getRequestDispatcher("views/before/student/look-coursecontent.jsp")
				.forward(req, resp);
	}

	/**
	 * @description: 删除学生选课事件
	 * @param @throws ServletException
	 * @param @throws IOException
	 * @return void
	 * @date 2018年7月23日上午11:31:47
	 */
	private void toDelete() throws ServletException, IOException {
		// 获取页面请求的用户id和课程id
		int userid = ((UserLoginInfo) req.getSession().getAttribute("user"))
				.getId();
		int courseid = Integer.parseInt(req.getParameter("courseid"));
		int result = studyService.deleteStudyCourse(userid, courseid);
		if (result > 0) {
			toCourse();
		}
	}

	/**
	 * @description: 点击学生学习页面的课堂按钮的事件
	 * @param
	 * @return void
	 * @throws IOException
	 * @throws ServletException
	 * @date 2018年7月23日上午8:52:57
	 */
	private void toCourse() throws ServletException, IOException {
		int userid = ((UserLoginInfo) req.getSession().getAttribute("user"))
				.getId();
		List<CourseBase> list = studyService.getCourseBaseByUid(userid);
		req.setAttribute("list", list);
		req.getRequestDispatcher("views/before/student/student-course.jsp")
				.forward(req, resp);
	}

	/**
	 * @description: 点击课程详情中未参加或去学习按钮的事件
	 * @param @throws ServletException
	 * @param @throws IOException
	 * @return void
	 * @date 2018年7月20日下午5:19:24
	 */
	private void toMain() throws ServletException, IOException {
		// 获取页面请求的用户id和课程id
		int userid = ((UserLoginInfo) req.getSession().getAttribute("user"))
				.getId();
		int courseid = Integer.parseInt(req.getParameter("courseid"));
		// 向student_course表中插入数据

		if (!courseService.isStudyCourse(userid, courseid)) {
			int result = courseService.insStudentCourse(userid, courseid);
			if (result > 0)
				// 说明插入成功，应将课程报名总数加一
				courseService.updateCount(courseid);
		}
		req.getRequestDispatcher("views/before/student/student-frameset.jsp")
				.forward(req, resp);
	}

}
